count="0"
for log_file in $(ls /var/log/*.log)
do
	((count+="$(wc -l < $log_file)"))
done
echo "$count"
