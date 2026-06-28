/usr/bin/killall -9 usb_auto_mount
/usr/bin/killall -9 bandwidth
#/usr/bin/killall -9 tcwdog
/usr/bin/killall -9 jvm_monitor
/usr/bin/killall -9 smbd
/usr/bin/killall -9 nmbd
/usr/bin/killall -9 java
/usr/bin/killall -9 mobile-manager
/usr/bin/killall -9 bundle_monitor
/usr/bin/killall -9 usb_monitor
/usr/bin/killall -9 udhcpc
/sbin/ifconfig ra0 down
/sbin/ifconfig ra1 down
/sbin/ifconfig apcli0 down
/sbin/rmmod /lib/modules/np_lanhost_mgr.ko
/userfs/bin/tcapi set Apcli_Common StartConn 0
/userfs/bin/irqCpuBind set pcie0 1
#/userfs/bin/irqCpuBind set pcie1 1
/userfs/bin/irqCpuBind set qdma_lan0 0
#/userfs/bin/irqCpuBind set qdma_lan2 2
#/userfs/bin/irqCpuBind set qdma_lan3 3
#/bin/echo 1 2 1 0 > /proc/tc3162/sw_rps
/bin/echo 1 > /proc/tc3162/sw_rps_ixia_tx
#/bin/echo 12000 > /proc/tc3162/sw_rps_queue_len
/bin/echo dis_ddmi > /proc/pon_phy/debug
#/bin/echo 3 > /proc/tc3162/sync_type
/userfs/bin/hw_nat -N 1
/userfs/bin/hw_nat -U 300 300 300 300
/bin/echo 2048 > /proc/net/skbmgr_hot_list_len
/bin/echo 138000 > /proc/net/skbmgr_driver_max_skb
/bin/echo 10000 > /proc/net/skbmgr_limit
/bin/echo 11000 > /proc/net/skbmgr_4k_limit

/bin/echo 8000 > /proc/tc3162/sw_rps_queue_len

echo 0 800 50 2 1 > /proc/tc3162/sw_rps_cls
echo 1 5 1 0 0 1 0 0 > /proc/tc3162/ixia_txrx
/bin/echo 0 > /proc/tc3162/sync_type
echo 0 1 1 > /proc/tc3162/rps_enable
#echo 1 > /proc/tc3162/wifi5g_IxiaTX

/userfs/bin/irqCpuBind set qdma_lan2 1
/userfs/bin/irqCpuBind set qdma_lan3 0
/userfs/bin/irqCpuBind set pcie1 3
echo 8 > /proc/irq/5/smp_affinity
echo 1 2 1 2 > /proc/tc3162/sw_rps

kill -23 `cat /var/run/wan_related_svc.pid`
kill -23 `cat /var/run/other_svc.pid`
kill -23 `cat /var/run/central_ctrl_svc.pid`
kill -23 `cat /var/run/wlan_svc.pid`
kill -23 `cat /var/run/voip_svc.pid`
killall tr69
killall dnshost
killall udhcpc
killall plugin_monitor
#killall -9 dnsmasq
killall -9 upnpd
killall -9 udhcpd
killall -9 radvd
killall -9 xl2tpd
killall -9 lan_host_mgr
killall -9 alink-mgr
/userfs/bin/iwpriv rai0 set ForceShortGI=1
/userfs/bin/iwpriv rai0 set PowerDropCtrl=30
