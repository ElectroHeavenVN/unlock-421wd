#!/bin/sh
Al_MAC_LIST="/tmp/AlMaclist.txt"
INFO_FILE="/tmp/info.txt"
AGENTS_LOG_DIR="/tmp/agents_log"
mkdir -p $AGENTS_LOG_DIR
/userfs/bin/mapd_cli /tmp/mapd_ctrl dump_topology_v1 > /dev/null
cat /tmp/dump.txt | grep 'AL MAC' > $Al_MAC_LIST
count=1
mac_addresses=""
rm -f $AGENTS_LOG_DIR/http_code.txt
while IFS= read -r line; do
	if echo "$line" | grep -q '"AL MAC"'; then
		mac=$(echo "$line" | sed 's/.*"AL MAC":"\([^"]*\)".*/\1/')
		mac_addresses="${mac_addresses} $mac"
	fi
done < $Al_MAC_LIST

for ALMAC in ${mac_addresses}; do
	IP="$(/usr/bin/ip neigh show dev br0 | grep lladdr | grep "${ALMAC}" | awk '{print $1}')"
	if [ -n "$IP" ] && [ -z "$(echo "$IP" | grep ":")" ]; then
		echo "IP: $IP" >> $AGENTS_LOG_DIR/log.txt 
		/userfs/bin/curl -o "$INFO_FILE" \
		-i -k -H "Connection: keep-alive" \
		-H "Cache-Control: max-age=0" \
		-H "Host: $IP" \
		-H "Origin: https://$IP" \
		-H "Referer: https://$IP/cgi-bin/luci" \
		-H "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,/;q=0.8,application/signed-exchange;v=b3;q=0.9" \
		-H "Accept-Encoding: gzip, deflate, br" \
		-H "Accept-Language: en-US,en;q=0.9,vi;q=0.8" \
		-H "Upgrade-Insecure-Requests: 1" -X POST https://$IP/cgi-bin/luci -d "StatusActionFlag=-1&luci_username=root&luci_password=pi@vhtkn"

		content=$(cat $INFO_FILE)
		stok=$(echo "$content" | sed -n 's/.*stok=\(.\{32\}\).*/\1/p')
		sysauth=$(echo "$content" | sed -n 's/.*sysauth=\(.\{32\}\).*/\1/p')
		if [ -z "$sysauth" ] || [ -z "$stok" ]; then
				continue
		fi

		/userfs/bin/curl --create-dirs -o $AGENTS_LOG_DIR/agent$count/log$count.tar.gz -v \
		-H "Connection: keep-alive" -H "Accept:text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,/;q=0.8,application/signed-exchange;v=b3;q=0.7" \
		-H "Accept-Encoding: gzip, deflate, br, zstd" \
		-H "Host: $IP" -H "Origin: https://$IP" \
		-H "Referer: https://$IP/cgi-bin/luci/;stok=$stok/admin/system/syslog" \
		-H "User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36" \
		-H "Accept-Language: en-US,en;q=0.9" \
		-H "Upgrade-Insecure-Requests: 1" \
		-H "Sec-Fetch-Dest: document" \
		-H "Sec-Fetch-Mode: navigate" \
		-H "Sec-Fetch-Site: same-origin" \
		-H "Sec-Fetch-User: ?1" \
		-H "Sec-Ch-Ua-Mobile: ?0" -H "Sec-Ch-Ua-Platform: \"Windows\"" \
		-H "Cache-Control: max-age=0" -H "Sec-Ch-Ua: \"Google Chrome\";v=\"123\", \"Not:A-Brand\";v=\"8\", \"Chromium\";v=\"123\"" \
		-H "Cookie: sysauth=$sysauth" -k -w "%{http_code}" -X GET "https://$IP/cgi-bin/luci/;stok=$stok/admin/system/syslog_download"

		echo "$ALMAC" > $AGENTS_LOG_DIR/agent$count/macinfo.txt
		count=`expr $count + 1`
	fi
done
rm -rf $Al_MAC_LIST
rm -rf $INFO_FILE