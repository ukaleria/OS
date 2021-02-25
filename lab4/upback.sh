lastBackupDate=$( ls ~ | grep -e "^Backup-" | sort -nr | head -1 | sed "s/^Backup-//" )
lastBackup=~/Backup-$lastBackupDate
restore=~/restore
if [ ! -z $lastBackupDate ]
then
	if [ ! -d $restore ]
	then
		mkdir $restore
	fi
	for file in $(ls $lastBackup | grep -Ev "[0-9]{4}-[0-9]{2}-[0-9]{2}")
	do
		cp $lastBackup/$file $restore/$file
	done
fi
