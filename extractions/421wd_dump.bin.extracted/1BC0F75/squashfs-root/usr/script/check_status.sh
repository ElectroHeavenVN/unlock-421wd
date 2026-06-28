#!/bin/sh
check_ping(){
	local old_status="$1"
	local target="$2"
	local dns_list
	local ping_ret
	local status="0"

	if [ "$target" = "IPv4" ]; then
		dns_list="8.8.8.8 1.1.1.1 208.67.222.222"
	elif [ "$target" = "IPv6" ]; then
		dns_list="2001:4860:4860::8888"
	else
		return $status
	fi

	for dns in ${dns_list}; do
		if [ -z "$dns" ]; then
			break;
		fi

		ping_cmd="ping -c 1 -W 4 $dns > /dev/null 2>&1"

		eval "$ping_cmd"
		ping_ret=$?
		if [ "$ping_ret" -eq 0 ]; then
			status="1"
			break
		fi
	done
	
	if [ "$status" -ne "$old_status" ]; then
		if [ "$status" -eq 0 ]; then
			/usr/bin/logger "[HSI] HSI state: DOWN $target"
		else
			/usr/bin/logger "[HSI] HSI state: UP $target"
		fi
	fi
	
	old_status=$status
	return $old_status
}

RxLow=-28
RxHigh=-8
Temperature_thres=70
Temperature_thres_exceeded=0
RxPower_thres_capped=0
hw_nat_no_entry_str="Total Entry Count = 0"
hw_nat_no_entry=0
BiasCurrent_thres=737
OLD_BIAS=0
old_status="0"
old_status6="0"
old_statusgw="0"
status="0"
temp=$(( 2**15 ))
file_dhcp_lease="/etc/udhcp_lease"
dhcp_lease_exceeded=0
dhcp_lease_threshold=30
file_arp_entry="/proc/net/arp"
arp_entry_exceeded=0
arp_entry_threshold=40
ping4_cmd="ping -c 1 -W 4 8.8.8.8 > /dev/null 2>&1"
ping6_cmd="ping6 -c 1 -W 4 2001:4860:4860::8888 > /dev/null 2>&1"
while true; do
	PonPhy_Status=`/userfs/bin/tcapi get xpon.common phyStatus`
	RxPower=`/userfs/bin/tcapi get Info_PonPhy RxPower`
	Temperature=`/userfs/bin/tcapi get Info_PonPhy Temperature`
	TrueRxPower=$(echo $RxPower | awk '{printf "%.0f\n",log($1/10000)*10/log(10)}')
	hw_nat_entry=`/userfs/bin/hw_nat -g`
	BIAS=`cat /proc/pon_phy/BiasCurrent`
	BIAS=$(( 0x$BIAS ))
	
	dhcp_lease_count=`wc -l < $file_dhcp_lease`
	arp_entry_count=`wc -l < $file_arp_entry`

	if [ $Temperature -ge $temp ]; then
		TrueTemperature=$(echo $Temperature | awk '{printf "%.0f\n",(2**16-$1)/256}')
	else
		TrueTemperature=$(echo $Temperature | awk '{printf "%.0f\n",$1/256}')
	fi
	
	if [ $TrueTemperature -ge $Temperature_thres ]; then
		if [ $Temperature_thres_exceeded -eq 0 ]; then
			/usr/bin/logger "[BOSA] Temperature exceeded threshold, reach $TrueTemperature"
			Temperature_thres_exceeded=1
		fi
	else
		if [ $Temperature_thres_exceeded -eq 1 ]; then
			/usr/bin/logger "[BOSA] Temperature came back from threshold, to $TrueTemperature"
			Temperature_thres_exceeded=0
		fi
	fi

	if [ "$PonPhy_Status" = "gpon_phy_up" ]; then
		if [ $TrueRxPower -le $RxLow ]; then
			if [ $RxPower_thres_capped -ne 1 ]; then
				/usr/bin/logger "[BOSA] RxPower is too low, $TrueRxPower dBm"
				RxPower_thres_capped=1
			fi
		elif [ $TrueRxPower -ge $RxHigh ]; then
			if [ $RxPower_thres_capped -ne 2 ]; then
				/usr/bin/logger "[BOSA] RxPower is too high, $TrueRxPower dBm"
				RxPower_thres_capped=2
			fi
		else
			if [ $RxPower_thres_capped -ne 0 ]; then
				/usr/bin/logger "[BOSA] RxPower came back from threshold, reach $TrueRxPower"
				RxPower_thres_capped=0
			fi
		fi
	fi

	if [ $BIAS -ge $BiasCurrent_thres ]; then
		if [ $(( $BIAS-$OLD_BIAS )) -ge 40 ] || [ $(( $BIAS-$OLD_BIAS )) -le -40 ]; then
			/usr/bin/logger "[BOSA] BiasCurrent is above threshold" $(( $BIAS*1221/50 )) "uA"
			OLD_BIAS=$BIAS
		fi
	else
		if [ $(( OLD_BIAS )) -ge $BiasCurrent_thres ]; then
			/usr/bin/logger "[BOSA] BiasCurrent is below threshold" $(( $BIAS*1221/50 )) "uA"
		fi
		OLD_BIAS=$(( $BiasCurrent_thres - 40 ))
	fi

	if [ "$hw_nat_entry" != "${hw_nat_entry%"$hw_nat_no_entry_str"*}" ]; then
		if [ $hw_nat_no_entry -eq 0 ]; then
			/usr/bin/logger "[hw_nat] hw_nat has NO entry"
			hw_nat_no_entry=1
		fi
	else
		if [ $hw_nat_no_entry -eq 1 ]; then
			/usr/bin/logger "[hw_nat] hw_nat has entries"
			hw_nat_no_entry=0
		fi
	fi

	check_ping "$old_status" "IPv4"
	status=$?
	
	check_ping "$old_status6" "IPv6"
	old_status6=$?

	if [ "$status" -eq 0 ]; then
		if [ "$status" -ne "$old_status" ]; then
			DefRoute4Idx=`/userfs/bin/tcapi get waninfo_common DefRouteIndexv4`
			pvc4=$(($(($DefRoute4Idx - $(($DefRoute4Idx%8))))/8))
			gw_addr=`/userfs/bin/tcapi get waninfo_Entry$pvc4 GateWay`
			if [ -n "$gw_addr" -a "$gw_addr" != "no node information" ]; then
				ping -c 1 -W 4 $gw_addr > /dev/null 2>&1
				ret_gw=$?
				if [ "$ret_gw" -eq 1 ]; then
					/usr/bin/logger "[HSI] HSI state: DOWN Gateway"
				else
					/usr/bin/logger "[HSI] HSI state: UP Gateway"
				fi
			else
				/usr/bin/logger "[HSI] HSI state: NO Gateway"
			fi
		fi
	fi
	old_status=$status

	if [ $dhcp_lease_count -ge $dhcp_lease_threshold ]; then
		if [ $dhcp_lease_exceeded -eq 0 ]; then
			/usr/bin/logger "[DHCP] Too many dhcp leases: $dhcp_lease_count"
			dhcp_lease_exceeded=1
		fi
	else
		if [ $dhcp_lease_exceeded -eq 1 ]; then
			/usr/bin/logger "[DHCP] The number of dhcp leases decreased to $dhcp_lease_count"
			dhcp_lease_exceeded=0
		fi 
	fi

	if [ $arp_entry_count -ge $arp_entry_threshold ]; then
		if [ $arp_entry_exceeded -eq 0 ]; then
			/usr/bin/logger "[ARP] Too many arp entries: $arp_entry_count"
			arp_entry_exceeded=1
		fi
	else
		if [ $arp_entry_exceeded -eq 1 ]; then
			/usr/bin/logger "[ARP] The number of arp entries decreased to $arp_entry_count"
			arp_entry_exceeded=0
		fi 
	fi
	sleep 5

done