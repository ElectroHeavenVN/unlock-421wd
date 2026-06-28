#!/bin/sh
iface_list="ra0 ra1 ra2 ra3 rai0 rai1 rai2"
parental_status=$(/userfs/bin/tcapi get ParentalCtrl.Common Status)
if [ $parental_status = "Disable" ]; then 
    logger "Parental control is disable, flush wifi acl"
    for iface in $iface_list
    do
        #logger "flush iface $iface"
        iwpriv $iface set VtAccessPolicy=0
        iwpriv $iface set VtACLClearAll=1
    done
fi