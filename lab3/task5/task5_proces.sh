cur=1
operation="+"
( tail -f channel & echo $! >&3 ) 3>pid |
while true
do
	read line
	case $line in
		QUIT)
			echo "$ANDME"
			kill $(<pid)
			exit 0
		;;
		"+")
			operation="+"
		;;
		"*")
			operation="*"
		;;
		[0-9]*)
			case $operation in
				"+")
					let "cur+=$line"
				;;
				"*")
					let "cur*=$line"
				;;
			esac
			echo $cur
		;;
		*)
			kill $(<pid)
			exit 1
		;;
	esac
done

