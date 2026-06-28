# Enable permanent telnet
/usr/bin/sys statevalue 1
# Disable permanent telnet
# /usr/bin/sys statevalue 4

# /userfs/bin/tcapi show Cwmp_Entry
# /userfs/bin/tcapi set Cwmp_Entry Tr069Enable 1
# /userfs/bin/tcapi set Cwmp_Entry Active Yes
# /userfs/bin/tcapi set Cwmp_Entry periodActive Yes
# /userfs/bin/tcapi set Cwmp_Entry acsUrl 'http://viettelacs.vn/gpon/dasan/normal'
# /userfs/bin/tcapi set Cwmp_Entry CPHostName 'viettelacs.vn'
# /userfs/bin/tcapi set Cwmp_Entry acsUrlDN 'viettelacs.vn'

/userfs/bin/tcapi set Cwmp_Entry Tr069Enable 0
/userfs/bin/tcapi set Cwmp_Entry Active No
/userfs/bin/tcapi set Cwmp_Entry periodActive No
/userfs/bin/tcapi set Cwmp_Entry acsUrl 'http://xxxxxxxacs.vn/gpon/dasan/normal'
/userfs/bin/tcapi set Cwmp_Entry CPHostName 'xxxxxxxacs.vn'
/userfs/bin/tcapi set Cwmp_Entry acsUrlDN 'xxxxxxxacs.vn'
/userfs/bin/tcapi commit Cwmp_Entry

# /userfs/bin/tcapi show TMSClient
# /userfs/bin/tcapi set TMSClient Enable Yes
# /userfs/bin/tcapi set TMSClient.MQTT Enable Yes
# /userfs/bin/tcapi set TMSClient.MQTT BrokerAddress 'homewifi3.viettel.vn'
# /userfs/bin/tcapi set TMSClient.BulkData HTTP.URL 'http://data.homewifi3.viettel.vn/bulkdata'

/userfs/bin/tcapi set TMSClient Enable No
/userfs/bin/tcapi set TMSClient.MQTT Enable No
/userfs/bin/tcapi set TMSClient.MQTT BrokerAddress 'homewifi3.xxxxxxx.vn'
/userfs/bin/tcapi set TMSClient.BulkData HTTP.URL 'http://data.homewifi3.xxxxxxx.vn/bulkdata'
/userfs/bin/tcapi commit TMSClient