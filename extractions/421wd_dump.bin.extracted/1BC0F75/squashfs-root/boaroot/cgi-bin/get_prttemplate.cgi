#!/bin/sh

echo -e "Content-Type: application/json\r\n\r\n"

IFS='=&'

#if [ ! "$QUERY_STRING" ]; then
#    exit 0
#fi

#set -- $QUERY_STRING

echo -e " { "
for id in 0 1 2 3 4 5 6 7 8 9 10 11
do
    /userfs/bin/tcapi set WebCurSet_Entry template_id "$id"
    ENABLE="$(/userfs/bin/tcapi get ParentalCtrl_Template_Entry Enable)"
    echo -e "\"enable$id\": \"$ENABLE\","
    if [ "$ENABLE" = "Yes" ]; then
        NAME=`/userfs/bin/tcapi get ParentalCtrl_Template_Entry TemplateName`
        TYPE=`/userfs/bin/tcapi get ParentalCtrl_Template_Entry FilterType`
        MODE=`/userfs/bin/tcapi get ParentalCtrl_Template_Entry FilterMode`
        START=`/userfs/bin/tcapi get ParentalCtrl_Template_Entry StartTimeEffect`
        DURATION=`/userfs/bin/tcapi get ParentalCtrl_Template_Entry EndTimeEffect`
        REPEAT=`/userfs/bin/tcapi get ParentalCtrl_Template_Entry Repeat`
        echo -e "\"name$id\": \"$NAME\",\"type$id\": \"$TYPE\",\"mode$id\": \"$MODE\",\"start$id\": \"$START\",\"end$id\": \"$DURATION\",\"repeat$id\": \"$REPEAT\","
        for entry in 0 1 2 3 4 5 6 7 8 9
        do
            ADDR=`/userfs/bin/tcapi get ParentalCtrl_Template_Entry Address$entry`
            ADDRTYPE=`/userfs/bin/tcapi get ParentalCtrl_Template_Entry AddressType$entry`
            echo -e "\"addr$id""_$entry\":\"$ADDR\","
            echo -e "\"addrtype$id""_$entry\":\"$ADDRTYPE\","
        done
    fi;
done
echo -e " \"end\": \"none\" }"