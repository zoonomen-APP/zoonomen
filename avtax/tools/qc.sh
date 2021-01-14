#2021.01.13 Shell script to output selected lines from cb2
# this produces a mirror of zoonomen without html tags.
# final string removes trailing spaces.
egrep $1 c:/zoonomen/avtax/cb2|sed 's/ [ ]*$//'

