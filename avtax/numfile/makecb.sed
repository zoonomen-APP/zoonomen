#2019.01.21
#start with numfiles to create cball.html
#./cbmake.sh
#this file will be used to designate Genera (GG), species (Gs), subspecies (Gss).
#first remover extinction daggers
/8224/s/..8224.//g

#now assign refs to refs so they dont look like subspecies.
/	<li>Peters Checklist/s/<li/<ref/
/	<li>H.amp.M /s/<li/<ref/
/	<li>CBBM /s/<li/<ref/
/	<li>HBW /s/<li/<ref/
/	<li>BirdsAmericas /s/<li/<ref/
/Suggestions/d
/Data Steward/d
/99362-0999/d
/Last updated/d
#Genera = ^<h4>
/^<h4>/ s/<h4>/<h4>Tax-GG /
#species = ^<li>[A-Z][a-z]
/^<li>[A-Z][a-z]/ s/<li>/<li>Tax-Gs /
#subspecies = ^\t<li>[A-Z] -- note -- danger here from source listings.
/^	<li>[A-Z][a-z]/ s/<li>/<li>Tax-Gss /
