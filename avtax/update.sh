#...; 2019.01.26
# make pass.html and update numfiles
#prevent pass.html from being copied to ./numfile
#
# run date script to put date and time in c:/txt/d1

c:/zoonomen/avtax/tools/date.sh
mv pass.html pass.html.tmp
#copy any new files to ./numfile ; the -u argument copies only newer files
# or files that do not exist in target directory.

cp -puv ????.html ./numfile/

# change to ./numfile to run the num.scr there.

cd c:/zoonomen/avtax/numfile

# run num.scr

c:/zoonomen/avtax/numfile/num.scr
c:/zoonomen/avtax/numfile/cbmake.sh
c:/zoonomen/avtax/numfile/zlst.scr
cat c:/zoonomen/avtax/numfile/0*.html > ../wb.html


cd c:/zoonomen/avtax
cat `ls ./numfile/0*pa*.html` | tr -d '\r' > pa01.out
awk -f c:/awk/notab.awk pa01.out > pant.out
cat hpass.html pant.out tpass.html | tr -d '\r' > pass.html
./cb2.sh
cp -puv c:/zoonomen/avtax/n/?.html c:/zoonomen/avtax/n/bak
cat c:/zoonomen/avtax/n/bak/?.html| tr -d '\015' > c:/zoonomen/avtax/n/bak/stor/cat.001
cp -puv c:/zoonomen/cit/jour?.html c:/zoonomen/cit/bak
cp -puv c:/zoonomen/bio/bio?.html c:/zoonomen/bio/bak
cp -puv c:/zoonomen/avtax/numfile/cball.html c:/zoonomen/avtax
#2020.05.27
#Next line creates a file that prepends file name from
#numfile and lists output in taxonomic order.
grep ^ /dev/null c:/zoonomen/avtax/numfile/0*.html > c:/zoonomen/avtax/cbtxfile.txt

## temporarily stop znalst.sh 2020.11.13
#./znalst.sh

#$ date  +'%Y%m%d%H%M%S'
#20191023121914

#mv znls*.* c:/zoonomen/avtax/znlst/
#mv znsponlyd.lst c:/zoonomen/avtax/znlst/
