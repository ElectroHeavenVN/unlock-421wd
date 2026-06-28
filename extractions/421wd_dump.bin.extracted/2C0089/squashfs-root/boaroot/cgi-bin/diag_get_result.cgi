#!/bin/sh
echo -e "Content-Type: text/html\r\n\r\n"

IFS='=&'
set -- $QUERY_STRING
awk 'NR=="'"$2"'"' /tmp/diag_file
