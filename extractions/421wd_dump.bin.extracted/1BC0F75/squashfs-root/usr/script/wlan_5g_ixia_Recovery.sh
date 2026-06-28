/sbin/ifconfig ra0 up
kill -25 `cat /var/run/wlan_svc.pid`
kill -25 `cat /var/run/wan_related_svc.pid`
kill -25 `cat /var/run/other_svc.pid`
kill -25 `cat /var/run/central_ctrl_svc.pid`
kill -25 `cat /var/run/voip_svc.pid`
echo 0 5 1 0 0 1 0 0 > /proc/tc3162/ixia_txrx