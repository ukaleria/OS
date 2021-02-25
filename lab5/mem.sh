array=()
sequence=(1 2 3 4 5 6 7 8 9 10)
counter=0
echo "" > report.log #change to report1.log
while true
do
	array+=(${sequence[@]})
	let counter++
	if [[ $counter == 10000 ]]
	then
		counter=0
		echo "${#array[@]}" >> report.log # >> report1.log
	fi
done
