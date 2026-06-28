#!/bin/sh

echo -e "Content-Type: application/json\r\n\r\n"

IFS='=&'

if [ ! "$QUERY_STRING" ]; then
    exit 0
fi

set -- $QUERY_STRING

ping -c 1 -W 1 8.8.8.8 > /dev/null 2>&1
PING4_RET=$?
ping6 -c 1 -W 1 2001:4860:4860::8888 > /dev/null 2>&1
PING6_RET=$?

echo -e " { "
if [ $2 -ge 0 ] && [ $2 -le 64 ]; then
	if [ $4 -ge 0 ] && [ $4 -le 7 ]; then
		if [ $6 -ge 0 ] && [ $6 -le 7 ]; then
			WAN_CONNECT_TYPE=`/userfs/bin/tcapi get Wan_PVC$4_Entry$6 ISP`
			WAN_ACTIVE=`/userfs/bin/tcapi get Wan_PVC$4_Entry$6 Active`
			WAN_IPVER=`/userfs/bin/tcapi get Wan_PVC$4_Entry$6 IPVERSION`
			WAN_MAC=`/userfs/bin/tcapi get WanInfo_Entry$2 hwaddr`
			WAN_IP_STT=`/userfs/bin/tcapi get WanInfo_Entry$2 Status`
			WAN_IP_ADDR=`/userfs/bin/tcapi get WanInfo_Entry$2 IP`
			WAN_IP_SUBNET=`/userfs/bin/tcapi get WanInfo_Entry$2 NetMask`
			WAN_IP_GW=`/userfs/bin/tcapi get WanInfo_Entry$2 GateWay`
			WAN_IP_DNS=`/userfs/bin/tcapi get WanInfo_Entry$2 DNS`
			WAN_IP_DNS2=`/userfs/bin/tcapi get WanInfo_Entry$2 SecDNS`
			WAN_IPv6_STT=`/userfs/bin/tcapi get WanInfo_Entry$2 Status6`
			WAN_IPv6_ADDR=`/userfs/bin/tcapi get WanInfo_Entry$2 IP6`
			WAN_IPv6_PFIX=`/userfs/bin/tcapi get WanInfo_Entry$2 PrefixLen6`
			WAN_IPv6_GW=`/userfs/bin/tcapi get WanInfo_Entry$2 GateWay6`
			WAN_IPv6_DNS=`/userfs/bin/tcapi get WanInfo_Entry$2 DNS6`
			WAN_IPv6_DNS2=`/userfs/bin/tcapi get WanInfo_Entry$2 SecDNS6`
			WAN_IPv6_PREDE=`/userfs/bin/tcapi get WanInfo_Entry$2 PD6`
			PPP_CON_TIME=`/userfs/bin/tcapi get WanInfo_Entry$2 connect_sec`
			ONUSTATE=`cat /proc/xpon/ponInfo | grep "G_ACTIVATION" | cut -c 35-`
			INDEX4_DEFAULTROUTE=`/userfs/bin/tcapi get WanInfo_Common DefRouteIndexv4`
			IPV4_DEFAULTROUTE=`/userfs/bin/tcapi get WanInfo_Entry$INDEX4_DEFAULTROUTE IP`
			INDEX6_DEFAULTROUTE=`/userfs/bin/tcapi get WanInfo_Common DefRouteIndexv6`
			IPV6_DEFAULTROUTE=`/userfs/bin/tcapi get WanInfo_Entry$INDEX6_DEFAULTROUTE IP6`
			LINK_STATE=`/userfs/bin/tcapi get XPON_Common trafficStatus`
			echo -e "\"wan_ipver\": \"$WAN_IPVER\",\"wan_active\": \"$WAN_ACTIVE\",\"wan_connect_type\": \"$WAN_CONNECT_TYPE\",\"wan_mac\": \"$WAN_MAC\",\"wan_ip_stt\": \"$WAN_IP_STT\",\"wan_ip_addr\": \"$WAN_IP_ADDR\",\"wan_ip_subnet\": \"$WAN_IP_SUBNET\",\"wan_ip_gw\": \"$WAN_IP_GW\",\"wan_ip_dns\": \"$WAN_IP_DNS\",\"wan_ip_dns2\": \"$WAN_IP_DNS2\",\"wan_ipv6_stt\": \"$WAN_IPv6_STT\",\"wan_ipv6_addr\": \"$WAN_IPv6_ADDR\",\"wan_ipv6_pfix\": \"$WAN_IPv6_PFIX\",\"wan_ipv6_gw\": \"$WAN_IPv6_GW\",\"wan_ipv6_dns\": \"$WAN_IPv6_DNS\",\"wan_ipv6_dns2\": \"$WAN_IPv6_DNS2\",\"wan_ipv6_prede\": \"$WAN_IPv6_PREDE\",\"ppp_con_time\": \"$PPP_CON_TIME\",\"onustate\": \"$ONUSTATE\",\"ping4_ret\": \"$PING4_RET\",\"ping6_ret\": \"$PING6_RET\",\"ipv4_defaultroute\": \"$IPV4_DEFAULTROUTE\",\"ipv6_defaultroute\": \"$IPV6_DEFAULTROUTE\",\"link_state\": \"$LINK_STATE\","
		fi
	fi
fi

if [ $8 -ge 0 ] && [ $8 -le 64 ]; then
	TR069_IP_ADDR=`/userfs/bin/tcapi get WanInfo_Entry$8 IP`
	echo -e "\"TR069_IP_ADDR\": \"$TR069_IP_ADDR\","
fi

echo -e " \"end\": \"none\" }"