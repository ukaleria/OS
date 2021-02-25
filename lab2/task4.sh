for proc in $(ps ax -o pid)
do
	pid=$(grep -Ps "^Pid:" /proc/$proc/status | grep -soP '\d*')
	ppid=$(grep -Ps "^PPid:" /proc/$proc/status | grep -soP '\d*')
	sum_exec_runtime=$(grep -Ps "se.sum_exec_runtime" /proc/$proc/sched | awk '{print $3}')
	nr_switches=$(grep -Ps "nr_switches" /proc/$proc/sched | grep -osP '\d*')

	if [[ -z "$pid" ]]
	then
		continue
	fi
	if [[ -z "$ppid" ]]
	then
		ppid=0
	fi

	art=$(echo "scale=2; x=$sum_exec_runtime/$nr_switches; if(x<1&&x!=0) print 0; x" | bc)

	echo "ProcessID=$pid : Parent_ProcessID=$ppid :Averange_Running_Time=$art"
done | sort --key=2 -V > out4.txt
