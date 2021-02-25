awk -F ':' '{print $1 " " $3 }' /etc/passwd | sort -nt ' ' -k 2 | column -t
