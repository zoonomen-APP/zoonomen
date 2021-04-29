#2021.01.11
mv pass.html pass.html.tmp
#cat ????.html | tr -d '\r' > cball
cat c:/zoonomen/avtax/????.html | tr -d '\r' > cball
# tr -d '\r' removes carriage return.
mv pass.html.tmp pass.html
