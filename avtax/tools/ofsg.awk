Begin{ 	RS = "\n";
	FS= " ";
	ORDER= ""}
$1~ /h1/ {ORDER=$1} 
$1~/h2/ {Family=$1}
#$1~/^<li>/ {print ORDER,Family,$2,$1}
#$1~/^<li>[A-Z]/  {print ORDER,Family,$2,$1}
$0~/^<li>[A-Z]/  {print ORDER,Family,$2,$1}
#{gsub(/<[^>]*/, "")}
#$1~/^<li>[A-Z][a-z]* [a-z]/  {print ORDER,Family,$2,$1}
