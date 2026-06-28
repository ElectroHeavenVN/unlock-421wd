#!/bin/sh
echo -e "Content-Type: text/html\r\n\r\n"

rm -rf /tmp/diag_file
IFS='=&'

if [ ! "$QUERY_STRING" ]; then
    exit 0
fi

set -- $QUERY_STRING

is_ip() {
    local ip=$1
    local is_ip_check=1

    if expr "$ip" : '[0-9,.]*$' >/dev/null; then
       ## Go with validate IP
       is_ip_check=1
    else
       ## Go with validate domain
       is_ip_check=0
    fi
    
    echo "Is IP Ch: $is_ip_check"

    if [ "$is_ip_check" -ne 0 ]; then
        if expr "$ip" : '[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*$' >/dev/null; then
            for i in 1 2 3 4; do
                if [ $(echo "$ip" | cut -d. -f$i) -gt 255 ]; then
                        return 1
                fi
            done
            return 0
        fi
        return 1
    else
        #result=`echo $ip | pcregrep '(?=^.{1,254}$)(^(?>(?!\d+\.)[a-zA-Z0-9_\-]{1,63}\.?)+(?:[a-zA-Z]{2,})$)'`
        #ONT-335
        result=`echo $ip | pcregrep '(?=^.{4,253}$)(^(?>((?!\d+\.)|(?!\D+\.))[a-zA-Z0-9_\-]{1,63}\.?)+(?:[a-zA-Z]{2,})$)`
        #ONT-335
        if [ -z "$result" -o "$result" -eq " " ]; then
            return 2
        else
            return 0
        fi
    fi
}

TMP=`cat /proc/tc3162/eth_link_st`
if [ $TMP = "Down" ]; then
    echo Fail >> /tmp/diag_file
else
    echo PASS >> /tmp/diag_file
fi

TMP=`/userfs/bin/tcapi get xpon.linkcfg LinkSta`
if [ $TMP = "1" ]; then
    echo PASS >> /tmp/diag_file
else
    echo Fail >> /tmp/diag_file
fi

TMP=`/userfs/bin/tcapi get xpon.common trafficStatus`
if [ $TMP = "up" ]; then
    echo PASS >> /tmp/diag_file
else
    echo Fail >> /tmp/diag_file
fi

dns=`/userfs/bin/tcapi get WanInfo_Entry$16 DNS`
ping -c 1 $dns
if [ $? = "0" ]; then
    echo PASS >> /tmp/diag_file
else
    echo Fail >> /tmp/diag_file
fi

is_ip $2
func_ret=$?

if [ "$func_ret" -ne 0 ]; then
    if [ "$func_ret" -eq 2 ]; then
    echo Invalid DomainName!!! >> /tmp/diag_file
    else
    echo Invalid IP!!! >> /tmp/diag_file
    fi
    echo END OF DIAG >> /tmp/diag_file
    exit 0
fi

#ONT-313
if [ $4 = "ping" ]; then
    test $6 -ge 0 > /dev/null

    if [ $? -ge 1 ] || [ $6 -gt 10 ] || [ $6 -lt 1 ]; then
        echo Invalid Count!!! >> /tmp/diag_file
        echo END OF DIAG >> /tmp/diag_file
        exit 0
    fi

    test $8 -ge 0 > /dev/null

    if [ $? -ge 1 ] || [ $8 -gt 1472 ] || [ $8 -lt 4 ]; then
        echo Invalid Size!!! >> /tmp/diag_file
        echo END OF DIAG >> /tmp/diag_file
        exit 0
    fi

    test $10 -ge 0 > /dev/null

    if [ $? -ge 1 ] || [ $10 -gt 2000 ] || [ $10 -lt 100 ]; then
        echo Invalid Timeout!!! >> /tmp/diag_file
        echo END OF DIAG >> /tmp/diag_file
        exit 0
    fi
fi

#ONT-313
if [ $4 = "tracert" ]; then
    test $12 -ge 0 > /dev/null

    if [ $? -ge 1 ] || [ $12 -gt 30 ] || [ $12 -lt 1 ]; then
        echo Invalid Max TTL!!! >> /tmp/diag_file
        echo END OF DIAG >> /tmp/diag_file
        exit 0
    fi
fi

if [ $4 = "ping" ]; then
    ping -c $6 -s $8 -i $14 $2 >> /tmp/diag_file
    echo END OF DIAG >> /tmp/diag_file
elif [ $4 = "tracert" ]; then
    traceroute -m $12 -i $14 $2  >> /tmp/diag_file
    echo END OF DIAG >> /tmp/diag_file
else
    echo COMMAND is invalid!  >> /tmp/diag_file
    echo END OF DIAG >> /tmp/diag_file
fi
