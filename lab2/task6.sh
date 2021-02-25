max_ram=-1
pid_max_ram=-1
for proc in $(ps ax -o pid | sed 1d)
do
	pid=$(grep -Ps "^Pid:" /proc/$proc/status | grep -soP '\d*')
	ram=$(grep -Ps "^VmRSS:" /proc/$proc/status | grep -soP '\d*')
	if [[ -z $ram ]]
	then
		continue
	fi
	if [[ $ram -gt $max_ram ]]
	then
		max_ram=$ram
		pid_max_ram=$pid
	fi
done
echo "$pid_max_ram : $max_ram"
