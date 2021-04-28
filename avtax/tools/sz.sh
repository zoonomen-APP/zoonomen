#2021.01.11 looks like this changes html & to just &, and removes blank spaces
egrep $1 c:/zoonomen/avtax/cb2 > x1.jnk
sed -e 's/\&amp\;/\&/g' -e 's/ [ ]*$//' x1.jnk > x2.jnk
