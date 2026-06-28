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
if Request_Form("SSID_Flag") = "1" then 
	TCWebApi_set("WebCurSet_Entry","wlan_id", "wlSsidIdx")
end if
If Request_Form("CountryChange")="1" Then
	tcWebApi_set("WebCurSet_Entry","wlan_id","wlSsidIdx")
	TCWebApi_set("WLan_Common","Country","Countries_Channels")
	if Request_Form("Countries_Channels") = "CANADA" then
		TCWebApi_set("WLan_Common","CountryRegion","CountryRegion0")
	elseif Request_Form("Countries_Channels") = "COLOMBIA" then
		TCWebApi_set("WLan_Common","CountryRegion","CountryRegion0")
	elseif Request_Form("Countries_Channels") = "DOMINICAN REPUBLIC" then
		TCWebApi_set("WLan_Common","CountryRegion","CountryRegion0")
	elseif Request_Form("Countries_Channels") = "GUATEMALA" then
		TCWebApi_set("WLan_Common","CountryRegion","CountryRegion0")
	elseif Request_Form("Countries_Channels") = "MEXICO" then
		TCWebApi_set("WLan_Common","CountryRegion","CountryRegion0")
	elseif Request_Form("Countries_Channels") = "NORWAY" then
		TCWebApi_set("WLan_Common","CountryRegion","CountryRegion0")
	elseif Request_Form("Countries_Channels") = "PANAMA" then
		TCWebApi_set("WLan_Common","CountryRegion","CountryRegion0")
	elseif Request_Form("Countries_Channels") = "PUERTO RICO" then
		TCWebApi_set("WLan_Common","CountryRegion","CountryRegion0")
	elseif Request_Form("Countries_Channels") = "UNITED STATES" then
		TCWebApi_set("WLan_Common","CountryRegion","CountryRegion0")
	elseif Request_Form("Countries_Channels") = "TAIWAN" then
		TCWebApi_set("WLan_Common","CountryRegion","CountryRegion0")
	elseif Request_Form("Countries_Channels") = "UZBEKISTAN" then
		TCWebApi_set("WLan_Common","CountryRegion","CountryRegion0")
	else
		TCWebApi_set("WLan_Common","CountryRegion","CountryRegion1")
	end if
End If
if Request_Form("Save_Flag") = "1" then
	if Request_Form("isDot1XSupported")  = "1" then
		TCWebApi_set("WLan_Common","session_timeout_interval","radiusSVR_ReAuthInter")
		TCWebApi_set("WLan_Entry","RekeyInterval","WPARekeyInter")
		TCWebApi_set("WLan_Entry","RADIUS_Server","radiusSVR_IP")
		TCWebApi_set("WLan_Entry","RADIUS_Port","radiusSVR_Port")
		TCWebApi_set("WLan_Entry","RADIUS_Key","radiusSVR_Key")
		if Request_Form("isDot1XEnhanceSupported") = "1" then
			TCWebApi_set("WLan_Entry","BAK_RADIUS_Server","bakradiusSVR_IP5")
			TCWebApi_set("WLan_Entry","BAK_RADIUS_Port","bakradiusSVR_Port5")
			TCWebApi_set("WLan_Entry","BAK_RADIUS_Key","bakradiusSVR_Key5")
		end if
	end if		
	if Request_Form("wlSsidIdx") <> tcWebApi_get("WebCurSet_Entry","wlan_id", "h") then
		tcWebApi_constSet("WebCurSet_Entry", "wlan_id", "0")
	else
		if tcWebApi_get("WLan_Common","rt_device","h") = "7615" then	
			TCWebApi_set("WLan_Common","HT_TxStream","TxStream_Action")	
			TCWebApi_set("WLan_Common","HT_RxStream","RxStream_Action")	
		end if	
		TCWebApi_set("WLan_Common", "APOn", "hwlEnbl")
		TCWebApi_set("WLan_Common","WirelessMode", "hwlgMode")
		if tcWebApi_get("Info_WLan","isMT7615TxOffloadSupported","h") = "Yes" then 	
			TCWebApi_set("WLan_Common","WHNAT","WLANTxOffload")
		end if
		if tcWebApi_get("WLan_Common","rt_device","h") = "7615" then	
			TCWebApi_set("WLan_Common","ITxBfEn","WLanITxBfEn")
			TCWebApi_set("WLan_Common","ETxBfEnCond","WLanETxBfEnCond")
			TCWebApi_set("WLan_Common","ETxBfIncapable","WLanETxBfIncapable")
		end if	
		TCWebApi_set("WLan_Common","Channel", "wlChannel")
		' ONTS-62
		if Request_Form("wlChannel") <> "0" then
			tcWebApi_constSet("WLan_Common","AutoChannelSelect","0")
		elseif Request_Form("wlChannel") = "0" then
			tcWebApi_constSet("WLan_Common","AutoChannelSelect","3")
		end if
		TCWebApi_set("WLan_Entry","HT_RATE", "wlRate")
		if Request_Form("wlTxPwr") = "6" then
			tcWebApi_constSet("WLan_Common","TxPower", "100")
			tcWebApi_constSet("WLan_Common","PaMode", "1")
			tcWebApi_constSet("WLan_Common","PowerLevel", "128")
		elseif Request_Form("wlTxPwr") = "1" then
			tcWebApi_constSet("WLan_Common","TxPower","75")
			tcWebApi_constSet("WLan_Common","PowerLevel", "100")
			tcWebApi_constSet("WLan_Common","PaMode", "0")
		elseif Request_Form("wlTxPwr") = "2" then
			tcWebApi_constSet("WLan_Common","TxPower","50")
			tcWebApi_constSet("WLan_Common","PowerLevel", "80")
			tcWebApi_constSet("WLan_Common","PaMode", "0")
		elseif Request_Form("wlTxPwr") = "3" then
			tcWebApi_constSet("WLan_Common","TxPower","25")
			tcWebApi_constSet("WLan_Common","PowerLevel", "60")
			tcWebApi_constSet("WLan_Common","PaMode", "0")
		end if
		TCWebApi_set("WLan_Common","BeaconPeriod","BeaconInterval")
		TCWebApi_set("WLan_Common","RTSThreshold","RTSThreshold")
		TCWebApi_set("WLan_Common","FragThreshold","FragmentThreshold")
		TCWebApi_set("WLan_Common","DtimPeriod","DTIM")
		if Request_Form("bwControl") = "0" then
			tcWebApi_constSet("WLan_Common","HT_BW","0")
		else
			tcWebApi_constSet("WLan_Common","HT_BW","1")
		end if
		TCWebApi_set("WLan_Common","HT_GI","giControl")	
		TCWebApi_set("WLan_Entry", "HideSSID", "hwlHide")
		TCWebApi_set("WLan_Entry","SSID", "wlSsid")	
		TCWebApi_set("WLan_Entry","HT_MCS","wlMcs")
		TCWebApi_set("WLan_Entry","EnableSSID","henableSsid")
		tcWebApi_constSet("WLan_Common","HT_BSSCoexistence", "0")
		if Request_Form("hwlgMode") = "6" then
			if Request_Form("bwControl") = "1" then
				tcWebApi_constSet("WLan_Common","HT_BSSCoexistence", "1")
			end if
		end if	
		if Request_Form("hwlgMode") = "7" then
			if Request_Form("bwControl") = "1" then
				tcWebApi_constSet("WLan_Common","HT_BSSCoexistence", "1")
			end if
		end if
		if Request_Form("hwlgMode") = "9" then
			if Request_Form("bwControl") = "1" then
				tcWebApi_constSet("WLan_Common","HT_BSSCoexistence", "1")
			end if
		end if
		if tcwebApi_get("WebCustom_Entry","isMaxStaNumSupported","h" ) = "Yes" then
			TCWebApi_set("WLan_Entry","MaxStaNum", "wlAssociateNum")
		end if
		TCWebApi_set("WLan_Entry", "AuthMode","hwlAuthMode")
		TCWebApi_set("WLan_Entry","WPAPSK","wlWpaPsk")
		TCWebApi_set("WLan_Entry","WEPAuthType","wlWep")
		TCWebApi_set("WLan_Entry","AuthKeyLen","wlKeyBit")
		TCWebApi_set("WLan_Entry","EncrypType","wlWpa")
		TCWebApi_set("WLan_Entry","DefaultKeyID","wlKeyIndex")
		TCWebApi_set("WLan_Entry","Key1Str","hwlKeys0")
		TCWebApi_set("WLan_Entry","Key2Str","hwlKeys1")
		TCWebApi_set("WLan_Entry","Key3Str","hwlKeys2")
		TCWebApi_set("WLan_Entry","Key4Str","hwlKeys3")
		if Request_Form("WpsActive") = "0" then 
			TCWebApi_set("WLan_Entry","WPSConfMode","WpsConfModeNone")
		else
			if Request_Form("hWpsStart") = "1" then 
				TCWebApi_set("Info_WLan","WPSActiveStatus","hWpsStart")
				TCWebApi_set("WLan_Entry","WPSConfMode","WpsConfModeAll")
				TCWebApi_set("WLan_Entry","WPSMode","hWPSMode")
				if Request_form("hWPSMode") = "0" then
					TCWebApi_set("WLan_Entry","enrolleePinCode","pinvalue")
				end if
			else
				if tcWebApi_get("Info_WLan","wlanWPStimerRunning", "h") = "0" then
					TCWebApi_set("WLan_Entry","WPSConfMode","WpsConfModeAll")
				elseif tcWebApi_get("Info_WLan","wlanWPStimerRunning", "h") = "N/A" then
					TCWebApi_set("WLan_Entry","WPSConfMode","WpsConfModeAll")
				end if
			end if
		end if
		TCWebApi_commit("WLan_Entry")
		if tcWebApi_get("WLan_Bndstrg","BndStrgEnable", "h") = "1" then
			if Request_Form("wlSsidIdx") = "0" then
				TCWebApi_set("WLan11ac_Entry0","SSID","wlSsid")
				TCWebApi_set("WLan11ac_Entry0","WscDefaultSSID1","wlSsid")
				TCWebApi_set("WLan11ac_Entry0","AuthMode","hwlAuthMode")
				if Request_Form("hwlAuthMode") <> "OPEN" then
					TCWebApi_set("WLan11ac_Entry0","WPAPSK","wlWpaPsk")
				end if
				TCWebApi_commit("WLan11ac_Entry0")
			end if		
		end if
		tcWebApi_save()
	end if
end if
If Request_Form("WpsOOB")="1" Then
	TCWebApi_set("Info_WLan","WPSOOBActive","WpsOOB")
	tcWebApi_commit("WLan_Entry")
end if
If Request_Form("WpsGenerate") = "1" then
	TCWebApi_set("Info_WLan","WPSGenPinCode","WpsGenerate")
	TCWebApi_commit("WLan_Entry")
end if
%>
<!doctype html>
<html>
	<head>
<title>Viettel ONT - <%tcWebApi_get("String_Entry","NavigationWiFiSettingsText","s")%></title>		<meta charset="utf-8">
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
		</script><script language="javascript" type=text/javascript>
<% if tcWebApi_get("Mesh_dat","MapEnable","h") = "1" then %>
<% if tcWebApi_get("WebCurSet_Entry","wlan_id","h") = "3" then
	tcWebApi_ConstSet("WebCurSet_Entry","wlan_id","0")
end if %>
<% end if %>
var sptUserName = 1;
var curUserName = sptUserName;
var UserLevel = 1;
var ShowAdvanced = 0;
<% if tcwebApi_get("WebCustom_Entry","isMultiSupported","h") = "Yes" then %>
	<% if tcWebApi_get("Info_WLan","wlanWPStimerRunning_0","h") <> "N/A" then %>
		var oldwpsTimerRunningData = "<% tcWebApi_get("Info_WLan","wlanWPStimerRunning_0","s") %>";
	<% else %>
		var oldwpsTimerRunningData = "";
	<% end if %>
	<% if tcWebApi_get("Info_WLan","wlanWPSStatus_0","h") <> "N/A" then %>
		var oldwlanWPSStatus = "<% tcWebApi_get("Info_WLan", "wlanWPSStatus_0", "s") %>";		
	<% else %>
		var oldwlanWPSStatus = "";
	<% end if %>
<% end if %>
function doRegionCheck(){
	var vCountryName = document.ConfigForm.Countries_Channels.value;
	var ctlCountryRegion = document.ConfigForm.hCountryRegion;
	var ctlCountryRegion0 = document.ConfigForm.CountryRegion0;
	var ctlCountryRegion1 = document.ConfigForm.CountryRegion1;
	var ctlCountryRegion2 = document.ConfigForm.CountryRegion2;
	var ctlCountryRegion3 = document.ConfigForm.CountryRegion3;
	var ctlCountryRegion4 = document.ConfigForm.CountryRegion4;
	var ctlCountryRegion5 = document.ConfigForm.CountryRegion5;
	if(vCountryName == "CANADA" || vCountryName == "COLOMBIA" || vCountryName == "DOMINICAN REPUBLIC" || vCountryName == "GUATEMALA" || vCountryName == "MEXICO" ||
	   vCountryName == "NORWAY" || vCountryName == "PANAMA" || vCountryName == "PUERTO RICO" || vCountryName == "UNITED STATES" || vCountryName == "TAIWAN" || vCountryName == "UZBEKISTAN")
		ctlCountryRegion.value = ctlCountryRegion0.value;	
	else	
		ctlCountryRegion.value = ctlCountryRegion1.value;
	loadChannelList();
	document.ConfigForm.CountryChange.value = 1;
	}
function doStartWPS(){
	var pinLen = 8;
	var Form = new webSubmitForm();
	if (addParameter(Form) == false)
	{
		return;
	}	
	if(getSelectVal("wpsmode") == 'ap-pin')
	{
		var pinval = getElement('pinvalue');
		if(isSafeStringIn(pinval.value,'0123456789') == false)
		{
			alert('<%tcWebApi_get("String_Entry","PINIntegerText","s")%> ');
			setCheck('wlEnbl',1);
			wlClickEnble(getElById('wlEnbl'));
			return false;
		}
		var pinValue = pinval.value;
		if(pinValue.length != pinLen)
		{
			alert('<%tcWebApi_get("String_Entry","EightDigitPINText","s")%>');
			setCheck('wlEnbl',1);
			wlClickEnble(getElById('wlEnbl'));
			return false;
		}
		if(isvalidpin(pinValue) == false)
		{
			alert('<%tcWebApi_get("String_Entry","RightPINText","s")%>');
			setCheck('wlEnbl',1);
			wlClickEnble(getElById('wlEnbl'));
			return false;
		}
	}
	var temp = getSelectVal("wpsmode");
	if(temp == 'ap-pin')
	{
		setText('hWPSMode', 0);
	}
	else
	{
		setText('hWPSMode', 1);
	}	
	setText('hWpsStart',1);
	if(getValue('isInWPSing')==0){
		alert("<%tcWebApi_get("String_Entry","EnableIn2MinutesText","s")%>");
	}
<% if tcwebApi_get("WebCustom_Entry", "isMultiSupported", "h") = "Yes" then %>	
	top.getWlanWpsTimerCount = top.maxWlanWpsTimerCount;
<% end if %>
	doSubmit();	
	//document.ConfigForm.submit();
}
function doGenerate(){
	document.ConfigForm.WpsGenerate.value = "1";
	submitAsync("ConfigForm");
}
function stWlan(domain,enable,ssid,mode,channel,rate,power,wlHide,BeaconType,Encryption,AuthMode,KeyIndex,EncryptionLevel,WPAModes,IEEE11iEModes,BWControl,GIControl,MCSValue,TxRxStream,WPAWPA2Modes,WPSMode,PINValue)
{
	this.domain = domain;
	this.enable = enable;
	if(ssid == 'N/A')
		this.ssid = '';
	else
		this.ssid = ssid;
	var WirelessMode = 'b,g';
	if (mode == '0')
		WirelessMode = 'b,g';
	else if (mode == '1')
		WirelessMode = 'b';
	else if (mode == '4')
		WirelessMode = 'g';
	else if (mode == '6')
		WirelessMode = 'n';
	else if (mode == '7')
		WirelessMode = 'g,n';
	else if (mode == '9')
		WirelessMode = 'b,g,n';		
	else
		WirelessMode = 'b,g';			
	this.mode = WirelessMode;
	//this.channel = channel;
	if(channel == 'N/A')
		this.channel = 'Auto';
	else
		this.channel = channel;
	//this.rate = rate;
	if(rate == 'N/A')
		this.rate = 'Auto';
	else
		this.rate = rate;
	if(power == 'N/A')
		this.power = '1';
	else
		this.power = power;
	if (wlHide == '1')
		this.wlHide = '1';
	else
		this.wlHide = '0';
	var SecurMode = 'None';
	if (BeaconType == 'WEP-64Bits')
		SecurMode = 'Basic';
	else if (BeaconType == 'WEP-128Bits')
		SecurMode = 'Basic';
	else if (BeaconType == 'WPAPSK')
		SecurMode = 'WPA';
	else if (BeaconType == 'WPA2PSK')
		SecurMode = '11i';
	else if (BeaconType == 'WPAPSKWPA2PSK')
		SecurMode = 'WPAand11i';
	else if (BeaconType == 'Radius-WEP64')
		SecurMode = 'radius64';
	else if (BeaconType == 'Radius-WEP128')
		SecurMode = 'radius128';
	else if (BeaconType == 'WPA')
		SecurMode = 'wpaOnly';
	else if (BeaconType == 'WPA2')
		SecurMode = 'wpa2Only';
	else if (BeaconType == 'WPA1WPA2')
		SecurMode = 'wpa1and2';
	else//'OPEN'
		SecurMode = 'None';
	this.BeaconType = SecurMode;
	this.Encryption = Encryption;
	if(AuthMode == 'N/A')
		this.AuthMode = 'Both';
	else
		this.AuthMode = AuthMode;
	if(KeyIndex == 'N/A')
		this.KeyIndex = '1';
	else
		this.KeyIndex = KeyIndex;
	if(parseInt(EncryptionLevel.substr(4)) == '64')
		this.EncypBit = '64';
	else if(parseInt(EncryptionLevel.substr(4)) == '128')
		this.EncypBit = '128';
	else
		this.EncypBit = '64';
	if((WPAModes == 'N/A') || (WPAModes == 'NONE') || (WPAModes == 'WEP'))
		this.WPAModes = 'TKIP';
	else
		this.WPAModes = WPAModes;
	if((IEEE11iEModes == 'N/A') || (IEEE11iEModes == 'NONE') || (IEEE11iEModes == 'WEP'))
		this.IEEE11iEModes = 'TKIP';
	else
		this.IEEE11iEModes = IEEE11iEModes;
	this.BWControl = BWControl;
	this.GIControl = GIControl;
	if(MCSValue == 'N/A')
		this.MCSValue = '33';//Auto
	else
		this.MCSValue = MCSValue;
	this.TxRxStream = TxRxStream;	
	if((WPAWPA2Modes == 'N/A') || (WPAWPA2Modes == 'NONE') || (WPAWPA2Modes == 'WEP'))
		this.WPAWPA2Modes = 'TKIP';
	else
		this.WPAWPA2Modes = WPAWPA2Modes;	
	if(WPSMode == '1' || WPSMode == 'N/A')
		this.WPSMode = 'ap-pbc';
	else	
		this.WPSMode = 'ap-pin';
	this.PINValue = PINValue;
}
var srt_device = "<% tcWebApi_get("WLan_Common", "rt_device","s") %>";
var str_trstream = "1";
if(srt_device != "N/A")
{
	if(srt_device.substr(3) == "2")
		str_trstream = "2";
}
var Wlan = new Array(new stWlan("domain","<% tcWebApi_get("WLan_Entry", "EnableSSID","s") %>","<% tcWebApi_get("WLan_Entry","SSID","s") %>","<% tcWebApi_get("WLan_Common","WirelessMode","s") %>","<% tcWebApi_get("WLan_Common","Channel","s") %>","<% tcWebApi_get("WLan_Entry","HT_RATE","s") %>","<% tcWebApi_get("WLan_Common","TxPowerLevel","s") %>","<% tcWebApi_get("WLan_Entry","HideSSID","s") %>","<% tcWebApi_get("WLan_Entry","AuthMode","s") %>","WEPEncryption","<% tcWebApi_get("WLan_Entry","WEPAuthType","s") %>","<% tcWebApi_get("WLan_Entry","DefaultKeyID","s") %>","<% tcWebApi_get("WLan_Entry","AuthMode","s") %>","<% tcWebApi_get("WLan_Entry","EncrypType","s") %>","<% tcWebApi_get("WLan_Entry","EncrypType","s") %>","<% tcWebApi_get("WLan_Common","HT_BW","s") %>","<% tcWebApi_get("WLan_Common","HT_GI","s") %>","<% tcWebApi_get("WLan_Entry","HT_MCS","s") %>", str_trstream,"<% tcWebApi_get("WLan_Entry","EncrypType","s") %>","<% tcWebApi_get("WLan_Entry","WPSMode","s") %>","<% tcWebApi_get("WLan_Entry","enrolleePinCode","s") %>"),null);
var enbl = <% tcWebApi_get("WLan_Common","APOn","s") %>;
var ssidIdx = 0;
var state = enbl;
var wlHide = Wlan[0].wlHide;
var band = 2;
var phy = 'g';
var wepEnable = getWepSwitch();
var wlCorerev = 8;
var ssidAccessAttr = 'Subscriber';
var beaconTypeAccessAttr = 'Subscriber';
var EnableAccessAttr = 'Subscriber';
var wpsV2Support = '<% tcWebApi_get("WLan_Entry0","WscV2Support", "s") %>';
function getWepSwitch()
{
	if (Wlan[ssidIdx].Encryption == 'WEPEncryption')
	{
		return 1;
	}
	else if (Wlan[ssidIdx].Encryption == 'None')
	{
		return 0;
	}
}
function hideOption(selObject, index)
{
	var oldOption = selObject.children(index);
	var oldStr = oldOption.innerText;
	var newOption = document.createElement('<div' + oldOption.outerHTML.match(/(<\w*)([^>]*)(>)/)[2] +'>');
	newOption.innerText  = oldStr;
	newOption.swapNode(oldOption);
}
function hideWlSecInfo(hidden)
{
	var status = 'visible';
	with ( document.ConfigForm )
	{
		var i = 0;
		if ( hidden == 1 )
		{
			status = 'hidden';
			wlHide.disabled = 1;
			wlSsid.disabled = 1;
		}
		else
		{
			wlHide.disabled = 0;
			wlSsid.disabled = 0;
		}
	}
}
function wlSecCbClick(cb)
{
	if ( cb.checked == true )
	{
		hideWlSecInfo(0);
	}
	else
	{
		hideWlSecInfo(1);
	}
}
function getPreauth(wlPreauth) {
	var ret;
	if ( wlPreauth == "on" )
		ret = 1;
	else
		ret = 0;
	return ret;
}
function isValidWPAPskKey(val) {
	var ret = false;
	var len = val.length;
	var maxSize = 64;
	var minSize = 8;
	if ( len >= minSize && len < maxSize )
	{
		if(val.match(/[^\x00-\xff]/g))
   	    {
			ret = false;
		 } else {
   	        for ( i = 0; i < len; i++)
				if (val.charAt(i) == ','){
				break;
				}
			if ( i == len)
				ret = true;
   	    }
	} else if ( len == maxSize ) {
		for ( i = 0; i < maxSize; i++ )
		if ( isHexaDigit(val.charAt(i)) == false )
		break;
		if ( i == maxSize )
		ret = true;
	} else
		ret = false;
	return ret;
}
function hideAllElements()
{
	setDisplay("wlWpaD", 0);
	setDisplay("wpaPreShareKey", 0);
	setDisplay("wpaGTKRekey", 0);
	setDisplay("wlRadius", 0);
	setDisplay("Preauth", 0);
	setDisplay("NetReauth", 0);
	setDisplay("wlWepD", 0);
	setDisplay("keyInfo", 0);
	setDisplay("wlWPARekeyInter", 0);
}
function encrypChange()
{
	with ( document.ConfigForm )
	{
		var securmode = getSelectVal('wlSecurMode')
		switch(securmode)
		{
			case 'None':
			{
				/* getElement("wlUserTip").innerHTML = "<font color=red><%tcWebApi_get("String_Entry","PromotText","s")%></font>"
				+ "<br>"
				+ "&nbsp;&nbsp;&nbsp;&nbsp;<%tcWebApi_get("String_Entry","ModeIsNoneText","s")%>"
				+ "<br>"
				+ "&nbsp;&nbsp;&nbsp;&nbsp;<%tcWebApi_get("String_Entry","RandomAccessText","s")%>"
				+ "<br>"
				+ "&nbsp;&nbsp;&nbsp;&nbsp;<%tcWebApi_get("String_Entry","NotUseText","s")%>"; */
				break;
			}
			case 'Basic':
			case 'radius64': 
			case 'radius128': 
			{
				wlKeys[0].disabled = 0;
				wlKeys[1].disabled = 0;
				wlKeys[2].disabled = 0;
				wlKeys[3].disabled = 0;
				wlKeyIndex.length = 0;
				wlKeyIndex[0] = new Option("1", "1");
				wlKeyIndex[1] = new Option("2", "2");
				wlKeyIndex[2] = new Option("3", "3");
				wlKeyIndex[3] = new Option("4", "4");
				setSelect('wlKeyIndex',Wlan[ssidIdx].KeyIndex) ;
                                if(securmode == 'Basic')
                                {
				setDisplay("keyInfo", 1);
				/* getElement("wlUserTip").innerHTML = "<font color=red><%tcWebApi_get("String_Entry","PromotText","s")%></font>"
				+ "<br>"
				+ "&nbsp;&nbsp;&nbsp;&nbsp;<%tcWebApi_get("String_Entry","ModeWEPText","s")%>"
				+ "<br>"
				+ "&nbsp;&nbsp;&nbsp;&nbsp;<%tcWebApi_get("String_Entry","KeySetByUserText","s")%>"; */
				}
				else if(securmode == 'radius64')
				{
				setDisplay("keyInfo", 1);
				/*	getElement("wlUserTip").innerHTML = "<font color=red>Prompt:</font>"
				+ "<br>"
					+ "&nbsp;&nbsp;&nbsp;&nbsp;<%tcWebApi_get("String_Entry","ModeRadius64Text","s")%>"
					+ "<br>"
					+ "&nbsp;&nbsp;&nbsp;&nbsp;<%tcWebApi_get("String_Entry","KeySet64BitByUserText","s")%>"; */
				}
				else if(securmode == 'radius128')
				{
				setDisplay("keyInfo", 1);
				/* 	getElement("wlUserTip").innerHTML = "<font color=red>Prompt:</font>"
				+ "<br>"
					+ "&nbsp;&nbsp;&nbsp;&nbsp;<%tcWebApi_get("String_Entry","ModeRadius128Text","s")%>"
				+ "<br>"
					+ "&nbsp;&nbsp;&nbsp;&nbsp;<%tcWebApi_get("String_Entry","KeySet128BitByUserText","s")%>"; */
				}
				break;
			}
			case 'WPA':
			{
				/* getElement("wlUserTip").innerHTML = "<font color=red><%tcWebApi_get("String_Entry","PromotText","s")%></font>"
				+ "<br>"
				+ "&nbsp;&nbsp;&nbsp;&nbsp;<%tcWebApi_get("String_Entry","ModeIsWPAText","s")%>"
				+ "<br>"
				+ "&nbsp;&nbsp;&nbsp;&nbsp;<%tcWebApi_get("String_Entry","KeySetByUser2Text","s")%>"; */
				break;
			}
			case '11i':
			{
				/* getElement("wlUserTip").innerHTML = "<font color=red><%tcWebApi_get("String_Entry","PromotText","s")%></font>"
				+ "<br>"
				+ "&nbsp;&nbsp;&nbsp;&nbsp;<%tcWebApi_get("String_Entry","ModeIsWPA2Text","s")%>"
				+ "<br>"
				+ "&nbsp;&nbsp;&nbsp;&nbsp;<%tcWebApi_get("String_Entry","KeySetByUser3Text","s")%>"; */
				break;
			}
			case 'WPAand11i':
			{
				/* getElement("wlUserTip").innerHTML = "<font color=red><%tcWebApi_get("String_Entry","PromotText","s")%></font>"
				+ "<br>"
				+ "&nbsp;&nbsp;&nbsp;&nbsp;<%tcWebApi_get("String_Entry","ModeIsWPA2ConfigureText","s")%>"
				+ "<br>"
				+ "&nbsp;&nbsp;&nbsp;&nbsp;<%tcWebApi_get("String_Entry","KeySetByUser3Text","s")%>"; */
				break;
			}
			case 'wpaOnly':
			{
				/* getElement("wlUserTip").innerHTML = "<font color=red>Prompt:</font>"
				+ "<br>"
				+ "&nbsp;&nbsp;&nbsp;&nbsp;<%tcWebApi_get("String_Entry","ModeWPAText","s")%>"; */
				break;
			}
			case 'wpa2Only': 
			{
				/* getElement("wlUserTip").innerHTML = "<font color=red>Prompt:</font>"
				+ "<br>"
				+ "&nbsp;&nbsp;&nbsp;&nbsp;<%tcWebApi_get("String_Entry","ModeWPA2Text","s")%>"; */
				break;
			}
			case 'wpa1and2':
			{
				/* getElement("wlUserTip").innerHTML = "<font color=red>Prompt:</font>"
				+ "<br>"
				+ "&nbsp;&nbsp;&nbsp;&nbsp;<%tcWebApi_get("String_Entry","ModeWPA1WPA2Text","s")%>"; */
				break;
			}
			default:
				break;
		}
	}
}
function wlKeyBitChange()
{
	with(document.ConfigForm)
	{
		var wlKeyBitLen = getSelectVal('wlKeyBit');
		if(wlKeyBitLen == 64)
		{
			getElement("wlKeyBitTip").innerHTML = "<%tcWebApi_get("String_Entry","Enter1Text","s")%>";
		}
		else
		{
			getElement("wlKeyBitTip").innerHTML = "<%tcWebApi_get("String_Entry","Enter2Text","s")%>";
		}
	}
}
function authModeChange(OnPageLoad)
{
	with ( document.ConfigForm )
	{
		var SecurMode = getSelectVal('wlSecurMode');
		var mode = getValue('wlgMode');
		var i, algos;
	if(SecurMode == "None" || SecurMode == "Basic"){
		}
	else if(document.getElementById("wds_div") != null){
		document.getElementById("wds_div").style.display="";
		}
		hideAllElements();
		switch ( SecurMode )
		{
		case 'None':
			setDisplay("wlWepD", 0);
			setDisplay("keyInfo", 0);
			setDisplay("wpsinfo", 1);
			wpsModeChange();
			break;
		case 'Basic':
		case 'shared':
			setDisplay("wlWepD", 1);
			setDisplay("keyInfo", 1);
			setDisplay("wpsinfo", 1);
			break;
		case 'radius':
			setDisplay("wlRadius", 1);
			setDisplay("wlWepD", 1);
			break;
		case 'radius64':
		case 'radius128':
			setDisplay("wlRadius", 1);
			setDisplay("keyInfo", 1); 
			break;
		case 'wpaOnly':
		case 'wpa2Only':
		case 'wpa1and2':
			setDisplay("wlWpaD", 1);
			setDisplay("wlRadius", 1);
			setDisplay("wlWPARekeyInter", 1);
			break;
		case 'wpa2':
		case 'wpa2mix':
			setDisplay("Preauth", 1);
			setDisplay("NetReauth", 1);
		case 'wpa':
			setDisplay("wlWpaD", 1);
			setDisplay("wlRadius", 1);
			break;
		case '11i':
		case 'psk2mix':
		case 'WPA':
		case 'WPAand11i':
			setDisplay("wlWpaD", 1);
			setDisplay("wpaPreShareKey", 1);
			setDisplay("wpsinfo", 1);
			if (ShowAdvanced == 1) {
				setDisplay("wlWPARekeyInter", 1);
			}
			wpsModeChange();
			break;
		}
		if(OnPageLoad==1)
		{
			if ("n" == mode)
				algos = new Array(new Array('AES','AES'));
			else
				algos = new Array(new Array('TKIP','TKIP'), new Array('AES','AES'),new Array('TKIP+AES','TKIPAES'));
			wlWpa.length = 0;
			if (wlWpa.parentNode.getElementsByClassName("select-items")[0]) {
				wlWpa.parentNode.getElementsByClassName("select-items")[0].innerHTML = "";
			}
			for (var i in algos)
			{
				cs_addoption(wlWpa,algos[i][1],algos[i][0]);
				//wlWpa[i] = new Option(algos[i][0], algos[i][1]);
				//wlWpa[i].value = algos[i][1];
				if (Wlan[ssidIdx].BeaconType == 'WPA'
				&& wlWpa[i][1] == Wlan[ssidIdx].WPAModes)
				{
					cs_chooseoption(wlWpa, i);
					//wlWpa[i].selected = true;
				}
				else if (Wlan[ssidIdx].BeaconType == '11i'
				&& wlWpa[i][1] ==  Wlan[ssidIdx].IEEE11iEModes)
				{
					cs_chooseoption(wlWpa, i);
					//wlWpa[i].selected = true;
				}
				else if (Wlan[ssidIdx].BeaconType == 'WPAand11i'
				&& wlWpa[i][1] ==  Wlan[ssidIdx].WPAWPA2Modes)
				{
					cs_chooseoption(wlWpa, i);
					//wlWpa[i].selected = true;
				}
			}
		}
		if (SecurMode == 'WPA' || SecurMode =='wpaOnly' || SecurMode =='wpa2Only' ||SecurMode =='wpa1and2' )
		{
			if ("n" == mode)
				setSelect('wlWpa',"AES");
			else
				setSelect('wlWpa',Wlan[ssidIdx].WPAModes);
		}
		else if (SecurMode == '11i')
		{
			if ("n" == mode)
				setSelect('wlWpa',"AES");
			else
				setSelect('wlWpa',Wlan[ssidIdx].IEEE11iEModes);
		}
		else if (SecurMode == 'WPAand11i')
		{
			if ("n" == mode)
				setSelect('wlWpa',"AES");
			else
				setSelect('wlWpa',Wlan[ssidIdx].WPAWPA2Modes);
		}
		else if (SecurMode == 'Basic')
		{
			document.ConfigForm.wlKeyBit.disabled=false;
			wlWep.length = 0;
			wlWep[0] = new Option("open", "OpenSystem");
			wlWep[1] = new Option("share", "SharedKey");
			wlWep[2] = new Option("open+share", "Both");
			if(OnPageLoad==1)
			{
				setSelect('wlWep',Wlan[ssidIdx].AuthMode);
			}
			else
			{
				setSelect('wlWep', "Both");
			}
		}
		else if (SecurMode == 'radius64')
		{
			document.ConfigForm.wlKeyBit.disabled=true;
			document.ConfigForm.wlKeyBit.options[1].selected=true;
			wlKeyBitChange(); 
		}
		else if (SecurMode == 'radius128')
		{
			document.ConfigForm.wlKeyBit.disabled=true;
			document.ConfigForm.wlKeyBit.options[0].selected=true;
			wlKeyBitChange(); 
		}
	}
	encrypChange();
}
function doBroadcastSSIDChange()
{
	with ( document.ConfigForm )
	{	
		if(wpsV2Support == 1)
		{
			if(wlSsidIdx[0].selected == true && enableWps.checked == true && wlHide.checked == true)
			{
					var rv = confirm("<%tcWebApi_get("String_Entry","BroadcastCancellText","s")%>");
					if (rv == false)
					{
						wlHide.checked = false;
					}
					else
					{
						wlHide.checked = true;
						enableWps.checked = false;
						WpsActive.value = "0";					
					}
			} 
		} 
  }	
	return 1;
}
function wpapsk_window()
{
	var psk_window = window.open("", "", "toolbar=no,width=500,height=100");
	psk_window.document.write("The WPA Pre-Shared Key is " + wpaPskKey);
	psk_window.document.close();
}
function getGmodeIndex(mode) {
	var ret = 0;
	switch(mode) {
		case '0':
			ret = 3;
			break;
		case '4':
			ret = 1;
			break;
		case '5':
			ret = 2;
			break;
		default:
			ret = 0;
			break;
	}
	return ret;
}
<% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then %>
var isMeshBssCfg = 0;
function easymesh_onload(type)
{
	var wl_authMode="", wl_encrypType = "";
	var mapDevRole = "<% tcWebApi_get("Mesh_common","DeviceRole","s") %>";
	var al_mac = "<% tcWebApi_get("Mesh_mapcfg","AL-MAC","s") %>";
	var bss_al_mac = "";
	var bss_fh_support = 0, bss_bh_support = 0;
	var node_idx = document.ConfigForm.wlSsidIdx.value;
	node_idx = parseInt(node_idx) + 1;
	isMeshBssCfg = 0;
	if(mapDevRole != 1 && mapDevRole != 2)
	{
		console.log("EasyMesh Device Role is neither Controller nor Agent!");
		return;
	}
	bss_al_mac = "<% tcWebApi_get("Mesh_radio2gbssinfo","AL-MAC","s") %>";
	switch(parseInt(node_idx))
	{
		case 1:
			bss_fh_support = "<% tcWebApi_get("Mesh_radio2gbssinfo_entry0","FrontHaul","s") %>";
			bss_bh_support = "<% tcWebApi_get("Mesh_radio2gbssinfo_entry0","BackHaul","s") %>";
			wl_authMode = "<% tcWebApi_get("WLan_Entry.1","AuthMode","s") %>";
			wl_encrypType = "<% tcWebApi_get("WLan_Entry.1","EncrypType","s") %>";
			break;
		case 2:
			bss_fh_support = "<% tcWebApi_get("Mesh_radio2gbssinfo_entry1","FrontHaul","s") %>";
			bss_bh_support = "<% tcWebApi_get("Mesh_radio2gbssinfo_entry1","BackHaul","s") %>";
			wl_authMode = "<% tcWebApi_get("WLan_Entry.2","AuthMode","s") %>";
			wl_encrypType = "<% tcWebApi_get("WLan_Entry.2","EncrypType","s") %>";
			break;
		case 3:
			bss_fh_support = "<% tcWebApi_get("Mesh_radio2gbssinfo_entry2","FrontHaul","s") %>";
			bss_bh_support = "<% tcWebApi_get("Mesh_radio2gbssinfo_entry2","BackHaul","s") %>";
			wl_authMode = "<% tcWebApi_get("WLan_Entry.3","AuthMode","s") %>";
			wl_encrypType = "<% tcWebApi_get("WLan_Entry.3","EncrypType","s") %>";
			break;
		case 4:
			bss_fh_support = "<% tcWebApi_get("Mesh_radio2gbssinfo_entry3","FrontHaul","s") %>";
			bss_bh_support = "<% tcWebApi_get("Mesh_radio2gbssinfo_entry3","BackHaul","s") %>";
			wl_authMode = "<% tcWebApi_get("WLan_Entry.4","AuthMode","s") %>";
			wl_encrypType = "<% tcWebApi_get("WLan_Entry.4","EncrypType","s") %>";
			break;
		case 5:
			bss_fh_support = "<% tcWebApi_get("Mesh_radio2gbssinfo_entry4","FrontHaul","s") %>";
			bss_bh_support = "<% tcWebApi_get("Mesh_radio2gbssinfo_entry4","BackHaul","s") %>";
			wl_authMode = "<% tcWebApi_get("WLan_Entry.5","AuthMode","s") %>";
			wl_encrypType = "<% tcWebApi_get("WLan_Entry.5","EncrypType","s") %>";
			break;
		case 6:
			bss_fh_support = "<% tcWebApi_get("Mesh_radio2gbssinfo_entry5","FrontHaul","s") %>";
			bss_bh_support = "<% tcWebApi_get("Mesh_radio2gbssinfo_entry5","BackHaul","s") %>";
			wl_authMode = "<% tcWebApi_get("WLan_Entry.6","AuthMode","s") %>";
			wl_encrypType = "<% tcWebApi_get("WLan_Entry.6","EncrypType","s") %>";
			break;
		case 7:
			bss_fh_support = "<% tcWebApi_get("Mesh_radio2gbssinfo_entry6","FrontHaul","s") %>";
			bss_bh_support = "<% tcWebApi_get("Mesh_radio2gbssinfo_entry6","BackHaul","s") %>";
			wl_authMode = "<% tcWebApi_get("WLan_Entry.7","AuthMode","s") %>";
			wl_encrypType = "<% tcWebApi_get("WLan_Entry.7","EncrypType","s") %>";
			break;
		case 8:
			bss_fh_support = "<% tcWebApi_get("Mesh_radio2gbssinfo_entry7","FrontHaul","s") %>";
			bss_bh_support = "<% tcWebApi_get("Mesh_radio2gbssinfo_entry7","BackHaul","s") %>";
			wl_authMode = "<% tcWebApi_get("WLan_Entry.8","AuthMode","s") %>";
			wl_encrypType = "<% tcWebApi_get("WLan_Entry.8","EncrypType","s") %>";
			break;
		case 9:
			bss_fh_support = "<% tcWebApi_get("Mesh_radio2gbssinfo_entry8","FrontHaul","s") %>";
			bss_bh_support = "<% tcWebApi_get("Mesh_radio2gbssinfo_entry8","BackHaul","s") %>";
			wl_authMode = "<% tcWebApi_get("WLan_Entry.9","AuthMode","s") %>";
			wl_encrypType = "<% tcWebApi_get("WLan_Entry.9","EncrypType","s") %>";
			break;
		case 10:
			bss_fh_support = "<% tcWebApi_get("Mesh_radio2gbssinfo_entry9","FrontHaul","s") %>";
			bss_bh_support = "<% tcWebApi_get("Mesh_radio2gbssinfo_entry9","BackHaul","s") %>";
			wl_authMode = "<% tcWebApi_get("WLan_Entry.10","AuthMode","s") %>";
			wl_encrypType = "<% tcWebApi_get("WLan_Entry.10","EncrypType","s") %>";
			break;
		case 11:
			bss_fh_support = "<% tcWebApi_get("Mesh_radio2gbssinfo_entry10","FrontHaul","s") %>";
			bss_bh_support = "<% tcWebApi_get("Mesh_radio2gbssinfo_entry10","BackHaul","s") %>";
			wl_authMode = "<% tcWebApi_get("WLan_Entry.11","AuthMode","s") %>";
			wl_encrypType = "<% tcWebApi_get("WLan_Entry.11","EncrypType","s") %>";
			break;
		case 12:
			bss_fh_support = "<% tcWebApi_get("Mesh_radio2gbssinfo_entry11","FrontHaul","s") %>";
			bss_bh_support = "<% tcWebApi_get("Mesh_radio2gbssinfo_entry11","BackHaul","s") %>";
			wl_authMode = "<% tcWebApi_get("WLan_Entry.12","AuthMode","s") %>";
			wl_encrypType = "<% tcWebApi_get("WLan_Entry.12","EncrypType","s") %>";
			break;
		case 13:
			bss_fh_support = "<% tcWebApi_get("Mesh_radio2gbssinfo_entry12","FrontHaul","s") %>";
			bss_bh_support = "<% tcWebApi_get("Mesh_radio2gbssinfo_entry12","BackHaul","s") %>";
			wl_authMode = "<% tcWebApi_get("WLan_Entry.13","AuthMode","s") %>";
			wl_encrypType = "<% tcWebApi_get("WLan_Entry.13","EncrypType","s") %>";
			break;
		case 14:
			bss_fh_support = "<% tcWebApi_get("Mesh_radio2gbssinfo_entry13","FrontHaul","s") %>";
			bss_bh_support = "<% tcWebApi_get("Mesh_radio2gbssinfo_entry13","BackHaul","s") %>";
			wl_authMode = "<% tcWebApi_get("WLan_Entry.14","AuthMode","s") %>";
			wl_encrypType = "<% tcWebApi_get("WLan_Entry.14","EncrypType","s") %>";
			break;
		case 15:
			bss_fh_support = "<% tcWebApi_get("Mesh_radio2gbssinfo_entry14","FrontHaul","s") %>";
			bss_bh_support = "<% tcWebApi_get("Mesh_radio2gbssinfo_entry14","BackHaul","s") %>";
			wl_authMode = "<% tcWebApi_get("WLan_Entry.15","AuthMode","s") %>";
			wl_encrypType = "<% tcWebApi_get("WLan_Entry.15","EncrypType","s") %>";
			break;
		case 16:
			bss_fh_support = "<% tcWebApi_get("Mesh_radio2gbssinfo_entry15","FrontHaul","s") %>";
			bss_bh_support = "<% tcWebApi_get("Mesh_radio2gbssinfo_entry15","BackHaul","s") %>";
			wl_authMode = "<% tcWebApi_get("WLan_Entry.16","AuthMode","s") %>";
			wl_encrypType = "<% tcWebApi_get("WLan_Entry.16","EncrypType","s") %>";
			break;
		default:
			bss_al_mac = "";
			bss_fh_support = 0;
			bss_bh_support = 0;
			wl_authMode = "";
			wl_encrypType = "";
			break;
	}
	al_mac = al_mac.toUpperCase();
	bss_al_mac = bss_al_mac.toUpperCase();
	if( (al_mac == null) || (al_mac == "N/A") || (al_mac == "") || (al_mac == "00:00:00:00:00:00") 
		|| (bss_al_mac == null) || (bss_al_mac == "N/A") || (bss_al_mac == "") || (bss_al_mac == "00:00:00:00:00:00") )
	{
		return;
	}
	if( ((bss_al_mac == al_mac) || (bss_al_mac == "FF:FF:FF:FF:FF:FF"))
			&& ((1 == bss_fh_support) || (1 == bss_bh_support)) )
	{
		var wlSecurMode = document.ConfigForm.wlSecurMode;
		for (var idx=0; idx < wlSecurMode.length; idx++) 
		{
			var tmpSecurMode = wlSecurMode.options[idx].value;
			tmpSecurMode = tmpSecurMode.toUpperCase();
			if((tmpSecurMode == "NONE") || (tmpSecurMode == "11I"))
			{
				//wlSecurMode.options[idx].disabled = false;
				cs_enable_option("wlSecurMode", idx);
			}
			else
			{
				//wlSecurMode.options[idx].disabled = true;
				cs_disable_option("wlSecurMode", idx);
			}
		}
		var wlWpa = document.ConfigForm.wlWpa;
		for (var idx=0; idx < wlWpa.length; idx++) 
		{
			var tmpWpa = wlWpa.options[idx].value;
			tmpWpa = tmpWpa.toUpperCase();
			if((tmpWpa == "NONE") || (tmpWpa == "AES"))
			{
				cs_enable_option("wlWpa", idx);
				//wlWpa.options[idx].disabled = false;
			}
			else
			{
				cs_disable_option("wlWpa", idx);
				//wlWpa.options[idx].disabled = true;
			}
		}
		if((wl_authMode.toUpperCase() != "OPEN") && (wl_authMode.toUpperCase() != "WPA2PSK") && type == 1)
		{
			alert("<%tcWebApi_get("String_Entry","HintOpenEasyMeshText2","s")%>");
		}
		if(wl_authMode.toUpperCase() != "OPEN" && type == 1)
		{
			if((wl_encrypType.toUpperCase() != "NONE") && (wl_encrypType.toUpperCase() != "AES"))
			{
				alert("<%tcWebApi_get("String_Entry","HintOpenEasyMeshText3","s")%>");
			}
		}
		isMeshBssCfg = 1;
	}
	return;	
}
<% end if %>
function gModeChange()
{
	with ( document.ConfigForm )
	{
		var mode = getValue('wlgMode');
		if ((mode == 'b,g,n') || (mode == 'n') || (mode == 'g,n'))
		{
			setDisplay('wlTransferRate',0);
			if (curUserName == sptUserName)
			{
				setDisplay('11NmcsControl',1);
				setDisplay('11NbwControl',1);
				//setDisplay('11NgiControl',1);
			}
			loadMCSList();
<% if tcWebApi_get("WLan_Common","rt_device","h") = "7615" Then %>
<% if tcWebApi_get("Info_WLan","isMT7615DSupported","h") <> "Yes" then %>		
		document.ConfigForm.WLanTxBeamForming[3].selected = true;
<% end if %>
<% end if %>
		}
		else
		{
			setDisplay('wlTransferRate',1);
			if (curUserName == sptUserName)
			{
				setDisplay('11NmcsControl',0);
				setDisplay('11NbwControl',0);
				setDisplay('11NgiControl',0);
			}
			loadRateList();
		}
		loadAuthModeList();
<% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then %>
		easymesh_onload(0);
<% end if %>
	}
}
function loadChannelList()
{
	var CountryRegion = document.ConfigForm.hCountryRegion.value;
	if (band == "2")
	{
		document.ConfigForm.wlChannel.length = 0;
		if (document.ConfigForm.wlChannel.parentNode.children.length > 2) {
			document.ConfigForm.wlChannel.parentNode.children[2].innerHTML  = "";
		}
		cs_addoption(document.ConfigForm.wlChannel,"0", "Auto" )
		//document.ConfigForm.wlChannel[0] = new Option("Auto", "0");
		if(CountryRegion == "0"){
			cs_addoption(document.ConfigForm.wlChannel,"1", "1" )
			cs_addoption(document.ConfigForm.wlChannel,"2", "2" )
			cs_addoption(document.ConfigForm.wlChannel,"3", "3" )
			cs_addoption(document.ConfigForm.wlChannel,"4", "4" )
			cs_addoption(document.ConfigForm.wlChannel,"5", "5" )
			cs_addoption(document.ConfigForm.wlChannel,"6", "6" )
			cs_addoption(document.ConfigForm.wlChannel,"7", "7" )
			cs_addoption(document.ConfigForm.wlChannel,"8", "8" )
			cs_addoption(document.ConfigForm.wlChannel,"9", "9" )
			cs_addoption(document.ConfigForm.wlChannel,"10", "10" )
			cs_addoption(document.ConfigForm.wlChannel,"11", "11" )
			/*
			document.ConfigForm.wlChannel[1] = new Option("1", "1");
			document.ConfigForm.wlChannel[2] = new Option("2", "2");
			document.ConfigForm.wlChannel[3] = new Option("3", "3");
			document.ConfigForm.wlChannel[4] = new Option("4", "4");
			document.ConfigForm.wlChannel[5] = new Option("5", "5");
			document.ConfigForm.wlChannel[6] = new Option("6", "6");
			document.ConfigForm.wlChannel[7] = new Option("7", "7");
			document.ConfigForm.wlChannel[8] = new Option("8", "8");
			document.ConfigForm.wlChannel[9] = new Option("9", "9");
			document.ConfigForm.wlChannel[10] = new Option("10", "10");
			document.ConfigForm.wlChannel[11] = new Option("11", "11"); */
		}
		else  if (CountryRegion == "2"){
			cs_addoption(document.ConfigForm.wlChannel,"10", "10" )
			cs_addoption(document.ConfigForm.wlChannel,"11", "11" )
			// document.ConfigForm.wlChannel[1] = new Option("10", "10");
			// document.ConfigForm.wlChannel[2] = new Option("11", "11");		
		}
		else  if (CountryRegion == "3"){
			cs_addoption(document.ConfigForm.wlChannel,"10", "10" )
			cs_addoption(document.ConfigForm.wlChannel,"11", "11" )
			cs_addoption(document.ConfigForm.wlChannel,"12", "12" )
			cs_addoption(document.ConfigForm.wlChannel,"13", "13" )
			// document.ConfigForm.wlChannel[1] = new Option("10", "10");
			// document.ConfigForm.wlChannel[2] = new Option("11", "11");
			// document.ConfigForm.wlChannel[3] = new Option("12", "12");
			// document.ConfigForm.wlChannel[4] = new Option("13", "13");					
		}
		else  if (CountryRegion == "4"){
			cs_addoption(document.ConfigForm.wlChannel,"4", "4" )
			// document.ConfigForm.wlChannel[1] = new Option("4", "4");		
		}
		else  if (CountryRegion == "5"){
			cs_addoption(document.ConfigForm.wlChannel,"1", "1" )
			cs_addoption(document.ConfigForm.wlChannel,"2", "2" )
			cs_addoption(document.ConfigForm.wlChannel,"3", "3" )
			cs_addoption(document.ConfigForm.wlChannel,"4", "4" )
			cs_addoption(document.ConfigForm.wlChannel,"5", "5" )
			cs_addoption(document.ConfigForm.wlChannel,"6", "6" )
			cs_addoption(document.ConfigForm.wlChannel,"7", "7" )
			cs_addoption(document.ConfigForm.wlChannel,"8", "8" )
			cs_addoption(document.ConfigForm.wlChannel,"9", "9" )
			cs_addoption(document.ConfigForm.wlChannel,"10", "10" )
			cs_addoption(document.ConfigForm.wlChannel,"11", "11" )
			cs_addoption(document.ConfigForm.wlChannel,"12", "12" )
			cs_addoption(document.ConfigForm.wlChannel,"13", "13" )
			cs_addoption(document.ConfigForm.wlChannel,"14", "14" )
			// document.ConfigForm.wlChannel[1] = new Option("1", "1");
			// document.ConfigForm.wlChannel[2] = new Option("2", "2");
			// document.ConfigForm.wlChannel[3] = new Option("3", "3");
			// document.ConfigForm.wlChannel[4] = new Option("4", "4");
			// document.ConfigForm.wlChannel[5] = new Option("5", "5");
			// document.ConfigForm.wlChannel[6] = new Option("6", "6");
			// document.ConfigForm.wlChannel[7] = new Option("7", "7");
			// document.ConfigForm.wlChannel[8] = new Option("8", "8");
			// document.ConfigForm.wlChannel[9] = new Option("9", "9");
			// document.ConfigForm.wlChannel[10] = new Option("10", "10");
			// document.ConfigForm.wlChannel[11] = new Option("11", "11");
			// document.ConfigForm.wlChannel[12] = new Option("12", "12");
			// document.ConfigForm.wlChannel[13] = new Option("13", "13");
			// document.ConfigForm.wlChannel[14] = new Option("14", "14");					
		}
		else  if (CountryRegion == "6"){
			cs_addoption(document.ConfigForm.wlChannel,"3", "3" )
			cs_addoption(document.ConfigForm.wlChannel,"4", "4" )
			cs_addoption(document.ConfigForm.wlChannel,"5", "5" )
			cs_addoption(document.ConfigForm.wlChannel,"6", "6" )
			cs_addoption(document.ConfigForm.wlChannel,"7", "7" )
			cs_addoption(document.ConfigForm.wlChannel,"8", "8" )
			cs_addoption(document.ConfigForm.wlChannel,"9", "9" )
			// document.ConfigForm.wlChannel[1] = new Option("3", "3");
			// document.ConfigForm.wlChannel[2] = new Option("4", "4");
			// document.ConfigForm.wlChannel[3] = new Option("5", "5");
			// document.ConfigForm.wlChannel[4] = new Option("6", "6");
			// document.ConfigForm.wlChannel[5] = new Option("7", "7");
			// document.ConfigForm.wlChannel[6] = new Option("8", "8");
			// document.ConfigForm.wlChannel[7] = new Option("9", "9");					
		}								
		else{//1 or else
			cs_addoption(document.ConfigForm.wlChannel,"1", "1" )
			cs_addoption(document.ConfigForm.wlChannel,"2", "2" )
			cs_addoption(document.ConfigForm.wlChannel,"3", "3" )
			cs_addoption(document.ConfigForm.wlChannel,"4", "4" )
			cs_addoption(document.ConfigForm.wlChannel,"5", "5" )
			cs_addoption(document.ConfigForm.wlChannel,"6", "6" )
			cs_addoption(document.ConfigForm.wlChannel,"7", "7" )
			cs_addoption(document.ConfigForm.wlChannel,"8", "8" )
			cs_addoption(document.ConfigForm.wlChannel,"9", "9" )
			cs_addoption(document.ConfigForm.wlChannel,"10", "10" )
			cs_addoption(document.ConfigForm.wlChannel,"11", "11" )
			cs_addoption(document.ConfigForm.wlChannel,"12", "12" )
			cs_addoption(document.ConfigForm.wlChannel,"13", "13" )
			// document.ConfigForm.wlChannel[1] = new Option("1", "1");
			// document.ConfigForm.wlChannel[2] = new Option("2", "2");
			// document.ConfigForm.wlChannel[3] = new Option("3", "3");
			// document.ConfigForm.wlChannel[4] = new Option("4", "4");
			// document.ConfigForm.wlChannel[5] = new Option("5", "5");
			// document.ConfigForm.wlChannel[6] = new Option("6", "6");
			// document.ConfigForm.wlChannel[7] = new Option("7", "7");
			// document.ConfigForm.wlChannel[8] = new Option("8", "8");
			// document.ConfigForm.wlChannel[9] = new Option("9", "9");
			// document.ConfigForm.wlChannel[10] = new Option("10", "10");
			// document.ConfigForm.wlChannel[11] = new Option("11", "11");
			// document.ConfigForm.wlChannel[12] = new Option("12", "12");
			// document.ConfigForm.wlChannel[13] = new Option("13", "13");
		}
	}
	else  if (band == "1")
	{
		cs_addoption(document.ConfigForm.wlChannel,"0", "Auto" )
		//document.ConfigForm.wlChannel[0] = new Option("Auto", "0");
	}
	else
	{
		cs_addoption(document.ConfigForm.wlChannel,"0", "Auto" )
		//document.ConfigForm.wlChannel[0] = new Option("Auto", "0");
	}
	setSelect('wlChannel',Wlan[ssidIdx].channel);
}
/*
function loadMCSList()
{
	document.ConfigForm.wlMcs.options.length = 0;
	document.ConfigForm.wlMcs[0] = new Option("Auto", "33", false, Wlan[ssidIdx].MCSValue == "33");
	if (Wlan[0].TxRxStream == '1')
	{
		if ("0" == getSelectVal('bwControl'))
		{
			if ("0" == getSelectVal('giControl'))
			{
				document.ConfigForm.wlMcs[1] = new Option("6.5 Mbps", "0", false, Wlan[ssidIdx].MCSValue == "0");
				document.ConfigForm.wlMcs[2] = new Option("13 Mbps", "1", false, Wlan[ssidIdx].MCSValue == "1");
				document.ConfigForm.wlMcs[3] = new Option("19.5 Mbps", "2", false, Wlan[ssidIdx].MCSValue == "2");
				document.ConfigForm.wlMcs[4] = new Option("26 Mbps", "3", false, Wlan[ssidIdx].MCSValue == "3");
				document.ConfigForm.wlMcs[5] = new Option("39 Mbps", "4", false, Wlan[ssidIdx].MCSValue == "4");
				document.ConfigForm.wlMcs[6] = new Option("52 Mbps", "5", false, Wlan[ssidIdx].MCSValue == "5");
				document.ConfigForm.wlMcs[7] = new Option("58.5 Mbps", "6", false, Wlan[ssidIdx].MCSValue == "6");
				document.ConfigForm.wlMcs[8] = new Option("65 Mbps", "7", false, Wlan[ssidIdx].MCSValue == "7");
		}
			else if ("1" == getSelectVal('giControl'))
			{
				document.ConfigForm.wlMcs[1] = new Option("7.2 Mbps", "0", false, Wlan[ssidIdx].MCSValue == "0");
				document.ConfigForm.wlMcs[2] = new Option("14.4 Mbps", "1", false, Wlan[ssidIdx].MCSValue == "1");
				document.ConfigForm.wlMcs[3] = new Option("21.7 Mbps", "2", false, Wlan[ssidIdx].MCSValue == "2");
				document.ConfigForm.wlMcs[4] = new Option("28.9 Mbps", "3", false, Wlan[ssidIdx].MCSValue == "3");
				document.ConfigForm.wlMcs[5] = new Option("43.3 Mbps", "4", false, Wlan[ssidIdx].MCSValue == "4");
				document.ConfigForm.wlMcs[6] = new Option("57.8 Mbps", "5", false, Wlan[ssidIdx].MCSValue == "5");
				document.ConfigForm.wlMcs[7] = new Option("65 Mbps", "6", false, Wlan[ssidIdx].MCSValue == "6");
				document.ConfigForm.wlMcs[8] = new Option("72.2 Mbps", "7", false, Wlan[ssidIdx].MCSValue == "7");
			}
		}
		else
		{
			if ("0" == getSelectVal('giControl'))
		{
				document.ConfigForm.wlMcs[1] = new Option("13.5 Mbps", "0", false, Wlan[ssidIdx].MCSValue == "0");
				document.ConfigForm.wlMcs[2] = new Option("27 Mbps", "1", false, Wlan[ssidIdx].MCSValue == "1");
				document.ConfigForm.wlMcs[3] = new Option("40.5 Mbps", "2", false, Wlan[ssidIdx].MCSValue == "2");
				document.ConfigForm.wlMcs[4] = new Option("54 Mbps", "3", false, Wlan[ssidIdx].MCSValue == "3");
				document.ConfigForm.wlMcs[5] = new Option("81 Mbps", "4", false, Wlan[ssidIdx].MCSValue == "4");
				document.ConfigForm.wlMcs[6] = new Option("108 Mbps", "5", false, Wlan[ssidIdx].MCSValue == "5");
				document.ConfigForm.wlMcs[7] = new Option("121.5 Mbps", "6", false, Wlan[ssidIdx].MCSValue == "6");
				document.ConfigForm.wlMcs[8] = new Option("135 Mbps", "7", false, Wlan[ssidIdx].MCSValue == "7");
		}
			else if ("1" == getSelectVal('giControl'))
			{
				document.ConfigForm.wlMcs[1] = new Option("15 Mbps", "0", false, Wlan[ssidIdx].MCSValue == "0");
				document.ConfigForm.wlMcs[2] = new Option("30 Mbps", "1", false, Wlan[ssidIdx].MCSValue == "1");
				document.ConfigForm.wlMcs[3] = new Option("45 Mbps", "2", false, Wlan[ssidIdx].MCSValue == "2");
				document.ConfigForm.wlMcs[4] = new Option("60 Mbps", "3", false, Wlan[ssidIdx].MCSValue == "3");
				document.ConfigForm.wlMcs[5] = new Option("90 Mbps", "4", false, Wlan[ssidIdx].MCSValue == "4");
				document.ConfigForm.wlMcs[6] = new Option("120 Mbps", "5", false, Wlan[ssidIdx].MCSValue == "5");
				document.ConfigForm.wlMcs[7] = new Option("135 Mbps", "6", false, Wlan[ssidIdx].MCSValue == "6");
				document.ConfigForm.wlMcs[8] = new Option("150 Mbps", "7", false, Wlan[ssidIdx].MCSValue == "7");
			}
		}
	}
	else if (Wlan[0].TxRxStream == '2')
	{
		if ("0" == getSelectVal('bwControl'))
		{
			if ("0" == getSelectVal('giControl'))
			{
				document.ConfigForm.wlMcs[1] = new Option("13 Mbps", "8", false, Wlan[ssidIdx].MCSValue == "8");
				document.ConfigForm.wlMcs[2] = new Option("26 Mbps", "9", false, Wlan[ssidIdx].MCSValue == "9");
				document.ConfigForm.wlMcs[3] = new Option("39 Mbps", "10", false, Wlan[ssidIdx].MCSValue == "10");
				document.ConfigForm.wlMcs[4] = new Option("52 Mbps", "11", false, Wlan[ssidIdx].MCSValue == "11");
				document.ConfigForm.wlMcs[5] = new Option("78 Mbps", "12", false, Wlan[ssidIdx].MCSValue == "12");
				document.ConfigForm.wlMcs[6] = new Option("104 Mbps", "13", false, Wlan[ssidIdx].MCSValue == "13");
				document.ConfigForm.wlMcs[7] = new Option("117 Mbps", "14", false, Wlan[ssidIdx].MCSValue == "14");
				document.ConfigForm.wlMcs[8] = new Option("130 Mbps", "15", false, Wlan[ssidIdx].MCSValue == "15");
		}
			else if ("1" == getSelectVal('giControl'))
			{
				document.ConfigForm.wlMcs[1] = new Option("14.4 Mbps", "8", false, Wlan[ssidIdx].MCSValue == "8");
				document.ConfigForm.wlMcs[2] = new Option("28.9 Mbps", "9", false, Wlan[ssidIdx].MCSValue == "9");
				document.ConfigForm.wlMcs[3] = new Option("43.3 Mbps", "10", false, Wlan[ssidIdx].MCSValue == "10");
				document.ConfigForm.wlMcs[4] = new Option("57.8 Mbps", "11", false, Wlan[ssidIdx].MCSValue == "11");
				document.ConfigForm.wlMcs[5] = new Option("86.7 Mbps", "12", false, Wlan[ssidIdx].MCSValue == "12");
				document.ConfigForm.wlMcs[6] = new Option("115.6 Mbps", "13", false, Wlan[ssidIdx].MCSValue == "13");
				document.ConfigForm.wlMcs[7] = new Option("130.0 Mbps", "14", false, Wlan[ssidIdx].MCSValue == "14");
				document.ConfigForm.wlMcs[8] = new Option("144.4 Mbps", "15", false, Wlan[ssidIdx].MCSValue == "15");
			}
		}
		else
		{
			if ("0" == getSelectVal('giControl'))
		{
				document.ConfigForm.wlMcs[1] = new Option("27 Mbps", "8", false, Wlan[ssidIdx].MCSValue == "8");
				document.ConfigForm.wlMcs[2] = new Option("54 Mbps", "9", false, Wlan[ssidIdx].MCSValue == "9");
				document.ConfigForm.wlMcs[3] = new Option("81 Mbps", "10", false, Wlan[ssidIdx].MCSValue == "10");
				document.ConfigForm.wlMcs[4] = new Option("108 Mbps", "11", false, Wlan[ssidIdx].MCSValue == "11");
				document.ConfigForm.wlMcs[5] = new Option("162 Mbps", "12", false, Wlan[ssidIdx].MCSValue == "12");
				document.ConfigForm.wlMcs[6] = new Option("216 Mbps", "13", false, Wlan[ssidIdx].MCSValue == "13");
				document.ConfigForm.wlMcs[7] = new Option("243 Mbps", "14", false, Wlan[ssidIdx].MCSValue == "14");
				document.ConfigForm.wlMcs[8] = new Option("270 Mbps", "15", false, Wlan[ssidIdx].MCSValue == "15");
		}
			else if ("1" == getSelectVal('giControl'))
			{
				document.ConfigForm.wlMcs[1] = new Option("30 Mbps", "8", false, Wlan[ssidIdx].MCSValue == "8");
				document.ConfigForm.wlMcs[2] = new Option("60 Mbps", "9", false, Wlan[ssidIdx].MCSValue == "9");
				document.ConfigForm.wlMcs[3] = new Option("90 Mbps", "10", false, Wlan[ssidIdx].MCSValue == "10");
				document.ConfigForm.wlMcs[4] = new Option("120 Mbps", "11", false, Wlan[ssidIdx].MCSValue == "11");
				document.ConfigForm.wlMcs[5] = new Option("180 Mbps", "12", false, Wlan[ssidIdx].MCSValue == "12");
				document.ConfigForm.wlMcs[6] = new Option("240 Mbps", "13", false, Wlan[ssidIdx].MCSValue == "13");
				document.ConfigForm.wlMcs[7] = new Option("270 Mbps", "14", false, Wlan[ssidIdx].MCSValue == "14");
				document.ConfigForm.wlMcs[8] = new Option("300 Mbps", "15", false, Wlan[ssidIdx].MCSValue == "15");
			}
		}
	}
	//setSelect('wlMcs',Wlan[ssidIdx].MCSValue);
}
*/
function loadMCSList() {
	return;
}
function loadRateList() {
	document.ConfigForm.wlRate.options.length = 0;
	var mode = getValue('wlgMode');
	if (band == "2")
	{ 
		if (mode == "b" )
		{ 
			document.ConfigForm.wlRate[0] = new Option("Auto", "Auto", false, Wlan[ssidIdx].rate == "Auto");
			document.ConfigForm.wlRate[1] = new Option("1 Mbps", "1", false, Wlan[ssidIdx].rate == "1");
			document.ConfigForm.wlRate[2] = new Option("2 Mbps", "2", false, Wlan[ssidIdx].rate == "2");
			document.ConfigForm.wlRate[3] = new Option("5.5 Mbps", "5.5", false, Wlan[ssidIdx].rate == "5.5");
			document.ConfigForm.wlRate[4] = new Option("11 Mbps", "11", false, Wlan[ssidIdx].rate == "11");
		}
		else
		{
			document.ConfigForm.wlRate[0] = new Option("Auto", "Auto", false, Wlan[ssidIdx].rate == "Auto");
			document.ConfigForm.wlRate[1] = new Option("1 Mbps", "1", false, Wlan[ssidIdx].rate == "1");
			document.ConfigForm.wlRate[2] = new Option("2 Mbps", "2", false, Wlan[ssidIdx].rate == "2");
			document.ConfigForm.wlRate[3] = new Option("5.5 Mbps", "5.5", false, Wlan[ssidIdx].rate == "5.5");
			document.ConfigForm.wlRate[4] = new Option("6 Mbps", "6", false, Wlan[ssidIdx].rate == "6");
			document.ConfigForm.wlRate[5] = new Option("9 Mbps", "9", false, Wlan[ssidIdx].rate == "9");
			document.ConfigForm.wlRate[6] = new Option("11 Mbps", "11", false, Wlan[ssidIdx].rate == "11");
			document.ConfigForm.wlRate[7] = new Option("12 Mbps", "12", false, Wlan[ssidIdx].rate == "12");
			document.ConfigForm.wlRate[8] = new Option("18 Mbps", "18", false, Wlan[ssidIdx].rate == "18");
			document.ConfigForm.wlRate[9] = new Option("24 Mbps", "24", false, Wlan[ssidIdx].rate == "24");
			document.ConfigForm.wlRate[10] = new Option("36 Mbps", "36", false, Wlan[ssidIdx].rate == "36");
			document.ConfigForm.wlRate[11] = new Option("48 Mbps", "48", false, Wlan[ssidIdx].rate == "48");
			document.ConfigForm.wlRate[12] = new Option("54 Mbps", "54", false, Wlan[ssidIdx].rate == "54");
		}
	}
	else if (band == "1")
	{ 
		document.ConfigForm.wlRate[0] = new Option("Auto", "Auto", false, Wlan[ssidIdx].rate == "Auto");
		document.ConfigForm.wlRate[1] = new Option("6 Mbps", "6", false, Wlan[ssidIdx].rate == "6");
		document.ConfigForm.wlRate[2] = new Option("9 Mbps", "9", false, Wlan[ssidIdx].rate == "9");
		document.ConfigForm.wlRate[3] = new Option("12 Mbps", "12", false, Wlan[ssidIdx].rate == "12");
		document.ConfigForm.wlRate[4] = new Option("18 Mbps", "18", false, Wlan[ssidIdx].rate == "18");
		document.ConfigForm.wlRate[5] = new Option("24 Mbps", "24", false, Wlan[ssidIdx].rate == "24");
		document.ConfigForm.wlRate[6] = new Option("36 Mbps", "36", false, Wlan[ssidIdx].rate == "36");
		document.ConfigForm.wlRate[7] = new Option("48 Mbps", "48", false, Wlan[ssidIdx].rate == "48");
		document.ConfigForm.wlRate[8] = new Option("54 Mbps", "54", false, Wlan[ssidIdx].rate == "54");
	}
	else
	{
		document.ConfigForm.wlRate[0] = new Option("Auto", "Auto", false, Wlan[ssidIdx].rate == "Auto");
	}
	//setSelect('wlRate',Wlan[ssidIdx].rate);
}
function loadSsidIdxList() {
	var ssidNum = 0;
	var multiFlag = "<% tcWebApi_get("WLan_Common","MultiSSIDConfigEnable","s") %>";
<% if tcwebApi_get("WebCustom_Entry","isShowNumOfSsid","h") = "Yes" then %>
	var WlanIndex = "<% tcWebApi_get("WebCurSet_Entry","wlan_id","s") %>";
	var ssidselsectFlag = 0;
	var ssidindex = 1;
	var ssid1 = "<% tcWebApi_get("WLan_Entry0","EnableSSID","s") %>";
	var ssid2 = "<% tcWebApi_get("WLan_Entry1","EnableSSID","s") %>";
	var ssid3 = "<% tcWebApi_get("WLan_Entry2","EnableSSID","s") %>";
	var ssid4 = "<% tcWebApi_get("WLan_Entry3","EnableSSID","s") %>";
	<% if tcwebApi_get("WebCustom_Entry","isMultiUserITFSupported","h") = "Yes" then %>
	var ssid5 = "<% tcWebApi_get("WLan_Entry4", "EnableSSID", "s") %>";
	var ssid6 = "<% tcWebApi_get("WLan_Entry5", "EnableSSID", "s") %>";
	var ssid7 = "<% tcWebApi_get("WLan_Entry6", "EnableSSID", "s") %>";
	var ssid8 = "<% tcWebApi_get("WLan_Entry7", "EnableSSID", "s") %>";
<% end if %>
<% end if %>
	if(multiFlag == "Yes")
		ssidNum = <% tcWebApi_get("WLan_Common","BssidNum","s") %>;
	else
		ssidNum = '1';//only can edit and query 0 index of ssid
<% if tcwebApi_get("WebCustom_Entry","isCTPONCZNXSupported","h") = "Yes" then %>
<% if tcwebApi_get("WebCurSet_Entry","CurrentAccess","h") <> "0" then %>
	if(ssidNum > "1" && ssidNum <= "8")
		ssidNum = '1';//only can edit and query 0 index of ssid for second user.
<% end if %>
<% end if %>
	document.ConfigForm.wlSsidIdx.options.length = 0;
	cs_addoption(document.ConfigForm.wlSsidIdx, "0", "SSID1");
<% if tcwebApi_get("WebCustom_Entry","isShowNumOfSsid","h") = "Yes" then %>
	if(ssidNum > "1")
	{
		if(ssid2 == "0" || ssid2 == "1")
		{
			cs_addoption(document.ConfigForm.wlSsidIdx, "1", "SSID2");
			ssidindex++;
		}
<% if tcwebApi_get("WebCustom_Entry","isCTPONOnlyTwoSSIDSupported","h") <> "Yes" then %>
		if(ssid3 == "0" || ssid3 == "1") 
		{
			if ( ssidNum > "2" )
			{
				cs_addoption(document.ConfigForm.wlSsidIdx, "2", "SSID3");
				ssidindex++;
			}
		}
<% if tcwebApi_get("Mesh_dat", "MapEnable", "h") <> "1" then %>
		if(ssid4 == "0" || ssid4 == "1") 
		{
			if ( ssidNum > "3" )
			{
				cs_addoption(document.ConfigForm.wlSsidIdx, "3", "SSID4");
				ssidindex++;
			}
		}
		<% if tcwebApi_get("WebCustom_Entry", "isMultiUserITFSupported", "h") = "Yes" then %>
		if ( (ssid5 == "0") || (ssid5 == "1") )
		{
			if ( ssidNum > "4" )
			{
				cs_addoption(document.ConfigForm.wlSsidIdx, "4", "SSID5");
			ssidindex++;
		}
		}
		if ( (ssid6 == "0") || (ssid6 == "1") )
		{
			if ( ssidNum > "5" )
			{
				cs_addoption(document.ConfigForm.wlSsidIdx, "5", "SSID6");
			ssidindex++;
		}
		}
		if ( (ssid7 == "0") || (ssid7 == "1") )
		{
			if ( ssidNum > "6" )
			{
				cs_addoption(document.ConfigForm.wlSsidIdx, "6", "SSID7");
				ssidindex++;
			}
		}
		if ( (ssid8 == "0") || (ssid8 == "1") )
		{
			if ( ssidNum > "7" )
			{
				cs_addoption(document.ConfigForm.wlSsidIdx, "7", "SSID8");;
				ssidindex++;
			}
		}
		<% end if %>
<% end if %>
<% end if %>
	}
<% else %>
	for(var i = 1; i < ssidNum; i++)
	{
		cs_addoption(document.ConfigForm.wlSsidIdx, i.toString(), "SSID" + (i+1).toString());
	}
<% end if %>
<% if tcwebApi_get("WebCustom_Entry","isShowNumOfSsid","h") = "Yes" then %>
	for(var i = 0; i < document.ConfigForm.wlSsidIdx.options.length; i++) 
	{
		if(document.ConfigForm.wlSsidIdx.options[i].value == WlanIndex)
		{
			setSelect('wlSsidIdx',WlanIndex);
			ssidselsectFlag = 1;
			break;
		}
	}
	if(ssidselsectFlag != 1)
	{
		setSelect('wlSsidIdx',0);
		selChangedSSID();
	}
<% else %>
	setSelect('wlSsidIdx', <% tcWebApi_get("WebCurSet_Entry","wlan_id","s") %>);
<% end if %>	
}
function loadMCastRateList() {
	if (band == "2") { 
		if (phy == "b") {
			document.ConfigForm.wlMCastRate[0] = new Option("Auto", "Auto");
			document.ConfigForm.wlMCastRate[1] = new Option("1 Mbps", "1000000");
			document.ConfigForm.wlMCastRate[2] = new Option("2 Mbps", "2000000");
			document.ConfigForm.wlMCastRate[3] = new Option("5.5 Mbps", "5500000");
			document.ConfigForm.wlMCastRate[4] = new Option("11 Mbps", "11000000");
		}
		else {
			document.ConfigForm.wlMCastRate[0] = new Option("Auto", "Auto");
			document.ConfigForm.wlMCastRate[1] = new Option("1 Mbps", "1000000");
			document.ConfigForm.wlMCastRate[2] = new Option("2 Mbps", "2000000");
			document.ConfigForm.wlMCastRate[3] = new Option("5.5 Mbps", "5500000");
			document.ConfigForm.wlMCastRate[4] = new Option("6 Mbps", "6000000");
			document.ConfigForm.wlMCastRate[5] = new Option("9 Mbps", "9000000");
			document.ConfigForm.wlMCastRate[6] = new Option("11 Mbps", "11000000");
			document.ConfigForm.wlMCastRate[7] = new Option("12 Mbps", "12000000");
			document.ConfigForm.wlMCastRate[8] = new Option("18 Mbps", "18000000");
			document.ConfigForm.wlMCastRate[9] = new Option("24 Mbps", "24000000");
			document.ConfigForm.wlMCastRate[10] = new Option("36 Mbps", "36000000");
			document.ConfigForm.wlMCastRate[11] = new Option("48 Mbps", "48000000");
			document.ConfigForm.wlMCastRate[12] = new Option("54 Mbps", "54000000");
		}
	}
	else if (band == "1") { 
		document.ConfigForm.wlMCastRate[0] = new Option("Auto", "Auto");
		document.ConfigForm.wlMCastRate[1] = new Option("6 Mbps", "6000000");
		document.ConfigForm.wlMCastRate[2] = new Option("9 Mbps", "9000000");
		document.ConfigForm.wlMCastRate[3] = new Option("12 Mbps", "12000000");
		document.ConfigForm.wlMCastRate[4] = new Option("18 Mbps", "18000000");
		document.ConfigForm.wlMCastRate[5] = new Option("24 Mbps", "24000000");
		document.ConfigForm.wlMCastRate[6] = new Option("36 Mbps", "36000000");
		document.ConfigForm.wlMCastRate[7] = new Option("48 Mbps", "48000000");
		document.ConfigForm.wlMCastRate[8] = new Option("54 Mbps", "54000000");
	}
	else {
		document.ConfigForm.wlMCastRate[0] = new Option("Auto", "Auto");
	}
}
function loadAuthModeList(){
	var mode = getValue('wlgMode');
	document.ConfigForm.wlSecurMode.options.length = 0;
	if (document.ConfigForm.wlSecurMode.parentNode.getElementsByClassName("select-items").length !=0) {
		document.ConfigForm.wlSecurMode.parentNode.getElementsByClassName("select-items")[0].innerHTML = "";
	}
	if (mode == "n"){
		cs_addoption(document.ConfigForm.wlSecurMode, "None", "OPEN", Wlan[ssidIdx].BeaconType=="None");
		cs_addoption(document.ConfigForm.wlSecurMode, "WPA", "WPA-PSK", Wlan[ssidIdx].BeaconType=="WPA");
		cs_addoption(document.ConfigForm.wlSecurMode, "11i", "WPA2-PSK", Wlan[ssidIdx].BeaconType=="11i");
		cs_addoption(document.ConfigForm.wlSecurMode, "WPAand11i", "WPA/WPA2-PSK", Wlan[ssidIdx].BeaconType=="WPAand11i");
	<% if tcwebApi_get("Info_WLan","isDot1XSupported","h") = "Yes" then %>
		/* cs_addoption(document.ConfigForm.wlSecurMode, "radius64", "Radius-WEP64", Wlan[ssidIdx].BeaconType=="radius64");
		cs_addoption(document.ConfigForm.wlSecurMode, "radius128", "Radius-WEP128", Wlan[ssidIdx].BeaconType=="radius128");
		cs_addoption(document.ConfigForm.wlSecurMode, "wpaOnly", "WPA", Wlan[ssidIdx].BeaconType=="wpaOnly");
		cs_addoption(document.ConfigForm.wlSecurMode, "wpa2Only", "WPA2", Wlan[ssidIdx].BeaconType=="wpa2Only");
		cs_addoption(document.ConfigForm.wlSecurMode, "wpa1and2", "WPA1WPA2", Wlan[ssidIdx].BeaconType=="wpa1and2"); */
	<% end if %> 
	}
	else {
		cs_addoption(document.ConfigForm.wlSecurMode, "None", "OPEN", Wlan[ssidIdx].BeaconType=="None");
		//cs_addoption(document.ConfigForm.wlSecurMode, "Basic", "WEP", Wlan[ssidIdx].BeaconType=="Basic");
		cs_addoption(document.ConfigForm.wlSecurMode, "WPA", "WPA-PSK", Wlan[ssidIdx].BeaconType=="WPA");
		cs_addoption(document.ConfigForm.wlSecurMode, "11i", "WPA2-PSK", Wlan[ssidIdx].BeaconType=="11i");
		cs_addoption(document.ConfigForm.wlSecurMode, "WPAand11i", "WPA/WPA2-PSK", Wlan[ssidIdx].BeaconType=="WPAand11i");
	<% if tcwebApi_get("Info_WLan","isDot1XSupported","h") = "Yes" then %>
		/* cs_addoption(document.ConfigForm.wlSecurMode, "radius64", "Radius-WEP64", Wlan[ssidIdx].BeaconType=="radius64");
		cs_addoption(document.ConfigForm.wlSecurMode, "radius128", "Radius-WEP128", Wlan[ssidIdx].BeaconType=="radius128");
		cs_addoption(document.ConfigForm.wlSecurMode, "wpaOnly", "WPA", Wlan[ssidIdx].BeaconType=="wpaOnly");
		cs_addoption(document.ConfigForm.wlSecurMode, "wpa2Only", "WPA2", Wlan[ssidIdx].BeaconType=="wpa2Only");
		cs_addoption(document.ConfigForm.wlSecurMode, "wpa1and2", "WPA1WPA2", Wlan[ssidIdx].BeaconType=="wpa1and2"); */
	<% end if %> 
	}
	authModeChange(1);
	doWPSUseChange();
}
function doWPSUseChange(){
	if(document.ConfigForm.enableWps.checked && getSelectVal('wlSecurMode') == "Basic")
	{
		alert("<%tcWebApi_get("String_Entry","ForWEPText","s")%>");
		document.ConfigForm.enableWps.checked = false;
		return;
	}
	if(wpsV2Support == 1)
	{
		if(document.ConfigForm.enableWps.checked)
		{
			if(getSelectVal('wlWpa') == "TKIP" &&	(getSelectVal('wlSecurMode') == "WPA" || getSelectVal('wlSecurMode') == "WPAand11i" || getSelectVal('wlSecurMode') == "11i"))
			{
				alert("<%tcWebApi_get("String_Entry","ForWPAText","s")%>");
				document.ConfigForm.enableWps.checked = false;
				return;
			}
			if(document.ConfigForm.wlHide.checked == true)
			{
				alert("<%tcWebApi_get("String_Entry","UnableOpenWPSText","s")%>");
				document.ConfigForm.enableWps.checked = false;
				return;
			}
		}		
	}
	if(document.ConfigForm.enableWps.checked)
	{
		// ONTS-317
		//setDisplay("wpsmodeTR", 1);
		//setDisplay("btnStartWPS", 1);
		//setDisplay("wpssta", 1);
		//document.getElementById("ResetOOB").style.display = ""
		//setDisplay("pinval", 1);		
		//setDisplay("pinGenerate", 1);
		document.ConfigForm.WpsActive.value = "1";
	}
	else
	{
		if(getValue('isInWPSing')!=0)	//WPS is running
		{
			alert("<%tcWebApi_get("String_Entry","WPSWorkingText","s")%>");
			document.ConfigForm.enableWps.checked = true;
			document.ConfigForm.WpsActive.value = "1";
			return;		
		}
		else
		{
		setDisplay("wpsmodeTR", 0);
		setDisplay("btnStartWPS", 0);
		setDisplay("wpssta", 0);
		document.getElementById("ResetOOB").style.display = "none"
		setDisplay("pinval", 0);		
		setDisplay("pinGenerate", 0);
		document.ConfigForm.WpsActive.value = "0";
	}
	}
	return;
}
function wpsModeChange()
{
	with ( document.ConfigForm)
	{
		if (document.ConfigForm.enableWps.checked)
		{
		var temp = getSelectVal("wpsmode");
			if (temp == 'ap-pin')
		{
			setDisplay("pinGenerate", 1);			
			setDisplay("pinval", 1);
		}
		else
		{
			setDisplay("pinGenerate", 0);			
			setDisplay("pinval", 0);
		}
	}
		else
		{
			setDisplay("pinGenerate", 0);			
			setDisplay("pinval", 0);
		}
	}
}
function wpsContChange()
{
	with ( document.ConfigForm)
	{
		var temp = getCheckVal("wpsControl");
		if (temp == 0)
		{
			setDisable("wpsMode", 1);
			setDisable("pinValue", 1);
		}
		else
		{
			setDisable("wpsMode", 0);
			setDisable("pinValue", 0);
		}
	}
}
function isvalidpin(val)
{
	var ret = false;
	var len = val.length;
	var pinSize = 8;
	var pinvalue = new Array();
	if ( len !=  pinSize)
	{
		return false;
	}
	else
	{
		for(i = 0; i < pinSize; i++ )
		{
			pinvalue[i] = parseInt(val.charAt(i),10);
		}
		var accum = 0;
		accum = (pinvalue[0] + pinvalue[2] + pinvalue[4] + pinvalue[6]) * 3 + pinvalue[1] + pinvalue[3] + pinvalue[5] + pinvalue[7];
		if (0 == (accum % 10))
		{
			return true; 
		}
		else
		{
			return false; 
		}
	}
	return ret;
}
function getAfterBurnerIndex(afterburner)
{
	var ret;
	if ( afterburner == "auto" )
		ret = 1;
	else
		ret = 0;
	return ret;
}
function getTpcDbIndex(val) {
	var ret;
	if ( val == "0" )
		ret = 0;
	else if ( val == "2" )
		ret = 1;
	else if ( val == "3" )
		ret = 2;
	else if ( val == "4" )
		ret = 3;
	else ret = 0;
	return ret;
}
function ChannelChange() {
}
function getBandIndex(b) {
	var ret;
	if ( b == '1' )
		ret = 1;
	else
		ret = 0;
	return ret;
}
function wl_afterburner_options(OnPageLoad) {
}
function wl_recalc(OnPageLoad)
{
	with ( document.ConfigForm )
	{
		wl_afterburner_options(OnPageLoad);
	}
}
function updateCurChannel() {
}
<% if tcwebApi_get("WebCustom_Entry", "isMultiSupported", "h") = "Yes" then %>
function getTimerRunningData()
{
	var wpsTimerRunningData = '';
	$.ajaxSetup({
			async : false,
			cache : false
		});
	$.getJSON("/cgi-bin/getWPSPara.asp", function(data, status){
				wpsTimerRunningData = data.wpsTimerRunningData;
  	});
	top.getWlanWpsTimerCount--;	
	return wpsTimerRunningData;
}
function getwlanWPSStatus()
{
	var wlanWPSStatus = '';
	$.ajaxSetup({
			async : false,
			cache : false
		});
	$.getJSON("/cgi-bin/getWPSPara.asp", function(data, status){
				wlanWPSStatus = data.wlanWPSStatus;
  	});
	return wlanWPSStatus;
}
function getWPStimerRunning()
{
	var wlanWPSStatus = '';
	clearTimeout(getWPStimerRunning);
	{
		var wpsTimerRunningData = '';
		if(top.getWlanWpsTimerCount > 0)
		{
			wpsTimerRunningData = getTimerRunningData();
			wlanWPSStatus = getwlanWPSStatus();			
			if(('N/A' == wpsTimerRunningData) || ('' == wpsTimerRunningData) || (oldwpsTimerRunningData == wpsTimerRunningData) || (oldwlanWPSStatus == wlanWPSStatus))
			{
				document.ConfigForm.btnStartWPS.value = 'waiting......';				
				document.getElementById("WPSProcess").innerHTML = oldwlanWPSStatus;
				document.ConfigForm.btnStartWPS.disabled = "disabled";
				setTimeout(getWPStimerRunning, 1000);
			}
			else
			{
				top.getWlanWpsTimerCount = 0;								
				switch(wlanWPSStatus)
				{
					case "In progress":
						document.getElementById("WPSProcess").innerHTML = 'Inprogress';						
						break;
					case "Configured":
						document.getElementById("WPSProcess").innerHTML = 'Configured';						
						break;
					case "WPS process Fail":
						document.getElementById("WPSProcess").innerHTML = 'WPS process Fail';								
						break;
					case "Idle":
						document.getElementById("WPSProcess").innerHTML = 'Idle';						
						break;
					default:
						document.getElementById("WPSProcess").innerHTML = wlanWPSStatus;
						break;
				}				
				switch(wpsTimerRunningData)
				{
					case "1":
						document.ConfigForm.btnStartWPS.value = 'Stop WPS';
						break;
					default:
						document.ConfigForm.btnStartWPS.value = 'Start WPS';
						break;
				}
				document.ConfigForm.btnStartWPS.disabled = "";
			}
		}
		else
		{
			switch(oldwlanWPSStatus)
			{
				case "In progress":
					document.getElementById("WPSProcess").innerHTML = 'Inprogress';						
					break;
				case "Configured":
					document.getElementById("WPSProcess").innerHTML = 'Configured';						
					break;
				case "WPS process Fail":
					document.getElementById("WPSProcess").innerHTML = 'WPS process Fail';								
					break;
				case "Idle":
					document.getElementById("WPSProcess").innerHTML = 'Idle';						
					break;
				default:
					document.getElementById("WPSProcess").innerHTML = wlanWPSStatus;
					break;
			}			
			switch(oldwpsTimerRunningData)
			{
				case "1":
					document.ConfigForm.btnStartWPS.value = 'Stop WPS';
					break;
				default:
					document.ConfigForm.btnStartWPS.value = 'Start WPS';
					break;
			}			
			document.ConfigForm.btnStartWPS.disabled = "";
		}
	}
}
<% end if %>
function showUI()
{
<% if tcWebApi_get("Mesh_dat","MapEnable","h") = "1" then %>
<% if tcWebApi_get("Mesh_Common","DeviceRole","h") <> "1" then %>
	location.pathname = "/cgi-bin/home.asp";
	return;
<% end if %>
<% end if %>
// ONTS-122
<% if tcWebApi_get("WLan_Bndstrg","BndStrgEnable","h") = "1" then %>
	$("#bandsteeringnote_div").show();
	$("#wlEnbl_div").hide();
	<% if tcWebApi_get("WebCurSet_Entry","wlan_id","h") = "0" then %>
	$("#enableSsid_div").hide();
	<% end if %>
<% end if %>
	with ( document.ConfigForm )
	{
<% if tcWebApi_get("WLan_Common","rt_device","h") = "7615" then %>
<% if tcWebApi_get("Info_WLan","isMT7615DSupported","h") <> "Yes" then %>		
	if(initFlag == true)
	{
		initWLanTxBeamFormingSel();
		initFlag = false;
	}
<% end if %>
<% end if %>
		setCheck('wlEnbl', enbl);
		setCheck('wlHide', Wlan[ssidIdx].wlHide);
		if ( phy == "g" )
		{
			if(Wlan[ssidIdx].mode == "b/g")
			{
				setSelect('wlgMode', "b,g");
			}
			else
			{
				setSelect('wlgMode',Wlan[ssidIdx].mode);
			}
		}
<% if tcWebApi_get("WLan_Common","HT_BW","h") = "1" then %>
	<% if tcWebApi_get("WLan_Common","HT_BSSCoexistence","h") = "1" then %>
		setSelect('bwControl',"1");
	<% else %>
		setSelect('bwControl',"2");
	<% end if %>
<% else %>
		setSelect('bwControl',"0");
<% end if %>	
		setSelect('giControl',Wlan[ssidIdx].GIControl);
		loadChannelList();
		loadSsidIdxList();
		gModeChange();
/*
<% if tcWebApi_get("WLan_Common","PaMode","h") = "1" then %>
<% if tcWebApi_get("WLan_Common","TxPowerLevel","h") = "1" then %>
		setSelect('wlTxPwr',"6");
<% else %>
		setSelect('wlTxPwr',Wlan[ssidIdx].power);
<% end if %>
<% else %>
		setSelect('wlTxPwr',Wlan[ssidIdx].power);
<% end if %>
*/
		setCheck('wlHide',Wlan[ssidIdx].wlHide);
		setCheck('enableSsid',Wlan[ssidIdx].enable);
		setText('wlSsid',htmlDecode(Wlan[ssidIdx].ssid));
		setSelect('wlSecurMode',Wlan[ssidIdx].BeaconType);
		setDisplay('wlInfo',enbl);
		setDisplay('authen',enbl);
		setDisplay('ssid-header',enbl);
		setDisplay('ssid-widget',enbl);
		/* setDisplay('wlUserTip',enbl); */
		setSelect('wlKeyBit',Wlan[ssidIdx].EncypBit);//setSelect('wlKeyBit',parseInt(Wlan[ssidIdx].EncypBit)+24);		
		wlKeyBitChange();
		if (ssidAccessAttr.indexOf('Subscriber') < 0)
		{
			setDisable('wlSsid',1);
		}
		if ( EnableAccessAttr.indexOf('Subscriber') < 0)
		{
			setDisable('enableSsid',1);
		}
		if ( beaconTypeAccessAttr.indexOf('Subscriber') < 0)
		{
			setDisable('wlSecurMode',1);
		}
	}
	setSelect("wpsmode", Wlan[ssidIdx].WPSMode);
	if (getSelectVal("wpsmode") == 'ap-pin')
	{
		setText("pinvalue", Wlan[ssidIdx].PINValue);
	}
	authModeChange(1);
<% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then %>
	easymesh_onload(1);
<% end if %>
<% if tcwebApi_get("WebCustom_Entry", "isMultiSupported", "h") = "Yes" then %>
	getWPStimerRunning();
<% end if %>
}
function isValidIpAddr(ip1,ip2,ip3,ip4)
{
	if(ip1==0 || ip4==0 || ip4==255 || ip1==127 )	
		return false;			
	return true;	
}
function inValidIPAddr(Address)
{
	var address = Address.match("^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$");
	var digits;
	var i;
	if(address == null) { 
		alert('<%tcWebApi_get("String_Entry","IsInvalidIPAddrText","s")%>' + Address);
		return true;
	}
	digits = address[0].split(".");
	for(i=0; i < 4; i++)
	{
		if((Number(digits[i]) > 255 ) || (Number(digits[i]) < 0 ) || (Number(digits[0]) > 223) || (digits[i] == null))
		{ 
			alert('<%tcWebApi_get("String_Entry","IsInvalidIPAddrText","s")%>' + Address);
			return true;
		}
	}
	if(!isValidIpAddr(digits[0],digits[1],digits[2],digits[3],false))
	{
		alert('<%tcWebApi_get("String_Entry","IsInvalidIPAddrText","s")%>' + Address);
		return true;
	}
	return false;
}
function checkRadiusSetting()
{
	var Radiusip = document.ConfigForm.radiusSVR_IP.value;
	var Radiusport = document.ConfigForm.radiusSVR_Port.value;
	var Radiuskey= document.ConfigForm.radiusSVR_Key.value;
	var RadiusReAuthTime=document.ConfigForm.radiusSVR_ReAuthInter.value;
	if( inValidIPAddr(Radiusip) )
	{
		return false;
	}
	if(isNaN(Radiusport) || Radiusport < 0 || Radiusport > 65535)
	{	
		alert("<%tcWebApi_get("String_Entry","RadiusServerPortTipsText","s")%>");
		return false;
	}
	if (Radiuskey.length == 0)
	{
		alert("<%tcWebApi_get("String_Entry","RadiusShareSecretTipsText","s")%>");
		return false; 
	}
	if (isNaN(RadiusReAuthTime) || RadiusReAuthTime.length == 0)
	{
		alert("<%tcWebApi_get("String_Entry","RadiusReauthIntervalTipsText","s")%>");
		return false; 
	}
}
function checkWePKeyValue(KeyBit,index,wlKeys)
{
	var val = wlKeys[index-1].value;
	var SecurMode = getSelectVal('wlSecurMode');
	if(SecurMode == "radius64" || SecurMode == "radius128") {
		return true;
	}
	if ( val == '')
	{
		alert('<%tcWebApi_get("String_Entry","KeyNotEmptyText","s")%>');
		setCheck('wlEnbl',1);
		wlClickEnble(getElById('wlEnbl'));
		return false;
	}
	var vKey = 0;
	for (vKey = 0; vKey < 4; vKey++)
	{
		val = wlKeys[vKey].value;
		if ( val != '' )
		{
			if ( KeyBit == '128' )
			{
				if (isValidKey(val, 13) == false )
				{
					alert('<%tcWebApi_get("String_Entry","SecretKeyText","s")%> "' + val + '" <%tcWebApi_get("String_Entry","InvalidWEPKey1Text","s")%>');
					setCheck('wlEnbl',1);
					wlClickEnble(getElById('wlEnbl'));
					return false;
}
			}
			else
			{
				if ( isValidKey(val, 5) == false )
				{
					alert('<%tcWebApi_get("String_Entry","SecretKeyText","s")%>"' + val + '" <%tcWebApi_get("String_Entry","InvalidWEPKey2Text","s")%>');
					setCheck('wlEnbl',1);
					wlClickEnble(getElById('wlEnbl'));
					return false;
				}
			}
		}
	}
	return true;
}
function addParameter(Form)
{
	var url = '';
	var temp = '';
	var pinLen = 8;
	Form.usingPrefix('y');
	var phymode = getValue('wlgMode');
	Form.addParameter('Standard',phymode);
	if(phymode == 'b' || phymode == 'g' || phymode== 'b/g' ||phymode== 'b,g')
	{
		Form.addParameter('MaxBitRate',getSelectVal('wlRate'));
	}
	else
	{
		Form.addParameter('X_ATP_11NHtMcs',getSelectVal('wlMcs'));
		Form.addParameter('X_ATP_Wlan11NBWControl',getSelectVal('bwControl'));
		Form.addParameter('X_ATP_Wlan11NGIControl',getSelectVal('giControl'));
	}
	Form.addParameter('Enable',getCheckVal('enableSsid'));
	Form.addParameter('Channel',getSelectVal('wlChannel'));
	Form.addParameter('X_CT-COM_SSIDHide',getCheckVal('wlHide'));
	Form.addParameter('X_CT-COM_Powerlevel',getSelectVal('wlTxPwr'));
	var ssid = getValue('wlSsid');
	if (ssid == '' )
	{
		alert('SSID<%tcWebApi_get("String_Entry","EmptyText","s")%>');
		setCheck('wlEnbl',1);
		wlClickEnble(getElById('wlEnbl'));
		return false;
	}
	if (ssid.length > 32)
	{
		alert('SSID "' + getValue('wlSsid') + '" <%tcWebApi_get("String_Entry","EqualOrLesser32Text","s")%>');
		setCheck('wlEnbl',1);
		wlClickEnble(getElById('wlEnbl'));
		return false;
	}
	if (<% tcWebApi_get("WebCurSet_Entry","wlan_id","s") %> == 0)
	{
		if(document.ConfigForm.isCUCSupport.value == 1){
			var preLen= document.ConfigForm.SSIDPre.value.length;
			var the_substring = ssid.substring(0, preLen);
			if (the_substring != document.ConfigForm.SSIDPre.value)
			{
				alert('SSID1 "' + getValue('wlSsid') + '" <%tcWebApi_get("String_Entry","Should1Text","s")%>');
				setCheck('wlEnbl',1);
				wlClickEnble(getElById('wlEnbl'));
				return false;
			}
		}
	}
	if (isValidAscii(ssid) != '')
	{
		alert("SSID<%tcWebApi_get("String_Entry","InvalidCharacterText","s")%> '" + isValidAscii(ssid) + "'");
		setCheck('wlEnbl',1);
		wlClickEnble(getElById('wlEnbl'));
		return false;
	}
<% If tcWebApi_get("WebCustom_Entry","isMaxStaNumSupported","h") = "Yes" Then %>
	var deviceNum = parseInt(getValue('wlAssociateNum'),10);
  if (isPlusInteger(deviceNum) == false
      || parseInt(deviceNum) < 1
      || parseInt(deviceNum) > 32
      || !isInteger(getValue('wlAssociateNum')))
  {
	ShowAdvanced = 0;
	showAdvanced(); /* Show before alert */
      alert('<%tcWebApi_get("String_Entry","NumberConnectText","s")%>');
			setCheck('wlEnbl',1);
			wlClickEnble(getElById('wlEnbl'));      
      return false;
  }
<%end if%>
	Form.addParameter('SSID',ssid);
	var AuthMode = getSelectVal('wlSecurMode');
	Form.addParameter('BeaconType',AuthMode);
	Form.endPrefix();
	var KeyBit = getSelectVal('wlKeyBit');
	var index = parseInt(getSelectVal('wlKeyIndex'));
	var wlKeys = getElById('wlKeys');
	if (AuthMode == 'None')
	{
		Form.addParameter('y.BasicEncryptionModes','None');
		Form.addParameter('y.BasicAuthenticationMode','OpenSystem');
		return true;
	}
	else if (AuthMode == 'Basic')
	{
		var wepauthtype = getSelectVal('wlWep');
		if ( (wepauthtype == 'OpenSystem')
		||(wepauthtype == 'SharedKey')
		||(wepauthtype == 'Both'))
		{
			if( false == checkWePKeyValue(KeyBit,index,wlKeys) )
					{
							return false;
						}
			Form.addParameter('y.WEPEncryptionLevel',(KeyBit-24)+'-bit');
			Form.addParameter('y.WEPKeyIndex',index);
			for (l = 1; l <= 4; l++)
			{
				Form.addParameter('k' + l +  '.InternetGatewayDevice.LANDevice.1.WLANConfiguration.1.WEPKey.' + l + '.' + 'WEPKey',
				wlKeys[l-1].value);
			}
		}
		Form.addParameter('y.BasicEncryptionModes','WEPEncryption');
		Form.addParameter('y.BasicAuthenticationMode',wepauthtype);
		return true;
	}
	else if (AuthMode == 'WPA' || AuthMode == '11i' || AuthMode == 'WPAand11i')
	{
		value = getValue('wlWpaPsk');
		if (isValidWPAPskKey(value) == false )
		{
			alert('<%tcWebApi_get("String_Entry","PreliminaryKeyText","s")%>');
			setCheck('wlEnbl',1);
			wlClickEnble(getElById('wlEnbl'));
			return false;
		}
		Form.addParameter('y.X_ATP_WPSMode', getSelectVal('wpsmode'));
		if(getSelectVal("wpsmode") == 'ap-pin')
		{
			var pinval = getElement('pinvalue');
			if(isSafeStringIn(pinval.value,'0123456789') == false)
			{
				alert('<%tcWebApi_get("String_Entry","PINIntegerText","s")%>');
				setCheck('wlEnbl',1);
				wlClickEnble(getElById('wlEnbl'));
				return false;
			}
			var pinValue = pinval.value;
			if(pinValue.length != pinLen)
			{
				alert('<%tcWebApi_get("String_Entry","EightDigitPINText","s")%>');
				setCheck('wlEnbl',1);
				wlClickEnble(getElById('wlEnbl'));
				return false;
			}
			if(isvalidpin(pinValue) == false)
			{
				alert('<%tcWebApi_get("String_Entry","RightPINText","s")%>');
				setCheck('wlEnbl',1);
				wlClickEnble(getElById('wlEnbl'));
				return false;
			}
			Form.addParameter('y.X_ATP_WPSPinValue', getValue('pinvalue'));
		}
		Form.addParameter('k.PreSharedKey.1.PreSharedKey',value);
		if (AuthMode == 'WPA')
		{
			Form.addParameter('y.WPAEncryptionModes',getSelectVal('wlWpa'));
		}
		else  if (AuthMode == '11i')
		{
			Form.addParameter('y.IEEE11iEncryptionModes',getSelectVal('wlWpa'));
		}
		else  if (AuthMode == 'WPAand11i')
		{
			Form.addParameter('y.WPAWPA2EncryptionModes',getSelectVal('wlWpa'));
		}
		if(checkRekeyinteral(document.ConfigForm.WPARekeyInter.value))
		{
			return false;
		}
	}
	else if(AuthMode == 'radius64' || AuthMode == 'radius128')
	{
		if(false == checkRadiusSetting() ||false == checkWePKeyValue(KeyBit,index,wlKeys))
		{
			return false;
		}
	}
	else if(AuthMode == 'wpaOnly' || AuthMode == 'wpa2Only' || AuthMode == 'wpa1and2')
	{
		if( false == checkRadiusSetting())
		{
			return false;
		}
		if(checkRekeyinteral(document.ConfigForm.WPARekeyInter.value))
		{
			return false;
		}
	}
	return true;
}
<% if tcWebApi_get("WLan_Common","rt_device","h") = "7615" Then %>
<% if tcWebApi_get("Info_WLan","isMT7615DSupported","h") <> "Yes" then %>
var initFlag = true;
function initWLanTxBeamFormingSel()			/*init TxBeamforming sel*/
{
	var ITxBfEn = "<%tcWebApi_get("WLan_Common","ITxBfEn","s")%>";
	var ETxBfEnCond = "<%tcWebApi_get("WLan_Common","ETxBfEnCond","s")%>";
	var ETxBfIncapable = "<%tcWebApi_get("WLan_Common","ETxBfIncapable","s")%>";
	if(ITxBfEn == "1" && ETxBfEnCond == "1" && ETxBfIncapable == "0")		/*Both*/
	{
		document.ConfigForm.WLanTxBeamForming[0].selected = true;
	}
	else if(ITxBfEn == "0" && ETxBfEnCond == "1" && ETxBfIncapable == "0")		/*Explicit*/
	{
		document.ConfigForm.WLanTxBeamForming[1].selected = true;
	}
	else if(ITxBfEn == "1" && ETxBfEnCond == "0" && ETxBfIncapable == "1")		/*Implicit*/
	{
		document.ConfigForm.WLanTxBeamForming[2].selected = true;
	}
	else if(ITxBfEn == "0" && ETxBfEnCond == "0" && ETxBfIncapable == "1")		/*Disable*/
	{
		document.ConfigForm.WLanTxBeamForming[3].selected = true;
	}
	else
	{
		document.ConfigForm.WLanTxBeamForming[3].selected = true;
	}
}
function doVHTTxBeamFormingChange()
{
	if(document.ConfigForm.WLanTxBeamForming[0].selected == true)			/*Both*/
	{
		document.ConfigForm.WLanITxBfEn.value = "1";
		document.ConfigForm.WLanETxBfEnCond.value = "1";
		document.ConfigForm.WLanETxBfIncapable.value = "0";
	}
	else if(document.ConfigForm.WLanTxBeamForming[1].selected == true)		/*Explicit*/
	{
		document.ConfigForm.WLanITxBfEn.value = "0";
		document.ConfigForm.WLanETxBfEnCond.value = "1";
		document.ConfigForm.WLanETxBfIncapable.value = "0";
	}
	else if(document.ConfigForm.WLanTxBeamForming[2].selected == true)		/*Implicit*/
	{
		document.ConfigForm.WLanITxBfEn.value = "1";
		document.ConfigForm.WLanETxBfEnCond.value = "0";
		document.ConfigForm.WLanETxBfIncapable.value = "1";
	}
	else if(document.ConfigForm.WLanTxBeamForming[3].selected == true)		/*Disable*/
	{
		document.ConfigForm.WLanITxBfEn.value = "0";
		document.ConfigForm.WLanETxBfEnCond.value = "0";
		document.ConfigForm.WLanETxBfIncapable.value = "1";
	}
	else
	{
		document.ConfigForm.WLanITxBfEn.value = "0";
		document.ConfigForm.WLanETxBfEnCond.value = "0";
		document.ConfigForm.WLanETxBfIncapable.value = "1";
	}
}
<% end if %>	
<% end if %>
function WDSKeyCheck(object) {
	var keyvalue=object.value;
	var wdskeylen=object.value.length;
 	if(wdskeylen < 8) {
  	alert('WDS Key length error!');
		return true;
	}else if(wdskeylen==64){
		for(i=0;i<64;i++){
			var c=keyvalue.charAt(i);
			if(doHexCheck(c)<0){
				alert('WDS Key Hex value error!');
				return true;
			}
		}
	}else if(wdskeylen > 64) {
    alert('WDS Key length error!');
		return true;
	}			
	return false;
}
function quotationCheck(object, limit_len) {
	var len = object.value.length;
	var c;
	var i, j = 0;
  for (i = 0; i < len; i++)
  {
	 	var c = object.value.charAt(i);
	  if (c == '"')
		{
			j += 6;
		}
		else
			j++;
  }
 	if (j > limit_len-1)
	{
    alert('too many quotation marks!');		
    return true;
	}	
	return false;
}
function doSubmit() {
	document.ConfigForm.BeaconInterval.value = document.ConfigForm.BeaconInterval.value.trim();
	document.ConfigForm.RTSThreshold.value = document.ConfigForm.RTSThreshold.value.trim();
	document.ConfigForm.FragmentThreshold.value = document.ConfigForm.FragmentThreshold.value.trim();
	document.ConfigForm.DTIM.value = document.ConfigForm.DTIM.value.trim();
	if(checkDTIM(document.ConfigForm.DTIM.value) ||
		checkBeacon(document.ConfigForm.BeaconInterval.value) ||
		checkRTS(document.ConfigForm.RTSThreshold.value) ||
		checkFrag(document.ConfigForm.FragmentThreshold.value)){
		return false;
	}
	if(enbl == 1)
	{
	if(getValue('isInWPSing')!=0 && getValue('hWpsStart')!=1)
	{
		alert("<%tcWebApi_get("String_Entry","WPSIsWorkingText","s")%>");
		return;
	}		
	}		
	var Form = new webSubmitForm();
	var enable = getCheckVal('wlEnbl');
	var SecurMode = getSelectVal('wlSecurMode');
	Form.addParameter('x.WLANConfiguration.1.X_CT-COM_APModuleEnable',enable);
	var wlandomain = 'InternetGatewayDevice.LANDevice.1.WLANConfiguration.'
	+(ssidIdx + 1);
	if(state == 1 && enable == 1)
	{
		if (addParameter(Form) == false)
		{
			return;
		}
		if (SecurMode == 'None')
		{
			Form.setAction('setcfg.cgi?x=InternetGatewayDevice.LANDevice.1'
			+ '&y=' + wlandomain
			+ '&RequestFile=html/network/wlan.asp');
		}
		else if (SecurMode == 'Basic')
		{
			if(document.ConfigForm.enableWps.checked)
			{
				alert("<%tcWebApi_get("String_Entry","ForWEPText","s")%>");
				return;
			}		
			Form.setAction('setcfg.cgi?x=InternetGatewayDevice.LANDevice.1'
			+ '&y=' + wlandomain + '&k1=' + '&k2='
			+ '&k3=' + '&k4='
			+ '&RequestFile=html/network/wlan.asp');
		}
		else if (SecurMode == 'WPA' || SecurMode == '11i' || SecurMode == 'WPAand11i')
		{
			if(wpsV2Support == 1 && document.ConfigForm.enableWps.checked && getSelectVal('wlWpa') == "TKIP")
			{
				alert("<%tcWebApi_get("String_Entry","ForWPAText","s")%>");
				return;
			}
			Form.setAction('setcfg.cgi?x=InternetGatewayDevice.LANDevice.1'
			+ '&y=' + wlandomain + '&k=' + wlandomain 
			+ '&RequestFile=html/network/wlan.asp');
		}
	}
<% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then %>
		if(isMeshBssCfg)
		{
			if((SecurMode != 'None') && (SecurMode != '11i'))
			{
				alert("<%tcWebApi_get("String_Entry","HintOpenEasyMeshText2","s")%>");
				return;
			}
			var sel_wlWpa = getSelectVal('wlWpa');
			if(SecurMode != 'None')
			{
				if((sel_wlWpa != "NONE") && (sel_wlWpa != "AES"))
				{
					alert("<%tcWebApi_get("String_Entry","HintOpenEasyMeshText3","s")%>");
					return;
				}
			}
		}
<% end if %>
	else
	{
		Form.setAction('setcfg.cgi?x=InternetGatewayDevice.LANDevice.1'
		+ '&y='+ wlandomain
		+ '&RequestFile=html/network/wlan.asp');
	}
	//Form.submit();
	setDisable('btnOK',1);
	SetCtlValue();
<% if tcWebApi_get("WLan_Common","rt_device","h") = "7615" then %>	
<% if tcWebApi_get("Info_WLan","isMT7615DSupported","h") <> "Yes" then %>
	doVHTTxBeamFormingChange();
<% end if %>	
<% end if %>	
	var mode = getValue('wlgMode');
	var SecurMode1 = getSelectVal('wlSecurMode');
	if(document.ConfigForm.isWDSSupported.value==1)
	{
		if(document.ConfigForm.WLAN_WDS_Active[0].checked == true)//if wds enable ,to check wds_key, or not to check
		{
			if(mode != "n")
			{
				if((SecurMode1 == 'Basic') || (SecurMode1 == 'WPA') || (SecurMode1 == '11i')
				|| (SecurMode1 == 'WPAand11i'))
				{
					if (WDSKeyCheck(document.ConfigForm.WDS_Key))
					{
						return false;
					}
					if(quotationCheck(document.ConfigForm.WDS_Key, 385) )
					{
						return false;	 
					}  			
			    }	
			}
			else
			{
				if((SecurMode1 == 'WPA') || (SecurMode1 == '11i') || (SecurMode1 == 'WPAand11i' ))
				{
					if (WDSKeyCheck(document.ConfigForm.WDS_Key))
					{
						return false;
					}
					if(quotationCheck(document.ConfigForm.WDS_Key, 385) )
					{
						return false;	 
					} 
				}	
			}
		}
		if(doMACcheck(document.ConfigForm.WLANWDS_PEER_MAC1)||
			doMACcheck(document.ConfigForm.WLANWDS_PEER_MAC2)||
			doMACcheck(document.ConfigForm.WLANWDS_PEER_MAC3)||
			doMACcheck(document.ConfigForm.WLANWDS_PEER_MAC4))
		{
			return false;
	}
	}
	submitAsync("ConfigForm");
}
function wlClickEnble(wlEnbleCl)
{   
	if (wlEnbleCl.checked == true)
	{
		setDisplay('wlInfo',1);
		setDisplay('authen',1);
		/*setDisplay('wlUserTip',1); */
		setDisplay('ssid-header',1);
		setDisplay('ssid-widget',1);
<% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then %>
		//setDisplay('wlMeshTip',1);
<% end if %>
	}
	else
	{
		setDisplay('wlInfo',0);
		setDisplay('authen',0);
		/*setDisplay('wlUserTip',0);*/
		setDisplay('ssid-header',0);
		setDisplay('ssid-widget',0);
<% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then %>
		//setDisplay('wlMeshTip',0);
<% end if %>
	}
}
function SetCtlValue()
{	
	with ( document.ConfigForm)
	{
		var enable = getCheckVal('wlEnbl');
		if(enable == 1)
			setText('hwlEnbl', 1);
		else
			setText('hwlEnbl', 0);
		enable = getCheckVal('enableSsid');
		if(enable == 1)
			setText('henableSsid', 1);
		else
			setText('henableSsid', 0);
		var hide = getCheckVal('wlHide');
		if(hide == 1)
			setText('hwlHide', 1);
		else
			setText('hwlHide', 0);		
		var temp = getSelectVal("wpsmode");
		if(temp == 'ap-pin')
		{
			setText('hWPSMode', 0);
		}
		else
		{
			setText('hWPSMode', 1);
		}
		setText('hwlKeys0', wlKeys[0].value);
		setText('hwlKeys1', wlKeys[1].value);
		setText('hwlKeys2', wlKeys[2].value);
		setText('hwlKeys3', wlKeys[3].value);
		var mode = '0';
		WirelessMode = getSelectVal('wlgMode');
		if (WirelessMode == 'b,g')
			mode = '0';
		else if (WirelessMode == 'b')
			mode = '1';
		else if (WirelessMode == 'g')
			mode = '4';
		else if (WirelessMode == 'n')
			mode = '6';
		else if (WirelessMode == 'g,n')
			mode = '7';
		else if (WirelessMode == 'b,g,n')
			mode = '9';		
		else
			mode = '0';			
		setText('hwlgMode', mode);		
		var BeaconType = 'OPEN';
		var SecurMode = getSelectVal('wlSecurMode');
		if (SecurMode == 'Basic')
		{
			var wlKeyBitLen = getSelectVal('wlKeyBit');
			if(wlKeyBitLen == 128)
				BeaconType = 'WEP-128Bits';
			else
				BeaconType = 'WEP-64Bits';
		}
		else if (SecurMode == 'WPA')
			BeaconType = 'WPAPSK';
		else if (SecurMode == '11i')
			BeaconType = 'WPA2PSK';
		else if (SecurMode == 'WPAand11i')
			BeaconType = 'WPAPSKWPA2PSK';
		else if (SecurMode == 'radius64')
			BeaconType = 'Radius-WEP64';
		else if (SecurMode == 'radius128')
			BeaconType = 'Radius-WEP128';
		else if (SecurMode == 'wpaOnly')
			BeaconType = 'WPA';
		else if (SecurMode == 'wpa2Only')
			BeaconType = 'WPA2';
		else if (SecurMode == 'wpa1and2')
			BeaconType = 'WPA1WPA2';
		else//'None'
			BeaconType = 'OPEN';
		setText('hwlAuthMode', BeaconType);
		setText('Save_Flag', 1);
	}
}
function selChangedSSID()
{
	document.ConfigForm.SSID_Flag.value = "1";
	submitAsync("ConfigForm");
}
function autoWLAN_WDS_Active()
{
	if(document.ConfigForm.WDS_EncrypType_Selection != null){
		document.ConfigForm.WDS_EncrypType_Selection.disabled = false;
		document.ConfigForm.WDS_Key.disabled = false;
	}
	document.ConfigForm.WLANWDS_PEER_MAC1.disabled = false;
	document.ConfigForm.WLANWDS_PEER_MAC2.disabled = false;
	document.ConfigForm.WLANWDS_PEER_MAC3.disabled = false;
	document.ConfigForm.WLANWDS_PEER_MAC4.disabled = false;
}
function autoWLAN_WDS_Deactive()
{
	if(document.ConfigForm.WDS_EncrypType_Selection != null){
		document.ConfigForm.WDS_EncrypType_Selection.disabled = true;
		document.ConfigForm.WDS_Key.disabled = true;
	}
	document.ConfigForm.WLANWDS_PEER_MAC1.disabled = true;
	document.ConfigForm.WLANWDS_PEER_MAC2.disabled = true;
	document.ConfigForm.WLANWDS_PEER_MAC3.disabled = true;
	document.ConfigForm.WLANWDS_PEER_MAC4.disabled = true;
}
function autoWLAN_Flt_Active()
{
	if(document.ConfigForm.WLAN_FltAction != null){
		document.ConfigForm.WLAN_FltAction.disabled = false;
	}
	document.ConfigForm.WLANFLT_MAC1.disabled = false;
	document.ConfigForm.WLANFLT_MAC2.disabled = false;
	document.ConfigForm.WLANFLT_MAC3.disabled = false;
	document.ConfigForm.WLANFLT_MAC4.disabled = false;
	document.ConfigForm.WLANFLT_MAC5.disabled = false;
	document.ConfigForm.WLANFLT_MAC6.disabled = false;
	document.ConfigForm.WLANFLT_MAC7.disabled = false;
	document.ConfigForm.WLANFLT_MAC8.disabled = false;
}	
function autoWLAN_Flt_Deactive()
{
	if(document.ConfigForm.WLAN_FltAction != null){
		document.ConfigForm.WLAN_FltAction.disabled = true;
	}
	document.ConfigForm.WLANFLT_MAC1.disabled = true;
	document.ConfigForm.WLANFLT_MAC2.disabled = true;
	document.ConfigForm.WLANFLT_MAC3.disabled = true;
	document.ConfigForm.WLANFLT_MAC4.disabled = true;
	document.ConfigForm.WLANFLT_MAC5.disabled = true;
	document.ConfigForm.WLANFLT_MAC6.disabled = true;
	document.ConfigForm.WLANFLT_MAC7.disabled = true;
	document.ConfigForm.WLANFLT_MAC8.disabled = true;
}
function doHexCheck(c)
{
  if ((c >= "0")&&(c <= "9"))
  {
    return 1;
  }
  else if ((c >= "A")&&(c <= "F"))
  {
    return 1;
  }
  else if ((c >= "a")&&(c <= "f"))
  {
    return 1;
  }
  return -1;
}
function isNumeric(s)
{
  var len = s.length;
  var ch;
  if(len==0)
    return false;
  for( i=0; i< len; i++)
  {
    ch= s.charAt(i);
    if( ch > '9' || ch < '0')
    {
      return false;
    }
  }
  return true;
}
function checkRekeyinteral(value) 
{
	if (!isNumeric(value)) {
		ShowAdvanced = 0;
		showAdvanced(); /* Show before alert */
		alert("<%tcWebApi_get("String_Entry","WPAGroupintegerText","s")%>"); 
		return true;
	}
	if (value < 10 || value > 4194303) {
		ShowAdvanced = 0;
		showAdvanced(); /* Show before alert */
		alert("<%tcWebApi_get("String_Entry","WPAGrouprangeText","s")%>");
		return true;
	}	
	return false;
}
function checkDTIM(value) 
{
  if (!isNumeric(value)) {
	ShowAdvanced = 0;
	showAdvanced(); /* Show DTIM before alert */
    alert("<%tcWebApi_get("String_Entry","DTIMintegerText","s")%>: " + value);
    return true;
  }
  if (value < 1 || value > 255) {
	ShowAdvanced = 0;
	showAdvanced(); /* Show DTIM before alert */
    alert("<%tcWebApi_get("String_Entry","DTIMvalueText","s")%>");	
    return true;
	}	
	return false;
}
function checkBeacon(value) 
{
  if (!isNumeric(value)) {
	ShowAdvanced = 0;
	showAdvanced(); /* Show before alert */
    alert("<%tcWebApi_get("String_Entry","BeaconIntervalintegerText","s")%>");    
    return true;
  }
  if (value < 20 || value > 1000) {
	ShowAdvanced = 0;
	showAdvanced(); /* Show before alert */
    alert("<%tcWebApi_get("String_Entry","BeaconIntervalrangeText","s")%>");    
    return true;  	
  }
  return false;
}
function checkRTS(value) 
{
  if (!isNumeric(value)) {
	ShowAdvanced = 0;
	showAdvanced(); /* Show before alert */
    alert("<%tcWebApi_get("String_Entry","RTSThresholdintegerText","s")%>");    
    return true;
  }
  if (value < 1500 || value > 2347) {
	ShowAdvanced = 0;
	showAdvanced(); /* Show before alert */
    alert("<%tcWebApi_get("String_Entry","RTSThresholdrangeText","s")%>");    
    return true;  	
  }
  return false;
}
function checkFrag(value) 
{
  if (!isNumeric(value)) {
	ShowAdvanced = 0;
	showAdvanced(); /* Show before alert */
    alert("<%tcWebApi_get("String_Entry","FragmentThresholdintegerText","s")%>");    
    return true;
  }
  if (value < 256 || value > 2346) {
	ShowAdvanced = 0;
	showAdvanced(); /* Show before alert */
    alert("<%tcWebApi_get("String_Entry","FragmentThresholdrangeText","s")%>");    
    return true;  	
  }
  if (value % 2) {
	ShowAdvanced = 0;
	showAdvanced(); /* Show before alert */
    alert("<%tcWebApi_get("String_Entry","FragmentThresholdevenText","s")%>");    
    return true;  	
  }
  return false;
}
function doMACcheck(object)
{
  var szAddr = object.value;
  var len = szAddr.length;
  var errMsg = "Invalid MAC Address";
  if ( len == 0 )
  {
    object.value ="00:00:00:00:00:00";
    return false;
  }
  if ( len == 12 )
  {
    var newAddr = "";
    var i = 0;
    for ( i = 0; i < len; i++ )
    {
      var c = szAddr.charAt(i);
      if ( doHexCheck(c) < 0 )
      {
      	alert("Invalid MAC Address");        
        return true;
      }
      if ( (i == 2) || (i == 4) || (i == 6) || (i == 8) || (i == 10) )
        newAddr = newAddr + ":";
      newAddr = newAddr + c;
    }
    object.value = newAddr;
  }
  else if ( len == 17 )
  {
    var i = 2;
    var c0 = szAddr.charAt(0);
    var c1 = szAddr.charAt(1);
    if ( (doHexCheck(c0) < 0) || (doHexCheck(c1) < 0) )
    {
			alert("Invalid MAC Address");       	
			return true;
    }
    i = 2;
    while ( i < len )
    {
      var c0 = szAddr.charAt(i);
      var c1 = szAddr.charAt(i+1);
      var c2 = szAddr.charAt(i+2);  
      if ( (c0 != ":") || (doHexCheck(c1) < 0) || (doHexCheck(c2) < 0) )
      {
				alert("Invalid MAC Address");         	
				return true;
      }
      i = i + 3;
    }
  }
  else
  {
		alert("Invalid MAC Address");         	
		return true;
  }
  return false;
}
function showAdvanced() {
	if (ShowAdvanced == 0) {
		$("#adv-div-1").show();
		$("#adv-div-2").show();
		if ($("#wlSecurMode").val() != "None") {
			$("#wlWPARekeyInter").show();
		}
		ShowAdvanced = 1;
	}
	else {
		$("#adv-div-1").hide();
		$("#adv-div-2").hide();
		$("#wlWPARekeyInter").hide();
		ShowAdvanced = 0;
	}
}
function doResetOOB(){
	document.ConfigForm.WpsOOB.value = 1;
	<% if tcwebApi_get("WebCustom_Entry", "isMultiSupported", "h") = "Yes" then %>	
	top.getWlanWpsTimerCount = top.maxWlanWpsTimerCount;
	<% end if %>
	submitAsync("ConfigForm");
}
</script>
	</head>
	<body onload="showUI();" class="container">
<header class="fixed-top"><nav id="top-nav" class="navbar navbar-expand-lg container"><a class="navbar-brand " href="/cgi-bin/home.asp"><div><img src="/img/logo_home.png" width="100" height="18" alt=""><div style="font-family: sans-serif; font-weight: bold;font-size: 12px;color: #000; margin-top: 0">OPTICAL NETWORK TERMINATION</div></div></a><button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"><em class="fas fa-align-justify"></em></span></button><div class="collapse navbar-collapse" id="navbarCollapse"><ul class="navbar-nav mr-auto sidenav" id="navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/home.asp"><%tcWebApi_get("String_Entry","NavigationHomeText","s")%><span class="sr-only"></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/deviceinfo.asp"><%tcWebApi_get("String_Entry","NavigationStatusDeviceText","s")%><span class="sr-only"></span></a></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#status-menu" aria-controls="status-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NavigationStatusStatisticsText","s")%></a><ul class="nav-second-level collapse" id="status-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/sta-statistics.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationTrafficText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/sta-wifiusers.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationStatusUsersText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/sta-users.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","ARPStatusText","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#network-menu" aria-controls="network-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NAVNetwork","s")%></a><ul class="nav-second-level collapse" id="network-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/net-wan.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationBasInternetText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/net-lan.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationBasLANText","s")%></span></a></li></ul></li><li class="nav-item active"><a class="nav-link nav-link-collapse nav-link-show" href="#" id="hasSubItems" data-toggle="collapse" data-target="#wifi-menu" aria-controls="wifi-menu" aria-expanded="true"><%tcWebApi_get("String_Entry","NAVWifi","s")%></a><ul class="nav-second-level show" id="wifi-menu" data-parent="#navAccordion"><li class="nav-item active"><a class="nav-link" href="/cgi-bin/wifi.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationWiFiSettingsText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/wifi-11ac.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationWiFi11acSettingsText","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#firewall-menu" aria-controls="firewall-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NavigationAdvFirewallText","s")%></a><ul class="nav-second-level collapse" id="firewall-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-spi.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","ContentFirewallText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-urlfilter.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","FILTERTYPE_index2","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-macfilter.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVL2Filter","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-parentalcontrol.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","ParentalControlText","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#apps-menu" aria-controls="apps-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NAVApplication","s")%></a><ul class="nav-second-level collapse" id="apps-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-dmz.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NatTopDMZText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-portforwarding.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NatVirsvrText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-sslim.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","SessionLimit","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-route.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","StaticRouteText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-ddns.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","dyDNS1Text","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#tools-menu" aria-controls="tools-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NavigationMaintenanceText","s")%></a><ul class="nav-second-level collapse" id="tools-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-admin.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationMainAdminText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-time.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVSysTime","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-firmware.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationMainFirmwareText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-config.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVConfig","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-diagnostic.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationMainDiagnosticsText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-log.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVLogs","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-reboot.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","RebootText","s")%></span></a></li></ul></li></ul><div class="top-item-groups"><form name="LanguageForm" method="POST" action="/cgi-bin/wifi.asp" class="nav-item dropdown"><input type="hidden" name="TokenString" value="<%tcWebApi_getToken()%>"><input type="hidden" name="Language_Flag" value="<% tcWebApi_get("LanguageSwitch_Entry","Type","s") %>"><a class="nav-link dropdown-toggle" href="#" id="LanguageDropdown" role="button" data-toggle="dropdown" aria-expanded="false"><% tcWebApi_get("String_Entry","LoginLanguage","s") %></a><ul class="dropdown-menu" aria-labelledby="LanguageDropdown"><li><a class="dropdown-item <% if tcWebApi_get("LanguageSwitch_Entry","Type","h") = "1" then asp_Write("active") end if %>" href="#" onclick="submitLanguageForm(1);"><% tcWebApi_get("String_Entry","LanguageVIELong","s") %></a></li><li><a class="dropdown-item <% if tcWebApi_get("LanguageSwitch_Entry","Type","h") = "2" then asp_Write("active") end if %>" href="#" onclick="submitLanguageForm(2);"><% tcWebApi_get("String_Entry","LanguageENGLong","s") %></a></li></ul></form><div id="signout" class="nav-item"><a class="nav-link" href="javascript:doLogout();"><em class="fa fa-sign-out-alt"></em><span class="nav-link-text"><% tcWebApi_get("String_Entry","LogoutText","s") %></span></a></div></div></div></header></nav><% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then
	if tcWebApi_get("Mesh_Common", "DeviceRole", "h") = "2" then %>
		<script language='javascript'>
		document.getElementById("wifi-menu").children[0].style="display: none";
		document.getElementById("wifi-menu").children[1].style="display: none";
		</script>
<% end if end if %>		<div id="content">
			<form class="form-inline" METHOD="POST" ACTION="/cgi-bin/wifi.asp" name="ConfigForm" >
			<div class="row row-w-100">
			<input type="hidden" name="Save_Flag" value="0">
			<input type="hidden" name="TokenString" value="<%tcWebApi_getToken()%>">
			<INPUT TYPE="HIDDEN" ID="hCountryRegion" NAME="hCountryRegion" value="<% tcWebApi_get("WLan_Common","CountryRegion","s") %>" >	
			<INPUT TYPE="HIDDEN" ID="CountryName" NAME="CountryName" value="<% tcWebApi_get("WLan_Common","Country","s") %>" >	
			<INPUT TYPE="HIDDEN" ID="CountryChange" NAME="CountryChange" VALUE="0" >
			<INPUT TYPE="HIDDEN" ID="CountryRegion0" NAME="CountryRegion0" value="0" >	
			<INPUT TYPE="HIDDEN" ID="CountryRegion1" NAME="CountryRegion1" value="1" >	
			<INPUT TYPE="HIDDEN" ID="CountryRegion2" NAME="CountryRegion2" value="2" >	
			<INPUT TYPE="HIDDEN" ID="CountryRegion3" NAME="CountryRegion3" value="3" >		
			<INPUT TYPE="HIDDEN" ID="CountryRegion4" NAME="CountryRegion4" value="4" >	
			<INPUT TYPE="HIDDEN" ID="CountryRegion5" NAME="CountryRegion5" value="5" >
<% if tcWebApi_get("WLan_Common","rt_device","h") = "7615" then %>
			<INPUT TYPE="HIDDEN" NAME="WLanITxBfEn" value="<%tcWebApi_get("WLan_Common","ITxBfEn","s")%>">
			<INPUT TYPE="HIDDEN" NAME="WLanETxBfEnCond" value="<%tcWebApi_get("WLan_Common","ETxBfEnCond","s")%>">
			<INPUT TYPE="HIDDEN" NAME="WLanETxBfIncapable" value="<%tcWebApi_get("WLan_Common","ETxBfIncapable","s")%>">
<% end if %>
				<div class="widget col-xs-12 col-lg-12">
					<header><%tcWebApi_get("String_Entry","AccessPointSettingsText","s")%></header>
					<div class="widget-body">
						<fieldset>
							<div class="form-group" id="wlEnbl_div">
								<label class="col-lg-5" for="wlEnbl"><%tcWebApi_get("String_Entry","EnableWirelessText","s")%></label>
								<label class="toggle-switch">
									<input type="checkbox" name="wlEnbl" id="wlEnbl" onclick=wlClickEnble(this) value="ON">
									<span class="slider"></span>
								</label>
								<input type="hidden" id="hwlKeys0" name="hwlKeys0" value="0">
								<input type="hidden" id="hwlKeys1" name="hwlKeys1" value="0">
								<input type="hidden" id="hwlKeys2" name="hwlKeys2" value="0">
								<input type="hidden" id="hwlKeys3" name="hwlKeys3" value="0">
								<input type="hidden" id="hwlgMode" name="hwlgMode" value="0">
								<input type="hidden" id="hwlAuthMode" name="hwlAuthMode" value="0">
								<input type="hidden" id="hwlEnbl" name="hwlEnbl" value="0">
								<input type="hidden" id="hWPSMode" name="hWPSMode" value="0">
								<input type="hidden" id="henableSsid" name="henableSsid" value="0">
								<input type="hidden" id="hwlHide" name="hwlHide" value="0">
								<INPUT TYPE="hidden" id="isInWPSing" NAME="isInWPSing" value="<%If TCWebApi_get("Info_WLan","wlanWPStimerRunning","h") <> "N/A" then tcWebApi_get("Info_WLan","wlanWPStimerRunning","s") else asp_write("0") end if%>">
								<INPUT TYPE="HIDDEN" id="WpsConfModeAll" NAME="WpsConfModeAll" value="7">
								<INPUT TYPE="HIDDEN" id="WpsConfModeNone" NAME="WpsConfModeNone" value="0">
								<INPUT TYPE="hidden" id="hWpsStart" NAME="hWpsStart" value="0">
								<INPUT TYPE="hidden" id="WpsOOB" NAME="WpsOOB" value="0">
								<INPUT TYPE="hidden" id="WpsGenerate" NAME="WpsGenerate" value="0">
								<INPUT TYPE="hidden" id="isCUCSupport" NAME="isCUCSupport" value="<%if tcWebApi_get("Info_WLan","isCUCSupport","h")="Yes" then asp_write("1") else asp_write("0") end if%>">
								<INPUT type="hidden" id="SSIDPre" NAME="SSIDPre" value="<%tcWebApi_get("WLan_Common","SSIDPre","s")%>">			
								<INPUT type="HIDDEN" NAME="isDot1XSupported" value="<% if tcWebApi_get("Info_WLan","isDot1XSupported","h") = "Yes" then asp_write("1") else asp_write("0") end if %>">
								<INPUT type="HIDDEN" NAME="isDot1XEnhanceSupported" value="<% if tcWebApi_get("Info_WLan","isDot1XEnhanceSupported","h") = "Yes" then asp_write("1") else asp_write("0") end if %>">	
								<INPUT TYPE="HIDDEN" ID="isWDSSupported" NAME="isWDSSupported" value="0" >
								<INPUT TYPE="HIDDEN" ID="WDS_EncrypType_NONE" NAME="WDS_EncrypType_NONE" value="NONE" >
									<INPUT TYPE="HIDDEN" ID="WDS_EncrypType_WEP" NAME="WDS_EncrypType_WEP" value="WEP" >
							</div>
							<div class="form-group col-lg-12" id="bandsteeringnote_div" style="display: none;">
								<label class=" input-description">
								<% if tcWebApi_get("WebCurSet_Entry","wlan_id","h") = "0" then %>
									<p><%tcWebApi_get("String_Entry","BandSteeringNote1Text","s")%>&nbsp;<a href="/cgi-bin/home.asp"><%tcWebApi_get("String_Entry","NavigationHomeText","s")%></a>.</p>
								<% else %>
									<p><%tcWebApi_get("String_Entry","BandSteeringNote2Text","s")%>&nbsp;<a href="/cgi-bin/home.asp"><%tcWebApi_get("String_Entry","NavigationHomeText","s")%></a>.</p>
								<% end if %>
								</label>
							</div>
						</fieldset>
						<fieldset id="wlInfo">
							<div class="form-group" id="div_gMode">
								<label class="col-lg-5" for=""><%tcWebApi_get("String_Entry","ModeText","s")%></label>
								<div class="col-lg-5 custom-select">
									<SELECT onchange=gModeChange() size=1 id=wlgMode name=wlgMode>
										<OPTION value=b>802.11b
										<OPTION value=g>802.11g
										<OPTION value=n>802.11n
										<OPTION value=b,g>802.11b/g
										<OPTION value=g,n>802.11g/n
										<OPTION value=b,g,n selected>802.11b/g/n</OPTION>
	                          		</SELECT>
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-5" for=""><%tcWebApi_get("String_Entry","SelectChannelText","s")%></label>
								<div class="col-lg-5 custom-select">
									<SELECT ID="Countries_Channels" NAME="Countries_Channels" SIZE="1" onChange="doRegionCheck()" >
										<SCRIPT language=javascript >
											var countryarr = new Array(98);
											countryarr[0]="ALBANIA";
											countryarr[1]="ALGERIA";
											countryarr[2]="ARGENTINA";
											countryarr[3]="ARMENIA";
											countryarr[4]="AUSTRALIA";
											countryarr[5]="AUSTRIA";
											countryarr[6]="AZERBAIJAN";
											countryarr[7]="BAHRAIN";
											countryarr[8]="BELARUS";
											countryarr[9]="BELGIUM";
											countryarr[10]="BELIZE";
											countryarr[11]="BOLIVIA";
											countryarr[12]="BRAZIL";
											countryarr[13]="BRUNEI DARUSSALAM";
											countryarr[14]="BULGARIA";
											countryarr[15]="CANADA";
											countryarr[16]="CHILE";
											countryarr[17]="CHINA";
											countryarr[18]="COLOMBIA";
											countryarr[19]="COSTA RICA";
											countryarr[20]="CROATIA";
											countryarr[21]="CYPRUS";
											countryarr[22]="CZECH REPUBLIC";
											countryarr[23]="DENMARK";
											countryarr[24]="DOMINICAN REPUBLIC";
											countryarr[25]="ECUADOR";
											countryarr[26]="EGYPT";
											countryarr[27]="ELSALVADOR";
											countryarr[28]="FINLAND";
											countryarr[29]="FRANCE";
											countryarr[30]="GEORGIA";
											countryarr[31]="GERMANY";
											countryarr[32]="GREECE";
											countryarr[33]="GUATEMALA";
											countryarr[34]="HONDURAS";
											countryarr[35]="HONGKONG";
											countryarr[36]="HUNGARY";
											countryarr[37]="ICELAND";
											countryarr[38]="INDIA";
											countryarr[39]="INDONESIA";
											countryarr[40]="IRAN";
											countryarr[41]="IRELAND";
											countryarr[42]="ISRAEL";
											countryarr[43]="ITALY";
											countryarr[44]="JAPAN";
											countryarr[45]="KAZAKHSTAN";
											countryarr[46]="KOREA DEMOCRATIC";
											countryarr[47]="KOREA REPUBLIC";
											countryarr[48]="LATVIA";
											countryarr[49]="LEBANON";
											countryarr[50]="LIECHTENSTEIN";
											countryarr[51]="LITHUANIA";
											countryarr[52]="LUXEMBOURG";
											countryarr[53]="MACAU";
											countryarr[54]="MACEDONIA";
											countryarr[55]="MALAYSIA";
											countryarr[56]="MEXICO";
											countryarr[57]="MONACO";
											countryarr[58]="MOROCCO";
											countryarr[59]="NETHERLANDS";
											countryarr[60]="NEW ZEALAND";
											countryarr[61]="NORWAY";
											countryarr[62]="OMAN";
											countryarr[63]="PAKISTAN";
											countryarr[64]="PANAMA";
											countryarr[65]="PERU";
											countryarr[66]="PHILIPPINES";
											countryarr[67]="POLAND";
											countryarr[68]="PORTUGAL";
											countryarr[69]="PUERTO RICO";
											countryarr[70]="QATAR";
											countryarr[71]="ROMANIA";
											countryarr[72]="RUSSIA";
											countryarr[73]="SAUDI ARABIA";
											countryarr[74]="SINGAPORE";
											countryarr[75]="SLOVAKIA";
											countryarr[76]="SLOVENIA";
											countryarr[77]="SOUTH AFRICA";
											countryarr[78]="SPAIN";
											countryarr[79]="SWEDEN";
											countryarr[80]="SWITZERLAND";
											countryarr[81]="SYRIAN ARAB REPUBLIC";
											countryarr[82]="TAIWAN";
											countryarr[83]="THAILAND";
											countryarr[84]="TRINIDAD AND TOBAGO";
											countryarr[85]="TUNISIA";
											countryarr[86]="TURKEY";
											countryarr[87]="UKRAINE";
											countryarr[88]="UNITED ARAB EMIRATES";
											countryarr[89]="UNITED KINGDOM";
											countryarr[90]="UNITED STATES";
											countryarr[91]="URUGUAY";
											countryarr[92]="UZBEKISTAN";
											countryarr[93]="VENEZUELA";
											countryarr[94]="VIETNAM";
											countryarr[95]="YEMEN";
											countryarr[96]="ZIMBABWE";
											countryarr[97]="Undefined";
											for(i=0;i<98;i++)
											{
												if(document.ConfigForm.CountryName.value.match(countryarr[i]) != null)
												{
													document.ConfigForm.Countries_Channels[i]=new Option(countryarr[i],countryarr[i],false,true);
													document.ConfigForm.Countries_Channels[i].selected=true;
												}
												else
												{
													if(countryarr[i].match("TAIWAN") !=null){
														document.ConfigForm.Countries_Channels[i]=new Option(countryarr[i],countryarr[i],true,false);
													}
													else
													{
														document.ConfigForm.Countries_Channels[i]=new Option(countryarr[i],countryarr[i],false,false);
														document.ConfigForm.Countries_Channels[i].selected=false;
													}
												}
											}	
										</SCRIPT>				
									</SELECT> 
								</div>
								&nbsp;
								<div class="col-lg-1 custom-select <% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then asp_write("d-none") end if%> ">
									<SELECT ID="wlChannel" NAME="wlChannel" SIZE="1" onChange="ChannelChange()" ></SELECT>
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-5" for="CurrentChannel"><%tcWebApi_get("String_Entry","CurrentChannelText","s")%></label>
<% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then %>
								<INPUT class="form-control col-lg-5" TYPE="TEXT" ID="CurrentChannel" NAME="CurrentChannel" STYLE="WIDTH:62" MAXLENGTH="2" VALUE="<% If tcWebApi_get("Info_WLan","CurrentChannel","h") <> "N/A" then tcWebApi_get("Info_WLan","CurrentChannel","s") end if %>" disabled >
<% else %>
<% if tcWebApi_get("WLan_Common","Channel","h") = "0" then %>
								<INPUT class="form-control col-lg-5" TYPE="TEXT" ID="CurrentChannel" NAME="CurrentChannel" STYLE="WIDTH:62" MAXLENGTH="2" VALUE="<% If tcWebApi_get("Info_WLan","CurrentChannel","h") <> "N/A" then tcWebApi_get("Info_WLan","CurrentChannel","s") end if %>" disabled >
<% else %>
								<INPUT class="form-control col-lg-5" TYPE="TEXT" ID="CurrentChannel_Common" NAME="CurrentChannel" STYLE="WIDTH:62" MAXLENGTH="2" VALUE="<% If tcWebApi_get("WLan_Common","Channel","h") <> "N/A" then tcWebApi_get("WLan_Common","Channel","s") end if %>" disabled >
<% end if %>
<% end if %>
							</div>
							<div class="form-group d-none" id=wlTransferRate>
								<label class="col-lg-5" for="wlRate"><%tcWebApi_get("String_Entry","RateText","s")%></label>
								<div class="col-lg-5 custom-select">
									<SELECT ID="wlRate" NAME="wlRate" SIZE="1" ></SELECT>
								</div>
							</div>
							<div class="form-group" id=11NbwControl>
								<label class="col-lg-5" for="bwControl"><%tcWebApi_get("String_Entry","BandwidthText","s")%></label>
								<div class="col-lg-5 custom-select">
									<SELECT id=bwControl style="WIDTH: 123px" onchange=loadMCSList() size=1 id=bwControl name=bwControl> 
										<OPTION value=0 selected>20 MHz</OPTION> 
										<OPTION value=2>40 MHz</OPTION>
										<OPTION value=1>20/40 MHz</OPTION>
									</SELECT>
								</div>
							</div>
							<div class="form-group" id=11NgiControl style="display:none">
								<label class="col-lg-5" for="giControl"><%tcWebApi_get("String_Entry","ProtectIntervalText","s")%></label>
								<div class="col-lg-5 custom-select">
									<SELECT id=giControl style="WIDTH: 123px" onchange=loadMCSList() size=1 name=giControl>
										<OPTION value=0 selected>Long</OPTION>
                          				<OPTION value=1>Short</OPTION>
                      				</SELECT>
								</div>
							</div>
							<div id="adv-div-1" style="display: none;">
							<div class="form-group" id=wlPutOutPower>
								<label class="col-lg-5" for="wlTxPwr"><%tcWebApi_get("String_Entry","TransmittedPowerText","s")%></label>
								<div class="col-lg-5 custom-select">
									<SELECT style="WIDTH: 123px" size=1 id=wlTxPwr name=wlTxPwr> 
										<OPTION value=3 <% if tcWebApi_get("WLan_Common","TxPower","h") = "25" then asp_Write("selected") end if %>>25%</OPTION> 
										<OPTION value=2 <% if tcWebApi_get("WLan_Common","TxPower","h") = "50" then asp_Write("selected") end if %>>50%</OPTION>
										<OPTION value=1 <% if tcWebApi_get("WLan_Common","TxPower","h") = "75" then asp_Write("selected") end if %>>75%</OPTION> 
										<OPTION value=6 <% if tcWebApi_get("WLan_Common","TxPower","h") = "100" then asp_Write("selected") end if %>>100%</OPTION>
									</SELECT>
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-5" for="DTIM"><%tcWebApi_get("String_Entry","DTIMIntervalText","s")%></label>
								<INPUT class="form-control col-lg-3" TYPE="TEXT" ID="DTIM" NAME="DTIM" STYLE="WIDTH:62" MAXLENGTH="5" VALUE="<% If tcWebApi_get("WLan_Common","DtimPeriod","h") <> "N/A" then tcWebApi_get("WLan_Common","DtimPeriod","s") else asp_Write("1") end if %>" >&nbsp;
								(<%tcWebApi_get("String_Entry","RangeText","s")%> 1~255)
							</div>
							<div class="form-group">
								<label class="col-lg-5" for="BeaconInterval"><%tcWebApi_get("String_Entry","WlanBeaconIntervalText","s")%></label>
								<INPUT class="form-control col-lg-3" TYPE="TEXT" ID="BeaconInterval" NAME="BeaconInterval" STYLE="WIDTH:62" MAXLENGTH="4" VALUE="<% If tcWebApi_get("WLan_Common","BeaconPeriod","h") <> "N/A" then tcWebApi_get("WLan_Common","BeaconPeriod","s") else asp_Write("100") end if %>">&nbsp;
								(<%tcWebApi_get("String_Entry","BeaconRangeTipText","s")%>)
							</div>
							<div class="form-group">
								<label class="col-lg-5" for="RTSThreshold"><%tcWebApi_get("String_Entry","WlanRTSThresholdText","s")%></label>
								<INPUT class="form-control col-lg-3" TYPE="TEXT"  ID="RTSThreshold" NAME="RTSThreshold" STYLE="WIDTH:62" MAXLENGTH="5" VALUE="<% If tcWebApi_get("WLan_Common","RTSThreshold","h") <> "N/A" then tcWebApi_get("WLan_Common","RTSThreshold","s") else asp_Write("2347") end if %>">&nbsp;
								(<%tcWebApi_get("String_Entry","RTSrangeTipText","s")%>)
							</div>
							<div class="form-group">
								<label class="col-lg-5" for="FragmentThreshold"><%tcWebApi_get("String_Entry","WlanFragmentThresholdText","s")%></label>
								<INPUT class="form-control col-lg-3" TYPE="TEXT"  ID="FragmentThreshold" NAME="FragmentThreshold" STYLE="WIDTH:62" MAXLENGTH="5" VALUE="<% If tcWebApi_get("WLan_Common","FragThreshold","h") <> "N/A" then tcWebApi_get("WLan_Common","FragThreshold","s") else asp_Write("2346") end if %>">&nbsp;
								(<%tcWebApi_get("String_Entry","FragmentRangeTipText","s")%>)
							</div>
<% if tcWebApi_get("WLan_Common","rt_device","h") = "7615" Then %> 
<% if tcWebApi_get("Info_WLan","isMT7615DSupported","h") <> "Yes" then %>
							<div class="form-group" id=trTx Beamforming>
								<label class="col-lg-5" for="WLanTxBeamForming"><%tcWebApi_get("String_Entry","FixTransmissionText","s")%></label>
								<div class="col-lg-5 custom-select">
									<SELECT style="WIDTH: 123px" NAME="WLanTxBeamForming" id="WLanTxBeamForming">
										<option value="3">Both</option>
										<option value="2">Explicit TxBF</option>
										<option value="1">Implicit TxBF</option>
										<option value="0">Disable</option>
									</SELECT>
								</div>
							</div>
<% end if %>
<% end if %>
							</div>
						</fieldset>
					</div>
					<header id="ssid-header"><%tcWebApi_get("String_Entry","SSIDSettingsText","s")%></header>
					<div class="widget-body" id="ssid-widget">
						<fieldset>
							<div class="form-group" id=trSSID>
								<label class="col-lg-5" for="wlSsidIdx"><%tcWebApi_get("String_Entry","IndexText","s")%></label>
								<div class="col-lg-5 custom-select">
									<SELECT style="WIDTH: 123px" onchange="selChangedSSID()" size=1 id=wlSsidIdx name=wlSsidIdx></SELECT>
									<input type="hidden" id="SSID_Flag" name="SSID_Flag" value="0">
								</div>
							</div>
							<div class="form-group" id="enableSsid_div">
								<label class="col-lg-5" for="enableSsid"><%tcWebApi_get("String_Entry","EnableSSIDText","s")%></label>
								<label class="toggle-switch">
									<INPUT type=checkbox id=enableSsid name=enableSsid>
									<span class="slider"></span>
								</label>
							</div>
							<div class="form-group">
								<label class="col-lg-5" for="wlSsid">SSID</label>
								<INPUT class="form-control col-lg-5" size=10 id=wlSsid name=wlSsid MAXLENGTH="32">
							</div>
							<div class="form-group">
								<label class="col-lg-5" for="wlHide"><%tcWebApi_get("String_Entry","CancelBroadcastText","s")%></label>
								<label class="toggle-switch">
									<INPUT type=checkbox value=ON onClick="doBroadcastSSIDChange();" id=wlHide name=wlHide>
									<span class="slider"></span>
								</label>
							</div>
							<div class="form-group d-none" id=11NmcsControl>
								<label class="col-lg-5" for="wlMcs"><%tcWebApi_get("String_Entry","RateText","s")%></label>
								<div class="col-lg-5 custom-select">
									<SELECT style="WIDTH: 123px" size=1 id=wlMcs  name=wlMcs></SELECT>
								</div>
							</div>
							<div class="form-group" id="adv-div-2" style="display: none;">
								<label class="col-lg-5" for="wlAssociateNum"><%tcWebApi_get("String_Entry","ConnectDeviceText","s")%></label>
								<INPUT class="form-control col-lg-5" size=10 name=wlAssociateNum value="<%tcWebApi_get("WLan_Entry","MaxStaNum","s")%>">
								<label class="offset-lg-5 input-description">(<%tcWebApi_get("String_Entry","RangeText","s")%> 1~32)</label>
							</div>
							<DIV id=authen>
							<div class="form-group" id=>
								<label class="col-lg-5" for="wlSecurMode"><%tcWebApi_get("String_Entry","WirelessAuthTypeText","s")%></label>
								<div class="col-lg-5 custom-select">
									<SELECT style="WIDTH: 160px" onchange=authModeChange(0) size=1 id=wlSecurMode name=wlSecurMode> 
                          			</SELECT>
								</div>
							</div>
							<div class="form-group" id=Preauth>
								<label class="col-lg-5" for="wlPreauth">WPA2 <%tcWebApi_get("String_Entry","PreCertificationText","s")%></label>
								<div class="col-lg-5 custom-select">
									<SELECT style="WIDTH: 123px" size=1 id=wlPreauth name=wlPreauth>
										<OPTION value=off selected>Disabled</OPTION>
										<OPTION value=on>Enabled</OPTION>
									</SELECT>
								</div>
							</div>
							<div class="form-group" id=NetReauth>
								<label class="col-lg-5" for="wlNetReauth"><%tcWebApi_get("String_Entry","RecertificationIntervalText","s")%></label>
								<INPUT class="form-control col-lg-7" maxLength=10 name=wlNetReauth value="<%if TCWebApi_get("WLan_Common","DtimPeriod","h") <> "N/A" then TCWebApi_get("WLan_Common","DtimPeriod","s") end if%>">
							</div>
							<div class="form-group" id=wpaPreShareKey>
								<label class="col-lg-5" for="wlWpaPsk"><%tcWebApi_get("String_Entry","PasswordText","s")%></label>
								<div class="input-group col-lg-5 px-0">
									<input class="form-control" id=wlWpaPsk type=password maxLength=63 name=wlWpaPsk value="<%if tcWebApi_get("WLan_Entry","WPAPSK","h") <> "N/A" then tcWebApi_get("WLan_Entry","WPAPSK","s") end if%>">
									<div class="input-group-addon show-password-btn">
										<a href="#" id="pw-eye"><i class="fa fa-eye-slash" aria-hidden="true"></i></a>
									</div>
								</div>
								<!-- <label class="offset-lg-5 input-description">(8~63<%tcWebApi_get("String_Entry","CharactersOr64StringText","s")%>)</label>-->
							</div>
							<div class="form-group" id=wpaGTKRekey style="DISPLAY: none">
								<label class="col-lg-5" for="wlWpaGtkRekey">WPA <%tcWebApi_get("String_Entry","PiarKeyText","s")%></label>
								<INPUT class="form-control col-lg-7" maxLength=10 id=wlWpaGtkRekey name=wlWpaGtkRekey>
							</div>
							<DIV id=wlRadius>
								<div class="form-group">
									<label class="col-lg-5" for="radiusSVR_IP"><%tcWebApi_get("String_Entry","RadiusServiceIPText","s")%></label>
									<INPUT class="form-control col-lg-7" name="radiusSVR_IP" type="text" value="<% if tcWebApi_get("WLan_Entry","RADIUS_Server","h") <> "N/A" then tcWebApi_get("WLan_Entry","RADIUS_Server","s") end if %>" size="20" maxlength="15">
								</div>
								<div class="form-group">
									<label class="col-lg-5" for="radiusSVR_Port"><%tcWebApi_get("String_Entry","RadiusServicePortText","s")%></label>
									<INPUT class="form-control col-lg-7" name="radiusSVR_Port" type="text" value="<% if tcWebApi_get("WLan_Entry","RADIUS_Port","h") <> "N/A" then tcWebApi_get("WLan_Entry","RADIUS_Port","s") end if %>" size="8" maxlength="5">
								</div>
								<div class="form-group">
									<label class="col-lg-5" for="radiusSVR_Key"><%tcWebApi_get("String_Entry","RadiusSharedSecretText","s")%></label>
									<INPUT class="form-control col-lg-7" name="radiusSVR_Key" type="text" value="<% if tcWebApi_get("WLan_Entry","RADIUS_Key","h") <> "N/A" then tcWebApi_get("WLan_Entry","RADIUS_Key","s") end if %>" size="20" maxlength="63">
								</div>
<% if tcWebApi_get("Info_WLan","isDot1XEnhanceSupported","h") = "Yes" then %>
								<div class="form-group">
									<label class="col-lg-5" for="bakradiusSVR_IP"><%tcWebApi_get("String_Entry","BackUpServiceIPText","s")%></label>
									<INPUT class="form-control col-lg-7" name="bakradiusSVR_IP" type="text" value="<% if tcWebApi_get("WLan_Entry","BAK_RADIUS_Server","h") <> "N/A" then tcWebApi_get("WLan_Entry","BAK_RADIUS_Server","s") end if %>" size="20" maxlength="15">
								</div>
								<div class="form-group">
									<label class="col-lg-5" for="bakradiusSVR_Port"><%tcWebApi_get("String_Entry","BackUpServicePortText","s")%></label>
									<INPUT class="form-control col-lg-7"name="bakradiusSVR_Port" type="text" value="<% if tcWebApi_get("WLan_Entry","BAK_RADIUS_Port","h") <> "N/A" then tcWebApi_get("WLan_Entry","BAK_RADIUS_Port","s") end if %>" size="8" maxlength="5">
								</div>
								<div class="form-group">
									<label class="col-lg-5" for="bakradiusSVR_Key"><%tcWebApi_get("String_Entry","BackUpSharedSecretText","s")%></label>
									<INPUT class="form-control col-lg-7" name="bakradiusSVR_Key" type="text" value="<% if tcWebApi_get("WLan_Entry","BAK_RADIUS_Key","h") <> "N/A" then tcWebApi_get("WLan_Entry","BAK_RADIUS_Key","s") end if %>" size="20" maxlength="63">
								</div>
<% end if %>
								<div class="form-group">
									<label class="col-lg-5" for="radiusSVR_ReAuthInter"><%tcWebApi_get("String_Entry","ReAuthIntervalText","s")%></label>
									<INPUT class="form-control col-lg-5" name="radiusSVR_ReAuthInter" value="<% if tcWebApi_get("WLan_Common","session_timeout_interval","h") <> "N/A" then tcWebApi_get("WLan_Common","session_timeout_interval","s") end if %>" size="20" maxlength="63">&nbsp;seconds
								</div>
							</DIV>
							<DIV class="form-group" id=wlWPARekeyInter>
								<label class="col-lg-5" for="WPARekeyInter"><%tcWebApi_get("String_Entry","KeyRenwalText","s")%></label>
								<INPUT class="form-control col-lg-5" id="WPARekeyInter" name="WPARekeyInter" size="7" maxlength="7" onchange="checkRekeyinteral(this.value)">&nbsp;<%tcWebApi_get("String_Entry","SecondsText","s")%>
								<script language="JavaScript" type="text/JavaScript">
									var rekeystr = "<% tcWebApi_get("WLan_Entry","RekeyInterval","s") %>";
									if("N/A" == rekeystr || "" == rekeystr)
									{
										document.getElementById('WPARekeyInter').value = "3600";
									}						
									else
									{
										document.getElementById('WPARekeyInter').value = rekeystr;
									}
								</script>
							</DIV>
							<DIV class="form-group" id=wlWpaD>
								<label class="col-lg-5" for="wlWpa"><%tcWebApi_get("String_Entry","EncryptionText","s")%></label>
								<div class="col-lg-5 custom-select">
									<SELECT name=wlWpa id=wlWpa></SELECT> 
								</div>
							</DIV>
							<DIV class="form-group" id=wlWepD>
								<label class="col-lg-5" for="wlWep">WEP <%tcWebApi_get("String_Entry","CertificationText","s")%></label>
								<div class="col-lg-5 custom-select">
									<SELECT id=wlWep name=wlWep></SELECT> 
								</div>
							</DIV>
							<DIV id=keyInfo>
								<DIV class="form-group">
									<label class="col-lg-5" for="wlKeyBit"><%tcWebApi_get("String_Entry","EncryptionLengthText","s")%></label>
									<div class="col-lg-5 custom-select">
										<SELECT style="WIDTH: 83px" id=wlKeyBit onchange=wlKeyBitChange() size=1 id=wlKeyBit name=wlKeyBit> 
											<OPTION value=128 selected>128-bit</OPTION>
											<OPTION value=64>64-bit</OPTION>
										</SELECT>
									</div>
								</DIV>
								<DIV class="form-group">
									<label class="col-lg-5" for="wlKeyIndex"><%tcWebApi_get("String_Entry","CurentKeyIndexText","s")%></label>
									<div class="col-lg-5 custom-select">
										<SELECT style="WIDTH: 83px" size=1 id=wlKeyIndex name=wlKeyIndex></SELECT>
									</div>
								</DIV>
								<DIV class="form-group">
									<label class="col-lg-5" for="wlKeys1"><%tcWebApi_get("String_Entry","KeyText","s")%> 1</label>
									<INPUT class="form-control col-lg-4" maxLength=26 id=wlKeys1 name=wlKeys value="<%if tcWebApi_get("WLan_Entry","Key1Str","h") <> "N/A" then tcWebApi_get("WLan_Entry","Key1Str","s") end if%>">
									<label class="offset-lg-5 input-description font-italic" id=wlKeyBitTip><%tcWebApi_get("String_Entry","Enter2Text","s")%></label>
								</DIV>
								<DIV class="form-group">
									<label class="col-lg-5" for="wlKeys2"><%tcWebApi_get("String_Entry","KeyText","s")%> 2</label>
									<INPUT class="form-control col-lg-4" maxLength=26 id=wlKeys2 name=wlKeys value="<%if tcWebApi_get("WLan_Entry","Key2Str","h") <> "N/A" then tcWebApi_get("WLan_Entry","Key2Str","s") end if%>">
								</DIV>
								<DIV class="form-group">
									<label class="col-lg-5" for="wlKeys3"><%tcWebApi_get("String_Entry","KeyText","s")%> 3</label>
									<INPUT class="form-control col-lg-4" maxLength=26 id=wlKeys3 name=wlKeys value="<%if tcWebApi_get("WLan_Entry","Key3Str","h") <> "N/A" then tcWebApi_get("WLan_Entry","Key3Str","s") end if%>">
								</DIV>
								<DIV class="form-group">
									<label class="col-lg-5" for="wlKeys4"><%tcWebApi_get("String_Entry","KeyText","s")%> 4</label>
									<INPUT class="form-control col-lg-4" maxLength=26 id=wlKeys4 name=wlKeys value="<%if tcWebApi_get("WLan_Entry","Key4Str","h") <> "N/A" then tcWebApi_get("WLan_Entry","Key4Str","s") end if%>">
								</DIV>
							</DIV>
							<DIV id=wpsinfo style="display:none">
								<div class="form-group" id="wpsenableTR">
									<label class="col-lg-5" for="enableWps"><%tcWebApi_get("String_Entry","WPSEnableText","s")%></label>
									<label class="toggle-switch">
										<INPUT type=checkbox id=enableWps name=enableWps <%if tcWebApi_get("WLan_Entry","WPSConfMode","h") <> "0" then asp_Write("checked") end if%> onclick="doWPSUseChange()">
										<span class="slider"></span>
										<INPUT TYPE="hidden" id="WpsActive" NAME="WpsActive" value="0">
									</label>
								</div>
								<div class="form-group d-none" id=wpsmodeTR style="display: none">
									<label class="col-lg-5" for="wpsmode">WPS <%tcWebApi_get("String_Entry","ModeText","s")%></label>
									<div class="col-lg-5 custom-select">
										<SELECT id=wpsmode style="WIDTH: 123px" onchange=wpsModeChange() size=1 name=wpsmode>
											<OPTION value=ap-pbc <%if tcWebApi_get("WLan_Entry","WPSMode","h") = "1" then asp_Write("selected") end if%>>PBC</OPTION>
											<OPTION value=ap-pin <%if tcWebApi_get("WLan_Entry","WPSMode","h") = "0" then asp_Write("selected") end if%>>PIN</OPTION>
										</SELECT>
									</div>
								</div>
								<div class="d-none">
									<div class="form-group" id="pinGenerate">
										<label class="col-lg-5" for="pin_generate">AP self PIN code</label>
										<% tcWebApi_get("Info_WLan", "wlanSelfPinCode", "s") %>&nbsp;&nbsp;
										<input type="button" id="pin_generate" name="pin_generate" value="Generate" onClick="doGenerate()">
									</div>
									<div class="form-group" id="pinval">
										<label class="col-lg-5" for="pinvalue">enrollee PIN code</label>
										<input class="form-control col-lg-5" id="pinvalue" name="pinvalue" size="9" maxlength="9" value="<% If tcWebApi_get("WLan_Entry","enrolleePinCode","h") = "N/A" then asp_Write("") else TCWebApi_get("WLan_Entry","enrolleePinCode","s") end if %>" type="text">
									</div>
								</div>
								<div class="form-group" id=wpssta style="display: none">
									<label class="col-lg-5" for="wpsmode"><%tcWebApi_get("String_Entry","WPSStatusText","s")%></label>
									<% if tcwebApi_get("WebCustom_Entry","isMultiSupported","h") = "Yes" then %>
									<p id="WPSProcess" name="WPSProcess" ><% if tcWebApi_get("Info_WLan", "wlanWPSStatus_0", "h") = "Idle" then asp_Write("Idle")
										elseif tcWebApi_get("Info_WLan", "wlanWPSStatus_0", "h") = "In progress" then asp_Write("Inprogress")
										elseif tcWebApi_get("Info_WLan", "wlanWPSStatus_0", "h") = "Configured" then asp_Write("Configured")
										elseif tcWebApi_get("Info_WLan", "wlanWPSStatus_0", "h") = "WPS process Fail" then asp_Write("WPS process Fail") 
										else tcWebApi_get("Info_WLan", "wlanWPSStatus_0", "s") end if %></p>
									<% else %>
									<label class="col-lg-5 status-value "><% if tcWebApi_get("Info_WLan", "wlanWPSStatus_0", "h") = "Idle" then asp_Write("Idle")
										elseif tcWebApi_get("Info_WLan", "wlanWPSStatus_0", "h") = "In progress" then asp_Write("Inprogress")
										elseif tcWebApi_get("Info_WLan", "wlanWPSStatus_0", "h") = "Configured" then asp_Write("Configured")
										elseif tcWebApi_get("Info_WLan", "wlanWPSStatus_0", "h") = "WPS process Fail" then asp_Write("WPS process Fail")
										else tcWebApi_get("Info_WLan", "wlanWPSStatus_0", "s") end if%></label>
									<% end if %>
								</div>
								<div class="form-group" id="ResetOOB" style="display: none">
									<div class="d-none d-lg-block col-lg-5"></div>
									<% if tcwebApi_get("WebCustom_Entry", "isMultiSupported", "h") = "Yes" then %>
										<input class="btn small-button btn-secondary" name="btnStartWPS" value="Start WPS" onClick="doStartWPS();" type="button"> 
									<% else %>
									<input class="btn small-button btn-secondary" id="btnStartWPS" name="btnStartWPS" value="<%IF tcWebApi_get("Info_WLan","wlanWPStimerRunning","h") = "0" then asp_Write("Start WPS") end if%> <%IF tcWebApi_get("Info_WLan","wlanWPStimerRunning","h") = "1" then asp_Write("Stop WPS") end if%><%IF tcWebApi_get("Info_WLan","wlanWPStimerRunning","h") = "N/A" then asp_Write("Start WPS") end if%>" onClick="doStartWPS();" type="button">
									<% end if %>
									<!-- <input class="btn small-button btn-secondary" name="ResetOOB" value="Reset to OOB" onclick="doResetOOB();" type="button" > -->
								</div>
							</DIV>
							</DIV>
							<!-- <DIV id=wlUserTip><FONT color=red><%tcWebApi_get("String_Entry","PromotText","s")%></FONT> 
							<BR>&nbsp;&nbsp;&nbsp;&nbsp;<%tcWebApi_get("String_Entry","ModeIsNoneText","s")%>
							<BR>&nbsp;&nbsp;&nbsp;&nbsp;<%tcWebApi_get("String_Entry","RandomAccessText","s")%>
							<BR>&nbsp;&nbsp;&nbsp;&nbsp;<%tcWebApi_get("String_Entry","NotUseText","s")%></DIV>
<% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then %>
							<DIV id="wlMeshTip">
								<p>&nbsp;&nbsp;&nbsp;&nbsp;<%tcWebApi_get("String_Entry","HintOpenEasyMeshText1","s")%></p>
							</DIV>
<% end if %>
						-->
						</fieldset>
					</div>
				<div class="col-lg-12 d-flex align-items-center justify-content-center">
					<button id="btnADV" type="button" class="action-button small-button" onclick="showAdvanced();"><%tcWebApi_get("String_Entry","ButtonAdvancedText","s")%></button>
					<button id="btnOK" type="button" class="page-button small-button" onclick="doSubmit();"><%tcWebApi_get("String_Entry","ButtonApplyText","s")%></button>
				</div>
			</div>
			</div>
			</form>
		</div>
<script language="JavaScript">
	var enableOpenFlag = "<%tcWebApi_get("dynCwmpAttr_Entry","aSSIDEnable","s")%>";
	var beaconTypeOpenFlag = "<%tcWebApi_get("dynCwmpAttr_Entry","aWLanBeaconType","s")%>";
	var ssidOpenFlag = "<%tcWebApi_get("dynCwmpAttr_Entry","aWLanSSID","s")%>";
	if(enableOpenFlag == "0")
		getElById('enableSsid').disabled = true;
	if(beaconTypeOpenFlag == "0")
		getElById('wlSecurMode').disabled = true;
	if(ssidOpenFlag == "0")
		getElById('wlSsid').disabled = true;
</script>
		<footer>
			<p><%tcWebApi_get("String_Entry","SaleConsultantText","s")%>: <a href="tel:18008168">18008168</a></p>
			<p><%tcWebApi_get("String_Entry","ReportProblemText","s")%>: <a href="tel:18008119">18008119</a></p>
			<p>&copy; 2021 by VHT. All rights reserved.</p>
		</footer>
		<script language='javascript' src='/JS/user.js'></script>	</body>
</html>
