#!/bin/sh

/userfs/bin/tcapi commit deviceAccount_Entry

/userfs/bin/tcapi commit Accesslimit

/sbin/rmmod /lib/modules/swnat.ko

/usr/bin/firewallcmd switch on

/userfs/bin/hw_nat -T 3
/userfs/bin/hw_nat -N 30
/userfs/bin/hw_nat -U 15 15 5 15
/usr/bin/sys memwl bfb50e2c  0x0fa00fa0
/usr/bin/sys memwl bfb50e30  0x00011f40

/userfs/bin/qdmamgr_lan set rxratelimit config Enable packet
/userfs/bin/qdmamgr_wan set rxratelimit config Enable Packet
/userfs/bin/qdmamgr_lan set txratelimit  7 Enable 1000000


/bin/echo 1 > /proc/irq/23/smp_affinity

/bin/rm -f /tmp/dbus_guard_off

/userfs/bin/lan_host_mgr &
/userfs/bin/trafficvpninfo &
/userfs/bin/process_monitor &
/userfs/bin/cpu_temp &
/usr/bin/tcwdog -t 1 /dev/watchdog &

