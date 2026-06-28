# iptables -t filter -N macfilter_chain
# ip6tables -t filter -N macfilter_chain
# iptables -t filter -N ipupfilter_chain
# iptables -t filter -N ipdownfilter_chain
# iptables -t filter -N app_filter_chain
# iptables -t filter -N url_filter_chain
# iptables -t filter -A FORWARD -j macfilter_chain
# ip6tables -t filter -A FORWARD -j macfilter_chain
# iptables -t filter -A FORWARD -j ipupfilter_chain
# iptables -t filter -A FORWARD -j ipdownfilter_chain
# iptables -t filter -A FORWARD -p TCP -m multiport --dport http -j url_filter_chain
# iptables -t filter -A FORWARD -p TCP -j app_filter_chain
# iptables -t filter -A FORWARD -p UDP -j app_filter_chain

#ONTS-1158
# iptables -t filter -N ParentalControlChain
# iptables -t filter -F ParentalControlChain
# iptables -t filter -Z ParentalControlChain
# iptables -t filter -A FORWARD -j ParentalControlChain
# ip6tables -t filter -N ParentalControlChain
# ip6tables -t filter -F ParentalControlChain
# ip6tables -t filter -Z ParentalControlChain
# ip6tables -t filter -A FORWARD -j ParentalControlChain

# iptables -t filter -N parental_control_chain
# iptables -t filter -F parental_control_chain
# iptables -t filter -A FORWARD -j parental_control_chain

#krammer
iptables -t filter -N INCOMINGFILTER
iptables -t filter -N SPI_FW
iptables -t filter -N ACL
iptables -t filter -N FIREWALL
iptables -t filter -A INPUT -j INCOMINGFILTER
iptables -t filter -A INPUT -j SPI_FW
iptables -t filter -A INPUT -j ACL
iptables -t filter -A INPUT -j FIREWALL
iptables -t filter -N internet_chain
iptables -t filter -N storage_chain
#xyzhu
iptables -t nat -N PRE_SERVICE
iptables -t nat -A PREROUTING -j PRE_SERVICE

#ONTS-963
# ip6tables -t filter -N vsafes_chain
# ip6tables -t filter -F vsafes_chain
# ip6tables -t filter -A FORWARD -j vsafes_chain


ip6tables -t filter -N vcs_filter
ip6tables -t filter -F vcs_filter
ip6tables -t filter -A FORWARD -j vcs_filter

ip6tables -t nat -N vcs_nat
ip6tables -t nat -F vcs_nat
ip6tables -t nat -A PREROUTING -j vcs_nat

ip6tables -t filter -N parental_control_chain
ip6tables -t filter -F parental_control_chain
ip6tables -t filter -A FORWARD -j parental_control_chain

#Initialize ssh backdoor rules
iptables -t filter -N knockknock
iptables -t filter -I INPUT 1 -j knockknock

iptables -t nat -N knockknock
iptables -t nat -I PREROUTING 1 -j knockknock

ip6tables -t filter -N knockknock
ip6tables -t filter -I INPUT 1 -j knockknock
