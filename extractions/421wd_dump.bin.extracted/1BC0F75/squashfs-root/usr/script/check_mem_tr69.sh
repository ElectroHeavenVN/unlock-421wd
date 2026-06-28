#method 1
#pid=$(pidof tr69)
#tr69=$(cat /proc/$pid/stat | awk '{print $22}')
#method 2
tr69=$(ps aux | grep tr69 | grep -v grep | grep -v check_mem > /tmp/tr69.txt; awk 'NR==1{print $3}' /tmp/tr69.txt)
total=$(free | awk 'NR == 4 {print($2)}')
percent=$(awk -v var1="$tr69" -v var2="$total" 'BEGIN {printf "%.2f\n",var1/var2*100}')
echo "$percent"
