#!/bin/sh

echo -e "Content-Type: application/json\r\n\r\n"

STATUS=`/userfs/bin/tcapi get Ddns_Entry ConnStatus`
TIME=`/userfs/bin/tcapi get Ddns_Entry lastUpdateTime`

echo -e "{ \"status\": \"$STATUS\", \"time\": \"$TIME\"}"