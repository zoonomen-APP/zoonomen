# uses cb2 as source
# 2021.03.06 modified so Pt.1 becomes Pt.01 etc.
#modified 2020.11.19 to handle AMPERSAND combined "no.'s"
# Appears to work:
#1878 J.Orn. 26 no.143 p. 266 Mirafra rufocinnamomea fischeri (Reichenow)
#1878 J.Orn. 26 no.146&no.147 p. 205,232 Ploceus nigricollis melanoxanthus (Cabanis)
#1878 J.Orn. 26 no.146&no.147 p. 205,239 Lybius torquatus irroratus (Cabanis)
#
#REQUIRES : c:/zoonomen/avtax/cb2
#REQUIRES : c:/zoonomen/avtax/tools/sz.sh
c:/zoonomen/avtax/tools/sz.sh $1|
sed '/ 1[7-9][0-9][0-9]/ s/ 1/|1/'|
sed '/ 20[0-2][0-9]/ s/ 2/|2/'|
awk -F "|" '{print $2,$1}'|sort -n|
sed '/p\.[1-9][0-9] / s/ p\./ p\.0/'|sed '/p\.[1-9] /s/ p\./ p\.00/'|
sed 's/  / /g'|
sed 's/ p\./ p\. /'|
sed '/no\.[1-9][0-9] / s/ no\./ no\.0/'|sed '/no\.[1-9] /s/ no\./ no\.0/'|
#sed '/no\.[1-9]\&/ s/ no\./ no\.0/'|sed '/no\.[1-9][1-9]\&/s/ no\./ no\.0/'|
#sed '/no\.[1-9][0-9]\&/ s/ no\./ no\.0/'|sed '/no\.[1-9][1-9]\&/s/ no\./ no\.0/'|
sed '/art\.[1-9][0-9] / s/ art\./ no\.0/'|sed '/art\.[1-9] /s/ art\./ art\.00/'|
sed 's/Nomenclature//'|sed 's/Systematics//'|sed 's/Type//'|sed 's/Concept//'|sed 's/Citation//'|
sed 's/  / /g'|
sed  '/pt[1-9] / s/ pt/ pt 00/'|
sed  '/pt[1-9][0-9] / s/ pt/ pt 0/'|
#2021.03.06
sed  '/Pt[1-9] / s/ Pt/ Pt 00/'|
sed  '/Pt[1-9][0-9] / s/ Pt/ Pt 0/'|
# end 2021.03.06
sed  '/livr\.[1-9] / s/ livr\./ livr\. 00/'|
sed '/livr\.[1-9][0-9] / s/ livr\./ livr\. 0/'|sort -n|uniq
#print "RICB"
#egrep $1 RICB|more
#print "RIGSP"
#egrep $1 RIGSP
