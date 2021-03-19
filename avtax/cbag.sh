cat ????.html | egrep '^<h4' |awk '{print $1}'|sed 's/^<h4>//'|sort -d|uniq > cbag.001
mv cbag.001 cbag.00c

