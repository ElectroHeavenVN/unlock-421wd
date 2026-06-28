#!/bin/sh

/usr/bin/iptables -t nat -D PREROUTING -i br+ -p tcp --dport 80 -j REDIRECT --to-ports 80
/usr/bin/ebtables -t filter -D FORWARD -p IPv4 --ip-proto udp --ip-dport 53 -j DROP
/usr/bin/firewallcmd switch off

/usr/bin/accesslimitcmd mode 0

/sbin/insmod /lib/modules/swnat.ko
/bin/echo 0x0140 > /proc/tc3162/swnat_test_flag
/bin/echo 1000 > /proc/tc3162/swnat_entry_life

/userfs/bin/hw_nat -T 1
/userfs/bin/hw_nat -N 1
/userfs/bin/hw_nat -U 1 1 1 1
/usr/bin/sys memwl bfb50e2c  0x1fff3fff
/usr/bin/sys memwl bfb50e30  0x00010fff

/bin/echo 10 > /proc/sys/net/netfilter/nf_conntrack_tcp_timeout_time_wait
/bin/echo 1 > /proc/sys/net/netfilter/nf_conntrack_tcp_timeout_fin_wait
/bin/echo 1 > /proc/sys/net/netfilter/nf_conntrack_tcp_timeout_close_wait
/bin/echo 1 > /proc/sys/net/netfilter/nf_conntrack_tcp_timeout_close
/bin/echo 1 > /proc/sys/net/netfilter/nf_conntrack_tcp_timeout_syn_recv
/bin/echo 30 > /proc/sys/net/netfilter/nf_conntrack_tcp_timeout_established
/bin/echo 300000 > /proc/sys/net/nf_conntrack_max
/userfs/bin/qdmamgr_lan set rxratelimit config disable packet
/userfs/bin/qdmamgr_wan set rxratelimit config Disable Packet
/userfs/bin/qdmamgr_lan set txratelimit  7 Disable 1000000
/bin/echo 4096 > /proc/net/skbmgr_hot_list_len

/bin/echo 6000 > /proc/net/skbmgr_limit
/bin/echo 6000 > /proc/net/skbmgr_4k_limit
/bin/echo 8192 > /proc/net/skbmgr_driver_max_skb

/bin/echo 8 > /proc/irq/23/smp_affinity

/bin/echo 1 > /tmp/dbus_guard_off
/usr/bin/killall -9 tr69
/usr/bin/killall -9 saf
/usr/bin/killall -9 lan_host_mgr
/usr/bin/killall -9 trafficvpninfo
/usr/bin/killall -9 process_monitor
/usr/bin/killall -9 cpu_temp
/usr/bin/killall -9 tcwdog

/usr/bin/dbus-send --system --print-reply --dest=com.ctc.appframework1 /com/ctc/appframework1 com.ctc.appframework1.AppAgent.Stop string:"b01odmv3"
