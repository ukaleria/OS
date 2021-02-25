cur=1
operation="+"
term() {
	echo "quit"
	exit 0
}
plus() {
	operation="+"
}
aster() {
	operation="*"
}
trap 'term' SIGTERM
trap 'plas' USR1
trap 'aster' USR2

while true
do
	case $operation in
		"+")
			let "cur+=2"
		;;
		"*")
			let "cur+=2"
		;;
	esac
	sleep 1
	echo $cur
done
