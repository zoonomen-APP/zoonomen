#....; 2019.01.21
# passerine files = 0*pa?[1-9]*.html
# non passerine files =  0[0,1]*.html
# tr -d '\r' gets rid of funny stuff at end of line
cat  00*.html|tr -d '\r' > cbnpass.tmp
echo 'cbnpass.tmp made'
cat 0*pa[0-9]*.html|tr -d '\r' > cbpass.tmp
echo 'cbpass.tmp made'
cat cbnpass.tmp cbpass.tmp|tr -d '\r' > cball.html
echo 'cball.html made'
cp cball.html cballed.html
# edit cball.html to cballed.html to add or remove taxa for comparisons
rm cb*.tmp
echo 'cb*.tmp removed'
