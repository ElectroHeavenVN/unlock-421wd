#!/bin/sh
CMD=$1
PPP_IF=$2
$CMD &
echo $! > /var/run/$PPP_IF/$PPP_IF.pid