#!/bin/sh

echo -e "Content-Type: application/json\r\n\r\n"

IFS='=&'

set -- $QUERY_STRING

echo -e "{"
for i in 1 2 3 4 5 6 7 8 
do
    index=$(( $i-1 ))
    NUM=`/userfs/bin/tcapi get wifimactab.common NUM$index`
    echo -e "\"num$i\": \"$NUM\","
    if [ "$NUM" = "no node information" ]; then
        continue
    elif [ "$NUM" = "no attribute information" ]; then
        continue
    else
        j=1; k=1
        while [ $k -le $NUM ]; do
            MAC=`/userfs/bin/tcapi get wifimactab.pvc.$i.entry.$j MAC`
            IP=`/userfs/bin/tcapi get wifimactab.pvc.$i.entry.$j IP`
            RSSI=`/userfs/bin/tcapi get wifimactab.pvc.$i.entry.$j RSSI`
            RATE=`/userfs/bin/tcapi get wifimactab.pvc.$i.entry.$j DataRate`
            if [ "$MAC" = "no node information" ]; then
            	j=$(( $j+1 ))
        		continue
			fi 
			
            echo -e "\"mac$i.$k\": \"$MAC\",\"ip$i.$k\": \"$IP\",\"rssi$i.$k\": \"$RSSI\",\"rate$i.$k\": \"$RATE\","
            j=$(( $j+1 ))
            k=$(( $k+1 ))
        done
    fi
done

echo -e " \"end\": \"none\" }"