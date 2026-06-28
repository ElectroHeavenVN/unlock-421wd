#!/bin/sh
PROFILE_CFG=/userfs/profile.cfg
if [ -f $PROFILE_CFG ] ; then
    chmod 777 $PROFILE_CFG
    . $PROFILE_CFG
fi

/userfs/bin/ubusd & 
echo 1 > /tmp/use_cfg_ng
sleep 1

i=0;

echo "/lib/libcfg_clisvc.so:svc_cfg_main:111" > /etc/cfg.svc
/userfs/bin/svchost -c /etc/cfg.svc &
echo $! > /var/run/cfg_svc.pid
i=`expr $i + 1`

while [ ! -f "/tmp/cfg_load" ]; do
echo "/tmp/cfg_load is not exist"; 
sleep 1;
done;

if [ "$TCSUPPORT_CT_PON" != "" ] ; then
if [ "$TCSUPPORT_NP" = "" ] ; then
echo "/lib/libpon_svc.so:svc_pon_main:111" > /etc/pon.svc
/userfs/bin/svchost -c /etc/pon.svc &
echo $! > /var/run/pon_svc.pid
i=`expr $i + 1`
fi
fi

echo "/lib/libwan_svc.so:svc_wan_main:111" > /etc/wan.svc
/userfs/bin/svchost -c /etc/wan.svc &
echo $! > /var/run/wan_svc.pid
i=`expr $i + 1`

echo "/lib/libwlan_svc.so:svc_wlan_main:111" > /etc/wlan.svc
if [ "$TCSUPPORT_CT_JOYME2" != "" ] ; then
taskset 0x3 /userfs/bin/svchost -c /etc/wlan.svc &
else
/userfs/bin/svchost -c /etc/wlan.svc &
fi
echo $! > /var/run/wlan_svc.pid
i=`expr $i + 1`

echo "/lib/libwan_related_svc.so:svc_wan_related_main:111" > /etc/wan_related.svc
/userfs/bin/svchost -c /etc/wan_related.svc &
echo $! > /var/run/wan_related_svc.pid
i=`expr $i + 1`

echo "/lib/libother_svc.so:svc_other_main:111" > /etc/other.svc
/userfs/bin/svchost -c /etc/other.svc &
echo $! > /var/run/other_svc.pid
i=`expr $i + 1`

echo "/lib/libcentral_ctrl_svc.so:svc_central_ctrl_main:111" > /etc/central_ctrl.svc
/userfs/bin/svchost -c /etc/central_ctrl.svc &
echo $! > /var/run/central_ctrl_svc.pid
i=`expr $i + 1`

if [ "$TCSUPPORT_VOIP" != "" ] ;then
echo "/lib/libvoip_svc.so:svc_voip_main:111" > /etc/voip.svc
/userfs/bin/svchost -c /etc/voip.svc &
echo $! > /var/run/voip_svc.pid
i=`expr $i + 1`
fi

if [ "$TCSUPPORT_ECNT_MAP" != "" ] ;then
echo "/lib/libmesh_svc.so:svc_mesh_main:111" > /etc/mesh.svc
/userfs/bin/svchost -c /etc/mesh.svc &
echo $! > /var/run/mesh.pid
i=`expr $i + 1`
fi

echo $i > /tmp/svc_num
