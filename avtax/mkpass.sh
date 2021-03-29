# make pass.html
#requires all passerine files in ./numfile to be up to date.
echo make pa01.out
cat `ls ./numfile/0*pa*.html` > pa01.out
echo make no tab version of pa01.out as pant.out
awk -f c:/awk/notab.awk pa01.out > pant.out
echo cat hpass pant.out and tpass
cat hpass.html pant.out tpass.html > pass.html
