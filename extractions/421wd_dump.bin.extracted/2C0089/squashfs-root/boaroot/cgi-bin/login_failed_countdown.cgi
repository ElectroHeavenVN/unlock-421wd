#!/bin/sh

echo -e "Content-Type: application/json\r\n\r\n"

echo -e "{ "

echo -e " \"uptime\": \""`cat /proc/uptime | head -n1 | awk '{print $1;}'`"\"",

echo -e " \"end\": \"none\" }"