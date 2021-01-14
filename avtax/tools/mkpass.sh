# make pass.html
#requires all passerine files in ./numfile to be up to date.
mv pass.html pass.html.tmp
cp -puv pa??.html ./numfile/
cd c:/zoonomen/avtax/numfile
c:/zoonomen/avtax/numfile/num.scr
cd c:/zoonomen/avtax
cat `ls ./numfile/0*pa*.html` | tr -d '\r' > pa01.out
awk -f c:/awk/notab.awk pa01.out > pant.out
cat hpass.html pant.out tpass.html | tr -d '\r' > pass.html
