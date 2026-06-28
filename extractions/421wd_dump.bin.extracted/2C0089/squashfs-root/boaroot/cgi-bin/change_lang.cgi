#!/bin/sh
echo -e "Content-Type: application/json\r\n\r\n"
IFS='=&'

if [ ! "$QUERY_STRING" ]; then
	exit 0
fi

set -- $QUERY_STRING

/userfs/bin/tcapi set LanguageSwitch_Entry Type $4
if [ $4 -eq 1 ]; then
	/userfs/bin/tcapi set LanguageSwitch_Entry Language Vietnamese
else
	/userfs/bin/tcapi set LanguageSwitch_Entry Language English
fi
/userfs/bin/tcapi commit LanguageSwitch_Entry
/userfs/bin/tcapi save
echo -e '{"success" : "yes"}'
