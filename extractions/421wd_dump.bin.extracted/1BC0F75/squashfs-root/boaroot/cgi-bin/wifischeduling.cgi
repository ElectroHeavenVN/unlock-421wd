#!/bin/sh

echo -e "Content-Type: application/json\r\n\r\n"

CRONTAB_DIR="/data/crontest/cron/"
SCHEDULE_FILE="/data/crontest/cron/admin"
WIFI_ON="/data/crontest/wifischeduling_on.sh"
WIFI_OFF="/data/crontest/wifischeduling_off.sh"

IFS='=&'

if [ ! "$QUERY_STRING" ]; then
   exit 0
fi

set -- $QUERY_STRING

case "$2" in
    "init")
    ;;

    "apply")
        `/userfs/bin/tcapi set Wifischeduling_Entry$4 Enable $6`
        `/userfs/bin/tcapi set Wifischeduling_Entry$4 Name $8`
        `/userfs/bin/tcapi set Wifischeduling_Entry$4 StartTime $10`
        `/userfs/bin/tcapi set Wifischeduling_Entry$4 EndTime $12`
        `/userfs/bin/tcapi set Wifischeduling_Entry$4 Repeat $14`
        `/userfs/bin/tcapi commit wifischeduling`
        `/userfs/bin/tcapi save`
    ;;

    "edit")
        ENABLE=`/userfs/bin/tcapi get Wifischeduling_Entry$4 Enable`
        NAME=`/userfs/bin/tcapi get Wifischeduling_Entry$4 Name`
        START_TIME=`/userfs/bin/tcapi get Wifischeduling_Entry$4 StartTime`
        END_TIME=`/userfs/bin/tcapi get Wifischeduling_Entry$4 EndTime`
        REPEAT=`/userfs/bin/tcapi get Wifischeduling_Entry$4 Repeat`
        echo -e " { "
        echo -e "\"enable\": \"$ENABLE\",\"name\": \"$NAME\",\"starttime\": \"$START_TIME\",\"endtime\": \"$END_TIME\",\"repeat\": \"$REPEAT\"}"
        # echo -e " \"end\": \"none\" }"
    ;;
esac