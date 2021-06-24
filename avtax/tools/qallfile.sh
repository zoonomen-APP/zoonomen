#2021.02.17 Script to do global citation search
echo 'AMNH Types (vols 5-12)'
egrep -l $1 c:/zoonomen/cit/AMNH/AMNH*.txt
echo ' '
echo BNMA
echo ' '
egrep -l $1 c:/zoonomen/cit/BNMA/BNMA*e.txt
echo ' '
echo CBA
echo ' '
egrep -l $1 c:/zoonomen/cit/CBA/CBA*ed.txt
echo ' '
echo CBBM
echo ' '
egrep -l $1 c:/zoonomen/cit/CBBM/CBBM*ed.txt
echo ' '
echo Peters
echo ' '
egrep -l $1 c:/zoonomen/cit/Peters/Peters*.txt
echo ' '
echo Sharpes_Handlist
egrep -l $1 c:/zoonomen/cit/SharpHL/ShrpHL*.txt
