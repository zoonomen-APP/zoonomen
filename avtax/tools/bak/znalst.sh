egrep '^<li>' ./numfile/cball.html|sed -f tagsed|awk '{print $1,$2}' > znlst.001
sed 's/\&#8224\;//g' znlst.001 > znlst.002
sed 's/\&#//g' znlst.002 > znlst.003
sort -d znlst.003 > znlst.004
uniq znlst.004 > znlst.005
cp znlst.005 znsponlyd.lst
