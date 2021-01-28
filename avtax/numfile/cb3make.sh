#2020.05.25 to make text only version of a given ?.html
cat $1.html|sed -f c:/sed/s.sed|awk -f c:/awk/s1.awk|sed -f c:/sed/tagsed > cb3.txt
cp cb2.txt ../cb3
