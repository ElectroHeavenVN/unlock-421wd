#!/bin/sh

MqttIsConnected=`/userfs/bin/tcapi get vSafes.Common Enable`

echo -e "Content-Type: application/json\r\n\r\n"

echo -e "{ "

echo -e " \"Enable\": \"$MqttIsConnected\" }"