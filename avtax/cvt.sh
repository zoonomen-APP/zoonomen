  cat cball|tr -d '\015' > cball.002
  cat -vt cball.002 > cball2.cvt
  egrep -n '^\^I ' cball2.cvt
