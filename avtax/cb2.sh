#2017.10.03
#Need to write script to create cball.
# then mv pass.html to pass.html.tmp then mv back after cb2 is created.
#
date > date.txt
mv pass.html pass.html.tmp
cat ????.html date.txt > cball
mv pass.html.tmp pass.html
cat c:/zoonomen/avtax/cball |tr -d '\015' > c:/zoonomen/avtax/x.1
cat c:/zoonomen/avtax/x.1 |sed -f c:/sedscr/s.sed > c:/zoonomen/avtax/x.2
cat c:/zoonomen/avtax/x.2 |awk -f c:/awk/s1.awk > c:/zoonomen/avtax/x.3 
cat c:/zoonomen/avtax/x.3| tr -d '\015'|sed -f c:/sedscr/tagsed > c:/zoonomen/avtax/cb2
rm date.txt
