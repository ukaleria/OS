lastBackupDate=$( ls ~ | grep -E "^Backup-" | sort -nr | head -1 | sed "s/Backup-//")
lastBackup=~/Backup-$lastBackupDate
curDate=$(date +"%F")
curTimestamp=$(date -d "$curDate" +"%s")
lastBackupTimestamp=$(date -d $lastBackupDate +"%s")
timeDiff=$(echo "($curTimestamp - $lastBackupTimestamp) / (60 * 60 * 24)" | bc)
report=~/.backup-report
if [[ $timeDif < 7 ]] && [! -z $lastBackupDate ]
then
	changes=""
	for file in $(ls  ~/source)
	do
		if [ -f $lastBackup/$file ]
		then
			sizeInSource=$(wc -c ~/source/$file | awk '{print $1}')
			sizeInBackup=$(wc -c $lastBackup/$file | awk '{print $1}')
			sizeDiff=$(echo "$sizeInSource - $sizeInBackup" | bc)
			if [ $sizeDiff != 0 ]
			then
				mv $lastBackup/$file $lastBackup/$file.$curDate
				cp ~/source/$file $lastBackup
				changes="$changes$file $file.$curDate
			fi
		else
			cp ~/source/$file $lastBackup
			changes="$changes\nFile $file copied."
		fi
	done
	changes=$(echo $changes | sed "s/^\n//")
	if [ ! -z $changes ]
	then
		echo -e "Backup-$lastBackupDate updated:\n$changes" >> $report
	fi
else
	mkdir ~/Backup-$curDate
	for file in $(ls ~/source)
	do
		cp ~/source/$file ~/Backup-$curDate
	done
	files=$(ls ~/source)
	echo -e "Backup-$curDate was created:\n$files" >> $report
fi

