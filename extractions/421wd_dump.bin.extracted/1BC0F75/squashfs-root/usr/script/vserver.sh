#!/bin/sh
echo "this is vserver.sh"
if [ $1 = "add" ] ; then
        OPT=-I
elif [ $1 = "del" ] ; then
        OPT=-D
else
        echo "usage: $0 [add/del] [interface name#] [Rule#]"
        exit 0
fi

#PVC=$2
WAN_IF=$2
VS_CHAIN="VS_CHAIN"
RULE=$3
LAN_IP=$4
LAN_NETMASK=$5

#VS_CONF=/etc/nat_pvc$PVC/vserver$RULE
VS_CONF=/var/run/$WAN_IF/vserver$RULE
if [ -f $VS_CONF ] ; then
        chmod +x $VS_CONF
        . $VS_CONF
else
	exit 0
fi

EXT_SPORT=$STARTPORT
EXT_EPORT=$ENDPORT
INT_IP=$LOCALIP
IP_PROTOCAL=$Protocal

PROFILE_CFG=/userfs/profile.cfg
if [ -f $PROFILE_CFG ] ; then
    chmod 777 $PROFILE_CFG
    . $PROFILE_CFG
fi

if [ "$TCSUPPORT_CT_JOYME2" != "" ];then
INT_PORT=$INTPORT
fi

# get ipmode (Single or Multiple)
#IPMODE_CONF=/etc/nat_pvc$PVC/ipmode
#if [ -f $IPMODE_CONF ] ; then
#        chmod +x $IPMODE_CONF
#        . $IPMODE_CONF
#fi
if [ "" = $6 ] ; then 
        SERVER_IP="0.0.0.0"
else
        SERVER_IP=$6
fi
#if [ "$IPMODE" = "Multiple" ] ; then
#	SERVERIP_CONF=/etc/nat_pvc$PVC/server_ip
#	if [ -f $SERVERIP_CONF ] ; then
#        	chmod +x $SERVERIP_CONF
#        	. $SERVERIP_CONF
#	fi
#fi

if [ "$SERVER_IP" = "0.0.0.0" ] ; then

if [ "$TCSUPPORT_CT_JOYME2" != "" ];then

echo "$IP_PROTOCAL" | grep -q "TCP" && iptables -t nat $OPT $VS_CHAIN -p tcp --dport $EXT_SPORT -i $WAN_IF -j DNAT --to $INT_IP:$INT_PORT

echo "$IP_PROTOCAL" | grep -q "TCP" && iptables -t nat $OPT HAIRPIN -s $LAN_IP/$LAN_NETMASK -d $INT_IP -p tcp --dport $INT_PORT -j MASQUERADE

echo "$IP_PROTOCAL" | grep -q "UDP" && iptables -t nat $OPT $VS_CHAIN -p udp --dport $EXT_SPORT -i $WAN_IF -j DNAT --to $INT_IP:$INT_PORT

echo "$IP_PROTOCAL" | grep -q "UDP" && iptables -t nat $OPT HAIRPIN -s $LAN_IP/$LAN_NETMASK -d $INT_IP -p udp --dport $INT_PORT -j MASQUERADE

else

echo "$IP_PROTOCAL" | grep -q "TCP" && iptables -t nat $OPT $VS_CHAIN -p tcp --dport $EXT_SPORT:$EXT_EPORT -i $WAN_IF -j DNAT --to $INT_IP

echo "$IP_PROTOCAL" | grep -q "UDP" && iptables -t nat $OPT $VS_CHAIN -p udp --dport $EXT_SPORT:$EXT_EPORT -i $WAN_IF -j DNAT --to $INT_IP

fi

else

if [ "$TCSUPPORT_CT_JOYME2" != "" ];then

echo "$IP_PROTOCAL" | grep -q "TCP" && iptables -t nat $OPT $VS_CHAIN -p tcp --dport $EXT_SPORT -d $SERVER_IP -j DNAT --to $INT_IP:$INT_PORT

echo "$IP_PROTOCAL" | grep -q "TCP" && iptables -t nat $OPT HAIRPIN -s $LAN_IP/$LAN_NETMASK -d $INT_IP -p tcp --dport $INT_PORT -j MASQUERADE

echo "$IP_PROTOCAL" | grep -q "UDP" && iptables -t nat $OPT $VS_CHAIN -p udp --dport $EXT_SPORT -d $SERVER_IP -j DNAT --to $INT_IP:$INT_PORT

echo "$IP_PROTOCAL" | grep -q "UDP" && iptables -t nat $OPT HAIRPIN -s $LAN_IP/$LAN_NETMASK -d $INT_IP -p udp --dport $INT_PORT -j MASQUERADE

else

echo "$IP_PROTOCAL" | grep -q "TCP" && iptables -t nat $OPT $VS_CHAIN -p tcp --dport $EXT_SPORT:$EXT_EPORT -d $SERVER_IP -s 0/0  -j DNAT --to $INT_IP

echo "$IP_PROTOCAL" | grep -q "UDP" && iptables -t nat $OPT $VS_CHAIN -p udp --dport $EXT_SPORT:$EXT_EPORT -d $SERVER_IP -s 0/0  -j DNAT --to $INT_IP

fi

fi

