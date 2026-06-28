#!/bin/sh

echo -e "Content-Type: application/json\r\n\r\n"

IFS='=&'

if [ ! "$QUERY_STRING" ]; then
    exit 0
fi

set -- $QUERY_STRING

if [ $2 -eq 1 ] && [ $4 -ge 1 ] && [ $4 -le 4 ]; then
	/userfs/bin/tcapi set WebCurSet_Entry lan_id $4
	TRANSMIT_FRAMES=`/userfs/bin/tcapi get Info_Ether$4 txFrames`
	TRANSMIT_MULTICAST=`/userfs/bin/tcapi get Info_Ether$4 TxMulticastPkts`
	TRANSMIT_BROADCAST=`/userfs/bin/tcapi get Info_Ether$4 TxBroadcastPkts`
	TRANSMIT_UNICAST=`/userfs/bin/tcapi get Info_Ether$4 TxUnicasePkts`
	TRANSMIT_COLLISION=`/userfs/bin/tcapi get Info_Ether$4 TxCollision`
	TRANSMIT_ERROR=`/userfs/bin/tcapi get Info_Ether$4 TxDefer`
	RECEIVE_FRAMES=`/userfs/bin/tcapi get Info_Ether$4 rxFrames`
	RECEIVE_MULTICAST=`/userfs/bin/tcapi get Info_Ether$4 RxMulticastPkts`
	RECEIVE_BROADCAST=`/userfs/bin/tcapi get Info_Ether$4 RxBroadcastPkts`
	RECEIVE_UNICAST=`/userfs/bin/tcapi get Info_Ether$4 RxUnicasePkts`
	RECEIVE_CRC=`/userfs/bin/tcapi get Info_Ether$4 RxCRCError`
	RECEIVE_UNDER_SIZE=`/userfs/bin/tcapi get Info_Ether$4 RxUnderSizePkts`
	echo -e "{ \"tx_frames\": \"$TRANSMIT_FRAMES\",\"tx_multi\": \"$TRANSMIT_MULTICAST\",\"tx_broad\": \"$TRANSMIT_BROADCAST\",\"tx_uni\": \"$TRANSMIT_UNICAST\",\"tx_coll\": \"$TRANSMIT_COLLISION\",\"tx_err\": \"$TRANSMIT_ERROR\",\"rx_frames\": \"$RECEIVE_FRAMES\",\"rx_multi\": \"$RECEIVE_MULTICAST\",\"rx_broad\": \"$RECEIVE_BROADCAST\",\"rx_uni\": \"$RECEIVE_UNICAST\",\"rx_crc\": \"$RECEIVE_CRC\",\"rx_under\": \"$RECEIVE_UNDER_SIZE\"}"
elif [ $2 -eq 2 ]; then
	/userfs/bin/tcapi set WebCurSet_Entry wlan_id $4
	TX_PACKETS=`/userfs/bin/tcapi get Info_WLan wlanTxFrames`
	RX_PACKETS=`/userfs/bin/tcapi get Info_WLan wlanRxFrames`
	TX_ERRORS=`/userfs/bin/tcapi get Info_WLan wlanTxErrFrames`
	RX_ERRORS=`/userfs/bin/tcapi get Info_WLan wlanRxErrFrames`
	TX_DROPS=`/userfs/bin/tcapi get Info_WLan wlanTxDropFrames`
	RX_DROPS=`/userfs/bin/tcapi get Info_WLan wlanRxDropFrames`
	echo -e "{ \"tx_pkt\": \"$TX_PACKETS\",\"rx_pkt\": \"$RX_PACKETS\",\"tx_err\": \"$TX_ERRORS\",\"rx_err\": \"$RX_ERRORS\",\"tx_drop\": \"$TX_DROPS\",\"rx_drop\": \"$RX_DROPS\"}"
elif [ $2 -eq 3 ]; then
	TX_PACKETS=`/userfs/bin/tcapi get Info_WLan11ac wlanTxFrames`
	RX_PACKETS=`/userfs/bin/tcapi get Info_WLan11ac wlanRxFrames`
	TX_ERRORS=`/userfs/bin/tcapi get Info_WLan11ac wlanTxErrFrames`
	RX_ERRORS=`/userfs/bin/tcapi get Info_WLan11ac wlanRxErrFrames`
	TX_DROPS=`/userfs/bin/tcapi get Info_WLan11ac wlanTxDropFrames`
	RX_DROPS=`/userfs/bin/tcapi get Info_WLan11ac wlanRxDropFrames`
	echo -e "{ \"tx_pkt\": \"$TX_PACKETS\",\"rx_pkt\": \"$RX_PACKETS\",\"tx_err\": \"$TX_ERRORS\",\"rx_err\": \"$RX_ERRORS\",\"tx_drop\": \"$TX_DROPS\",\"rx_drop\": \"$RX_DROPS\"}"
elif [ $2 -eq 4 ]; then
	TX_PACKETS_PON=`/userfs/bin/tcapi get Info_PonWanStats TxFrameCnt`
	RX_PACKETS_PON=`/userfs/bin/tcapi get Info_PonWanStats RxFrameCnt`
	TX_BYTES_PON=`/userfs/bin/tcapi get Info_PonWanStats TxFrameLen`
	RX_BYTES_PON=`/userfs/bin/tcapi get Info_PonWanStats RxFrameLen`
	TRANSMIT_MULTICAST_PON=`/userfs/bin/tcapi get Info_PonWanStats TxMulticastCnt`
	RECEIVE_MULTICAST_PON=`/userfs/bin/tcapi get Info_PonWanStats RxMulticastCnt`
	TRANSMIT_BROADCAST_PON=`/userfs/bin/tcapi get Info_PonWanStats TxBroadcastCnt`
	RECEIVE_BROADCAST_PON=`/userfs/bin/tcapi get Info_PonWanStats RxBroadcastCnt`
	TRANSMIT_COLLISION_PON=`/userfs/bin/tcapi get Info_PonWanStats TxDropCnt`
	RECEIVE_CRC_PON=`/userfs/bin/tcapi get Info_PonWanStats RxCrcCnt`
	TRANSMIT_ERROR_PON=`/userfs/bin/tcapi get Info_PonWanStats TxLess64Cnt`
	RECEIVE_UNDER_SIZE_PON=`/userfs/bin/tcapi get Info_PonWanStats RxLess64Cnt`
	echo -e "{ \"tx_frames\": \"$TX_PACKETS_PON\",\"rx_frames\": \"$RX_PACKETS_PON\",\"tx_bytes\": \"$TX_BYTES_PON\",\"rx_bytes\": \"$RX_BYTES_PON\",\"tx_multi\": \"$TRANSMIT_MULTICAST_PON\",\"rx_multi\": \"$RECEIVE_MULTICAST_PON\",\"tx_broad\": \"$TRANSMIT_BROADCAST_PON\",\"rx_broad\": \"$RECEIVE_BROADCAST_PON\",\"tx_coll\": \"$TRANSMIT_COLLISION_PON\",\"rx_crc\": \"$RECEIVE_CRC_PON\",\"tx_err\": \"$TRANSMIT_ERROR_PON\",\"rx_under\": \"$RECEIVE_UNDER_SIZE_PON\"}"
elif [ $2 -eq 6 ]; then
	TRANSMIT_FRAMES=`/userfs/bin/tcapi get Info_Ether1 txFrames`
	TRANSMIT_MULTICAST=`/userfs/bin/tcapi get Info_Ether1 TxMulticastPkts`
	TRANSMIT_BROADCAST=`/userfs/bin/tcapi get Info_Ether1 TxBroadcastPkts`
	TRANSMIT_UNICAST=`/userfs/bin/tcapi get Info_Ether1 TxUnicasePkts`
	TRANSMIT_COLLISION=`/userfs/bin/tcapi get Info_Ether1 TxCollision`
	TRANSMIT_ERROR=`/userfs/bin/tcapi get Info_Ether1 TxDefer`
	RECEIVE_FRAMES=`/userfs/bin/tcapi get Info_Ether1 rxFrames`
	RECEIVE_MULTICAST=`/userfs/bin/tcapi get Info_Ether1 RxMulticastPkts`
	RECEIVE_BROADCAST=`/userfs/bin/tcapi get Info_Ether1 RxBroadcastPkts`
	RECEIVE_UNICAST=`/userfs/bin/tcapi get Info_Ether1 RxUnicasePkts`
	RECEIVE_CRC=`/userfs/bin/tcapi get Info_Ether1 RxCRCError`
	RECEIVE_UNDER_SIZE=`/userfs/bin/tcapi get Info_Ether1 RxUnderSizePkts`
	echo -e "{ \"tx_frames\": \"$TRANSMIT_FRAMES\",\"tx_multi\": \"$TRANSMIT_MULTICAST\",\"tx_broad\": \"$TRANSMIT_BROADCAST\",\"tx_uni\": \"$TRANSMIT_UNICAST\",\"tx_coll\": \"$TRANSMIT_COLLISION\",\"tx_err\": \"$TRANSMIT_ERROR\",\"rx_frames\": \"$RECEIVE_FRAMES\",\"rx_multi\": \"$RECEIVE_MULTICAST\",\"rx_broad\": \"$RECEIVE_BROADCAST\",\"rx_uni\": \"$RECEIVE_UNICAST\",\"rx_crc\": \"$RECEIVE_CRC\",\"rx_under\": \"$RECEIVE_UNDER_SIZE\","
	
	TX_PACKETS=`/userfs/bin/tcapi get Info_WLan wlanTxFrames`
	RX_PACKETS=`/userfs/bin/tcapi get Info_WLan wlanRxFrames`
	TX_ERRORS=`/userfs/bin/tcapi get Info_WLan wlanTxErrFrames`
	RX_ERRORS=`/userfs/bin/tcapi get Info_WLan wlanRxErrFrames`
	TX_DROPS=`/userfs/bin/tcapi get Info_WLan wlanTxDropFrames`
	RX_DROPS=`/userfs/bin/tcapi get Info_WLan wlanRxDropFrames`
	echo -e " \"tx_pktwf\": \"$TX_PACKETS\",\"rx_pktwf\": \"$RX_PACKETS\",\"tx_errwf\": \"$TX_ERRORS\",\"rx_errwf\": \"$RX_ERRORS\",\"tx_dropwf\": \"$TX_DROPS\",\"rx_dropwf\": \"$RX_DROPS\","

	TX_PACKETS=`/userfs/bin/tcapi get Info_WLan11ac wlanTxFrames`
	RX_PACKETS=`/userfs/bin/tcapi get Info_WLan11ac wlanRxFrames`
	TX_ERRORS=`/userfs/bin/tcapi get Info_WLan11ac wlanTxErrFrames`
	RX_ERRORS=`/userfs/bin/tcapi get Info_WLan11ac wlanRxErrFrames`
	TX_DROPS=`/userfs/bin/tcapi get Info_WLan11ac wlanTxDropFrames`
	RX_DROPS=`/userfs/bin/tcapi get Info_WLan11ac wlanRxDropFrames`
	echo -e " \"tx_pkt11ac\": \"$TX_PACKETS\",\"rx_pkt11ac\": \"$RX_PACKETS\",\"tx_err11ac\": \"$TX_ERRORS\",\"rx_err11ac\": \"$RX_ERRORS\",\"tx_drop11ac\": \"$TX_DROPS\",\"rx_drop11ac\": \"$RX_DROPS\","
	
	TX_PACKETS_PON=`/userfs/bin/tcapi get Info_PonWanStats TxFrameCnt`
	RX_PACKETS_PON=`/userfs/bin/tcapi get Info_PonWanStats RxFrameCnt`
	TX_BYTES_PON=`/userfs/bin/tcapi get Info_PonWanStats TxFrameLen`
	RX_BYTES_PON=`/userfs/bin/tcapi get Info_PonWanStats RxFrameLen`
	TRANSMIT_MULTICAST_PON=`/userfs/bin/tcapi get Info_PonWanStats TxMulticastCnt`
	RECEIVE_MULTICAST_PON=`/userfs/bin/tcapi get Info_PonWanStats RxMulticastCnt`
	TRANSMIT_BROADCAST_PON=`/userfs/bin/tcapi get Info_PonWanStats TxBroadcastCnt`
	RECEIVE_BROADCAST_PON=`/userfs/bin/tcapi get Info_PonWanStats RxBroadcastCnt`
	TRANSMIT_COLLISION_PON=`/userfs/bin/tcapi get Info_PonWanStats TxDropCnt`
	RECEIVE_CRC_PON=`/userfs/bin/tcapi get Info_PonWanStats RxCrcCnt`
	TRANSMIT_ERROR_PON=`/userfs/bin/tcapi get Info_PonWanStats TxLess64Cnt`
	RECEIVE_UNDER_SIZE_PON=`/userfs/bin/tcapi get Info_PonWanStats RxLess64Cnt`
	echo -e " \"tx_frames_pon\": \"$TX_PACKETS_PON\",\"rx_frames_pon\": \"$RX_PACKETS_PON\",\"tx_bytes_pon\": \"$TX_BYTES_PON\",\"rx_bytes_pon\": \"$RX_BYTES_PON\",\"tx_multi_pon\": \"$TRANSMIT_MULTICAST_PON\",\"rx_multi_pon\": \"$RECEIVE_MULTICAST_PON\",\"tx_broad_pon\": \"$TRANSMIT_BROADCAST_PON\",\"rx_broad_pon\": \"$RECEIVE_BROADCAST_PON\",\"tx_coll_pon\": \"$TRANSMIT_COLLISION_PON\",\"rx_crc_pon\": \"$RECEIVE_CRC_PON\",\"tx_err_pon\": \"$TRANSMIT_ERROR_PON\",\"rx_under_pon\": \"$RECEIVE_UNDER_SIZE_PON\"}"
	
else
	echo -e "{$2}"
	echo -e "Invalid"
	exit 0
fi
