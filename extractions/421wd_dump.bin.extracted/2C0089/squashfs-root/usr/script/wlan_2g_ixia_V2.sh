/usr/bin/killall -9 usb_auto_mount
/usr/bin/killall -9 bandwidth
/usr/bin/killall -9 tcwdog
/usr/bin/killall -9 jvm_monitor
/usr/bin/killall -9 smbd
/usr/bin/killall -9 nmbd
/usr/bin/killall -9 java
/usr/bin/killall -9 mobile-manager
/usr/bin/killall -9 bundle_monitor
/usr/bin/killall -9 usb_monitor
/usr/bin/killall -9 udhcpc
/usr/bin/killall -9 lan_host_mgr
/usr/bin/killall -9 alink-mgr
killall tr69
killall dnshost
killall udhcpc
killall plugin_monitor
killall -9 dnsmasq
killall -9 upnpd
killall -9 udhcpd
killall -9 radvd
killall -9 xl2tpd

/bin/echo 110000 > /proc/net/skbmgr_driver_max_skb
/bin/echo 100000 > /proc/net/skbmgr_limit
/bin/echo 100000 > /proc/net/skbmgr_4k_limit
/bin/echo 15000 > /proc/net/skbmgr_hot_list_len
/bin/echo 1 0 1 2 > /proc/tc3162/sw_rps_2g

/sbin/ifconfig rai0 down
/sbin/ifconfig ra1 down
/sbin/ifconfig apcli0 down
/userfs/bin/hw_nat -N 1
/userfs/bin/hw_nat -U 300 300 300 300
/userfs/bin/tcapi set Apcli_Common StartConn 0
/sbin/rmmod /lib/modules/np_lanhost_mgr.ko
/userfs/bin/iwpriv ra0 set TxPower=0 
echo 1 0 2 > /proc/tc3162/lan_tx
/userfs/bin/iwpriv ra0 set ShortcutFlag=0 
/userfs/bin/iwpriv ra0 set pse_dbg=0 
/userfs/bin/iwpriv ra0 set be_to_vo=1
/userfs/bin/iwpriv ra0 set flag_for_multiclient=1 
/userfs/bin/iwpriv ra0 set TxBurst=0 
/userfs/bin/iwpriv ra0 set HtRdg=0 
/userfs/bin/iwpriv ra0 set ed_chk=0
/userfs/bin/iwpriv ra0 mac 60200618=d7083f0f
/userfs/bin/iwpriv ra0 set SCSEnable=0 
/userfs/bin/iwpriv ra0 mac 60200500=7ff6666f
/userfs/bin/iwpriv ra0 mac 60201500=7ff6666f
/userfs/bin/iwpriv ra0 mac 6020050c=818181e3
/userfs/bin/iwpriv ra0 mac 6020150c=818181e3
/userfs/bin/iwpriv ra0 set MaxRxProcessCnt=1024
/userfs/bin/iwpriv ra0 set flushone_timeout=1000
/userfs/bin/iwpriv ra0 set flushall_timeout=1000
/userfs/bin/iwpriv ra0 set fcont=1
/userfs/bin/iwpriv ra0 set ForceShortGI=1
/userfs/bin/iwpriv ra0 set ShortRetry=30
/userfs/bin/iwpriv ra0 set pkthd=50
/userfs/bin/iwpriv ra0 set flag_for_ixiatest=1
/userfs/bin/iwpriv ra0 set manual_txop=1
/userfs/bin/iwpriv ra0 mac 60130014=ffffffff
/userfs/bin/iwpriv ra0 mac 60130010=ffffffff
/userfs/bin/iwpriv ra0 set FlagForKeepAlive=1
/userfs/bin/iwpriv ra0 set protectset=1
