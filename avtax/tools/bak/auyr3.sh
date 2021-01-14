# uses cb3.txt as source
c:/zoonomen/avtax/tools/sz3.sh $1|
sed '/ 1[7-9][0-9][0-9]/ s/ 1/|1/'|
sed '/ 20[0-2][0-9]/ s/ 2/|2/'|
awk -F "|" '{print $2,$1}'|sort -n|
sed '/p\.[1-9][0-9] / s/ p\./ p\.0/'|sed '/p\.[1-9] /s/ p\./ p\.00/'|
sed 's/  / /g'|
sed 's/ p\./ p\. /'|
sed '/no\.[1-9][0-9] / s/ no\./ no\.0/'|sed '/no\.[1-9] /s/ no\./ no\.00/'|
sed '/art\.[1-9][0-9] / s/ art\./ no\.0/'|sed '/art\.[1-9] /s/ art\./ art\.00/'|
sed 's/Nomenclature//'|sed 's/Systematics//'|sed 's/Type//'|sed 's/Concept//'|sed 's/Citation//'|
sed 's/  / /g'|
sed  '/pt[1-9] / s/ pt/ pt 00/'|
sed  '/pt[1-9][0-9] / s/ pt/ pt 0/'|
sed  '/livr\.[1-9] / s/ livr\./ livr\. 00/'|
sed '/livr\.[1-9][0-9] / s/ livr\./ livr\. 0/'|sort -n|uniq
#print "RICB"
#egrep $1 RICB|more
#print "RIGSP"
#egrep $1 RIGSP
