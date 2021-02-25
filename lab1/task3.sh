echo "--------------"
echo "   1. nano    "
echo "   2. vi      "
echo "   3. links   "
echo "   0. exit    "
echo "--------------"
while :
do
	echo "command >> "
	read command
	case "$command"
	in
		0) exit ;;
		1) nano ;;
		2) vi ;;
		3) links
	esac
done

