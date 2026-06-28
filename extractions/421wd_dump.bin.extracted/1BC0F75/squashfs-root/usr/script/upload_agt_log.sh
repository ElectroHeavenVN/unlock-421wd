#!bin/sh

URL="vhtont.sytes.net:11496/home/vsftpd12/ont_log/"
USERNAME="vsftpd12"
PASSWORD="ontdualbandproject"
CODE="VT_UPLOAD_AGT_LOG"

/userfs/bin/mapd_cli /tmp/mapd_ctrl send_VT_vendor_specific "-c $CODE -x $URL -u $USERNAME -p $PASSWORD"
