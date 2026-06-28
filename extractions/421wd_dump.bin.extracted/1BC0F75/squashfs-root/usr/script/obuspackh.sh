#!/bin/sh
# SHARED, To be sourced only
DB_FILE="/tmp/usp.db"
CHECK_INTERVAL=300

while [ 1 ] ; do
    sleep $CHECK_INTERVAL
    /userfs/bin/obuspackh
done
