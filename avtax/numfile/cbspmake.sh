# passerine files = 0*pa?[1-9]*.html
# non passerine files =  0[0,1]*.html
cat  0[0,1]*.html > cbnpass.tmp
cat 0999pass.html > cbpass.tmp
cat cbnpass.tmp cbpass.tmp > cbspall.html
#rm cb*.tmp
