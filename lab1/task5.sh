awk '$2 == "INFO" {print $0}' /var/log/anaconda/syslog > "$PWD"/info.log
