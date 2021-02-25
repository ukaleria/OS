trash=~/.trash
trash_log=~/.trash.log
file_n=$1
restore() {
	path=$1
	file=$2
	ln $trash/$file $path
}
if  [ $# != 1 ]
then
	echo "Wrong arguments!"
	exit 1
fi
if [ ! -d $trash ]
then
	echo "Trash directory wasn't created!"
	exit 1
if [ ! -f $trashlog ]
then
	echo "Trash.log wasn't created!"
	exit 1
fi
if [-z $(grep $1 $trash) ]
then
	echo "File $1 doesn't exist!"
	exit 1
fi
grep $file_n $trashlog |
while read file_path
do
	file=$(echo $file_path | cut -d " " -f 1)
	trasht=$(echo $filepath | cut -d " " -f 2)
	echo "Restore $trasht ? [y/n]"
	read  answer < /dev/tty
	if [ $answer == "y" ]
	then
		dir=$(dir_name $file) &&
		if [ -d $dir ];
		then
			$(restore $file $trasht)
		else
			$(restore $NOME/$file_name $trasht) &&
			echo  "Restored in $HOME!"
		fi &&
		rm $trash/$trasht && {
			sed -i "#$file_path#d" $trashlog
			echo "Restored $file!"
		}
	fi
done

