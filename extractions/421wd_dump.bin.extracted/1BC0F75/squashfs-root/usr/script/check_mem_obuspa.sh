obuspa=$(ps aux | grep obuspa | grep -v /userfs/bin/obuspaFM | grep -v grep | grep -v check_mem > /tmp/obuspa.txt; awk 'NR==1{print $3}' /tmp/obuspa.txt)
total=$(free | awk 'NR == 4 {print($2)}')
percent=$(awk -v var1="$obuspa" -v var2="$total" 'BEGIN {printf "%.2f\n",var1/var2*100}')
echo "$percent"