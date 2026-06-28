#!/bin/sh

echo -e "Content-Type: text/html\r\n\r\n"

IFS='=&'
set -- $QUERY_STRING

case "$2" in
"save")
	$(/userfs/bin/tcapi set mesh.common VtSaveTopology 2)
	$(/userfs/bin/tcapi save)
	$(/userfs/bin/1905ctrl controller vt_save_topo 2)
	echo -e '{"success" : "yes"}'
	;;
"clear")
	$(/userfs/bin/tcapi set mesh.common VtSaveTopology 1)
	$(/userfs/bin/tcapi save)
	$(/userfs/bin/1905ctrl controller vt_save_topo 1)
	echo -e '{"success" : "yes"}'
	;;
*) exit 1 ;;
esac
