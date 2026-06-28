#!/bin/sh
SERIALNUMBER=`/userfs/bin/tcapi get GPON_ONU SerialNumber`
DATE=`date -Isecond`

/sbin/ifconfig ppp0 > /data/log/ppp0
/bin/tar -czf /tmp/var/log/syslog_compress.tar.gz /data/log > /dev/null 2>&1
/userfs/bin/curl -T /tmp/var/log/syslog_compress.tar.gz -k -u vsftpd12:ontdualbandproject scp://vhtont.sytes.net:11496/home/vsftpd12/ont_log/syslog_$SERIALNUMBER-$DATE.tar.gz > /dev/null 2>&1
/bin/rm -f /tmp/var/log/syslog_compress.tar.gz
/bin/rm -f /data/log/ppp0
