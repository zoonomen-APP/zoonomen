cat gennam.html|sed 's/>/|/g'|awk -F "|" '{print $3}' > genflst.001
egrep '^[A-Z]' genflst.001 > genflst.002
sed 's/<\/li//' genflst.002 > genflst.003
cp genflst.003 genflst.00c
#awk '{print $NF}' genflst.001 > genflst.002

