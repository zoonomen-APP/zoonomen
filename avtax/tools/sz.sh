#2021.01.11 looks like this changes html & to just &, and removes blank spaces
egrep $1 c:/zoonomen/avtax/cb2|sed 's/\&amp\;/\&/g'|sed 's/ [ ]*$//'
