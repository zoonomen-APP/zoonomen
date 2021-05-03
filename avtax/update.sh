#...; 2019.01.26; 2021.03.21
# make pass.html and update numfiles
#prevent pass.html from being copied to ./numfile
mv pass.html pass.html.tmp
#
# run date script to put date and time in c:/txt/d1
echo run c:/zoonomen/avtax/tools/date.sh produces c:/txt/d1
c:/zoonomen/avtax/tools/date.sh
#
# mkpass has to be run AFTER files are updated in ./numfile
#echo run mkpass.sh
#./mkpass.sh
#echo temporarily make pass invisible by naming it pass.html.tmp
#mv pass.html pass.html.tmp
##copy any new files to ./numfile ; the -u argument copies only newer files
## or files that do not exist in target directory.
#
cp -puv ????.html ./numfile/
#
## change to ./numfile to run the num.scr there.
#
cd c:/zoonomen/avtax/numfile
#
echo run num.scr
#
c:/zoonomen/avtax/numfile/num.scr
echo run cbmake.sh
c:/zoonomen/avtax/numfile/cbmake.sh
#c:/zoonomen/avtax/numfile/zlst.scr
cat c:/zoonomen/avtax/numfile/0*.html > ../wb.html
#
#
cd c:/zoonomen/avtax
cat `ls ./numfile/0*pa*.html` | tr -d '\r' > pa01.out
awk -f c:/awk/notab.awk pa01.out > pant.out
cat hpass.html pant.out tpass.html | tr -d '\r' > pass.html

#2021.03.31 add cball make required for correct x.1

cat ./numfile/0*.html c:/txt/d1 > c:/zoonomen/avtax/cball

echo make cb2

cat c:/zoonomen/avtax/cball |tr -d '\015' > c:/zoonomen/avtax/x.1
cat c:/zoonomen/avtax/x.1 |sed -f c:/sedscr/s.sed > c:/zoonomen/avtax/x.2
cat c:/zoonomen/avtax/x.2 |awk -f c:/awk/s1.awk > c:/zoonomen/avtax/x.3
cat c:/zoonomen/avtax/x.3| tr -d '\015'|sed -f c:/sedscr/tagsed > c:/zoonomen/avtax/cb2

#c:/zoonomen/avtax/cb2.sh
ls -l c:/zoonomen/avtax/cb2
ls -l c:/zoonomen/avtax/x.?
echo end cb2 creation
cp -puv c:/zoonomen/avtax/n/?.html c:/zoonomen/avtax/n/bak
cat c:/zoonomen/avtax/n/bak/?.html| tr -d '\015' > c:/zoonomen/avtax/n/bak/stor/cat.001
cp -puv c:/zoonomen/cit/jour?.html c:/zoonomen/cit/bak
cp -puv c:/zoonomen/bio/bio?.html c:/zoonomen/bio/bak
cp -puv c:/zoonomen/avtax/numfile/cball.html c:/zoonomen/avtax
##2020.05.27
##Next line creates a file that prepends file name from
##numfile and lists output in taxonomic order.
#grep ^ /dev/null c:/zoonomen/avtax/numfile/0*.html > c:/zoonomen/avtax/cbtxfile.txt
#
### temporarily stop znalst.sh 2020.11.13
##./znalst.sh
#
##$ date  +'%Y%m%d%H%M%S'
##20191023121914
#
##mv znls*.* c:/zoonomen/avtax/znlst/
##mv znsponlyd.lst c:/zoonomen/avtax/znlst/
#
cat hpass.html pant.out tpass.html > pass.html