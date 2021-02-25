string_a=""
while :
do
	read string_b
	if [[ "$string_b" == "q" ]]
	then
		break
	fi
	string_a+="$string_b"
done
echo "$string_a"
