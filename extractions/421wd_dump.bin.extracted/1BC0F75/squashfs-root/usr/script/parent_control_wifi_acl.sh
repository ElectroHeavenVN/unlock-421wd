#!/bin/sh

POLICY_BLACKLIST=2
POLICY_WHITELIST=1
POLICY_DISABLE=0

CFG_BLACKLIST_MAC=""
CFG_WHITELIST_MAC=""
ACL_DUMP_PATH="/tmp/vt_acldump.txt"
iface_list="ra0 ra1 ra2 ra3 rai0 rai1 rai2"

tmp_num=""
tmp_policy=""

_get_iface_acl_info() {
    rm $ACL_DUMP_PATH
    iwpriv $1 set VtACLShowAll=1
    tmp_policy=$(cat /tmp/vt_acldump.txt | grep $1"_Policy" | awk -F'=' '{print $2}')
    tmp_num=$(cat /tmp/vt_acldump.txt | grep $1_"Num" | awk -F'=' '{print $2}')
    file=$(cat /tmp/vt_acldump.txt)
}

_get_cfg_rule_set() {
    for rule_id in 1 2 3 4 5 6 7 8 9 10
    do
        template_id=$(tcapi get ParentalCtrl.Entry.$rule_id Template)
        if [ -n "$template_id" ] && [ "$template_id" -eq "$template_id" ] 2>/dev/null; then     #validate number
            template_enable=$(tcapi get ParentalCtrl.Template.Entry.$template_id Enable)
            template_filter_type=$(tcapi get ParentalCtrl.Template.Entry.$template_id FilterType)
            if [ "$template_enable" = "Yes" ] && [ "$template_filter_type" = "WiFi" ]; then
                template_filter_mode=$(tcapi get ParentalCtrl.Template.Entry.$template_id FilterMode)
                mac_addr=$(tcapi get ParentalCtrl.Entry.$rule_id MAC)
                if [ "$template_filter_mode" = "Black" ]; then
                    CFG_BLACKLIST_MAC="$CFG_BLACKLIST_MAC $mac_addr"
                elif [ "$template_filter_mode" = "White" ]; then
                    CFG_WHITELIST_MAC="$CFG_WHITELIST_MAC $mac_addr"
                fi
            fi
        fi
    done
}

# _get_acl_iface_num_of_entry() {
#     iwpriv $1 set VtACLShowAll=1
#     iface_num=$1"_Num"
#     num_of_entry=$(cat $ACL_DUMP_PATH | grep $iface_num | awk -F= '{print $2}')
#     echo $num_of_entry
# }

_set_acl_policy() {
    for iface in $iface_list
    do
        iwpriv $iface set VtAccessPolicy=$1
    done 
}

_get_acl_policy() {
    iwpriv $1 set VtACLShowAll=1
    iface_policy=$1"_Policy"
    cur_acl_policy=$(cat $ACL_DUMP_PATH | grep $iface_policy | awk -F= '{print $2}')
    _set_acl_policy $cur_acl_policy
    echo "$cur_acl_policy"
}

_flush_all_acl_entry() {
    for iface in $iface_list
    do
        iwpriv $iface set VtACLClearAll=1
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

do_add_acl_entry() {
    cur_policy=$(_get_acl_policy ra0)
    mac_addr="$1"
    filter_mode="$2"

    case $cur_policy in
        "0")      #currently disable
            _flush_all_acl_entry
            if [ $filter_mode = "black" ]; then
                _set_acl_policy $POLICY_BLACKLIST
            elif [ $filter_mode = "white" ]; then
                _set_acl_policy $POLICY_WHITELIST
            fi
            _add_acl_entry $mac_addr
            ;;
        "1")      #currently whitelist
            if [ $filter_mode = "black" ]; then
                logger "Parental control: Skip $mac_addr"
            elif [ $filter_mode = "white" ]; then
                _add_acl_entry $mac_addr
            fi
            ;;
        "2")      #currently blacklist
            if [ $filter_mode = "black" ]; then
                _add_acl_entry $mac_addr
            elif [ $filter_mode = "white" ]; then
                _flush_all_acl_entry
                _set_acl_policy $POLICY_WHITELIST
                _add_acl_entry $mac_addr
            fi
            ;;
        *)
            logger "Error when get wifi acl policy"
        ;;
    esac
}

do_del_acl_entry() {
    mac_addr="$1"
    _get_cfg_rule_set
    _del_acl_entry $mac_addr 
}