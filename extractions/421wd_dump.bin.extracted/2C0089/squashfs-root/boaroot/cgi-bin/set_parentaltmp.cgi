#!/bin/sh

echo -e "Content-Type: application/json\r\n\r\n"

IFS='=&'

if [ ! "$QUERY_STRING" ]; then
	echo -e '{"success" : "no"}'
    exit 0
fi

set -- $QUERY_STRING

if [ $2 -le 100 ]; then

	/userfs/bin/tcapi set WebCurSet_Entry template_id $2
	echo -e '{"success" : "yes"}'
else
	echo -e '{"success" : "no"}'
fi