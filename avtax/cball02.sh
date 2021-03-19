cat ????.html > cball01
mv pass.html pass.html.tmp
awk -f c:/awk/s1.awk cball01 > cball02
mv pass.html.tmp pass.html

