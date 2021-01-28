#2019.01.21 to make text only version of cball.html from partly edited
cat cball01.html|sed -f c:/sed/s.sed|awk -f c:/awk/s1.awk|sed -f c:/sed/tagsed > cb2.txt
