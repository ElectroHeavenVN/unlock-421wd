<%
if tcWebApi_get("WebCustom_Entry", "isMultiLanguageSupport", "h") = "Yes" then
if Request_Form("Language_Flag")="1" then
tcWebApi_constSet("LanguageSwitch_Entry","Type","1")
tcWebApi_constSet("LanguageSwitch_Entry","Language","Vietnamese")
TCWebApi_commit("LanguageSwitch_Entry")
elseif Request_Form("Language_Flag")="2" then
tcWebApi_constSet("LanguageSwitch_Entry","Type","2")
tcWebApi_constSet("LanguageSwitch_Entry","Language","English")
TCWebApi_commit("LanguageSwitch_Entry")
end if
end if
%>
{
    <%if Request_Form("dv") = "1" then
        tcWebApi_set("WebCurSet_Entry","wan_pvc","wan_pvc")
        tcWebApi_set("WebCurSet_Entry","wan_pvc_entry","wan_pvc_entry")
        tcWebApi_set("WebCurSet_Entry","waninfo_index","waninfo_index")
    %>
        "user" : "<% tcWebApi_get("Wan_PVC_Entry", "USERNAME", "s") %>"
        ,"pass" : "<% tcWebApi_get("Wan_PVC_Entry", "PASSWORD", "s") %>"
        ,"active" : "<% tcWebApi_get("Wan_PVC_Entry", "Active", "s") %>"
        ,"ipver" : "<% tcWebApi_get("Wan_PVC_Entry", "IPVERSION", "s") %>"
        ,"ip4" : "<% tcWebApi_get("WanInfo_Entry", "IP", "s") %>"
        ,"ip6" : "<% tcWebApi_get("WanInfo_Entry", "IP6", "s") %>"
        ,"vlan" : "<% tcWebApi_get("Wan_PVC_Entry", "VLANID", "s") %>"
        ,"waitip4" : "<% tcWebApi_get("Wan_PVC_Entry", "waitforIP4", "s") %>"
        ,"waitip6" : "<% tcWebApi_get("Wan_PVC_Entry", "waitforIP6", "s") %>"
        ,"commitime" : "<% tcWebApi_get("Wan_PVC_Entry", "CommitTime", "s") %>"
        ,"curtime" : "<% tcWebApi_get("DeviceInfo", "PassedTime", "s") %>"
    <% end if %>
    }
