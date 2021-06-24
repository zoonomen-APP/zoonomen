# shell script to remake a dictionary sorted list of ssp from wb.html
# multiple steps added in sed to remover Howard and Peters lines.
egrep $'\t<li>[A-Z][a-z]' c:/zoonomen/avtax/wb.html|sed -f tagsed|awk '{print $1,$2,$3}' | sed -e 's/\&#8224\;//g' -e '/Peters/d' -e '/Howard/d' >c:/zoonomen/avtax/izcomp/zssp01.txt
sort -d c:/zoonomen/avtax/izcomp/zssp01.txt > c:/zoonomen/avtax/izcomp/dszssp.txt

