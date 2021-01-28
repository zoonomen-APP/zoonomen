#2017.08.25 to make text only version of cball
cat cball.html|sed -f c:/sed/s.sed|awk -f c:/awk/s1.awk|sed -f c:/sed/tagsed > cb2.txt
cp cb2.txt ../cb2
