#!/bin/sh
SERIALNUMBER=`/userfs/bin/tcapi get GPON_ONU SerialNumber`
DATE=`date +%d-%b-%Y_%Hh-%Mm-%Ss`
USERNAME=`/userfs/bin/tcapi get WAN_PVC_Entry0 USERNAME`

LOG_DIR="/data/log"
INPUT_FILES=$LOG_DIR
LOG_OVERVIEW="overview"
LOG_FIRMWARE_INFO="fwinfo"
TMP_SYSLOG_DIR="/tmp/var/log/syslog"
COMPRESS_FILE="ontw5_"$USERNAME"_"$SERIALNUMBER"_"$DATE".tar.gz"

mkdir -p $TMP_SYSLOG_DIR
rm -f $TMP_SYSLOG_DIR/*

touch $LOG_DIR/$LOG_OVERVIEW
echo -e "Log time: $DATE" >> "$LOG_DIR/$LOG_OVERVIEW"
echo -e "-------------Power on history-------------" >> "$LOG_DIR/$LOG_OVERVIEW"
Power_On_History=`/userfs/bin/tcapi get DeviceInfo passedSystime`
echo -e "Uptime: $Power_On_History" >> "$LOG_DIR/$LOG_OVERVIEW"

echo -e "-------------ONT online status (GPON)-------------" >> "$LOG_DIR/$LOG_OVERVIEW"
ONT_Online_Status_Physical=`/userfs/bin/tcapi get XPON_Common phyStatus`
ONT_Online_Status_Traffic=`/userfs/bin/tcapi get XPON_Common trafficStatus`
echo -e "Physical Status: $ONT_Online_Status_Physical" >> "$LOG_DIR/$LOG_OVERVIEW"
echo -e "Traffic Status: $ONT_Online_Status_Traffic" >> "$LOG_DIR/$LOG_OVERVIEW"

echo -e "-------------PPPoE session info-------------" >> "$LOG_DIR/$LOG_OVERVIEW"
PPPoE_Session_TX=`cat /sys/class/net/ppp0/statistics/tx_packets`
PPPoE_Session_RX=`cat /sys/class/net/ppp0/statistics/rx_packets`
PPPoE_Session_RX_Error=`cat /sys/class/net/ppp0/statistics/rx_errors`
PPPoE_Session_TX_Error=`cat /sys/class/net/ppp0/statistics/tx_errors`
PPPoE_Session_RX_Drop=`cat /sys/class/net/ppp0/statistics/rx_dropped`
PPPoE_Session_TX_Drop=`cat /sys/class/net/ppp0/statistics/tx_dropped`
echo -e "TX packet: $PPPoE_Session_TX" >> "$LOG_DIR/$LOG_OVERVIEW"
echo -e "TX packet Error: $PPPoE_Session_TX_Error" >> "$LOG_DIR/$LOG_OVERVIEW"
echo -e "TX packet Drop: $PPPoE_Session_TX_Drop" >> "$LOG_DIR/$LOG_OVERVIEW"
echo -e "RX packet: $PPPoE_Session_RX" >> "$LOG_DIR/$LOG_OVERVIEW"
echo -e "RX packet Error: $PPPoE_Session_RX_Error" >> "$LOG_DIR/$LOG_OVERVIEW"
echo -e "RX packet Drop: $PPPoE_Session_RX_Drop" >> "$LOG_DIR/$LOG_OVERVIEW"

echo -e -n "-------------WAN status-------------" >> "$LOG_DIR/$LOG_OVERVIEW"
for i in 0 8 16 24 32 40 48 56
do
    index=$i 
    echo -e -n "\nWAN$(($i/8)) " >> "$LOG_DIR/$LOG_OVERVIEW"
    WAN_Status=`/userfs/bin/tcapi get WanInfo_Entry$index Status`
    WAN_Name=`/userfs/bin/tcapi get WanInfo_Entry$index GUIInterfaceName`
    WAN_IP4=`/userfs/bin/tcapi get WanInfo_Entry$index IP`
    WAN_IP6=`/userfs/bin/tcapi get WanInfo_Entry$index IP6`
    if [ "$WAN_Status" != "no node information" ]; then
        echo -e -n "Status:$WAN_Status " >> "$LOG_DIR/$LOG_OVERVIEW"
    else 
        echo -e -n "Status:down " >> "$LOG_DIR/$LOG_OVERVIEW"
    fi
    if [ "$WAN_Name" != "no node information" ]; then
        echo -e -n "Name:$WAN_Name " >> "$LOG_DIR/$LOG_OVERVIEW"
    fi
    if [ "$WAN_IP4" != "no node information" ]; then
        echo -e -n "IPv4:$WAN_IP4 " >> "$LOG_DIR/$LOG_OVERVIEW"
    fi 
    if [ "$WAN_IP6" != "no node information" ]; then
        echo -e -n "IPv6:$WAN_IP6 " >> "$LOG_DIR/$LOG_OVERVIEW"
    fi 
done

echo -e "\n-------------Bridge information-------------" >> "$LOG_DIR/$LOG_OVERVIEW"
/sbin/ifconfig br0 >> "$LOG_DIR/$LOG_OVERVIEW"

echo -e "\n-------------Wifi client connections-------------" >> "$LOG_DIR/$LOG_OVERVIEW"
for i in 1 2 3 4 5 6 7 8
do
    if [ "$i" = 1 ]; then
        echo -e -n "Wifi 2.4Ghz: " >> "$LOG_DIR/$LOG_OVERVIEW"
    elif [ "$i" = 5 ]; then
        echo -e -n "\nWifi 5Ghz: " >> "$LOG_DIR/$LOG_OVERVIEW"
    fi 

    index=$(($i-1))
    NUM=`/userfs/bin/tcapi get wifimactab.common NUM$index`
    if [ "$NUM" = "no node information" ]; then
        continue
    elif [ "$NUM" = "no attribute information" ]; then
        continue
    else
        j=1
        while [ $j -le $NUM ]; do
            MAC=`/userfs/bin/tcapi get wifimactab.pvc.$i.entry.$j MAC`
            echo -e -n "$MAC " >> "$LOG_DIR/$LOG_OVERVIEW"
            j=$(($j+1))
        done
    fi
done

/userfs/bin/mapd_cli /tmp/mapd_ctrl dump_topology_v1
echo -e "\n-------------Device in topology-------------" >> "$LOG_DIR/$LOG_OVERVIEW"
cat /tmp/dump.txt | grep Serial >> "$LOG_DIR/$LOG_OVERVIEW"

echo -e "\n-------------Other Information-------------" >> "$LOG_DIR/$LOG_OVERVIEW"
echo -e "SerialNumber: $SERIALNUMBER" >> "$LOG_DIR/$LOG_OVERVIEW"
FIRMWARE_VER=`/userfs/bin/tcapi get DeviceInfo_devParaStatic CustomerSWVersion`
echo -e "Firmware version: $FIRMWARE_VER" >> "$LOG_DIR/$LOG_OVERVIEW"
TR069_STATUS=`/userfs/bin/tcapi get Cwmp_Entry Inform_Status`
if [ "$TR069_STATUS" = 8 ]; then
    TR069_STATUS="Success"
else
    TR069_STATUS="Failed"
fi
echo -e "TR069 status: $TR069_STATUS" >> "$LOG_DIR/$LOG_OVERVIEW"
echo -e "\n********************************************************************************" >> "$LOG_DIR/$LOG_OVERVIEW"
echo -e "********************************************************************************" >> "$LOG_DIR/$LOG_OVERVIEW"

touch $LOG_DIR/$LOG_FIRMWARE_INFO
echo $?
echo -e "-------------Image information-------------" > "$LOG_DIR/$LOG_FIRMWARE_INFO"
/usr/bin/sys img info | tail -n 2 >> $LOG_DIR/$LOG_FIRMWARE_INFO
/usr/bin/sys bootflag read | tail -n 1 >> $LOG_DIR/$LOG_FIRMWARE_INFO

echo -e "-------------Build version information-------------" >> "$LOG_DIR/$LOG_FIRMWARE_INFO"
cat /proc/version >> $LOG_DIR/$LOG_FIRMWARE_INFO

echo -e "-------------Gitrevision information-------------" >> "$LOG_DIR/$LOG_FIRMWARE_INFO"
cat /etc/gitrevision >> $LOG_DIR/$LOG_FIRMWARE_INFO

/sbin/ifconfig ppp0 >> "$LOG_DIR/ppp0"

/bin/tar -czf $TMP_SYSLOG_DIR/$COMPRESS_FILE $LOG_DIR >/dev/null 2>&1
/userfs/bin/curl -T $TMP_SYSLOG_DIR/$COMPRESS_FILE -k -u vsftpd12:ontdualbandproject scp://vhtont.sytes.net:11496/home/vsftpd12/ont_log/$COMPRESS_FILE > /dev/null 2>&1

/bin/rm -f $LOG_DIR/$LOG_FIRMWARE_INFO
/bin/rm -f $TMP_SYSLOG_DIR/$COMPRESS_FILE
/bin/rm -f /data/log/ppp0

# Upload all log files of all Agents to Viettel Remote Server
/usr/bin/open_dbg_connection -c uplog
