#!/bin/sh
WHT_IPSET=whtlist_ip
TMP_IPSET=tmplist_ip
WHT_IPSET6=whtlist_ip6
TMP_IPSET6=tmplist_ip6
FILTERD_IPT=vcs_filter
DEVICE_LIST_IPT=device_list
PKT_VERIDCT_IPT=pkt_verdict
SAFE_NAT_IPT=vcs_nat
SAFE_NAT_SAFE=vcs_safe
IPTABLES=/usr/bin/xptables
IP6TABLES=/usr/bin/xp6tables
IPSET=/usr/bin/ipset

PKT_VERDICT_RULE_1="$PKT_VERIDCT_IPT -p tcp --tcp-flags FIN,SYN,ACK SYN -j SET --del-set $WHT_IPSET dst,srcmac"
PKT_VERDICT_RULE_2="$PKT_VERIDCT_IPT -p tcp --tcp-flags FIN,SYN,ACK SYN -j SET --add-set $TMP_IPSET dst,srcmac"
PKT_VERDICT_RULE_3="$PKT_VERIDCT_IPT -p tcp --tcp-flags FIN,SYN,RST,ACK ACK -m set ! --match-set $TMP_IPSET dst,srcmac -j REJECT --reject-with tcp-reset"
PKT_VERDICT_RULE_4="$PKT_VERIDCT_IPT -p tcp --tcp-flags FIN,SYN,RST,ACK ACK -m set --match-set $WHT_IPSET dst,srcmac -j ACCEPT"
PKT_VERDICT_RULE_5="$PKT_VERIDCT_IPT -p tcp --tcp-flags FIN,SYN,RST,ACK ACK -m length --length 1:10000 -j NFQUEUE --queue-bypass --queue-balance 0:3"
PKT_VERDICT_RULE_6="$PKT_VERIDCT_IPT -p udp -m set ! --match-set $WHT_IPSET dst,srcmac -j DROP"

FORWARD_IPT_RULE_1="$FILTERD_IPT -p tcp -m multiport --dports 80:1000,4000:20000 -j $DEVICE_LIST_IPT"
FORWARD_IPT_RULE_2="$FILTERD_IPT -p udp -m multiport --dports 80,443 -j $DEVICE_LIST_IPT"
NAT_IPT_RULE_1="$SAFE_NAT_IPT -p udp -m udp --dport 53 -j $SAFE_NAT_SAFE"
NAT_IPT_RULE_2="$SAFE_NAT_IPT -p tcp -m tcp --dport 53 -j $SAFE_NAT_SAFE"

#IPV4
#Flush VSAFE FILTER CHAIN
$IPTABLES -F $FILTERD_IPT
$IPTABLES -F $PKT_VERIDCT_IPT
$IPTABLES -F $DEVICE_LIST_IPT

#Flush VSAFE NAT CHAIN
$IPTABLES -F $SAFE_NAT_IPT -t nat
$IPTABLES -F $SAFE_NAT_SAFE

#Destroy VSAFE CHAIN
$IPTABLES -X $PKT_VERIDCT_IPT
$IPTABLES -X $DEVICE_LIST_IPT
$IPTABLES -X $SAFE_NAT_SAFE -t nat

#IPV6
if [ -f $IP6TABLES ]
then
    $IP6TABLES -D $FORWARD_IPT_RULE_1
    $IP6TABLES -D $FORWARD_IPT_RULE_2
    $IP6TABLES -t nat -D $NAT_IPT_RULE_1
    $IP6TABLES -t nat -D $NAT_IPT_RULE_2

    $IP6TABLES -F $PKT_VERIDCT_IPT
    $IP6TABLES -F $DEVICE_LIST_IPT
    $IP6TABLES -F $SAFE_NAT_IPT -t nat

    $IP6TABLES -X $PKT_VERIDCT_IPT
    $IP6TABLES -X $DEVICE_LIST_IPT
    $IP6TABLES -X $SAFE_NAT_IPT -t nat
fi

#ipset
if [ -f $IPSET ]
then
    $IPSET -q destroy $WHT_IPSET
    $IPSET -q destroy $TMP_IPSET
    $IPSET -q destroy $WHT_IPSET6
    $IPSET -q destroy $TMP_IPSET6
fi