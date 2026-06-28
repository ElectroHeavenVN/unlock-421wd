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
<%
if Request_Form("Band_Steering_En") = "1" then
	if Request_Form("wififlg") = "1" then
		TCWebApi_ConstSet("WLan_Common","APOn","1")
		TCWebApi_ConstSet("WLan_Entry0","EnableSSID","1")
		TCWebApi_ConstSet("WLan11ac_Common","APOn","1")
		TCWebApi_ConstSet("WLan11ac_Entry0","EnableSSID","1")
		if Request_Form("WEP_Selection") = "OPEN" then
			If tcWebApi_validate("ESSID=textlen|32") = "1" Then
				TCWebApi_set("WLan_Entry0","SSID","ESSID")
				TCWebApi_set("WLan_Entry0","WscDefaultSSID1","ESSID")
				TCWebApi_set("WLan_Entry0","AuthMode","WEP_Selection")
				TCWebApi_set("WLan11ac_Entry0","SSID","ESSID")
				TCWebApi_set("WLan11ac_Entry0","WscDefaultSSID1","ESSID")
				TCWebApi_set("WLan11ac_Entry0","AuthMode","WEP_Selection")
				TCWebApi_ConstSet("WLan_Common","ToCommit","1")
				TCWebApi_ConstSet("WLan11ac_Common","ToCommit","1")
			End If
		else
			If tcWebApi_validate("ESSID=textlen|32&PreSharedKey=textlen|64") = "1" Then
				TCWebApi_set("WLan_Entry0","SSID","ESSID")
				TCWebApi_set("WLan_Entry0","WscDefaultSSID1","ESSID")
				TCWebApi_set("WLan_Entry0","WPAPSK","PreSharedKey")
				TCWebApi_set("WLan_Entry0","AuthMode","WEP_Selection")
				TCWebApi_set("WLan11ac_Entry0","SSID","ESSID")
				TCWebApi_set("WLan11ac_Entry0","WscDefaultSSID1","ESSID")
				TCWebApi_set("WLan11ac_Entry0","WPAPSK","PreSharedKey")
				TCWebApi_set("WLan11ac_Entry0","AuthMode","WEP_Selection")
				TCWebApi_ConstSet("WLan_Common","ToCommit","1")
				TCWebApi_ConstSet("WLan11ac_Common","ToCommit","1")
			End If
		end if
	end If
else
	if Request_Form("wififlg") = "1" then
		If Request_Form("Enable_AccessPoint") = "1" then
			TCWebApi_set("WLan_Common","APOn","Enable_AccessPoint")
			TCWebApi_ConstSet("WLan_Entry0","EnableSSID","1")
			if Request_Form("WEP_Selection") = "OPEN" then
			If tcWebApi_validate("ESSID=textlen|32") = "1" Then
					TCWebApi_set("WLan_Entry0","SSID","ESSID")
					TCWebApi_set("WLan_Entry0","WscDefaultSSID1","ESSID")
					TCWebApi_set("WLan_Entry0","AuthMode","WEP_Selection")
					TCWebApi_ConstSet("WLan_Common","ToCommit","1")
				End If
			else
				If tcWebApi_validate("ESSID=textlen|32&PreSharedKey=textlen|64") = "1" Then
					TCWebApi_set("WLan_Entry0","SSID","ESSID")
					TCWebApi_set("WLan_Entry0","WscDefaultSSID1","ESSID")
					TCWebApi_set("WLan_Entry0","WPAPSK","PreSharedKey")
					TCWebApi_set("WLan_Entry0","AuthMode","WEP_Selection")
					TCWebApi_ConstSet("WLan_Common","ToCommit","1")
				End If
			end if
		else
			TCWebApi_ConstSet("WLan_Entry0","EnableSSID","0")
			TCWebApi_ConstSet("WLan_Common","ToCommit","1")
		end if
	end If
	if Request_Form("wifi11acflg") = "1" then
		If Request_Form("wlan11ac_APenable") = "1" then
			TCWebApi_set("WLan11ac_Common","APOn","wlan11ac_APenable")
			TCWebApi_ConstSet("WLan11ac_Entry0","EnableSSID","1")
			if Request_Form("WEP_Selection_11ac") = "OPEN" then
			If tcWebApi_validate("ESSID11AC=textlen|32") = "1" Then
					TCWebApi_set("WLan11ac_Entry0","SSID","ESSID11AC")
					TCWebApi_set("WLan11ac_Entry0","WscDefaultSSID1","ESSID11AC")
					TCWebApi_set("WLan11ac_Entry0","AuthMode","WEP_Selection_11ac")
					TCWebApi_ConstSet("WLan11ac_Common","ToCommit","1")
				End If
			else
				If tcWebApi_validate("ESSID11AC=textlen|32&PreSharedKey11AC=textlen|64") = "1" Then
					TCWebApi_set("WLan11ac_Entry0","SSID","ESSID11AC")
					TCWebApi_set("WLan11ac_Entry0","WscDefaultSSID1","ESSID11AC")
					TCWebApi_set("WLan11ac_Entry0","WPAPSK","PreSharedKey11AC")
					TCWebApi_set("WLan11ac_Entry0","AuthMode","WEP_Selection_11ac")
					TCWebApi_ConstSet("WLan11ac_Common","ToCommit","1")
				End If
			end if
		else
			TCWebApi_ConstSet("WLan11ac_Entry0","EnableSSID","0")
			TCWebApi_ConstSet("WLan11ac_Common","ToCommit","1")
		end if
	end If
end if
if Request_Form("bndstrflg") = "1" then
	if Request_Form("Band_Steering_En") = "1" then
		TCWebApi_ConstSet("WLan_Bndstrg","BndStrgEnable","1")
	else
		TCWebApi_ConstSet("WLan_Bndstrg","BndStrgEnable","0")
	end if
	TCWebApi_ConstSet("WLan11ac_Common","ToCommit","1")
	TCWebApi_ConstSet("WLan_Common","ToCommit","1")
end if
if TCWebApi_get("WLan_Common","ToCommit","h") = "1" then
	TCWebApi_ConstSet("WebCurSet_Entry", "wlan_id", "0")
	TCWebApi_commit("WLan_Entry")
	TCWebApi_ConstSet("WLan_Common","ToCommit","0")
	TCWebApi_save()
end if
if TCWebApi_get("WLan11ac_Common","ToCommit","h") = "1" then
	TCWebApi_ConstSet("WebCurSet_Entry", "wlan_ac_id", "0")
	TCWebApi_commit("WLan11ac_Entry")
	TCWebApi_ConstSet("WLan11ac_Common","ToCommit","0")
	TCWebApi_save()
end if
if request_Form("wan0flg") = "1" then
	tcWebApi_set("WebCurSet_Entry","wan_pvc","wan_pvc")
	tcWebApi_set("WebCurSet_Entry","wan_pvc_entry","wan_pvc_entry")
	tcWebApi_set("WebCurSet_Entry","waninfo_index","waninfo_index")
    if request_Form("new_ppp0usr") <> "" then
		if request_Form("new_ppp0pwd") <> "" then
			If tcWebApi_validate("new_ppp0usr=textlen|64&new_ppp0pwd=textlen|64") = "1" Then
				tcWebApi_ConstSet("Wan_PVC_Entry","Active","Yes")
				tcWebApi_set("Wan_PVC_Entry","USERNAME","new_ppp0usr")
				tcWebApi_set("Wan_PVC_Entry","PASSWORD","new_ppp0pwd")
				tcWebApi_set("Wan_PVC_Entry","waitforIP4","waitforIP4")
				tcWebApi_set("Wan_PVC_Entry","waitforIP6","waitforIP6")
				tcWebApi_commit("Wan_PVC")
				TCWebApi_save()
			End If
		end if
    end if
end if
if Request_Form("accountflg") = "1" then
	if Request_Form("newpasswd") <> "" then
		if Request_Form("newpasswd") = Request_Form("cfpasswd") then
			if tcWebApi_PassWdFormatCheck("passwd", "newpasswd") = "0" Then
				'good to go
				tcWebApiSessionAttr_Update("pwd_changed", "1")
				tcWebApi_set("Account_Entry0","web_passwd","newpasswd")
				tcWebApi_commit("Account_Entry0")
				TCWebApi_save()
			else
				if tcWebApi_PassWdFormatCheck("passwd", "newpasswd") = "1" Then
					'wrong current password
					tcWebApiSessionAttr_Update("wrong_passwd", "1")
				else
					'new password is weak
					tcWebApiSessionAttr_Update("weak_passwd", "1")
					tcWebApiSessionAttr_Update("pwd_changed", "1")
					tcWebApi_set("Account_Entry0","web_passwd","newpasswd")
					tcWebApi_commit("Account_Entry0")
					TCWebApi_save()
				end if
			end If
		end if
	end if
end If
%>
<!doctype html>
<html>
	<head>
<title>Viettel ONT - <%tcWebApi_get("String_Entry","NavigationHomeText","s")%></title>		<meta charset="utf-8">
		<meta HTTP-EQUIV="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<meta http-equiv="x-ua-compatible" content="IE=edge">
		<script language='javascript' src='/JS/jquery.js'></script>
		<script language='javascript' src='/JS/util.js'></script>
		<script language='javascript' src='/JS/bootstrap.bundle.min.js'></script>
		<script language='javascript' src='/JS/pace.js'></script>
		<link rel="stylesheet" type="text/css" href="/style.css">
		<script language="JavaScript" type="text/JavaScript">
			var first_load = 1;
			var timer;
			var timeout = <% tcWebApi_get("Account_Entry0","StdioTimeout","s") %>;
			function logout_timer_run(t) {
				clearTimeout(timer);
				if (0 !=  Number(timeout))
				{
					timer = setTimeout(function(){ 
						$.ajax({
						   	url: '/cgi-bin/get_live_timeout.cgi',
						   	method: 'GET',
						   	complete: function(res){
								 {
									if (/iPad|iPhone|iPod/.test(navigator.userAgent) && !window.MSStream) {
										Pace.stop();
									}
									var obj = JSON.parse(res.responseText);
									timeout = obj["timeout_left"];
									if (timeout <= 1)
										onDeleteSession();
									else {
										logout_timer_run();
										return;
									}
								}
							}
						}
						)
					},  1000 * Number(timeout));
				}
			}
			function submitLanguageForm(value) {
				if (value != "<%tcWebApi_get("LanguageSwitch_Entry","Type","s")%>") {
					document.LanguageForm.Language_Flag.value = value;
					submitAsync('LanguageForm');
				}
			}
		</script>		<script language="javascript" type=text/javascript>
			/* Wi-Fi Widget */
			var wAPEnable = "<%tcWebApi_get("WLan_Common","APOn","s")%>";
			var wSSIDEnable =  "<%tcWebApi_get("WLan_Entry0","EnableSSID","s")%>";
			var wSSID =  "<%tcWebApi_get("WLan_Entry0","SSID","s")%>";
			var wAuthType = "<%tcWebApi_get("WLan_Entry0","AuthMode","s")%>";
			var wPSK = "<%tcWebApi_get("WLan_Entry0","WPAPSK","s")%>";
			var w11acAPEnable = "<%tcWebApi_get("WLan11ac_Common","APOn","s")%>";
			var w11acSSIDEnable = "<%tcWebApi_get("WLan11ac_Entry0","EnableSSID","s")%>";
			var w11acSSID = "<%tcWebApi_get("WLan11ac_Entry0","SSID","s")%>";
			var w11acAuthType = "<%tcWebApi_get("WLan11ac_Entry0","AuthMode","s")%>";
			var w11acPSK = "<%tcWebApi_get("WLan11ac_Entry0","WPAPSK","s")%>";
			var bandstrEnable = "<% if tcWebApi_get("WLan_Bndstrg","BndStrgEnable","h") <> "N/A" then tcWebApi_get("WLan_Bndstrg","BndStrgEnable","s") else asp_write("0") end if %>";
			var hide_wifi = 0;
			var wifi_24_on = wAPEnable&wSSIDEnable;
			var wifi_5_on = w11acAPEnable&w11acSSIDEnable;
			<% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then
				if tcWebApi_get("Mesh_Common", "DeviceRole", "h") = "2" then %>
				hide_wifi = 1;
			<% end if end if %>
			function display_wifi(){
				if ($("#Enable_AccessPoint").prop("checked") == true) {
					$("#ESSID").prop("disabled",false);
					$("#PreSharedKey").prop("disabled",false);
					cs_enable("WEP_Selection");
				}
				else {
					$("#ESSID").prop("disabled",true);
					$("#PreSharedKey").prop("disabled",true);
					cs_disable("WEP_Selection");
				}
			}
			function display_wifi11ac(){
				if ($("#wlan11ac_APenable").prop("checked") == true) {
					$("#ESSID11AC").prop("disabled",false);
					$("#PreSharedKey11AC").prop("disabled",false);
					cs_enable("WEP_Selection_11ac");
				}
				else {
					$("#ESSID11AC").prop("disabled",true);
					$("#PreSharedKey11AC").prop("disabled",true);
					cs_disable("WEP_Selection_11ac");
				}
			}
			function doWEPChange(){
				if ($("#WEP_Selection").val() == "OPEN") {
					$("#PreSharedKey").parent().parent().hide();
				}
				else {
					$("#PreSharedKey").parent().parent().show();
				}
			}
			function doWEPChange_11ac(){
				if ($("#WEP_Selection_11ac").val() == "OPEN") {
					$("#PreSharedKey11AC").parent().parent().hide();
				}
				else {
					$("#PreSharedKey11AC").parent().parent().show();
				}
			}
			function onloadCheck_wifi() {
				if (wAPEnable == "1") {
					if (wSSIDEnable == "1") {
						$("#Enable_AccessPoint").prop("checked", true);
						$("#Enable_AccessPoint").val("1");
					}
					$("#HaveWifi-div").show();
					$("#NoWifi-div").hide();
				}
				else {
					$("#HaveWifi-div").hide();
					$("#NoWifi-div").show();
				}
				if (w11acAPEnable == "1") {
					if (w11acSSIDEnable == "1") {
						$("#wlan11ac_APenable").prop("checked", true);
						$("#wlan11ac_APenable").val("1");
					}
					$("#HaveWifi11ac-div").show();
					$("#NoWifi11ac-div").hide();
				}
				else {
					$("#HaveWifi11ac-div").hide();
					$("#NoWifi11ac-div").show();
				}
				display_wifi();
				display_wifi11ac();
				doWEPChange();
				doWEPChange_11ac();
				ShowBandSteering(1);
			}
			function has_config_wifi() {
				if (wSSIDEnable != $("#Enable_AccessPoint").val()) {
					return true;
				}
				if (wAPEnable == "1") {
					if (wSSID != $("#ESSID").val()) {
						return true;
					}
					if (wAuthType != $("#WEP_Selection").val()) {
						return true;
					}
					if (wAuthType != "OPEN") {
						if (wPSK != $("#PreSharedKey").val()) {
							return true;
						}
					}
				}
				return false;
			}
			function has_config_wifi11ac() {
				if (w11acSSIDEnable != $("#wlan11ac_APenable").val()) {
					return true;
				}
				if (w11acAPEnable == "1") {
					if (w11acSSID != $("#ESSID11AC").val()) {
						return true;
					}
					if (w11acAuthType != $("#WEP_Selection_11ac").val()) {
						return true;
					}
					if (w11acAuthType != "OPEN") {
						if (w11acPSK != $("#PreSharedKey11AC").val()) {
							return true;
						}
					}
				}
				return false;
			}
			function has_config_bndstr() {
				if ($("#Band_Steering_En").val() != bandstrEnable)
					return true;
				else
					return false;
			}
			function quotationCheck(str, limit_len) {
				var len = str.length;
				var c;
				var i, j = 0;
				for (i = 0; i < len; i++)
				{
					var c = str.charAt(i);
					if (c == '"')
					{
						j += 6;
					}
					else
						j++;
				}
				if (j > limit_len-1)
				{
					alert('<%tcWebApi_get("String_Entry","WirelessJS17Text","s")%>');
					return true;
				}
				return false;
			}
			function strESSIDCheck(str) {
				if(str.match(/[^\x00-\xff]/g)){
					alert("<%tcWebApi_get("String_Entry","WirelessJS1Text","s")%>");
					return true;
				}
				if(str.length <= 0){
					alert("<%tcWebApi_get("String_Entry","WirelessJS2Text","s")%>");
					return true;
				}
				return false;
			}
			function doHexCheck(c) {
				if(c >= "0" && c <= "9")
					return 1;
				if(c >= "A" && c <= "Z")
					return 1;
				if(c >= "a" && c <= "z")
					return 1;
				return -1;
			}
			function wpapskCheck(str) {
				var keyvalue=str;
				var wpapsklen=str.length;
				if(wpapsklen >= 8 && wpapsklen < 64) {
					if(keyvalue.match(/[^\x00-\xff]/g))
					{
						alert("<%tcWebApi_get("String_Entry","WirelessJS25Text","s")%>");
						return true;
					}
				}else if(wpapsklen==64){
					for(i=0;i<64;i++){
						var c=keyvalue.charAt(i);
						if(doHexCheck(c)<0){
							alert("<%tcWebApi_get("String_Entry","WirelessJS26Text","s")%>");
							return true;
						}
					}
				}else {
					alert("<%tcWebApi_get("String_Entry","WirelessJS25Text","s")%>");
					return true;
				}
				return false;
			}	
			/* WAN Widget */
			var arPPPUsername = "";
			var arPPPPassword = "";
			var obj;
			function updateResult(item, val) {
				val1 = val.toLowerCase();
				if( val1 == "no attribute information")
				{
					document.getElementById(item).innerHTML = "N/A";
				}
				if( val1 == "no node information")
				{
					document.getElementById(item).innerHTML = "N/A";
				}
				else
				{
					document.getElementById(item).innerHTML = val;
				}
			}
			var topush;
			function ajax_get_waninfo() {
				$.ajax({
					url: '/cgi-bin/get_pppacc.asp',
					type: 'post',
					dataType: 'json',
					contentType: 'application/json',
					success: function (data) {
						var collecting = 0;
						obj = data;
						//var OLTType = "<% tcWebApi_get("Xpon_Common","oltType","s") %>";
						if ((obj.active != "Yes")) {									
							$("#wandisabled_div").show();								
							$("#wan_info").hide();
							return;
						}
						updateResult("ppp_vlan",obj.vlan);
						$("#new_ppp0usr").val(obj.user);
						$("#new_ppp0pwd").val(obj.pass);
						arPPPUsername=obj.user;
						arPPPPassword=obj.pass;
						$("#wan_ipver").val(obj.ipver);
						if ((obj.ipver == "IPv4") || (obj.ipver == "IPv4/IPv6")) {
							$("#ppp_ip4").show();
							if (obj.waitip4 == "1") {
								if ((parseInt(obj.curtime) - parseInt(obj.commitime)) < 120) {
									updateResult("ppp_ip4","<div class='loading'><%tcwebapi_get("String_Entry","GettingText","s")%> IPv4</div>");
									collecting = 1;
								}
								else {
									updateResult("ppp_ip4",obj.ip4);
								}
							}
							else {
								updateResult("ppp_ip4",obj.ip4);
							}
						}
						if ((obj.ipver == "IPv6") || (obj.ipver == "IPv4/IPv6")) {
							$("#ppp_ip6").show();
							if (obj.waitip6 == "1") {
								if ((parseInt(obj.curtime) - parseInt(obj.commitime)) < 120) {
									updateResult("ppp_ip6","<div class='loading'><%tcwebapi_get("String_Entry","GettingText","s")%> IPv6</div>");
									collecting = 1;
								}
								else {
									updateResult("ppp_ip6",obj.ip6);
								}
							}
							else {
								updateResult("ppp_ip6",obj.ip6);
							}
						}
						if (collecting) {
							setTimeout(ajax_get_waninfo, 5000);
						}
					},
            		data: topush
				});
			}
			function get_waninfo(hsi_index) {
				var entry = parseInt(hsi_index)%8;
				var pvc = (parseInt(hsi_index) - entry)/8;
				$("#wan_pvc").val(pvc);
				$("#wan_pvc_entry").val(entry);
				$("#waninfo_index").val(hsi_index);
				topush = {
					TokenString: "<%tcWebApi_getToken()%>",
					waninfo_index: hsi_index,
					wan_pvc: pvc,
					wan_pvc_entry: entry,
					dv: "1"
				}
				ajax_get_waninfo();
			}
			function onloadCheck_wan() {
				var pvc_counts=<% tcWebApi_get("WanInfo_Common","CycleNum","s") %>;
				//get all value
				// num 0
				var vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
				Wan_WanName = vArrayStr.split(',');
				vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
				vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
				// num 3
				vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
				Wan_Actives = vArrayStr.split(',');
				vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
				var WANEnNAT = vArrayStr.split(',');
				vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
				vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
				var WANIPver = vArrayStr.split(',');
				vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
				vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
				// num 9		
				vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
				Wan_ENCAP = vArrayStr.split(',');
				vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
				vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
				vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
				vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
				vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
				vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
				vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
				vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
				vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
				vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
				// num 20
				var CycleV = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
				IFIdxArray = CycleV.split(',');
				vArrayStr = "<% tcWebApi_get("WanInfo_Common","ValidIFIndex","s") %>";
				vEntryIndex = vArrayStr.split(',');
				//var OLTType = "<% tcWebApi_get("Xpon_Common","oltType","s") %>";
				var isBridge = "<%tcWebApi_get("Wan_Common", "ProfileBridge", "s") %>";
				var hsi_index, i;
				if ("<% tcWebApi_get("WanInfo_Common","DefRouteIndexv4","s") %>" != "N/A") {
					hsi_index = "<% tcWebApi_get("WanInfo_Common","DefRouteIndexv4","s") %>";
					i = vEntryIndex.indexOf(hsi_index);
					if ((Wan_ENCAP[i] == "PPPoE") && (Wan_Actives[i] == "Yes") && (WANIPver[i].indexOf("IPv4") >= 0)) {
						get_waninfo(hsi_index);
						return;
					}
				}
				if ("<% tcWebApi_get("WanInfo_Common","DefRouteIndexv6","s") %>" != "N/A") {
					hsi_index = "<% tcWebApi_get("WanInfo_Common","DefRouteIndexv6","s") %>";
					i = vEntryIndex.indexOf(hsi_index);
					if ((Wan_ENCAP[i] == "PPPoE") && (Wan_Actives[i] == "Yes") && (WANIPver[i].indexOf("IPv6") >= 0)) {
						get_waninfo(hsi_index);
						return;
					}
				}
				hsi_index = -1;
				for (var i = 0; i < pvc_counts; i++) {
					if (Wan_ENCAP[i] == "PPPoE") {
						if (Wan_WanName[i].indexOf("INTERNET") != -1) {
							if (Wan_Actives[i] == "Yes"){
								if ((WANIPver[i] == "IPv6") || (WANEnNAT[i] == "Enable")) {
									hsi_index = i;
									break;
								}
							}
						}
					}
				}
				if (hsi_index != -1) {
					get_waninfo(vEntryIndex[hsi_index]);
					return;
				}
				if (isBridge != "1") {
					get_waninfo(0);
					return;
				}
				$("#nowan_div").show();
				$("#wan_div").hide();
			}
			function has_config_wan() {
				if (arPPPUsername != $('input[name="new_ppp0usr"]').val()) {
					return true;
				}
				if (arPPPPassword != $('input[name="new_ppp0pwd"]').val()) {
					return true;
				}
				return false;
			}
			/* Account Widget */
			var signal = "<% tcWebApi_get("WebCurSet_Entry","CurPage","s") %>";
			function has_config_account() {
				if ($('input[name="passwd"]').val().length != 0) {
					return true;
				}
				if ($('input[name="newpasswd"]').val().length != 0) {
					return true;
				}
				if ($('input[name="cfpasswd"]').val().length != 0) {
					return true;
				}
				return false;
			}
			function quotationCheck_Admin(password, limit_len) {
				var len = password.length;
				var c;
				var i, j = 0;
				for (i = 0; i < len; i++)
				{
					var c = password.charAt(i);
					if (c == '"')
					{
						j += 6;
					}
					else
						j++;
				}
				if (j > limit_len)
				{
					alert('<%tcWebApi_get("String_Entry","AdminJS2Text","s")%>');
					return true;
				}
				return false;
			}
			function onloadCheck_account() {
				<%if tcWebApiSessionAttr_Get("wrong_passwd") = "1" then%>
					alert("<%tcWebApi_get("String_Entry","WrongPasswd","s")%>");
					<%if request_Form("accountflg") = "" then%>
						<%tcWebApiSessionAttr_Update("wrong_passwd", "0")%>
					<%end if%>
				<%end if%>
				<%if tcWebApiSessionAttr_Get("weak_passwd") = "1" then%>
					alert("<%tcWebApi_get("String_Entry","PasswdChangedWeak","s")%>");
					<%if request_Form("accountflg") = "" then%>
						<%tcWebApiSessionAttr_Update("weak_passwd", "0")%>
					<%end if%>
					<% if tcWebApiSessionAttr_Get("pwd_changed") = "1" then %>
						doLogout();
						return;
					<% end if %>
				<% else %>
					<% if tcWebApiSessionAttr_Get("pwd_changed") = "1" then %>
						alert("<%tcWebApi_get("String_Entry","AdminJS8Text","s")%>");
						doLogout();
						return;
					<% end if %>
				<%end if%>
			}
			/* Common functions */
			function onloadCheck() {
				if (hide_wifi == 0) {
					onloadCheck_wifi();
				}
				else {
					$("#wifi_div").hide();
				}
				onloadCheck_account();
				onloadCheck_wan();
			}
			function doSubmit() {
				/* WiFi Widget */
				if (hide_wifi == 0) {
					if (has_config_bndstr()) {
						$('input[name="bndstrflg"]').val('1');
						$('input[name="wififlg"]').val('1');
					}
					if (has_config_wifi()) {
						if ($("#Enable_AccessPoint").val() == "1") {
							if(quotationCheck($("#ESSID").val(), 193)||strESSIDCheck($("#ESSID").val())) {
								$("#ESSID").focus();
								return false;
							}
							if ($("#WEP_Selection").val() != "OPEN") {
								if (wpapskCheck($("#PreSharedKey").val()))
									return false;
								if(quotationCheck($("#PreSharedKey").val(), 385))
									return false;
							}
						}
						$('input[name="wififlg"]').val('1');
					}
					if ($("#Band_Steering_En").prop("checked") != true) {	
						if (has_config_wifi11ac()) {
							if ($("#wlan11ac_APenable").val() == "1") {
								if(quotationCheck($("#ESSID11AC").val(), 193)||strESSIDCheck($("#ESSID11AC").val())) {
									$("#ESSID11AC").focus();
									return false;
								}
								if ($("#WEP_Selection_11ac").val() != "OPEN") {
									if (wpapskCheck($("#PreSharedKey11AC").val()))
										return false;
									if(quotationCheck($("#PreSharedKey11AC").val(), 385))
										return false;
								}
							}
							$('input[name="wifi11acflg"]').val('1');
						}
					}
				}
				else {
					document.getElementById("wififlg").value = "0";
					document.getElementById("wifi11acflg").value = "0";
					document.getElementById("bndstrflg").value = "0";
				}
				/* WAN Widget */
				if (has_config_wan()) {
					if ($('input[name="new_ppp0usr"]').val().length == 0) {
						alert("<%tcWebApi_get("String_Entry","AdminJS5Text","s")%>");
						return false;
					}
					if ($('input[name="new_ppp0pwd"]').val().length == 0) {
						alert("<%tcWebApi_get("String_Entry","AdminJS0Text","s")%>");
						return false;
					}
					if (isValidNameEx($('input[name="new_ppp0usr"]').val()) == false)
					{
						alert("<%tcWebApi_get("String_Entry","InvalidUserNameText","s")%>");
						$('input[name="new_ppp0usr"]').focus();
						return false;
					}
					if (isValidNameEx($('input[name="new_ppp0pwd"]').val()) == false)
					{
						alert("<%tcWebApi_get("String_Entry","InvalidPasswordText","s")%>");
						$('input[name="new_ppp0pwd"]').focus();
						return false;
					}
					if($('input[name="new_ppp0usr"]').val() != arPPPUsername || $('input[name="new_ppp0pwd"]').val() != arPPPPassword)
					{
						$('input[name="wan0flg"]').val("1");
					}
					if (($("#wan_ipver").val() == "IPv4/IPv6") || ($("#wan_ipver").val()  == "IPv4")) {
						$('input[name="waitforIP4"]').val("1");
					}
					if (($("#wan_ipver").val()  == "IPv4/IPv6") || ($("#wan_ipver").val()  == "IPv6")) {
						$('input[name="waitforIP6"]').val("1");
					}
				}
				/* Account Widget */
				if (has_config_account()) {
					var password = $('input[name="newpasswd"]').val();
					if (password.length == 0) {
						alert("<%tcWebApi_get("String_Entry","AdminJS0Text","s")%>");
						return false;
					}
					for(var i = 0; i < password.length; i ++ ) {
					   var ascNum = password.charCodeAt(i);
					   if (ascNum < 33 || ascNum > 126 || ascNum == 59){
							alert("<%tcWebApi_get("String_Entry","AdminJS7Text","s")%>");
							return false;
						}
					}
					if (password != $('input[name="cfpasswd"]').val()) {
						alert("<%tcWebApi_get("String_Entry","AdminJS1Text","s")%>");
						return false;
					}
					if (password == $('input[name="passwd"]').val()) {
						alert("<%tcWebApi_get("String_Entry","AdminJS9Text","s")%>");
						return false;
					}
					if(quotationCheck_Admin(password, 30))
						return false;
					$('input[name="accountflg"]').val('1');
				}
				submitAsync('home_form');
			}
			function ShowBandSteering(onload) {
				if ($("#Band_Steering_En").prop("checked") == true) {
					$("#wlan11ac_div").hide();
					$("#enable_ap_div").hide();
					$("#wifi_legend").html("<%tcWebApi_get("String_Entry","WiFiDualbandSettingsText","s")%>");
					$("#bndstr_note").show();
					if (onload == 0) {
						if ((wAPEnable != "1") || (wSSIDEnable != "1")) {
							$("#HaveWifi-div").show();
							$("#NoWifi-div").hide();
							$("#ESSID").prop("disabled",false);
							$("#PreSharedKey").prop("disabled",false);
							cs_enable("WEP_Selection");
						}
					}
				}
				else {
					if ((onload == 0)&( $("#ESSID").val() == $("#ESSID11AC").val())) {
						var WifiSSID_bandsteering = $("#ESSID").val();
						if(WifiSSID_bandsteering.includes("VIETTEL_"))
						{
							$("#ESSID11AC").val(WifiSSID_bandsteering.replace("VIETTEL_", "VIETTEL_5G_"));
						}
						else
						{
							$("#ESSID11AC").val(WifiSSID_bandsteering + "_5G");
						}
					}
					if (onload == 0) {
						if (wAPEnable != "1") {
							$("#HaveWifi-div").hide();
							$("#NoWifi-div").show();
							$("#ESSID").prop("disabled",true);
							$("#PreSharedKey").prop("disabled",true);
							cs_disable("WEP_Selection");
						}
						if (wSSIDEnable != "1") {
							$("#ESSID").prop("disabled",true);
							$("#PreSharedKey").prop("disabled",true);
							cs_disable("WEP_Selection");
						}
					}
					$("#wlan11ac_div").show();
					$("#enable_ap_div").show();
					$("#wifi_legend").html("<%tcWebApi_get("String_Entry","NavigationWiFiSettingsText","s")%>");
					$("#bndstr_note").hide();
				}
			}
		</script>
	</head>
	<body onload="onloadCheck();" class="container">
<header class="fixed-top"><nav id="top-nav" class="navbar navbar-expand-lg container"><a class="navbar-brand " href="/cgi-bin/home.asp"><div><img src="/img/logo_home.png" width="100" height="18" alt=""><div style="font-family: sans-serif; font-weight: bold;font-size: 12px;color: #000; margin-top: 0">OPTICAL NETWORK TERMINATION</div></div></a><button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"><em class="fas fa-align-justify"></em></span></button><div class="collapse navbar-collapse" id="navbarCollapse"><ul class="navbar-nav mr-auto sidenav" id="navAccordion"><li class="nav-item active"><a class="nav-link" href="/cgi-bin/home.asp"><%tcWebApi_get("String_Entry","NavigationHomeText","s")%><span class="sr-only">(current)</span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/deviceinfo.asp"><%tcWebApi_get("String_Entry","NavigationStatusDeviceText","s")%><span class="sr-only"></span></a></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#status-menu" aria-controls="status-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NavigationStatusStatisticsText","s")%></a><ul class="nav-second-level collapse" id="status-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/sta-statistics.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationTrafficText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/sta-wifiusers.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationStatusUsersText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/sta-users.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","ARPStatusText","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#network-menu" aria-controls="network-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NAVNetwork","s")%></a><ul class="nav-second-level collapse" id="network-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/net-wan.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationBasInternetText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/net-lan.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationBasLANText","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#wifi-menu" aria-controls="wifi-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NAVWifi","s")%></a><ul class="nav-second-level collapse" id="wifi-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/wifi.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationWiFiSettingsText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/wifi-11ac.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationWiFi11acSettingsText","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#firewall-menu" aria-controls="firewall-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NavigationAdvFirewallText","s")%></a><ul class="nav-second-level collapse" id="firewall-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-spi.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","ContentFirewallText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-urlfilter.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","FILTERTYPE_index2","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-macfilter.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVL2Filter","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-parentalcontrol.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","ParentalControlText","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#apps-menu" aria-controls="apps-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NAVApplication","s")%></a><ul class="nav-second-level collapse" id="apps-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-dmz.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NatTopDMZText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-portforwarding.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NatVirsvrText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-sslim.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","SessionLimit","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-route.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","StaticRouteText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-ddns.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","dyDNS1Text","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#tools-menu" aria-controls="tools-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NavigationMaintenanceText","s")%></a><ul class="nav-second-level collapse" id="tools-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-admin.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationMainAdminText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-time.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVSysTime","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-firmware.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationMainFirmwareText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-config.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVConfig","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-diagnostic.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationMainDiagnosticsText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-log.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVLogs","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-reboot.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","RebootText","s")%></span></a></li></ul></li></ul><div class="top-item-groups"><form name="LanguageForm" method="POST" action="/cgi-bin/home.asp" class="nav-item dropdown"><input type="hidden" name="TokenString" value="<%tcWebApi_getToken()%>"><input type="hidden" name="Language_Flag" value="<% tcWebApi_get("LanguageSwitch_Entry","Type","s") %>"><a class="nav-link dropdown-toggle" href="#" id="LanguageDropdown" role="button" data-toggle="dropdown" aria-expanded="false"><% tcWebApi_get("String_Entry","LoginLanguage","s") %></a><ul class="dropdown-menu" aria-labelledby="LanguageDropdown"><li><a class="dropdown-item <% if tcWebApi_get("LanguageSwitch_Entry","Type","h") = "1" then asp_Write("active") end if %>" href="#" onclick="submitLanguageForm(1);"><% tcWebApi_get("String_Entry","LanguageVIELong","s") %></a></li><li><a class="dropdown-item <% if tcWebApi_get("LanguageSwitch_Entry","Type","h") = "2" then asp_Write("active") end if %>" href="#" onclick="submitLanguageForm(2);"><% tcWebApi_get("String_Entry","LanguageENGLong","s") %></a></li></ul></form><div id="signout" class="nav-item"><a class="nav-link" href="javascript:doLogout();"><em class="fa fa-sign-out-alt"></em><span class="nav-link-text"><% tcWebApi_get("String_Entry","LogoutText","s") %></span></a></div></div></div></header></nav><% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then
	if tcWebApi_get("Mesh_Common", "DeviceRole", "h") = "2" then %>
		<script language='javascript'>
		document.getElementById("wifi-menu").children[0].style="display: none";
		document.getElementById("wifi-menu").children[1].style="display: none";
		</script>
<% end if end if %>		<div id="content">
			<form class="form-inline" METHOD="POST" ACTION="/cgi-bin/home.asp" name="home_form" >
			<input type="hidden" name="TokenString" value="<%tcWebApi_getToken()%>">
			<input type="hidden" name="wififlg" value="0">
			<input type="hidden" name="wifi11acflg" value="0">
			<input type="hidden" name="wan0flg" value="0">
			<input type="hidden" name="wan_pvc" id="wan_pvc" value="0">
			<input type="hidden" name="wan_pvc_entry" id="wan_pvc_entry" value="0">
			<input type="hidden" name="waninfo_index" id="waninfo_index" value="0">
			<input type="hidden" name="accountflg" value="0">
			<input type="hidden" name="bndstrflg" value="0">
			<input type="hidden" name="waitforIP4" value="0">
			<input type="hidden" name="waitforIP6" value="0">
			<input type="hidden" name="wan_ipver" id="wan_ipver" value="">
			<div class="row row-w-100">
				<div class="widget col-xs-12 col-lg-12" id="wifi_div">
					<header>Wi-Fi</header>
					<div class="d-flex flex-wrap widget-body">
						<fieldset class="col-lg-6 mb-3" >
							<legend id="wifi_legend"><%tcWebApi_get("String_Entry","NavigationWiFiSettingsText","s")%></legend>
							<div id="HaveWifi-div">
								<div class="form-group" id="enable_ap_div">
									<label class="col-lg-5" for="Enable_AccessPoint"><%tcWebApi_get("String_Entry","EnableText","s")%> SSID1</label>
									<label class="toggle-switch">
										<input type="checkbox" name="Enable_AccessPoint" id="Enable_AccessPoint" onChange="display_wifi();" value="1">
										<span class="slider"></span>
									</label>
								</div>
								<div class="form-group">
									<label class="col-lg-5" for="ESSID"><%tcWebApi_get("String_Entry","WirelessBasicNetNameText","s")%> (SSID1)</label>
									<input type="text" class="form-control col-lg-6" name="ESSID" size="32" maxlength="32" id="ESSID" value="<%If tcWebApi_get("WLan_Entry0","SSID","h") <> "N/A" then tcWebApi_get("WLan_Entry0","SSID","s") end if%>">
								</div>
								<div class="form-group">
									<label class="col-lg-5" for=""><%tcWebApi_get("String_Entry","WirelessAuthTypeText","s")%></label>
									<div class="col-lg-6 custom-select">
										<select id="WEP_Selection" name="WEP_Selection" onChange="doWEPChange()">
											<OPTION value="OPEN" <% if tcWebApi_get("WLan_Entry0","AuthMode","h") = "OPEN" then asp_Write("selected") elseif tcWebApi_get("WLan_Entry0","AuthMode","h") = "N/A" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","WirelessWEPStatus0Text","s")%>
											<OPTION value="WPAPSK" <% if tcWebApi_get("WLan11ac_Entry","AuthMode","h") = "WPAPSK" then asp_Write("selected") end if %>  >WPA-PSK</OPTION>
											<OPTION value="WPA2PSK" <% if tcWebApi_get("WLan_Entry0","AuthMode","h") = "WPA2PSK" then asp_Write("selected") end if %>>WPA2-PSK
											<OPTION value="WPAPSKWPA2PSK" <% if tcWebApi_get("WLan_Entry0","AuthMode","h") = "WPAPSKWPA2PSK" then asp_Write("selected") end if %> <% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then asp_Write	("disabled") end if %> >WPA/WPA2-PSK
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-lg-5" for="PreSharedKey"><%tcWebApi_get("String_Entry","DonglePasswordText","s")%></label>
									<div class="input-group col-lg-6 px-0">
										<input class="form-control" TYPE="password" ID="PreSharedKey" NAME="PreSharedKey" STYLE="WIDTH:140" SIZE="48" MAXLENGTH="63" VALUE="<% If tcWebApi_get("WLan_Entry0","WPAPSK","h") <> "N/A" then tcWebApi_get("WLan_Entry0","WPAPSK","s") end if %>" >
										<div class="input-group-addon show-password-btn">
											<a href="#"><i class="fa fa-eye-slash" aria-hidden="true"></i></a>
										</div>
									</div>
								</div>
							</div>
							<div id="NoWifi-div" class="form-group" style="display: none;">
								<label class="text-justify pr-4">
									<p><%tcWebApi_get("String_Entry","WifiBandIsDisabledText","s")%><a href="/cgi-bin/wifi.asp"><%tcWebApi_get("String_Entry", "NavigationWiFiSettingsText", "s") %></a>.</p>
								</label>
							</div>
						</fieldset>
						<fieldset class="col-lg-6 mb-3" id="wlan11ac_div">
							<legend><%tcWebApi_get("String_Entry","NavigationWiFi11acSettingsText","s")%></legend>
							<div id="HaveWifi11ac-div">
								<div class="form-group">
									<label class="col-lg-5" for="wlan11ac_APenable"><%tcWebApi_get("String_Entry","EnableText","s")%> SSIDAC1</label>
									<label class="toggle-switch">
										<input type="checkbox" name="wlan11ac_APenable" id="wlan11ac_APenable" onChange="display_wifi11ac();" value="1">
										<span class="slider"></span>
									</label>
								</div>
								<div class="form-group">
									<label class="col-lg-5" for="ESSID11AC"><%tcWebApi_get("String_Entry","WirelessBasicNetNameText","s")%> (SSIDAC1)</label>
									<input type="text" class="form-control col-lg-6" name="ESSID11AC" size="32" maxlength="32" id="ESSID11AC" value="<%If tcWebApi_get("WLan11ac_Entry0","SSID","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry0","SSID","s") end if%>">
								</div>
								<div class="form-group">
									<label class="col-lg-5" for=""><%tcWebApi_get("String_Entry","WirelessAuthTypeText","s")%></label>
									<div class="col-lg-6 custom-select">
										<select id="WEP_Selection_11ac" name="WEP_Selection_11ac" onChange="doWEPChange_11ac()">
											<OPTION value="OPEN" <% if tcWebApi_get("WLan11ac_Entry0","AuthMode","h") = "OPEN" then asp_Write("selected") elseif tcWebApi_get("WLan11ac_Entry0","AuthMode","h") = "N/A" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","WirelessWEPStatus0Text","s")%>
											<OPTION value="WPAPSK" <% if tcWebApi_get("WLan11ac_Entry","AuthMode","h") = "WPAPSK" then asp_Write("selected") end if %>  >WPA-PSK</OPTION>
											<OPTION value="WPA2PSK" <% if tcWebApi_get("WLan11ac_Entry0","AuthMode","h") = "WPA2PSK" then asp_Write("selected") end if %>>WPA2-PSK
											<OPTION value="WPAPSKWPA2PSK" <% if tcWebApi_get("WLan11ac_Entry0","AuthMode","h") = "WPAPSKWPA2PSK" then asp_Write("selected") end if %> <% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then asp_Write	("disabled") end if %>>WPA/WPA2-PSK
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-lg-5" for="PreSharedKey11AC"><%tcWebApi_get("String_Entry","DonglePasswordText","s")%></label>
									<div class="input-group col-lg-6 px-0">
										<input class="form-control" TYPE="password" name="PreSharedKey11AC" size="32" maxlength="63" id="PreSharedKey11AC" value="<%If tcWebApi_get("WLan11ac_Entry0","WPAPSK","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry0","WPAPSK","s") end if%>">
										<div class="input-group-addon show-password-btn">
											<a href="#"><i class="fa fa-eye-slash" aria-hidden="true"></i></a>
										</div>
									</div>
								</div>
							</div>
							<div id="NoWifi11ac-div" class="form-group" style="display: none;">
								<label class="text-justify pr-4">
									<p><%tcWebApi_get("String_Entry","Wifi11acBandIsDisabledText","s")%><a href="/cgi-bin/wifi-11ac.asp"><%tcWebApi_get("String_Entry", "NavigationWiFi11acSettingsText", "s") %></a>.</p>
								</label>
							</div>
						</fieldset>
						<fieldset class="col-lg-12">
							<legend><%tcWebApi_get("String_Entry","WirelessBandSteeringSettingText","s")%></legend>
							<div class="form-group">
								<label class="col-lg-2-5" for="Band_Steering_En"><%tcWebApi_get("String_Entry","WirelessBandSteeringText","s")%></label>
								<label class="toggle-switch">
									<input type="checkbox" name="Band_Steering_En" id="Band_Steering_En" <% if tcWebApi_get("WLan_Common","APOn","h") = "1" then %>
										<% if tcWebApi_get("WLan_Bndstrg","BndStrgEnable","h") = "1" then asp_Write("checked") end if%> <% end if %> onclick="ShowBandSteering(0);">
									<span class="slider"></span>
								</label>
								<label id="bndstr_note" class="input-description font-italic offset-lg-2-5 col-lg-8"><%tcWebApi_get("String_Entry","BandSteeringNoteText","s")%></label>
							</div>
						</fieldset>
					</div>
				</div>
				<div class="widget col-xs-12 col-lg-6">
					<header><%tcWebApi_get("String_Entry","QSWanPppoeText","s")%></header>
					<div class="widget-body">
						<fieldset id="nowan_div" style="display: none" class="form-group">
							<label class="col-sm-12 text-justify"><p><%tcWebApi_get("String_Entry", "WanHSIIsDisabledText", "s") %>&nbsp;<a href="/cgi-bin/net-wan.asp"><%tcWebApi_get("String_Entry", "NavigationBasInternetText", "s") %></a>.</p></label>
						</fieldset>
						<fieldset id="wan_div">
							<legend id="wan_name">
							</legend>
							<div class="form-group">
								<label class="col-lg-5" for="new_ppp0usr"><%tcWebApi_get("String_Entry","QSWanUser","s")%></label>
								<input type="text" class="form-control col-lg-7" name="new_ppp0usr" size="32" maxlength="64" id="new_ppp0usr" autocomplete="new-user" value="">
							</div>
							<div class="form-group">
								<label class="col-lg-5" for="new_ppp0pwd"><%tcWebApi_get("String_Entry","QSWanPass","s")%></label>
								<div class="input-group col-lg-7 px-0">
									<input class="form-control" TYPE="password" name="new_ppp0pwd" size="32" maxlength="64" id="new_ppp0pwd" autocomplete="new-password" value="">
									<div class="input-group-addon show-password-btn">
										<a href="#"><i class="fa fa-eye-slash" aria-hidden="true"></i></a>
									</div>
								</div>
							</div>
							<div id="wan_info">
							<div class="form-group">
								<label class="col-lg-5">VLAN</label>
								<label class="status-value col-lg-7" id="ppp_vlan"></label>
							</div>
							<div class="form-group">
								<label class="col-lg-5"><%tcWebApi_get("String_Entry","QSWanIP","s")%></label>
								<label class="status-value col-lg-7" id="ppp_ip4" style="display: none"></label>
								<label class="offset-lg-5 status-value col-lg-7" id="ppp_ip6" style="overflow-x: auto; display: none"></label>
							</div>
							</div>
						</fieldset>
						<fieldset id="wandisabled_div" style="display: none" class="form-group">
							<label class="col-sm-12 text-justify"><p><%tcWebApi_get("String_Entry", "HomeWanDisabledText", "s") %></p></label>
						</fieldset>
					</div>
				</div>
				<div class="widget col-xs-12 col-lg-6">
					<header><%tcWebApi_get("String_Entry","QSAccountLegend","s")%></header>
					<div class="widget-body">
						<div class="form-group">
							<label class="col-lg-5"><%tcWebApi_get("String_Entry","LoginUsernameText","s")%></label>
							<label class="status-value col-lg-5">admin</label>
						</div>
						<div class="form-group">
							<label class="col-lg-5" for="curpasswd"><%tcWebApi_get("String_Entry","AdminCurPasswordText","s")%></label>
							<div class="input-group col-lg-7 px-0">
								<input class="form-control" TYPE="password" name="passwd" size="32" maxlength="30" id="passwd" value="" autocomplete="off">
								<div class="input-group-addon show-password-btn">
									<a href="#"><i class="fa fa-eye-slash" aria-hidden="true"></i></a>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-5" for="newpasswd"><%tcWebApi_get("String_Entry","AdminNewPasswordText","s")%></label>
							<div class="input-group col-lg-7 px-0">
								<input class="form-control" TYPE="password" name="newpasswd" size="32" maxlength="30" id="newpasswd" value="">
								<div class="input-group-addon show-password-btn">
									<a href="#"><i class="fa fa-eye-slash" aria-hidden="true"></i></a>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-5" for="cfpasswd"><%tcWebApi_get("String_Entry","AdminConfirmPasswordText","s")%></label>
							<div class="input-group col-lg-7 px-0">
								<input class="form-control" TYPE="password" name="cfpasswd" size="32" maxlength="30" id="cfpasswd" value="">
								<div class="input-group-addon show-password-btn">
									<a href="#"><i class="fa fa-eye-slash" aria-hidden="true"></i></a>
								</div>
							</div>
						</div>
					</div>
				</div>
				</div>
				<div class="col-lg-12 d-flex align-items-center justify-content-center">
					<button type="button" class="page-button large-button" onclick="doSubmit();"><%tcWebApi_get("String_Entry","ButtonApplyText","s")%></button>
				</div>
			</div>
			</form>
		</div>
		<footer>
			<p><%tcWebApi_get("String_Entry","SaleConsultantText","s")%>: <a href="tel:18008168">18008168</a></p>
			<p><%tcWebApi_get("String_Entry","ReportProblemText","s")%>: <a href="tel:18008119">18008119</a></p>
			<p>&copy; 2021 by VHT. All rights reserved.</p>
		</footer>
		<script language='javascript' src='/JS/user.js'></script>	</body>
</html>
