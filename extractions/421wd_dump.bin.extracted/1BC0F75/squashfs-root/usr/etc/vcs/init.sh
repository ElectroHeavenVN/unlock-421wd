#!/bin/sh

FIREWALL_MODE=$2
QUEUE_NUM=$3
VENDOR=$4

if [ "$VENDOR" = "VHT" ]
then
    VCS_DIR=/data/vcs
    IPTABLES_SCRIPT=/data/vcs/iptable_init.sh
    NFT_INIT_SCRIPT=/data/vcs/nft_init.sh
    NFT_DEINIT_SCRIPT=/data/vcs/nft_deinit.sh
    DNSMASQ=/userfs/bin/vcs-dnsmasq
else
    VCS_DIR=/etc/vcs
    IPTABLES_SCRIPT=/etc/vcs/iptable_init.sh
    NFT_SCRIPT=/etc/vcs/nft_init.sh
    NFT_DEINIT_SCRIPT=/etc/vcs/nft_deinit.sh
    DNSMASQ=/usr/sbin/dnsmasq
fi


firewall_init() {
    if [ "$FIREWALL_MODE" = "0" ]
    then
        $NFT_SCRIPT $QUEUE_NUM
    elif [ "$FIREWALL_MODE" = "1" ]
    then
        $IPTABLES_SCRIPT init $VENDOR $QUEUE_NUM
    fi
}

dhcp() {
    /etc/vcs/dhcp.sh $1
}

firewall_deinit() {
    if [ "$FIREWALL_MODE" = "0" ]
    then
        $NFT_DEINIT_SCRIPT
    elif [ "$FIREWALL_MODE" = "1" ]
    then
        $IPTABLES_SCRIPT deinit $VENDOR
    fi
}

dnsmasq_init() {
    $DNSMASQ -C $VCS_DIR/tRest.dnsmasq -x $VCS_DIR/dnsmasq.tRest.pid
}

dnsmasq_deinit() {
    if [ "$VENDOR" = "VHT" ]
    then
        pidof vcs-dnsmasq | xargs kill -9
    elif [ -f $VCS_DIR/dnsmasq.tRest.pid ];
    then
        cat $VCS_DIR/dnsmasq.tRest.pid | xargs kill -9 &&\
        rm $VCS_DIR/dnsmasq.tRest.pid
    fi
}

init() {
    firewall_init
    dnsmasq_init
}

deinit() {
    firewall_deinit
    dnsmasq_deinit
}

start() {
    deinit 2>&1 >> /dev/null
    init
}

$@