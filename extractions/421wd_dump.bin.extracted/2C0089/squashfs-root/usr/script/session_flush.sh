#!/bin/sh

# ECONET-1570
FLUSH="Yes"
if [ -f /tmp/session_flush ]; then
	FLUSH=`cat /tmp/session_flush`
fi

if [ "$FLUSH" = "No" ]; then
	echo STOP SESSION FLUSH
	exit 0
fi
# Flush mac table
/usr/bin/brctl flushmacs br0
# Flush arp table: 
/usr/bin/ip neigh flush dev br0 >/dev/null 2>&1
/usr/bin/ip neigh flush dev nas0_0 >/dev/null 2>&1
/usr/bin/ip neigh flush dev nas1_0 >/dev/null 2>&1
/usr/bin/ip neigh flush dev nas2_0 >/dev/null 2>&1
/usr/bin/ip neigh flush dev nas3_0 >/dev/null 2>&1
/usr/bin/ip neigh flush dev nas4_0 >/dev/null 2>&1
/usr/bin/ip neigh flush dev nas5_0 >/dev/null 2>&1
/usr/bin/ip neigh flush dev nas6_0 >/dev/null 2>&1
/usr/bin/ip neigh flush dev nas7_0 >/dev/null 2>&1
#Note: must be “/usr/bin/ip”, can not be “ip”, command “ip” is link to “/bin/ip -> busybox”

#Flush software nat table: echo 0 > /proc/net/nf_conntrack
/bin/conntrack -F
#Flush hw nat table: hw_nat -+0
/userfs/bin/hw_nat -!
