#2020.02.15 to be run after update
#
#Creates a list of species taxa in taxonomic sequence.
#
#use to compare with i101sponly.lst
#
egrep '^<li>[A-Z][a-z]' c:/zoonomen/avtax/cball.html|cut -d " " -f 1-2|sed -f tagsed > c:/zoonomen/avtax/znsp001.txt
sed -f c:/zoonomen/avtax/tools/dagger.sed c:/zoonomen/avtax/znsp001.txt > znsp002.txt
sed 's/\&#//g' znsp002.txt > znsponly.lst
#znsponly.lst
