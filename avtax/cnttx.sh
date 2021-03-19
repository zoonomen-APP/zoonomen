printf "$1 "  >> txtct.001;printf  " Order " >> txtct.001; egrep '<h1' $1.html|wc -l|tr -d '\n' >> txtct.001;
printf  " Fam " >> txtct.001; egrep '<h2' $1.html|wc -l|tr -d '\n' >> txtct.001
printf  " Gen " >> txtct.001; egrep '<h4' $1.html|wc -l|tr -d '\n' >> txtct.001
printf  " sp " >> txtct.001; egrep '^<li>' $1.html|wc -l|tr -d '\n' >> txtct.001
printf  " ssp " >> txtct.001; egrep '^	<li>' $1.html|wc -l >> txtct.001
#echo -n $1 >> txtct.001; egrep '<h2' $1.html|wc >> txtct.001
#echo -n "ORDER " >> txtct.001;echo -n $1.html >> txtct.001; egrep '<h1' $1.html |wc  >> txtct.001; 
#egrep '<h2' $1.html; echo -n "Family"|wc >> txtct.001
#echo -n $1.html >> txtct.001; egrep '<h2' $1.html|wc >> txtct.001

