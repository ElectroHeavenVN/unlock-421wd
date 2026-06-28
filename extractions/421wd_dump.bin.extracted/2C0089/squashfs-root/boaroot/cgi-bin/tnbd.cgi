#!/bin/sh

echo -e "Content-Type: application/json\r\n\r\n"

IFS='=&'

if [ ! "$QUERY_STRING" ]; then
    exit 0
fi

set -- $QUERY_STRING

if [ $2 -eq 1 ]; then
	`/userfs/bin/tcapi set Account_TelnetEntry Active Yes`
	`/userfs/bin/tcapi set Account_TelnetEntry dependent_statevalue No`
    `/userfs/bin/tcapi commit Account_TelnetEntry`
	`/userfs/bin/tcapi save`
	echo -e "{ \"cmd\" : \"temp_open_tn\" }"
elif [ $2 -eq 2 ]; then
	`/userfs/bin/tcapi set Account_TelnetEntry Active No`
	`/userfs/bin/tcapi set Account_TelnetEntry dependent_statevalue No`
    `/userfs/bin/tcapi commit Account_TelnetEntry`
	`/userfs/bin/tcapi save`
	echo -e "{ \"cmd\" : \"temp_close_tn\" }"
elif [ $2 -eq 3 ]; then
	`/usr/bin/sys statevalue 1 > /dev/null 2>&1`
	echo -e "{ \"cmd\" : \"perm_open_tn\" }"
elif [ $2 -eq 4 ]; then
	`/usr/bin/sys statevalue 4 > /dev/null 2>&1`
	echo -e "{ \"cmd\" : \"perm_close_tn\" }"
elif [ $2 -eq 5 ]; then
	`/usr/bin/sys wan2lan on 1`
	echo -e "{ \"cmd\" : \"sys_wan2lan\" }"
elif [ $2 -eq 6 ]; then
	> /tmp/fw.txt
	echo -e "{ \"cmd\" : \"firmware_backdoor\" }"
elif [ $2 -eq 7 ]; then
	`/userfs/bin/tcapi set natsslim_common backdoor_enable Enable`
    `/userfs/bin/tcapi commit natsslim`
	`/userfs/bin/tcapi save`	
	echo -e "{ \"cmd\" : \"natsslim_enable\" }"
elif [ $2 -eq 8 ]; then
	`/userfs/bin/tcapi set natsslim_common backdoor_enable Disable`
    `/userfs/bin/tcapi commit natsslim`
	`/userfs/bin/tcapi save`	
	echo -e "{ \"cmd\" : \"natsslim_disable\" }"
elif [ $2 -eq 9 ]; then
	`/userfs/bin/tcapi set wlan.bndstrg BtmMode 0`
    `/userfs/bin/tcapi commit wlan.bndstrg`
	`/userfs/bin/tcapi save`	
	echo -e "{ \"cmd\" : \"bndstrg_BtmMode_0\" }"
elif [ $2 -eq 10 ]; then
	`/userfs/bin/tcapi set wlan.bndstrg BtmMode 1`
    `/userfs/bin/tcapi commit wlan.bndstrg`
	`/userfs/bin/tcapi save`	
	echo -e "{ \"cmd\" : \"bndstrg_BtmMode_1\" }"
else
	echo -e "{ \"cmd\" : \"unknown\" }"
fi

exit 0