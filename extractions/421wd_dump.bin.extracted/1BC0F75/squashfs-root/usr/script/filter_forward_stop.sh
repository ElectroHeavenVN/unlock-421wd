# iptables -t filter -X macfilter_chain
# ip6tables -t filter -X macfilter_chain
# iptables -t filter -X ipupfilter_chain
# iptables -t filter -X ipdownfilter_chain
# iptables -t filter -X app_filter_chain
# iptables -t filter -X url_filter_chain

#ONTS-1158
# iptables -t filter -D FORWARD -j ParentalControlChain
# iptables -t filter -F ParentalControlChain
# iptables -t filter -X ParentalControlChain
# ip6tables -t filter -D FORWARD -j ParentalControlChain
# ip6tables -t filter -F ParentalControlChain
# ip6tables -t filter -X ParentalControlChain

# iptables -t filter -D FORWARD -j parental_control_chain
# iptables -t filter -F parental_control_chain
# iptables -t filter -X parental_control_chain

#krammer
iptables -t filter -X SPI_FW
iptables -t filter -X ACL
iptables -t filter -X FIREWALL
#xyzhu
iptables -t nat -F PRE_SERVICE
iptables -t nat -D PREROUTING -j PRE_SERVICE
iptables -t nat -X PRE_SERVICE

#ONTS-963
# ip6tables -t filter -D FORWARD -j vsafes_chain
# ip6tables -t filter -F vsafes_chain
# ip6tables -t filter -X vsafes_chain

ip6tables -t filter -D FORWARD -j vcs_filter
ip6tables -t filter -F vcs_filter
ip6tables -t filter -X vcs_filter

ip6tables -t nat -D PREROUTING -j vcs_nat
ip6tables -t nat -F vcs_nat
ip6tables -t nat -X vcs_nat

ip6tables -t filter -D FORWARD -j parental_control_chain
ip6tables -t filter -F parental_control_chain
ip6tables -t filter -X parental_control_chain
