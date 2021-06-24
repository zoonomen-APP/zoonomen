#2021.02.17 Script to do global citation search
echo 'AMNH Types (vols 5-12)'
egrep $1 c:/zoonomen/cit/AMNH/AMNH*.txt|awk -F "/" '{print $5,$6}'
echo ' '
echo ' '
echo BNMA
echo ' '
egrep $1 c:/zoonomen/cit/BNMA/BNMA*e.txt|awk -F "/" '{print $5,$6}'
echo ' '
echo ' '
echo ' '
echo ' '
echo CBA
echo ' '
egrep $1 c:/zoonomen/cit/CBA/CBA*ed.txt|awk -F "/" '{print $5,$6}'
echo ' '
echo ' '
echo CBBM
echo ' '
egrep $1 c:/zoonomen/cit/CBBM/C*ed.txt|awk -F "/" '{print $5,$6}'
echo ' '
echo ' '
echo ' '
echo Peters
echo ' '
egrep $1 c:/zoonomen/cit/Peters/Peters*.txt|awk -F "/" '{print $5,$6}'
echo ' '
echo Sharpes_Handlist
egrep $1 c:/zoonomen/cit/SharpHL/ShrpHL*.txt
