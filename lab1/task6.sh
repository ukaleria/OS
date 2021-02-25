awk '$3 == "(II)" {print $0}' /var/log/anaconda/X.log | sed 's/(II)/Info:/' > "$PWD"/full.log
awk '$3 == "(WW)" {print $0}' /var/log/anaconda/X.log | sed 's/(WW)/Warning:/' >> "$PWD"/full.log
