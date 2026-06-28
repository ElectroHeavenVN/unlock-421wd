#!/bin/sh

# After 1 hour, tcpdump.txt will be deleted.
while true; do
	/userfs/bin/tcpdump -t -i br0 port 53 > /tmp/tcpdump.txt &
	sleep 3600
	kill -9 $(pidof tcpdump)
done    