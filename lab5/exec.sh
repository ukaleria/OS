./mem.sh & pid0=$!
rm data #change to data1
echo "TIME MEM VIRT RES SHR CPU FREE SWAP"
while true
do
	line=$(top -p $pid0 -bn 1 | head -8 | tail -n +8)
	free=$(top -o $MEM -bn 1 | head -4 | tail -n +4 | awk '{print ""$6""}')
	swap=$(top -o $MEM -bn 1 | head -5 | tail -n +5 | awk '{print ""$6""}')
	line=$(echo -e $line | awk '{print ""$11" "$11" "$5" "$6" "$7" "$9""}')
	line=$(echo -e "$line $free $swap\n")
	echo $line >> data #data1
done
