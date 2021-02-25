man bash | sed -E 's/[[:space:]]+/\n/g' | sort | uniq -c | sort -nr |
awk -F ' ' '{if (length($2) >= 4) {print $2} }' | sed -n 1,3p
