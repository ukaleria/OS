reg_ex="[[:alnum:]_-]+@[[:alpha:]]+\.[[:alpha:]]+"
grep -EIhiors "$reg_ex" "/etc" | tr -s "\n" "," | sed 's/.$/\n/' > "$PWD"/emails.lst
