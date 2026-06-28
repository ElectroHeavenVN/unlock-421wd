#!/bin/sh

MAX_RULE_NUM=10
ACL_DUMP_FILE="/tmp/vt_acldump.txt"
CFG_BLACKLIST_MAC=""
CFG_WHITELIST_MAC=""
ACL_LIST_MAC=""
ACL_POLICY=""
ACL_NUM_ENTRY=""
iface_list="ra0 ra1 ra2 ra3 rai0 rai1 rai2"

tmp_policy=""
tmp_num=""

_is_found_in_list() {
    mac=$1
    if [ "$2" = "1" ]; then
        list=$CFG_WHITELIST_MAC
    elif [ "$2" = "2" ]; then
        list=$CFG_BLACKLIST_MAC
    fi

    for e in $list
    do
        if [ "$mac" = "$e" ]; then
            echo "1"
            return
        fi
    done

    echo "0"
}

_get_iface_acl_info() {
    rm $ACL_DUMP_FILE
    iwpriv $1 set VtACLShowAll=1
    tmp_policy=$(cat /tmp/vt_acldump.txt | grep $1"_Policy" | awk -F'=' '{print $2}')
    tmp_num=$(cat /tmp/vt_acldump.txt | grep $1_"Num" | awk -F'=' '{print $2}')
    file=$(cat /tmp/vt_acldump.txt)
}

_get_acl_rule_set() {
    rm $ACL_DUMP_FILE
    iwpriv ra0 set VtACLShowAll=1
    ra0_policy=$(cat /tmp/vt_acldump.txt | grep ra0_Policy | awk -F'=' '{print $2}')
    ra0_num=$(cat /tmp/vt_acldump.txt | grep ra0_Num | awk -F'=' '{print $2}')
    ra0_entries=$(cat /tmp/vt_acldump.txt | grep ra0_Entry | awk -F'=' '/[0-9a-fA-F:]{17}/{print $2}')

    for line in $ra0_entries
    do
        ACL_LIST_MAC="$ACL_LIST_MAC $line"
    done
    ACL_POLICY="$ra0_policy"
    ACL_NUM_ENTRY="$ra0_num"
}

_get_cfg_rule_set() {
    for id in 1 2 3 4 5 6 7 8 9 10
    do
        rule_id="$id"
        template_id="$(/userfs/bin/tcapi get ParentalCtrl.Entry.$rule_id Template)"
        if [ -n "$template_id" ] && [ "$template_id" -eq "$template_id" ] 2>/dev/null; then     #validate number
            template_enable="$(/userfs/bin/tcapi get ParentalCtrl.Template.Entry.$template_id Enable)"
            template_filter_type="$(/userfs/bin/tcapi get ParentalCtrl.Template.Entry.$template_id FilterType)"
            if [ "$template_enable" = "Yes" ] && [ "$template_filter_type" = "WiFi" ]; then
                template_filter_mode="$(/userfs/bin/tcapi get ParentalCtrl.Template.Entry.$template_id FilterMode)"
                mac_addr=$(/userfs/bin/tcapi get ParentalCtrl.Entry.$rule_id MAC)
                if [ "$template_filter_mode" = "Black" ]; then
                    CFG_BLACKLIST_MAC="$CFG_BLACKLIST_MAC $mac_addr"
                elif [ "$template_filter_mode" = "White" ]; then
                    CFG_WHITELIST_MAC="$CFG_WHITELIST_MAC $mac_addr"
                fi
            fi
        fi
    done
}

_add_acl_entry() {
    for iface in $iface_list
    do
        iwpriv $iface set VtACLAddEntry="$1"
    done
}

_del_acl_entry() {
    for iface in $iface_list
    do
        iwpriv $iface set VtACLDelEntry="$1"
        _get_iface_acl_info $iface
        if [ "$tmp_policy" = "1" ] && [ "$tmp_num" = "0" ]; then   #if whitelist is empty but blacklist has some entries, we add them to acl
            iwpriv $iface set VtACLClearAll=1     #flush all to make sure all iface acl is empty
            if [ ${#CFG_BLACKLIST_MAC} -ge 17 ]; then     #17 is len of a mac addr
                iwpriv $iface set VtAccessPolicy=2
                for mac in $CFG_BLACKLIST_MAC 
                do
                    iwpriv $iface set VtACLAddEntry="$mac"
                done
            else
                iwpriv $iface set VtAccessPolicy=0
            fi

        elif [ "$tmp_num" = "0" ] && [ "$tmp_policy" = "2" ]; then
            iwpriv $iface set VtAccessPolicy=0
        fi
    done
}

_get_acl_rule_set
_get_cfg_rule_set

# logger "cfg_b: ${#CFG_BLACKLIST_MAC}"
# for e in $CFG_BLACKLIST_MAC
# do
#     logger "$e"
# done 

# logger "cfg_w: ${#CFG_WHITELIST_MAC}"
# for e in $CFG_WHITELIST_MAC
# do
#     logger "$e"

# done 

# logger "acl: ${#ACL_LIST_MAC}"
# for e in $ACL_LIST_MAC
# do
#     logger "$e"
# done 

for acl_entry in $ACL_LIST_MAC
do
    
    if [ "$ACL_POLICY" = "1" ]; then
        is_found=$(_is_found_in_list $acl_entry 1)
    elif [ "$ACL_POLICY" = "2" ]; then
        is_found=$(_is_found_in_list $acl_entry 2)
    fi
    if [ "$is_found" = "0" ]; then
        _del_acl_entry $acl_entry
    fi

done