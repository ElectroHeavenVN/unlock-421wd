#method 2
mapd=$(ps aux | grep mapd | grep -v grep | grep -v check_mem > /tmp/vt_mapd_mem.txt; awk 'NR==1{print $3}' /tmp/vt_mapd_mem.txt)
total=$(free | awk 'NR == 4 {print($2)}')
percent=$(awk -v var1="$mapd" -v var2="$total" 'BEGIN {printf "%.2f\n",var1/var2*100}')
echo "$percent"
