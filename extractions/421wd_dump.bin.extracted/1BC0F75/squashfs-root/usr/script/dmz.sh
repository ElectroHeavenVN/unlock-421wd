#!/bin/sh

# if [ $# != 1 ] ; then
#         echo "usage: $0 [interface name]"
#         exit 0
# fi

#PVC=$1
WAN_IF=$1
WAN_IP=$2
LAN_IP=$3
LAN_MASK=$4

iptables -t nat -F DMZ_CHAIN
iptables -t nat -F HAIRPIN_DMZ

# get ipmode (Single or Multiple)
#IPMODE_CONF=/etc/nat_pvc$PVC/ipmode
#if [ -f $IPMODE_CONF ] ; then
#        chmod +x $IPMODE_CONF
#        . $IPMODE_CONF
#fi
SERVER_IP="0.0.0.0"
#if [ "$IPMODE" = "Multiple" ] ; then
#	SERVERIP_CONF=/etc/nat_pvc$PVC/server_ip
#	if [ -f $SERVERIP_CONF ] ; then
#        	chmod +x $SERVERIP_CONF
#        	. $SERVERIP_CONF
#	fi
#fi


#DMZ_CONF=/etc/nat_pvc$PVC/dmz
DMZ_CONF=/var/run/$WAN_IF/dmz
if [ -f $DMZ_CONF ] ; then
        chmod +x $DMZ_CONF
        . $DMZ_CONF
else
	exit 0
fi

if [ "$Active" = "Yes" ] ; then
    if [ "$SERVER_IP" = "0.0.0.0" ] ; then
    iptables -t nat -I HAIRPIN_DMZ -s $LAN_IP/$LAN_MASK -d $DMZ_IP -j MASQUERADE
    iptables -t nat -I DMZ_CHAIN -p all -d $WAN_IP -j DNAT --to $DMZ_IP
    else
	iptables -t nat -I DMZ_CHAIN -p all -d $SERVER_IP -j DNAT --to $DMZ_IP
    fi
fi
