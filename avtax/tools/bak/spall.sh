egrep '^<li>[A-Z][a-z]' c:/zoonomen/avtax/numfile/0*.html > cballsp.tmp
awk -F ":" '{print $3}' cballsp.tmp > cballsp.001
egrep '^<li>[A-Z][a-z]'  cballsp.001| awk '{print $1,$2}'> cballsp.002
sed -f c:/zoonomen/avtax/tools/tagsed cballsp.002 > cballsp.003
sed -f c:/zoonomen/avtax/tools/dagger.sed cballsp.003 > cballsp.004
sed 's/ /_/' cballsp.004 > cballsp.005
cat cballsp.005 | rev | cut -c 3- | rev  > 2018cbsp.001
awk '{print $0, NR}' 2018cbsp.001 > 2018cbsp.002
sort -d 2018cbsp.002 > 2018cbsps.001



