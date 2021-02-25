trash=~/.trash
trashlog=~/.trash.log
file_name=$1
vers=0
if [ $# != 1 ]
then
	exit 1
fi
if [ ! -d $trash ]
then
	mkdir $trash
fi
if [ ! -f $trashlog ]
then
	touch $trashlog
fi
trash_name=$File_name-$vers
while [ -f $trash/$trash_name ]
do
	(( version++ ))
	trash_name=$File_name-$vers
done
ln $file_name $trash/$trash_name
rm $file_name && echo $(realpath $file_name) $trash_name >> $trashlog
