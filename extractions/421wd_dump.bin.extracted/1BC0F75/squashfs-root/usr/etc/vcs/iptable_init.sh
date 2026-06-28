#!/bin/sh

VENDOR=$2
QUEUE_NUM=$3

VSAFES_IPSET=vsafes_ip
WHT_IPSET=whtlist_ip
TMP_IPSET=tmplist_ip
VSAFES_IPSET6=vsafes_ip6
WHT_IPSET6=whtlist_ip6
TMP_IPSET6=tmplist_ip6
FILTERD_IPT=vcs_filter
DEVICE_LIST_IPT=device_list
PKT_VERIDCT_IPT=pkt_verdict
SAFE_NAT_IPT=vcs_nat
SAFE_NAT_SAFE=vcs_safe

if [ "$VENDOR" = "VHT" ];
then
    IPTABLES=/usr/bin/xptables
    IP6TABLES=/usr/bin/xp6tables
    IPSET=/usr/bin/ipset 
else
    IPTABLES=/usr/sbin/iptables
    IP6TABLES=/usr/sbin/ip6tables
    IPSET=/usr/sbin/ipset
fi

# Rule Samples:
# filter:
# FORWARD -j VCS_FILTER
# VCS_FILTER -j DEVICE_LIST
# DEVICE_LIST -j PKT_VERDICT
# nat:
# PREROUTING -j VCS_NAT
# VCS_NAT -j VCS_SAFE
# VCS_SAFE -j REDIRECT

# Create VCS_FILTER, DEVICE_LIST, PKT VERDICT, VCS_SAFE and VCS_NAT
# Basic: Add VCS_FILTER, PKT_VERDICT and VCS_NAT
# Full: Add FORWARD, PREROUTING, VCS_FILTER, PKT_VERDICT and VCS_NAT

# Basic: Flush DEVICE_LIST, VCS_SAFE, VCS_FILTER, VCS_NAT and PKT_VERDICT
# Full: Delete FORWARD RULE, Flush DEVICE_LIST, VCS_FILTER, PKT_VERDICT and Destroy DEVICE_LIST, VCS_FILTER and PKT_VERDICT
# Full: Delete PREROUTING RULE, Flush VCS_NAT, VCS_SAFE and Destroy VCS_NAT, VCS_SAFE

PKT_VERDICT_RULE_1="$PKT_VERIDCT_IPT -p tcp --tcp-flags FIN,SYN,ACK SYN -j SET --del-set $WHT_IPSET dst,srcmac"
PKT_VERDICT_RULE_2="$PKT_VERIDCT_IPT -p tcp --tcp-flags FIN,SYN,ACK SYN -j SET --add-set $TMP_IPSET dst,srcmac"
PKT_VERDICT_RULE_3="$PKT_VERIDCT_IPT -p tcp --tcp-flags FIN,SYN,RST,ACK ACK -m set ! --match-set $TMP_IPSET dst,srcmac -j REJECT --reject-with tcp-reset"
PKT_VERDICT_RULE_4="$PKT_VERIDCT_IPT -p tcp --tcp-flags FIN,SYN,RST,ACK ACK -m set --match-set $WHT_IPSET dst,srcmac -j ACCEPT"
PKT_VERDICT_RULE_5="$PKT_VERIDCT_IPT -p tcp --tcp-flags FIN,SYN,RST,ACK ACK -m length --length 1:10000 -j NFQUEUE --queue-bypass --queue-balance 0:3"
PKT_VERDICT_RULE_6="$PKT_VERIDCT_IPT -p udp -m set ! --match-set $WHT_IPSET dst,srcmac -j DROP"

FORWARD_IPT_RULE="FORWARD -j $FILTERD_IPT"
NAT_IPT_RULE="PREROUTING -j $SAFE_NAT_IPT"
FORWARD_IPT_RULE_1="$FILTERD_IPT -p tcp -m multiport --dports 80:1000,4000:20000 -j $DEVICE_LIST_IPT"
FORWARD_IPT_RULE_2="$FILTERD_IPT -p udp -m multiport --dports 80,443 -j $DEVICE_LIST_IPT"
NAT_IPT_RULE_1="$SAFE_NAT_IPT -p udp -m udp --dport 53 -j $SAFE_NAT_SAFE"
NAT_IPT_RULE_2="$SAFE_NAT_IPT -p tcp -m tcp --dport 53 -j $SAFE_NAT_SAFE"


init() {
if [ $QUEUE_NUM -gt "1" ]
then
#IPV4
$IPSET create $WHT_IPSET hash:net,net family inet
$IPSET create $TMP_IPSET hash:net,net family inet
$IPSET create $VSAFES_IPSET hash:ip family inet

$IPSET add $VSAFES_IPSET 125.212.138.85

$IPTABLES -N $FILTERD_IPT
$IPTABLES -N $DEVICE_LIST_IPT
$IPTABLES -N $PKT_VERIDCT_IPT
$IPTABLES -N $SAFE_NAT_IPT -t nat
$IPTABLES -N $SAFE_NAT_SAFE -t nat

if [ "$VENDOR" != "VHT" ]
then
$IPTABLES -I $FORWARD_IPT_RULE
$IPTABLES -t nat -I $NAT_IPT_RULE
fi

$IPTABLES -A $PKT_VERIDCT_IPT -p tcp --tcp-flags FIN,SYN,ACK SYN -j SET --del-set $WHT_IPSET dst,srcmac
$IPTABLES -A $PKT_VERIDCT_IPT -p tcp --tcp-flags FIN,SYN,ACK SYN -j SET --add-set $TMP_IPSET dst,srcmac
$IPTABLES -A $PKT_VERIDCT_IPT -p tcp --tcp-flags FIN,SYN,RST,ACK ACK -m set ! --match-set $VSAFES_IPSET dst -m set ! --match-set $TMP_IPSET dst,srcmac -j REJECT --reject-with tcp-reset
$IPTABLES -A $PKT_VERIDCT_IPT -p tcp --tcp-flags FIN,SYN,RST,ACK ACK -m set --match-set $WHT_IPSET dst,srcmac -j ACCEPT
$IPTABLES -A $PKT_VERIDCT_IPT -p tcp --tcp-flags FIN,SYN,RST,ACK ACK -m length --length 40:10000 -j NFQUEUE --queue-bypass --queue-balance 0:3
$IPTABLES -A $PKT_VERIDCT_IPT -p udp -m set ! --match-set $WHT_IPSET dst,srcmac -j DROP

$IPTABLES -A $FORWARD_IPT_RULE_1
$IPTABLES -A $FORWARD_IPT_RULE_2
$IPTABLES -t nat -A $NAT_IPT_RULE_1
$IPTABLES -t nat -A $NAT_IPT_RULE_2

#IPV6
$IPSET create $WHT_IPSET6 hash:net,net family inet6
$IPSET create $TMP_IPSET6 hash:net,net family inet6
$IPSET create $VSAFES_IPSET6 hash:ip family inet6

$IPSET add $VSAFES_IPSET6 2402:800:20ff:4011::1111

if [ -f $IP6TABLES ]
then
$IP6TABLES -N $FILTERD_IPT
$IP6TABLES -N $DEVICE_LIST_IPT
$IP6TABLES -N $PKT_VERIDCT_IPT
$IP6TABLES -N $SAFE_NAT_IPT -t nat
$IP6TABLES -N $SAFE_NAT_SAFE -t nat

if [ "$VENDOR" != "VHT" ]
then
$IP6TABLES -I $FORWARD_IPT_RULE
$IP6TABLES -t nat -I $NAT_IPT_RULE
fi

$IP6TABLES -A $PKT_VERIDCT_IPT -p tcp --tcp-flags FIN,SYN,ACK SYN -j SET --del-set $WHT_IPSET6 dst,srcmac
$IP6TABLES -A $PKT_VERIDCT_IPT -p tcp --tcp-flags FIN,SYN,ACK SYN -j SET --add-set $TMP_IPSET6 dst,srcmac
$IP6TABLES -A $PKT_VERIDCT_IPT -p tcp --tcp-flags FIN,SYN,RST,ACK ACK -m set ! --match-set $VSAFES_IPSET6 dst -m set ! --match-set $TMP_IPSET6 dst,srcmac -j REJECT --reject-with tcp-reset
$IP6TABLES -A $PKT_VERIDCT_IPT -p tcp --tcp-flags FIN,SYN,RST,ACK ACK -m set --match-set $WHT_IPSET6 dst,srcmac -j ACCEPT
$IP6TABLES -A $PKT_VERIDCT_IPT -p tcp --tcp-flags FIN,SYN,RST,ACK ACK -m length --length 40:10000 -j NFQUEUE --queue-bypass --queue-balance 0:3
$IP6TABLES -A $PKT_VERIDCT_IPT -p udp -m set ! --match-set $WHT_IPSET6 dst,srcmac -j DROP

$IP6TABLES -A $FORWARD_IPT_RULE_1
$IP6TABLES -A $FORWARD_IPT_RULE_2
$IP6TABLES -t nat -A $NAT_IPT_RULE_1
$IP6TABLES -t nat -A $NAT_IPT_RULE_2
fi

else
echo "There have to be at least 2 queues."
exit 
fi
}

deinit() {
#IPV4
#Flush VSAFE FILTER CHAIN
$IPTABLES -F $DEVICE_LIST_IPT
$IPTABLES -F $FILTERD_IPT
$IPTABLES -F $PKT_VERIDCT_IPT

#Flush VSAFE NAT CHAIN
$IPTABLES -F $SAFE_NAT_SAFE -t nat
$IPTABLES -F $SAFE_NAT_IPT -t nat

if [ "$VENDOR" != "VHT" ]
then
# Delete VCS HOOK CHAIN
$IPTABLES -D $FORWARD_IPT_RULE
$IPTABLES -t nat -D $NAT_IPT_RULE

#Destroy VSAFE CHAIN
$IPTABLES -X $FILTERD_IPT
$IPTABLES -X $PKT_VERIDCT_IPT
$IPTABLES -X $DEVICE_LIST_IPT
$IPTABLES -X $SAFE_NAT_IPT -t nat
$IPTABLES -X $SAFE_NAT_SAFE -t nat
fi

#IPV6
#Flush VSAFE FILTER CHAIN
$IP6TABLES -F $DEVICE_LIST_IPT
$IP6TABLES -F $FILTERD_IPT
$IP6TABLES -F $PKT_VERIDCT_IPT

#Flush VSAFE NAT CHAIN
$IP6TABLES -F $SAFE_NAT_SAFE -t nat
$IP6TABLES -F $SAFE_NAT_IPT -t nat

if [ "$VENDOR" != "VHT" ]
then
# Delete VCS HOOK CHAIN
$IP6TABLES -D $FORWARD_IPT_RULE
$IP6TABLES -t nat -D $NAT_IPT_RULE

#Destroy VSAFE CHAIN
$IP6TABLES -X $FILTERD_IPT
$IP6TABLES -X $PKT_VERIDCT_IPT
$IP6TABLES -X $DEVICE_LIST_IPT
$IP6TABLES -X $SAFE_NAT_IPT -t nat
$IP6TABLES -X $SAFE_NAT_SAFE -t nat
fi

#ipset
if [ -f $IPSET ]
then
$IPSET -q destroy $WHT_IPSET
$IPSET -q destroy $TMP_IPSET
$IPSET -q destroy $WHT_IPSET6
$IPSET -q destroy $TMP_IPSET6
$IPSET -q destroy $VSAFES_IPSET
$IPSET -q destroy $VSAFES_IPSET6
fi
}


$@