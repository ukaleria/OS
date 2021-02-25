if [[ "$PWD" == "$HOME" ]]
then
	echo "$HOME"
else
	echo "ERROR!"
	exit 1
fi
