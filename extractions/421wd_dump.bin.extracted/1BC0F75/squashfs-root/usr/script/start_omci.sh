#!/bin/sh
PROFILE_CFG=/userfs/profile.cfg
if [ -f $PROFILE_CFG ] ; then
    chmod 777 $PROFILE_CFG
    . $PROFILE_CFG
fi

while [ ! -f "/tmp/wan_boot_completed" ]; do
sleep 1;
done;

/usr/bin/logger "[OMCI][WAN] /tmp/wan_boot_completed is exist"

if [ "$TCSUPPORT_NP" = "" ] ;then
/userfs/bin/omci &
fi