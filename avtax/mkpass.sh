# make pass.html
#requires all passerine files in ./numfile to be up to date.
cat `ls ./numfile/0*pa*.html` > pa01.out
awk -f c:/awk/notab.awk pa01.out > pant.out
cat hpass.html pant.out tpass.html > pass.html
