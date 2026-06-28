#!bin/sh
BINDBIT_FILE="/tmp/bindbit_all"
ACTION="$1"
TIMEOUT=60


get_modinfo() {
    MODULE="$1"
    lsmod | grep -q "\b$MODULE\b"
    if [ $? -ne 0 ]; then
        echo "0"
    else
        /usr/bin/logger  "Module $MODULE is loaded!"
        echo "1"
    fi
}


down_port() {
    if [ "$1" -eq 0 ]; then
        /usr/bin/logger "No bridged LAN need to be down"
        exit 0
    fi

    #blocking util module eth_ephy is insmoded
    is_have_eth=$(get_modinfo eth_ephy) 
    while [ $is_have_eth -eq 0 ]
    do
        sleep 1
        is_have_eth=$(get_modinfo eth_ephy) 
    done

    sleep 2
    for i in 0 1 2 3
    do
        if [ "$(( $1 & (1<<i) ))" -ne 0 ]; then
            /usr/bin/logger "LAN $((i+1)) is bridged, going down: ethphxcmd miiw "$((4-i))" 0 0800"
            /userfs/bin/ethphxcmd miiw $((4-i)) 0 0800
        fi
    done

    #timeout to up bridged lan port, backup in case omci doesn't execute the up_port command
    sleep $TIMEOUT
    if [ -f $BINDBIT_FILE ]; then
        /usr/bin/logger "Bridged LANs is still down, going up"
        BINDBIT=`cat $BINDBIT_FILE`
        up_port $BINDBIT
    else
        /usr/bin/logger "All bridged LANs is up, nothing to do"
        exit 0
    fi
}

up_port() {
    if [ "$1" -eq 0 ]; then
        /usr/bin/logger "No bridged LAN need to be up" 
        exit 0
    fi

    for i in 0 1 2 3
    do
        if [ "$(( $1 & (1<<i) ))" -ne 0 ]; then
            /usr/bin/logger "LAN $((i+1)) is bridged, going up: ethphxcmd miiw "$((4-i))" 0 1200"
            /userfs/bin/ethphxcmd miiw "$((4-i))" 0 1200
        fi
    done

    #remove bindbit file after up port
    rm -f $BINDBIT_FILE
}


if [ -f $BINDBIT_FILE ]; then
   BINDBIT_ALL=`cat $BINDBIT_FILE`
else
   /usr/bin/logger "File $BINDBIT_FILE does not exist."
   exit 0
fi

if [ "$BINDBIT_ALL" -gt 15 ]; then
    /usr/bin/logger "Invalid bindbit_all: $BINDBIT_ALL"
    exit 1
fi


case $ACTION in
    down)
        down_port $BINDBIT_ALL
    ;;

    up)
        sleep 15
        up_port $BINDBIT_ALL
    ;;
esac


