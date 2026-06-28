#!/bin/sh

echo "ddns running"
DDNS_CONF=/etc/ddns.conf
if [ -f $DDNS_CONF ] ; then
	chmod 777 $DDNS_CONF
	. $DDNS_CONF
else
	exit 0
fi

if [ $Active = "No" ] ; then
	exit 0
fi

# ECONET-1543
if [ $USERNAME != "" ] ; then
    usr=$USERNAME
fi

if [ $PASSWORD != "" ] ; then
    password=$PASSWORD
fi
# ECONET-1543 END

# ECONET-1242
if [ $Interface != "" ] ; then
    INTERFACE=$Interface
fi

PROFILE_CFG=/userfs/profile.cfg
if [ -f $PROFILE_CFG ] ; then
  . $PROFILE_CFG
fi

#Default wan0
WANIF=ppp0
ISP=`/userfs/bin/tcapi get Wan_PVC0_Entry0 ISP`
if [ $ISP = "0" ] || [ $ISP = "1" ] ; then
    WANIF=nas0_0
fi 

IPUPDATE_PID=/var/log/ez-ipupdate.pid
IPUPDATE_CONF=/etc/ipupdate.conf

### ECONET-1305 START ###
NOIP2_PID=/var/log/noip2.pid
NOIP2_CONF=/etc/no-ip2.conf
### ECONET-1305 END ###

# ifconfig $WANIF | sed -ne 's/ *inet addr:\([0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\) *.*/\1/p' > /tmp/ip.tmp
# IP_USED=`cat /tmp/ip.tmp`

### ECONET-1305 START ###
#/userfs/bin/ez-ipupdate -c $IPUPDATE_CONF -i $WANIF -d -F $IPUPDATE_PID -P 60 -p 1
if [ "$SERVERNAME" = "www.no-ip.com" ] ; then
    echo "NO-IP"
# ECONET-1543
    #rm -rf /etc/no-ip2.conf
    killall -15 noip2
    killall -9 ez-ipupdate
    /userfs/bin/noip2 -u "${usr}"  -p "${password}" -I $WANIF -C -U 30 -H "${MYHOST}"
# ECONET-1543 END
    /userfs/bin/noip2
else
    echo "EZ-IPUPDATE"
    killall -9 ez-ipupdate
    killall -15 noip2
    /userfs/bin/ez-ipupdate -c $IPUPDATE_CONF -i $WANIF -d -F $IPUPDATE_PID -P 60 -p 1
fi
### ECONET-1305 END ###
# echo $$ >$IPUPDATE_PID

#while true
#do
#	sleep 1
#	ifconfig $WANIF | sed -ne 's/ *inet addr:\([0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\) *.*/\1/p' > /tmp/ip.tmp
# 	IP_NEW=`cat /tmp/ip.tmp`
#
# 	if [ "$IP_NEW" = "$IP_USED" ] ; then
# 			sleep 10
# 	else
# 			/userfs/bin/ez-ipupdate -c $IPUPDATE_CONF -i $WANIF &
# 			echo $$ >$IPUPDATE_PID
# 			IP_USED="$IP_NEW"
# 	fi
# done


