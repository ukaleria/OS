ps ax -o pid,cmd | awk '/sbin/ {print $1}'
