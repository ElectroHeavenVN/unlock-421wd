#!/bin/sh

echo -e "Content-Type: application/json\r\n\r\n"

IFS='=&'

if [ ! "$QUERY_STRING" ]; then
    exit 0
fi

set -- $QUERY_STRING

if [ $2 -eq 1 ]; then
	`/userfs/bin/tcapi set customerdebug_TempTelnet Active Yes`
    `/userfs/bin/tcapi commit customerdebug_TempTelnet`
	`/userfs/bin/tcapi save`
	echo -e "{ \"cmd\" : \"temp_open_tn\" }"
elif [ $2 -eq 2 ]; then
	`/userfs/bin/tcapi set customerdebug_TempTelnet Active No`
    `/userfs/bin/tcapi commit customerdebug_TempTelnet`
	`/userfs/bin/tcapi save`
	echo -e "{ \"cmd\" : \"temp_close_tn\" }"
elif [ $2 -eq 3 ]; then
	`/userfs/bin/tcapi set customerdebug_StateValue Active Yes`
	`/userfs/bin/tcapi commit customerdebug_StateValue`
	`/userfs/bin/tcapi save`
	echo -e "{ \"cmd\" : \"StateValue_Active_Yes\" }"
elif [ $2 -eq 4 ]; then
	`/userfs/bin/tcapi set customerdebug_StateValue Active No`
	`/userfs/bin/tcapi commit customerdebug_StateValue`
	`/userfs/bin/tcapi save`
	echo -e "{ \"cmd\" : \"StateValue_Active_No\" }"
elif [ $2 -eq 5 ]; then
	`/usr/bin/sys wan2lan on 1`
	echo -e "{ \"cmd\" : \"sys_wan2lan\" }"
elif [ $2 -eq 6 ]; then
	`/userfs/bin/tcapi set customerdebug_Firmware Active Yes`
	`/userfs/bin/tcapi commit customerdebug_Firmware`
	`/userfs/bin/tcapi save`
	echo -e "{ \"cmd\" : \"firmware_customerdebug\" }"
elif [ $2 -eq 11 ]; then
	`/userfs/bin/tcapi set customerdebug_Autoreboot Active Yes`
	`/userfs/bin/tcapi commit customerdebug_Autoreboot`
	`/userfs/bin/tcapi save`
	echo -e "{ \"cmd\" : \"autoreboot_enabled\" }"
elif [ $2 -eq 12 ]; then
	`/userfs/bin/tcapi set customerdebug_Autoreboot Active No`
	`/userfs/bin/tcapi commit customerdebug_Autoreboot`
	`/userfs/bin/tcapi save`
	echo -e "{ \"cmd\" : \"autoreboot_disabled\" }"
elif [ "$2" = "h" ]; then
	echo -e "{ \"1,2\" : \"TempTelnet\", \"3,4\" : \"StateValue\", \"5\" : \"Wan2lan\", \"6\" : \"Firmware_upgrade\", \"11,12\" : \"Open/Close Autoreboot\" }"
else
	echo -e "{ \"cmd\" : \"unknown\" }"
fi

exit 0