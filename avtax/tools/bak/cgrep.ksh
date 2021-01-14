# cgrep -- a context grep
#
# Usage:   cgrep [-inx] [-C lines] pattern file ...
#
# Displays a given number of lines before and after a line which matches 
# the pattern supplied on the command line.
#

#
# Set up default values for variables.
#
lines=2
pattern=""
filelist=""
ignore_case=no
line_numbers=no
full_line=no

#
# Process the options.
#

while getopts C:inx opt
do
	case $opt in
	C)	lines=$OPTARG ;;
	i)	ignore_case=yes ;;
	n)	line_numbers=yes ;;
	x)	full_line=yes ;;
	[?])	print >&2 "Usage: cgrep [-inx] [-C lines] pattern file ..." 
		exit 2 ;;
	esac
done
shift $OPTIND-1

#
# Use the first argument after options as the search pattern.
#

if [ $# -eq 0 ]
then
	print >&2 "No search pattern specified" 
	exit 2
else
	pattern=$1
	shift 
fi

#
# If there are no arguments left, use standard input as the input file.
# If there are arguments left, these are the files to search for the pattern.
#

if [ $# -eq 0 ]
then
	filelist="-"
else
	while [ $# -gt 0 ]
	do
		if [ -d $1 ]
		then
			print >&2 "$1 is a directory ... skipped"
		else
			if [ ! -s $1 ]
			then
				print >&2 "$1 is an empty or non-existent file ... skipped"
			else
				filelist="$filelist $1"
			fi
		fi
		shift
	done
fi

#
# Check to ensure that the lines argument to -C is at least 1
#

if [ $lines -lt 1 ]
then
	print >&2 "Invalid argument for -C option. Must be a positive integer."
	exit 2 
fi

#
# Execute AWK script.
#

exec awk -v num_context_lines=$lines -v ignore_case=$ignore_case -v line_numbers=$line_numbers -v full_line=$full_line -v pattern="$pattern" '

#
# AWK script to handle context 'grepping' 
#

BEGIN {
	max_prev_lines=num_context_lines	
	print_flag=0
	ret_status=1
}
{
	#
	# If the script has moved on to the next file, display any remaining
	# context lines and reset variables and arrays.
	#
	if (FILENAME!=oldfilename) {
		if (num_buff_lines>0) {
			flush_buffer(oldfilename, num_buff_lines)
		}
		num_prev_lines=0
		num_buff_lines=0
		flush_line=0
		last_buffer_line=0
		oldfilename=FILENAME
		delete prev_line
		delete buff_line
		delete pre
	}	
	#
	# For all lines except the first in each file, move the elements
	# in the array prev_line to make room for the new line  and discard 
	# those that we no longer need.
	#
	if (FNR > 1) {
		if (num_prev_lines<max_prev_lines) {
			num_prev_lines++
		}	
		for (i=num_prev_lines;i>0;i--) {
			prev_line[i]=prev_line[i-1]
		}
	}
	prev_line[0]=$0
	#
	# If the -i option was specified (ignore_case=yes), convert both
	# the pattern and the line to uppercase before comparison.
	#
	if (ignore_case=="yes") {
		pm=match(toupper($0),toupper(pattern))
	} else {
		pm=match($0,pattern)
	}
	#
	# If the -x option was specified (full_line=yes) and the length of 
	# the matched string is not equal to the length of the line, do not
	# register a match.
	#
	if ((full_line=="yes")&&(RLENGTH!=length($0))) {
		pm=0
	}
	#
	# If we are still within the possible overlap range of a previous 
	# match, store the current line in the buffer.
	#
	if (FNR<=flush_line) {
		buff_line[++num_buff_lines]=$0
		pre[num_buff_lines]="  "
		#
		# If the current line contains a match, flag it, and reset
		# both flush_line (the line at which the buffer should be
		# printed) and last_buffer_line (the last line of the buffer
		# which should be printed).
		#
		if (pm>0) {
			pre[num_buff_lines]="* "
			flush_line=FNR+(2*num_context_lines)
			last_buffer_line=num_buff_lines+num_context_lines
		} else {
			pre[num_buff_lines]="  "
		}
		#
		# If we have reached flush_line, print the buffer.
		#
		if (FNR==flush_line) {
			flush_buffer(FILENAME, last_buffer_line)
			flush_line=0
			num_buff_lines=0
		}
	} else {
	#
	# If we are not in the possible overlap range of a previous match 
	# and the current line matches the pattern, store the line number
	# of the first line in the context range, move lines from the 
	# prev_line array to the buffer, flag the current line as a match
	# and set flush_line and last_buffer_line.
	#  
		num_buff_lines=0
		if (pm>0) {
			if (num_context_lines>num_prev_lines) {
				n=num_prev_lines
			} else {
				n=num_context_lines
			}	
			first_line=FNR-n
			for (i=n;i>0;i--) {
				buff_line[++num_buff_lines]=prev_line[i]
				pre[num_buff_lines]="  "
			}
			buff_line[++num_buff_lines]=$0
			pre[num_buff_lines]="* "
			flush_line=FNR+(2*num_context_lines)
			last_buffer_line=num_buff_lines+num_context_lines
			ret_status=0
		}
	}
}
END	{
	#
	# If the buffer still contains lines to be printed, print them
	#
	if (flush_line>FNR) {
		if (num_buff_lines<last_buffer_line) {
			last_buffer_line=num_buff_lines
		}
		flush_buffer(FILENAME, last_buffer_line)
	}
	exit ret_status
}	


#
# The flush_buffer function prints lines stored in the buffer. If there was
# more than one file given on the command line, prefix each line with the
# name of the file in which it appears.  If the -l option option was specified 
# (line_numbers=yes), prefix each line with its line number as well.
#
function flush_buffer(fn, last_line) {
	if (print_flag!=1) {
		print "=========================================================================="
	}
	if (last_line>0) {
		for (i=1;i<=last_line;i++) {
			prefix=""
			if (ARGC>2) {
				prefix=fn":"
			}
			if (line_numbers=="yes") {
				prefix=prefix first_line+i-1
			}
			print prefix " " pre[i] buff_line[i]
		}
		print "=========================================================================="
		print_flag=1
	}
}
'$filelist
			     A context grep
			     ==============

			     by Rod Currie

While the grep utility included in the MKS Toolkit is quite handy for finding 
lines that match a given regular expression pattern, there are times when you 
like to see the context in which these lines appear.  The following KornShell 
script (cgrep) provides this functionality. To use this script, specify a 
command line of the form

	cgrep pattern [file ...]

where pattern is an extended regular expression, and file ... is a list of 
files to search for pattern matches.  If you did not specify any file names,
a file is read from standard input. By default, cgrep displays the two 
lines both before and after a line which matches pattern.

cgrep also accepts the following options:

	-C num	displays num lines both before and after a matched line. num
		must be a positive integer.

	-i	ignores the case of the strings being matched.  This is similar
		to grep -i.

	-n 	precedes each displayed line with its file line number.  This
		is similar to grep -n.

	-x	requires pattern to match an entire line.  This is similar
		to grep -x.

cgrep precedes each context range with a string of equal signs and marks all
lines which actually match the pattern with an asterisk (*).  For example,
consider a file containing the following lines (let's call it pres.dat):

	George Washington
	John Adams
	Thomas Jefferson
	James Madison
	James Monroe
	John Quincy Adams
	Andrew Jackson
	Martin Van Buren
	William Henry Harrison
	John Tyler
	James Polk
	Zachary Taylor
	Millard Fillmore

If you type 

	cgrep -C 1 "Adams" pres.dat

you get the following output:

	=====================================================================
	   George Washington
	 * John Adams
	   Thomas Jefferson
	=====================================================================
	   James Monroe
	 * John Quincy Adams
	   Andrew Jackson
	=====================================================================

If the context ranges of two or more matching lines overlap, cgrep displays 
them as one range, beginning num lines before the first matching line in the
range and ending num lines after the last matching line in the range. For
example, the command line

	cgrep "James" pres.dat

produces the following output:

	=====================================================================
	   John Adams
	   Thomas Jefferson
	 * James Madison
	 * James Monroe
	   John Quincy Adams
	   Andrew Jackson
	=====================================================================
	   William Henry Harrison
	   John Tyler
	 * James Polk
	   Zachary Taylor
	   Millard Fillmore
	=====================================================================

cgrep returns one of the following exit statuses:

	0   cgrep found at least one match for pattern.

	1   cgrep found no matches for pattern.

	2   An error occurred.

To accomplish its task, cgrep first parses the command line (using the
getopts utility to process options) and then passes this information to
an AWK script which actually performs the search and display functions. 
For more information, see the comments in the listing.
