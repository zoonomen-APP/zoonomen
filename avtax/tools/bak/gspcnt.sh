egrep '^<h4' $1.html| wc -l
egrep '^<li' $1.html| wc -l
egrep "$(printf '\t')<li>" $1.html|wc -l
