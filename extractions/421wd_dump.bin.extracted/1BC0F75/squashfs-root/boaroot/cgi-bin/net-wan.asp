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
if Request_Form("Wan_Flag") = "1" then
	TCWebApi_unset("WanInfo_WanIF")
	TCWebApi_set("WanInfo_WanPVC","Action","OperatorStyle")
	if Request_Form("VLANMode") = "TAG" then
			TCWebApi_set("WanInfo_WanPVC", "VLANID", "vlan")
			TCWebApi_set("WanInfo_WanPVC", "DOT1P", "v8021P")
	elseif Request_Form("VLANMode") = "UNTAG" then
			TCWebApi_set("WanInfo_WanPVC", "VLANID", "vlanUNTAG")
			TCWebApi_set("WanInfo_WanPVC", "DOT1P", "vlanPriNone")
	elseif Request_Form("VLANMode") = "TRANSPARENT" then
			TCWebApi_set("WanInfo_WanPVC", "VLANID", "vlanTRANSPARENT")
			TCWebApi_set("WanInfo_WanPVC", "DOT1P", "vlanPriNone")
	end if
	TCWebApi_set("WanInfo_WanPVC","VLANMode","VLANMode")
	TCWebApi_set("WanInfo_WanPVC","ENCAP","EnCAPFlag")
	TCWebApi_set("WanInfo_WanIF","Active","WanActive")
	TCWebApi_set("WanInfo_WanIF","ServiceList","serviceList")
	TCWebApi_set("WanInfo_WanIF","BandActive","bindflag")
	TCWebApi_set("WanInfo_WanIF","LAN1","bindlan1")
	if TCWebApi_get("WebCustom_Entry","isCT1PORTSupported","h" ) <> "Yes" then
	TCWebApi_set("WanInfo_WanIF","LAN2","bindlan2")
	end if
	if TCWebApi_get("WebCustom_Entry","isCT2PORTSSupported","h" ) <> "Yes" then
	TCWebApi_set("WanInfo_WanIF","LAN3","bindlan3")
	TCWebApi_set("WanInfo_WanIF","LAN4","bindlan4")
	end if
	if TCWebApi_get("WebCustom_Entry","isMultiLanSupported","h" ) = "Yes" then
	TCWebApi_set("WanInfo_WanIF","LAN5","bindlan5")
	TCWebApi_set("WanInfo_WanIF","LAN6","bindlan6")
	TCWebApi_set("WanInfo_WanIF","LAN7","bindlan7")
	TCWebApi_set("WanInfo_WanIF","LAN8","bindlan8")
	end if
	if TCWebApi_get("WebCustom_Entry","isWLanSupported","h" ) = "Yes" then
	TCWebApi_set("WanInfo_WanIF","SSID1","bindwireless1")
	TCWebApi_set("WanInfo_WanIF","SSID2","bindwireless2")
	TCWebApi_set("WanInfo_WanIF","SSID3","bindwireless3")
	TCWebApi_set("WanInfo_WanIF","SSID4","bindwireless4")
	if TCWebApi_get("WebCustom_Entry","isMultiUserITFSupported","h" ) = "Yes" then
	TCWebApi_set("WanInfo_WanIF","SSID5","bindwireless5")
	TCWebApi_set("WanInfo_WanIF","SSID6","bindwireless6")
	TCWebApi_set("WanInfo_WanIF","SSID7","bindwireless7")
	TCWebApi_set("WanInfo_WanIF","SSID8","bindwireless8")
	end if
	end if
	if TCWebApi_get("WebCustom_Entry","isWLanACSupported","h" ) = "Yes" then
	TCWebApi_set("WanInfo_WanIF","SSIDAC1","bindwirelessac1")
	TCWebApi_set("WanInfo_WanIF","SSIDAC2","bindwirelessac2")
	TCWebApi_set("WanInfo_WanIF","SSIDAC3","bindwirelessac3")
	TCWebApi_set("WanInfo_WanIF","SSIDAC4","bindwirelessac4")
	if TCWebApi_get("WebCustom_Entry","isMultiUserITFSupported","h" ) = "Yes" then
	TCWebApi_set("WanInfo_WanIF","SSIDAC5","bindwirelessac5")
	TCWebApi_set("WanInfo_WanIF","SSIDAC6","bindwirelessac6")
	TCWebApi_set("WanInfo_WanIF","SSIDAC7","bindwirelessac7")
	TCWebApi_set("WanInfo_WanIF","SSIDAC8","bindwirelessac8")
	end if
	end if
	TCWebApi_set("WanInfo_WanIF","WanMode","wanMode")
	TCWebApi_set("WanInfo_WanIF","LinkMode","linkMode")
	if Request_Form("wanMode") = "Route" then
		TCWebApi_set("WanInfo_WanIF","MTU","MTU")
		if Request_Form("linkMode") = "linkPPP" then
			TCWebApi_set("WanInfo_WanIF","PPPGETIP","PPPGetIpFlag")
			TCWebApi_set("WanInfo_WanIF","CONNECTION","ConnectionFlag")
			TCWebApi_set("WanInfo_WanIF","USERNAME","pppUserName")
			TCWebApi_set("WanInfo_WanIF","PASSWORD","pppPassword")
			TCWebApi_set("WanInfo_WanIF","PPPManualStatus","pppManualStatus_Flag")
			if tcWebApi_get("WebCustom_Entry", "isPPPoEOnDemandWEBUISupported", "h") = "Yes"  then
				tcWebApi_set("WanInfo_WanIF","CONNECTION","ppp_DialMethod")
				if Request_Form("ppp_DialMethod") = "Connect_on_Demand" then
					tcWebApi_set("WanInfo_WanIF","CLOSEIFIDLE","pppondemand_idletime")
				end if
			end if
		end if
	elseif Request_Form("wanMode") = "Bridge" then
			TCWebApi_set("WanInfo_WanIF","BridgeMode","bridgeMode")
			TCWebApi_set("WanInfo_WanIF","DHCPRealy","dhcprelay")
	end if
	TCWebApi_set("WanInfo_WanIF","IPVERSION","IPVersionValue")
	TCWebApi_set("WanInfo_WanIF","ISP","ISPTypeValue")
	TCWebApi_set("WanInfo_WanIF","VLANMode","VLANMode")
	TCWebApi_set("WanInfo_WanIF","dot1q","vlanId")
	if Request_Form("vlanId") = "Yes" then
		TCWebApi_set("WanInfo_WanIF","VLANID","vlan")
	end if
	TCWebApi_set("WanInfo_WanIF","dot1p","vlanPri")
	if Request_Form("vlanPri") = "Yes" then
		TCWebApi_set("WanInfo_WanIF","dot1pData","v8021P")
	end if
	if Request_Form("MulVIDUsed") = "Yes" then
		TCWebApi_set("WanInfo_WanIF","MulticastVID","MulticastVID")
	end if
	TCWebApi_set("WanInfo_WanIF","NATENABLE","nat")
	if Request_Form("cb_enblIgmp") = "1" then
		TCWebApi_ConstSet("WanInfo_WanIF","IGMPproxy","Yes")
	else
		TCWebApi_ConstSet("WanInfo_WanIF","IGMPproxy","No")
	end if
	TCWebApi_ConstSet("WanInfo_WanIF","waitforIP4","0")
	TCWebApi_ConstSet("WanInfo_WanIF","waitforIP6","0")
	if Request_Form("IPVersionValue") <> "IPv6" then
		TCWebApi_ConstSet("WanInfo_WanIF","waitforIP4","1")
		if Request_Form("linkMode") = "linkIP" then
			if Request_Form("IpMode") = "Static" then
				TCWebApi_set("WanInfo_WanIF","IPADDR","wanIpAddress")
				TCWebApi_set("WanInfo_WanIF","NETMASK","wanSubnetMask")
				TCWebApi_set("WanInfo_WanIF","GATEWAY","defaultGateway")
				TCWebApi_set("WanInfo_WanIF","DNS","dnsPrimary")
				TCWebApi_set("WanInfo_WanIF","SecDNS","dnsSecondary")
			end if
		end if
		if Request_Form("cb_routev4") = "1" then
			TCWebApi_ConstSet("WanInfo_WanIF","DefRoute4","1")
		end if
	end if
	if Request_Form("IPVersionValue") <> "IPv4" then
		TCWebApi_ConstSet("WanInfo_WanIF","waitforIP6","1")
			TCWebApi_set("WanInfo_WanIF","DHCPv6","pppv6Mode")
			TCWebApi_set("WanInfo_WanIF","GW6_Manual","Disable_Flag")
		if Request_Form("IdIpv6AddrType") = "Static" then
			TCWebApi_set("WanInfo_WanIF","IPADDR6","IdIpv6Addr")
			TCWebApi_set("WanInfo_WanIF","GATEWAY6","IdIpv6Gateway")
			if Request_Form("IdIpv6Gateway") <> "" then
				TCWebApi_set("WanInfo_WanIF","GW6_Manual","Enable_Flag")
			end if
			TCWebApi_set("WanInfo_WanIF","PREFIX6","IdIpv6PrefixLen")
			TCWebApi_set("WanInfo_WanIF","DNS6","IdIpv6Dns1")
			TCWebApi_set("WanInfo_WanIF","SecDNS6","IdIpv6Dns2")
		elseif Request_Form("IdIpv6AddrType") = "DHCP" then
			TCWebApi_set("WanInfo_WanIF","GATEWAY6","IdIpv6Gateway")
			if Request_Form("IdIpv6Gateway") <> "" then
				TCWebApi_set("WanInfo_WanIF","GW6_Manual","Enable_Flag")
			end if
		end if
		if Request_Form("cb_routev6") = "1" then
			TCWebApi_ConstSet("WanInfo_WanIF","DefRoute6","1")
		end if
	end if
	TCWebApi_set("WanInfo_WanIF","IFIdx","WanCurrIFIdx")
	if Request_Form("OperatorStyle") = "Add" then
		TCWebApi_set("Wan_Common","LatestIFIdx","WanCurrIFIdx")
		TCWebApi_set("WanInfo_WanPVC", "EPONEnable", "xponstate")
		TCWebApi_set("WanInfo_WanPVC", "GPONEnable", "xponstate")
	end if
	if tcwebApi_get("WebCustom_Entry","isDSLiteSupported","h" ) = "Yes" then
		if Request_Form("dsliteUsed") = "Yes" then
			TCWebApi_set("WanInfo_WanIF","DsliteEnable","enabledslite")
			TCWebApi_set("WanInfo_WanIF","DsliteMode","dslitemode")
			if Request_Form("dslitemode") = "1" then
					TCWebApi_set("WanInfo_WanIF","DsliteAddr","dsliteaddress")
			end if
		else
			TCWebApi_set("WanInfo_WanIF","DsliteEnable","dsliteDisabled")
		end if
	end if
	if Request_Form("PDUsed") = "Yes" then
		TCWebApi_set("WanInfo_WanIF","PDEnable","enablepd")
	else
		TCWebApi_set("WanInfo_WanIF","PDEnable","PDDisabled")
	end if
	if Request_Form("pdmodeUsed") = "Yes" then
		TCWebApi_set("WanInfo_WanIF", "DHCPv6PD", "pdmode")
		if Request_Form("pdmode") = "No" then
			TCWebApi_set("WanInfo_WanIF", "PDOrigin", "pdmodeStatic")			
			TCWebApi_set("WanInfo_WanIF", "PDPrefix", "pdprefix")
			TCWebApi_set("WanInfo_WanIF", "PrefixPltime", "pdprefixptime")
			TCWebApi_set("WanInfo_WanIF", "PrefixVltime", "pdprefixvtime")
		else
			TCWebApi_set("WanInfo_WanIF", "PDOrigin", "pdmodeAuto")
		end if
	else
		TCWebApi_set("WanInfo_WanIF", "DHCPv6PD", "pdmodeDisabled")
		TCWebApi_set("WanInfo_WanIF", "PDOrigin", "pdmodeNone")
	end if
	if tcwebApi_get("WebCustom_Entry","isCTDHCPPortFilterSupported","h" ) = "Yes" then
		TCWebApi_set("WanInfo_WanIF", "DHCPEnable", "enable_dhcp")
	end if
	if tcWebApi_get("WebCustom_Entry","isCTPONC9Supported","h" ) = "Yes" then
		tcWebApi_set("WanInfo_WanIF", "WanHWAddr", "wanhwaddress")
	end if
	if tcWebApi_get("WebCustom_Entry","isPPPoEProxySupported","h" ) = "Yes" then
		tcWebApi_set("WanInfo_WanIF","ProxyEnable","pppproxyDisabled")
		tcWebApi_set("WanInfo_WanIF","ProxyMaxUser","pppproxy_user_zero")
		tcWebApi_set("WanInfo_WanIF","BridgeInterface","pppbiDisabled")
		if Request_Form("ppp_proxy_biUsed") = "Yes" then
			tcWebApi_set("WanInfo_WanIF","pppProxyBiMode","ppp_proxy_bi_mode")
			if Request_Form("ppp_proxy_bi_mode") = "1" then
				tcWebApi_set("WanInfo_WanIF","ProxyEnable","pppproxyEnabled")
				tcWebApi_set("WanInfo_WanIF","ProxyMaxUser","pppproxy_user")
			elseif Request_Form("ppp_proxy_bi_mode") = "2" then
				tcWebApi_set("WanInfo_WanIF","BridgeInterface","pppbiEnabled")
			end if
		else
			tcWebApi_set("WanInfo_WanIF","pppProxyBiMode","ppp_proxy_bi_disable")
		end if
	else		
		if Request_Form("pppbiUsed") = "Yes" then
			TCWebApi_set("WanInfo_WanIF","BridgeInterface","enablepppbi")
		else
			TCWebApi_set("WanInfo_WanIF","BridgeInterface","pppbiDisabled")
		end if
	end if
	if Request_Form("OperatorStyle") <> "Add" then
		tcWebApi_set("WanInfo_WanIF","Option60Enable1","Option60Enable1")
		tcWebApi_set("WanInfo_WanIF","Option60Enable2","Option60Enable2")
		tcWebApi_set("WanInfo_WanIF","Option60Enable3","Option60Enable3")
		tcWebApi_set("WanInfo_WanIF","Option60Enable4","Option60Enable4")
		tcWebApi_set("WanInfo_WanIF","Option60Type1","Option60Type1")
		tcWebApi_set("WanInfo_WanIF","Option60Type2","Option60Type2")
		tcWebApi_set("WanInfo_WanIF","Option60Type3","Option60Type3")
		tcWebApi_set("WanInfo_WanIF","Option60Type4","Option60Type4")
		tcWebApi_set("WanInfo_WanIF","Option60ValueMode1","Option60ValueMode1")
		tcWebApi_set("WanInfo_WanIF","Option60ValueMode2","Option60ValueMode2")
		tcWebApi_set("WanInfo_WanIF","Option60ValueMode3","Option60ValueMode3")
		tcWebApi_set("WanInfo_WanIF","Option60ValueMode4","Option60ValueMode4")
		tcWebApi_set("WanInfo_WanIF","Option60Value1","Option60Value1")
		tcWebApi_set("WanInfo_WanIF","Option60Value2","Option60Value2")
		tcWebApi_set("WanInfo_WanIF","Option60Value3","Option60Value3")
		tcWebApi_set("WanInfo_WanIF","Option60Value4","Option60Value4")
	end if
    TCWebApi_Constset("WanInfo_WanIF","force_commit","1")
	TCWebApi_commit("WanInfo_WanPVC")
	TCWebApi_save()
elseif Request_Form("Wan_Flag") = "2" then
	 TCWebApi_set("WanInfo_Common","CurIFIndex","curSetIndex")
     TCWebApi_Constset("WanInfo_WanIF","force_commit","1")
	 TCWebApi_commit("WanInfo_Common")
elseif Request_Form("Wan_Flag") = "3" then
	 TCWebApi_set("WanInfo_WanPVC","Action","OperatorStyle")
	 TCWebApi_set("WanInfo_Common","CurIFIndex","curSetIndex")
     TCWebApi_Constset("WanInfo_WanIF","force_commit","1")
	 TCWebApi_commit("WanInfo_WanPVC")
	 TCWebApi_set("WanInfo_Common","CurIFIndex","afterdeleteFlag")
	 TCWebApi_save()
elseif Request_Form("Wan_Flag") = "4" then
	 TCWebApi_set("WanInfo_WanIF","PPPManualStatus","pppManualStatus_Flag")
     TCWebApi_Constset("WanInfo_WanIF","force_commit","1")
	 TCWebApi_commit("WanInfo_WanIF")
	 TCWebApi_save()
elseif Request_Form("Wan_Flag") = "5" then
	 if tcwebApi_get("WebCustom_Entry", "isWanEtherSupported", "h") = "Yes" then
	 	 TCWebApi_set("Wan_Common", "TransMode", "transMode")
	 	 TCWebApi_set("Wan_Common", "RebootToChangeMode", "rebootToChangeMode")
	 	 tcWebApi_constSet("System_Entry", "reboot_type", "1")
		 if Request_Form("transMode") = "Ethernet" then
			tcWebApi_constSet("XPON_LinkCfg", "Mode", "3")
		 elseif Request_Form("transMode") = "PON" then
		 	tcWebApi_constSet("XPON_LinkCfg", "Mode", "0")
	 	 end if 
	 	 TCWebApi_save()
         TCWebApi_Constset("WanInfo_WanIF","force_commit","1")
		 TCwebApi_commit("System_Entry")
	 end if
else
	 TCWebApi_set("WanInfo_Common","ErrCode","Wan_Flag")
end if
%>
<!doctype html>
<html>
	<head>
<title><%tcWebApi_get("String_Entry","BranchName","s")%> ONT - <%tcWebApi_get("String_Entry","NavigationBasInternetText","s")%></title>		<meta charset="utf-8">
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
var WanPPP = new Array(null);
var WanIP = new Array(null);
var CntPvc = new Array(new PvcConstruction("InternetGatewayDevice.WANDevice.1.WANConnectionDevice.4.WANDSLLinkConfig","PVC:0/35","UBR","0","EoA","0","0","LLC"),null);
if (WanIP.length > 1)
AssociateParam('WanIP','CntPvc','atmVpi|atmVci|atmServiceCategory|atmPeakCellRate|LinkType|atmSustainedCellRate|atmMaxBurstSize|encapMode');
if (WanPPP.length > 1)
AssociateParam('WanPPP','CntPvc','atmVpi|atmVci|atmServiceCategory|atmPeakCellRate|LinkType|atmSustainedCellRate|atmMaxBurstSize|encapMode');
var msg = new Array(6);
msg[0] = "<%tcWebApi_get("String_Entry","OperateSuccessText","s")%> ";
msg[1] = "<%tcWebApi_get("String_Entry","FailModify1Text","s")%> ";
msg[2] = "<%tcWebApi_get("String_Entry","FailModify2Text","s")%> ";
msg[3] = "<%tcWebApi_get("String_Entry","FailCreate1Text","s")%> ";
msg[4] = "<%tcWebApi_get("String_Entry","FailCreate2Text","s")%> ";
msg[5] = "<%tcWebApi_get("String_Entry","FailDeleteText","s")%> ";
var oldIpVer;
var nEntryNum = "<% tcWebApi_get("WanInfo_Common","CycleNum","s") %>";
var vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
var vEntryName = vArrayStr.split(','); 
vArrayStr = "<% tcWebApi_get("WanInfo_Common","ValidIFIndex","s") %>";
var vEntryIndex = vArrayStr.split(',');
<% tcWebApi_constSet("WanInfo_Common", "CycleJump", "19") %>
var CycleV = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
var IFIdxArray = CycleV.split(',');
<% tcWebApi_get("WanInfo_Common","CycleValue","h") %>
<% tcWebApi_get("WanInfo_Common","CycleValue","h") %>
var CycleV = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
var Wan_VidArray = CycleV.split(',');
<% tcWebApi_get("WanInfo_Common","CycleValue","h") %>
<% tcWebApi_get("WanInfo_Common","CycleValue","h") %>
<% tcWebApi_get("WanInfo_Common","CycleValue","h") %>
var CycleV = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
var Wan_VlanMode = CycleV.split(',');
// Sort WAN base on Name
sortWAN(vEntryName, vEntryIndex);
sortWAN(vEntryName, IFIdxArray);
sortWAN(vEntryName, Wan_VidArray);
sortWAN(vEntryName, Wan_VlanMode);
sortWAN(vEntryName, vEntryName); // always sort WanName last;
var WanNameList = [];
var WanVlanModeList = [];
var vCurrentDHCPv6 = "<% tcWebApi_get("WanInfo_WanIF","DHCPv6","s") %>";
var vBindStatus = "<% tcWebApi_get("WanInfo_Common","BindStatus","s") %>";
var ppp_flag = 2;
var manual_flag = 2;
var vcurConnect = "<% tcWebApi_get("WanInfo_WanIF","CONNECTION","s") %>";
if(vcurConnect == "Connect_Keep_Alive")
	ppp_flag = 0;
else if(vcurConnect == "Connect_Manually")
	ppp_flag = 1;	
vcurConnect = "<% tcWebApi_get("WanInfo_WanIF","PPPManualStatus","s") %>";
if(vcurConnect == "connect")
	manual_flag = 0;
else if((vcurConnect == "disconnect"))
	manual_flag = 1;
var IFIdxStore = "<% tcWebApi_get("Wan_Common","LatestIFIdx","s") %>"
function ipv6mode(domain, mode)
{
this.domain = domain;
this.mode = mode;
}
var ipv6enable = new Array(new ipv6mode("InternetGatewayDevice.DeviceInfo.X_CT-COM_IPProtocolVersion","3"),null);
var ipv6version = ipv6enable[0].mode;
var Wan = Array();
for (i = 0; i < WanIP.length-1; i++)
{
	Wan[i] = WanIP[i];
}
for (j = 0; j < WanPPP.length-1; j++,i++)
{
	Wan[i] = WanPPP[j];
}
var upRate = parseInt('0');
var pcrMax = 5500;
if (upRate != 0)
pcrMax = Math.floor((upRate * 1000) / (53 * 8));
var i = 0;
var AddFlag = false;
var SelWanIndex = -1;
var pvcByUseIndex = -1;
var pvcByUseCount = 0;
var wanList = '';
var changePVCFlag = true;
var isNeedChange = 0;
var changeflag = 1;
function trimString(destStr, cTrim)
{
	var i;
	var j;
	var retStr = '';
	for (i = 0; i < destStr.length; i++)
	{
		if (destStr.charAt(i) != cTrim)
		{
			retStr += destStr.charAt(i);
		}
	}
	return retStr;
}
function PvcConstruction(domain,atmPvc,atmQoS,atmPeakCellRate,LinkType,atmSustainedCellRate,atmMaxBurstSize,encapMode)
{
	this.domain = domain;
	var list = domain.split('.');
	this.key =     '.' + list[4] + '.';
	var realPvc = trimString(atmPvc, ' ');
	if(realPvc.charAt(0) == 'P')
	{
	realPvc = realPvc.substr(4);
	}
	var pvc = realPvc.split('/');
	this.atmVpi = pvc[0];
	this.atmVci = pvc[1];
	this.LinkType = LinkType;    
	this.atmServiceCategory = atmQoS;
	this.atmPeakCellRate = atmPeakCellRate;
	this.atmSustainedCellRate = atmSustainedCellRate;
	this.atmMaxBurstSize = atmMaxBurstSize;
	this.encapMode = encapMode;
}
var CntPvc = new Array(new PvcConstruction("InternetGatewayDevice.WANDevice.1.WANConnectionDevice.4.WANDSLLinkConfig","PVC:0/35","UBR","0","EoA","0","0","LLC"),null);
function getIFIdxvidDomain(domain)
{
	var i = 0;
	var select = document.getElementById("wanId");
	for( i=0; i< select.length; i++)
	{
		if ( domain == select[i].value )
			return select[i].innerText[0];
	}
	return 1;
}
function VLANModeChg()
{
	with (getElById('wan_form'))
	{
		switch (VLANMode.value)
		{
			case 'TAG':
				setDisplay('vlansec', 1);
				setDisplay('priosec', 1);
				setDisplay('mulvidsec', 1);
				vlanId.value = "Yes";
				vlanPri.value = "Yes";
			if ( 0 == v8021P.value.length )
				v8021P.value = '0';
			break;
			case 'UNTAG':
				setDisplay('vlansec', 0);
				setDisplay('priosec', 0);
				setDisplay('mulvidsec',0);
				vlanId.value = "No";
				vlanPri.value = "No";
			break;
			case 'TRANSPARENT':
				setDisplay('vlansec', 0);
				setDisplay('priosec', 0);
				setDisplay('mulvidsec', 1);
				vlanId.value = "No";
				vlanPri.value = "No";
			break;
			default:
			break;
		}
	}
}
function clearBindList()
{
	for (var i = 1; i <= 4; i++)
	{
	document.getElementById("secLan" + i).disabled = false;
	document.getElementById("cb_bindlan" + i).checked = false;
	document.getElementById("secWireless" + i).disabled = false;
	document.getElementById("cb_bindwireless" + i).checked = false;
	}
}
function pppbiShow()
{
	var mode;
	var linkMode;
	var svrList;
	mode = getSelectVal('wanMode');
	linkMode = getSelectVal('linkMode');
	svrList = getSelectVal('serviceList');
	if ( 'Route' == mode && 'linkPPP' == linkMode
	   && (svrList.indexOf('INTERNET') >= 0 || svrList.indexOf('OTHER') >= 0) )
		setDisplay('ppp_bi', 1);
	else
		setDisplay('ppp_bi', 0);
}
function pppoeProxyShow()
{
<%if TCWebApi_get("WebCustom_Entry","isPPPoEProxySupported","h" ) = "Yes" then%>
	var mode;
	var linkMode;
	var svrList;
	mode = getSelectVal('wanMode');
	linkMode = getSelectVal('linkMode');
	svrList = getSelectVal('serviceList');
	if ( 'Route' == mode && 'linkPPP' == linkMode
	   && (svrList.indexOf('INTERNET') >= 0 || svrList.indexOf('OTHER') >= 0) )
	{
		setDisplay('ppp_proxy_bi', 1);
		ppp_proxy_bi_Change();
	}
	else
	{
		setDisplay('ppp_proxy_bi', 0);
		setDisplay('ppp_proxy_user', 0);
	}
<%else%>
	pppbiShow();
<%end if%>
}
var enabledhcpSel = 0;
function dhcpEnableShow()
{
<%if TCWebApi_get("WebCustom_Entry","isCTDHCPPortFilterSupported","h" ) = "Yes" then%>
	var svrList;
	svrList = getSelectVal('serviceList');
	/* ONTS-466 */
	var WanMode =  getSelectVal('select2');
	if ( 'TR069' == svrList
		|| 'VOICE' == svrList
		|| 'TR069_VOICE' == svrList )
	{
		setDisplay('enabledhcpsec', 0);
		setCheck('cb_enabledhcp', 0);
	}
	else
	{
		if (WanMode != 'Bridge') {
			setDisplay('enabledhcpsec', 1);
		}
		else {
			setDisplay('enabledhcpsec', 0);
		}
		if ( 1 == enabledhcpSel )
		{
			enabledhcpSel = 0;
			if ( svrList.indexOf('OTHER') >= 0 )
				setCheck('cb_enabledhcp', 0);
			else
				setCheck('cb_enabledhcp', 1);
		}
	}
<%else%>
	setDisplay('enabledhcpsec', 0);
	setCheck('cb_enabledhcp', 0);
<%end if%>
}
function MultiVIDDispChange()
{
	var svrList;
	with (getElById('wan_form'))
	{
		svrList = serviceList.value;
		if ( svrList.indexOf('INTERNET') >= 0 || svrList.indexOf('OTHER') >= 0 )
			setDisplay('mulvidsec', 1);
		else
			setDisplay('mulvidsec', 0);
	}
}
function MTUDispChange()
{
	var mtudescrip = new Array('[128-1492]', '[576-1500]', '[1280-1492]', '[1280-1500]','[1320-1492]','[1320-1500]');
	with (getElById('wan_form'))
	{
		if ( 'Route' == wanMode.value )
		{
			setDisplay('MTUsec', 1);
			setDisplay('WANIPCommonOptionText', 1);
			if (AddFlag == true || isNeedChange)
			{
				isNeedChange = false;
<% if tcwebApi_get("WebCustom_Entry","isCTPONCNJSSupported","h" ) = "Yes" then %>
				if (getSelectVal('linkMode') == 'linkPPP')
					MTU.value = 1482;
				else
					MTU.value = 1490;				
<% else %>
				if (getSelectVal('linkMode') == 'linkPPP')
					MTU.value = 1492;
				else
					MTU.value = 1500;
<% end if %>
			}
			if (getSelectVal('linkMode') == 'linkPPP')
			{
				if ('IPv4' == getRadioVal('IpVersion'))
					getElement("MIUDescrip").innerHTML = mtudescrip[0];
				else{
<% if tcwebApi_get("WebCustom_Entry","isDSLiteSupported","h" ) = "Yes" then %>
					if (getCheckVal('cb_enabledslite') == 1){
						getElement("MIUDescrip").innerHTML = mtudescrip[4];	
					}else{
<% end if %>
					getElement("MIUDescrip").innerHTML = mtudescrip[2];
<% if tcwebApi_get("WebCustom_Entry","isDSLiteSupported","h" ) = "Yes" then %>
			}
<% end if %>
				}
			}
			else
			{
				if ('IPv4' == getRadioVal('IpVersion'))			
					getElement("MIUDescrip").innerHTML = mtudescrip[1];
				else{
<% if tcwebApi_get("WebCustom_Entry","isDSLiteSupported","h" ) = "Yes" then %>
					if (getCheckVal('cb_enabledslite') == 1){
						getElement("MIUDescrip").innerHTML = mtudescrip[5];	
					}else{
<% end if %>
					getElement("MIUDescrip").innerHTML = mtudescrip[3];		
<% if tcwebApi_get("WebCustom_Entry","isDSLiteSupported","h" ) = "Yes" then %>
			}
<% end if %>
				}
			}
		}
		else
		{
			setDisplay('MTUsec', 0);
			setDisplay('WANIPCommonOptionText', 0);
		}
	}
}
function WanIndexConstruction(domain,WanName)
{
	this.domain = domain;
	this.WanName = WanName;
}
function CheckAddedWan(i) {
	if (((Wan_VidArray[i] == "-/-") || (Wan_VidArray[i] == "-/0"))&& (Wan_VlanMode[i] == "TAG")) {
		return 0;
	}
	else {
		return 1;
	}
}
function CheckWansActives()
{
	var	nCurTemp = 0;
	var	vcurLinks = new Array(nEntryNum);
	for(var i=0; i<nEntryNum; i++)
	{	
		if ( (vEntryName[i].indexOf("TR069") < 0)&& CheckAddedWan(i)) {
			vcurLinks[nCurTemp++] = new WanIndexConstruction(vEntryIndex[i], vEntryName[i]);
		}
	}
	var	vObjRet = new Array(nCurTemp+1);
	for(var m=0; m<nCurTemp; m++)
	{
		vObjRet[m] = vcurLinks[m];
	}
	vObjRet[nCurTemp] = null;
	return vObjRet;
}
var	CurWan = CheckWansActives();
function WriteWanNameSelected() {
	var select = document.getElementById('wanId');
	var isSel = -1;
	for (var i = 0; i <= nEntryNum; i++) {
		if (vEntryName[i].indexOf("TR069") >= 0) {
			WanNameList.push(vEntryName[i]);
			WanVlanModeList.push(Wan_VlanMode[i]);
		}
		else {
			if (CheckAddedWan(i) && vEntryName[i].length) {
				var opt = new Option(vEntryName[i], vEntryIndex[i]);
				WanNameList.push(vEntryName[i]);
				WanVlanModeList.push(Wan_VlanMode[i]);
				if ( document.wan_form.curSetIndex.value == vEntryIndex[i] )
				{
					opt.selected = true
					isSel = i;
				}
				select.options.add ( opt );
			}
		}
	}
	if (-1 == isSel) {
		select[0].selected = true;
	}
}
function dslitemodeChange()
{
	var mode;
	with (getElById('wan_form'))
	{
		mode = getRadioVal("dslitemode");
		switch (mode)
		{
			case '1':
				setDisplay('dslite_3', 1);
				break;
			default:
				setDisplay('dslite_3', 0);
				break;	
		}
	}
}
function cb_enabledsliteChange()
{
	with (getElById('wan_form'))
	{
		if ( 1 == getCheckVal('cb_enabledslite') )
		{
			setDisplay('dslite_2', 1);
			dslitemodeChange();
		}
		else
		{
			setDisplay('dslite_2', 0);
			setDisplay('dslite_3', 0);
		}
	}
	MTUDispChange();
}
function dsliteShow()
{
<%if TCWebApi_get("WebCustom_Entry","isDSLiteSupported","h" ) = "Yes" then%>
	var ipVer;
	var svrList;
	var mode;
	var addrType;
	ipVer = getRadioVal('IpVersion');
	svrList = getSelectVal('serviceList');
	mode = getSelectVal('wanMode');
	if ( 'Route' == mode && 
		'IPv4' != ipVer && svrList.indexOf('INTERNET') >= 0)
	{
		setDisplay('dslite_1', 1);
		var modeObj = document.getElementsByName('dslitemode');
		if ( modeObj.length >= 2 )
		{
			modeObj[0].disabled = false;
			modeObj[1].disabled = false;
		}
		addrType = getSelectVal('IdIpv6AddrType');
		if ( 'Static' == addrType )
		{
			if ( modeObj.length >= 2 )
			{
				modeObj[0].disabled = true;
				modeObj[1].checked = true;
			}
		}
		cb_enabledsliteChange();
	}
	else
	{
		setDisplay('dslite_1', 0);
		setDisplay('dslite_2', 0);
		setDisplay('dslite_3', 0);
	}
<%end if%>
}
function ppp_dialMethodChg()
{
<% if tcWebApi_get("WebCustom_Entry", "isPPPoEOnDemandWEBUISupported", "h") = "Yes"  then %>
	var mode;
	var linkMode;
	mode_val = getSelectVal('wanMode');
	linkMode_val = getSelectVal('linkMode');
	setDisplay('secIdleTime', 0);
	setDisplay('secManualDial', 0);
	with ( getElById('wan_form') )
	{
		if ( 'Route' == mode_val && 'linkPPP' == linkMode_val )
		{
			switch ( getSelectVal('ppp_DialMethod') )
			{
				case 'Connect_on_Demand':
					setDisplay('secIdleTime', 1);
					if ( 0 == pppTimeOut.value.length )
					{
						if ( 0 == pppondemand_idletime.value.length )
							pppTimeOut.value = '30';
						else
							pppTimeOut.value = parseInt(pppondemand_idletime.value) / 60;
					}
					break;
				default:
					break;
			}
		}
	}
<% end if %>
}
function pdStaticCfgShow( show )
{
	setDisplay('pdmode_2', show);
	setDisplay('pdmode_3', show);
	setDisplay('pdmode_4', show);
}
function pdmodeChange()
{
	var pdmode_sel;
	pdmode_sel = getRadioVal('pdmode');
	if ( 'No' == pdmode_sel )
		pdStaticCfgShow(1);
	else
		pdStaticCfgShow(0);
}
function pdModeShow( show )
{
	addrType = getSelectVal('IdIpv6AddrType');
	if ( 1 == show )
	{
		setDisplay('pdmode_1', 1);
		var modeObj = document.getElementsByName('pdmode');
		if ( modeObj.length >= 2 )
		{
			modeObj[0].disabled = false;
			modeObj[1].disabled = false;
		}
		if ( 'Static' == addrType )
		{
			if ( modeObj.length >= 2 )
			{
				modeObj[0].disabled = true;
				modeObj[1].checked = true;
			}
		}
		else {
			if ( modeObj.length >= 2 )
			{
				modeObj[0].checked = true;
				modeObj[1].disabled = true;
			}
		}
		pdmodeChange();
	}
	else
	{
		setDisplay('pdmode_1', 0);
		pdStaticCfgShow(0);
	}
}
var pdDefaultSel = 0;
function pdEnableShow()
{
	var ipVer;
	var mode;
	var svrList;
	ipVer = getRadioVal('IpVersion');
	mode = getSelectVal('wanMode');
	svrList = getSelectVal('serviceList');
	addrType = getSelectVal('IdIpv6AddrType');
	if ( 'Route' == mode && 'IPv4' != ipVer
		&& (svrList.indexOf('INTERNET') >= 0 || svrList.indexOf('OTHER') >= 0) )
	{
		setDisplay('PDEnableSec', 1);
		if ( svrList.indexOf('INTERNET') >= 0 && 1 == pdDefaultSel )
			setCheck('cb_enabledpd', 1);
		pdDefaultSel = 0;
		pdModeShow( getCheckVal('cb_enabledpd') );
	}
	else
	{
		setDisplay('PDEnableSec', 0);
		pdModeShow(0);
	}
}
function WriteIPv6List(index)
{
	var vmode = new Array("No", "Yes", "N/A");
	var ctrl = getElById('IdIpv6AddrType');
	for(var i=0; i<ctrl.options.length;)
	{
		cs_removeoption(ctrl, i);
		/* ctrl.removeChild(ctrl.options[i]); */
	}
	if(index == 0)
	{
		var aMenu = new Array("SLAAC","DHCP");
		for(i=0; i<aMenu.length; i++)
		{
			cs_addoption(ctrl, aMenu[i], aMenu[i])
			/* ctrl.options.add(new Option(aMenu[i],aMenu[i])); */
			if(vCurrentDHCPv6 == vmode[i])
			{
				cs_chooseoption(ctrl, i);
				//document.wan_form.IdIpv6AddrType.selectedIndex = i;
			}
		}
	}
	else if(index == 1)
	{
		var aMenu = new Array("SLAAC","DHCP","Static");
		for(i=0; i<aMenu.length; i++)
		{
			cs_addoption(ctrl, aMenu[i], aMenu[i])
			//ctrl.options.add(new Option(aMenu[i],aMenu[i]));
			if(vCurrentDHCPv6 == vmode[i])
			{
				cs_chooseoption(ctrl, i);
				//document.wan_form.IdIpv6AddrType.selectedIndex = i;
			}
		}
	}
	else if(index == 2)
	{
		var aMenu = "Static";
		//ctrl.options.add(new Option(aMenu,aMenu));
		cs_addoption(ctrl, aMenu, aMenu)
	}
	OnIPv6Changed();
}
function IpVersionChange()
{
	with (getElById('wan_form'))
	{
// ONTS-6
/* <% if tcwebApi_get("WebCustom_Entry","isCTPONCZGDSupported","h") ="Yes" then  if tcwebApi_get("Sys_Entry","IPProtocolVersion","h") ="1" then %>
		IpVersion[1].disabled = true;
		IpVersion[2].disabled = true;
		if(IpVersion[0].checked == false)
		{
			alert("<%tcWebApi_get("String_Entry","OnlySupportIPv4Text","s")%>");
		IPVersionValue.value = "IPv4";
		setRadio("IpVersion", "IPv4");
		}
<% end if end if %> 		
<% if tcwebApi_get("WebCustom_Entry","isCTPONCZGDSupported","h") ="Yes" then  if tcwebApi_get("Sys_Entry","IPProtocolVersion","h") ="2" then %>
		IpVersion[0].disabled = true;
		IpVersion[2].disabled = true;
		if(IpVersion[1].checked == false)
		{
			alert("<%tcWebApi_get("String_Entry","OnlySupportIPv6Text","s")%>");
			IPVersionValue.value = "IPv6";
			setRadio("IpVersion", "IPv6");
		}
<% end if end if %> */
		if ((wanMode.value == "Route") && (serviceList.value == "INTERNET")) {
			showRoute(1);
		}
		else {
			showRoute(0);
		}
		var ipVer = getRadioVal("IpVersion");
		var ConnType = getSelectVal('wanMode');
		var Serverlist = getSelectVal('serviceList');
		if (ConnType != 'Route')
		{
			setDisplay('divIpVersion', 1);
			setDisplay('secIPv6Div', 0);
			return;
		}
		setDisplay('divIpVersion', 1);
		setDisplay('secIPv6Div', 1);
		if ("IPv4" == ipVer)
		{
			if (Serverlist == "TR069"  || Serverlist == "VOICE" || Serverlist == "TR069_VOICE" )
			{
				setDisplay('secNat', 0);
				nat.value = "Disable";
			}
			else
			{
				setDisplay('secNat', 1);
				if ( oldIpVer != ipVer )
				{
					nat.value = "Enable";
					setCheck('cb_nat', 1);
				}
			}
			if ('linkIP' == getSelectVal('linkMode'))
			{
				setDisplay('secDhcp', 1);
				setDisplay('secStatic', 1);
				setDisplay('secPppoeItems', 0);
				if (SelWanIndex != -1)
				{
					if ((Wan[SelWanIndex].addrType == 'DHCP') || (Wan[SelWanIndex].wanConn == "PPPCon"))
					{
						IpMode[0].checked = true;
					}
					else
					{
						IpMode[1].checked = true;
					}
				}
			}
			else
			{
				setDisplay('secDhcp', 0);
				setDisplay('secStatic', 0);
				setDisplay('secPppoeItems', 1);
			}
			setDisplay('secPppoe', 0);
			setDisplay('secPppoa', 0);
			setDisplay('secIpoa', 0);
			if(IpMode[1].checked && ("linkIP" == getSelectVal('linkMode')))
			{
				setDisplay('secStaticItems', 1);
			}
			else
			{
				setDisplay('secStaticItems', 0);
			}
			setDisplay('secIPv6Div', 0);
			setDisplay('TrIpv6AddrType', 0);
			setDisplay('TrIpv6Addr', 0);
			setDisplay('TrIpv6Dns1', 0);
			setDisplay('TrIpv6Dns2', 0);
			setDisplay('TrIpv6Gateway', 0);
			setDisplay('TrIpv6GatewayInfo', 0);
		}
		else if ("IPv6" == ipVer)
		{
			setDisplay('secNat', 0);
			nat.value = "Disable";
			setDisplay('secDhcp', 0);
			setDisplay('secStatic', 0);
			setDisplay('secPppoe', 0);
			setDisplay('secPppoa', 0);
			setDisplay('secIpoa', 0);
			setDisplay('secStaticItems', 0);
			setDisplay('secIPv6Div', 1);
			setDisplay('TrIpv6AddrType', 1);
			var linkstr = getSelectVal('linkMode');
			if(linkstr == "linkIP")
				WriteIPv6List(1);
			else
				WriteIPv6List(0);
		}
		else
		{
			if (Serverlist == "TR069"  || Serverlist == "VOICE" || Serverlist == "TR069_VOICE")
			{
				setDisplay('secNat', 0);
				nat.value = "Disable";
			}
			else
			{
				setDisplay('secNat', 1);
				if ( oldIpVer != ipVer )
				{
					nat.value = "Enable";
					setCheck('cb_nat', 1);
				}
			}
			if ('linkIP' == getSelectVal('linkMode'))
			{
				setDisplay('secDhcp', 1);
				setDisplay('secStatic', 1);
				setDisplay('secPppoeItems', 0);
				if (SelWanIndex != -1)
				{
					if ((Wan[SelWanIndex].addrType == 'DHCP') || (Wan[SelWanIndex].wanConn == "PPPCon"))
					{
						IpMode[0].checked = true;
					}
					else
					{
						IpMode[1].checked = true;
					}
				}
			}
			else
			{
				setDisplay('secDhcp', 0);
				setDisplay('secStatic', 0);
				setDisplay('secPppoeItems', 1);
			}
				setDisplay('secPppoe', 0);
				setDisplay('secPppoa', 0);
				setDisplay('secIpoa', 0);
				if (('linkIP' == getSelectVal('linkMode')) && IpMode[1].checked)
				{
					setDisplay('secStaticItems', 1);
				}
				else
				{
					setDisplay('secStaticItems', 0);
				}
				setDisplay('TrIpv6AddrType', 1);
				if('linkIP' == getSelectVal('linkMode'))
				{
					if(IpMode[0].checked)
					{
						WriteIPv6List(0);
					}
					else if(IpMode[1].checked)
						WriteIPv6List(2);
					else
						WriteIPv6List(0);
				}
				else
					WriteIPv6List(0);
				setDisplay('secIPv6Div', 1);
			}
			oldIpVer = ipVer;
			dsliteShow();
			pdEnableShow();
			ppp_dialMethodChg();
	}
}
var isWanModeChg = -1;
var isAddBtnClick = 0;
function onChangeSvrList(onload)
{
	with (getElById('wan_form'))
	{
		if ((serviceList.value == 0) && (IpMode[2].checked == true) && (wanMode.value != "Bridge"))
		{
			changeflag = 0;
			secManualDial.style.display = "none";
			secIdleTime.style.display = "none";
		}
		else if((serviceList.value != 0) && (IpMode[2].checked == true) && (wanMode.value != "Bridge"))
		{
			if(changeflag == 0)
			{
				cs_addoption(DialMethod,1,"<%tcWebApi_get("String_Entry","ConnectAutoText","s")%>");
				cs_addoption(DialMethod,'Manual',"<%tcWebApi_get("String_Entry","DialManualText","s")%>");
				changeflag = 1;
			}
		}
		if (serviceList.value == "TR069"   || serviceList.value == "VOICE" || serviceList.value == "TR069_VOICE" )
		{
			dhcpv6pdflag.value = "No";
			cb_nat.checked = false;
			nat.value = "Disable";
			setDisplay('secBind',0);
			setDisplay('secNat',0);
			setDisplay('legend_port_bindding',0);
			clearBindList();
		}
		else
		{
			dhcpv6pdflag.value = "Yes";
			if (onload == 1) {
				cb_nat.checked = true;
				nat.value = "Enable";
			}
	<% if tcwebApi_get("WebCustom_Entry","isCYE8SFUSupported","h") = "Yes" then %>
			setDisplay('secBind',0);
			setDisplay('legend_port_bindding',0);
	<% else %>
	<% if tcWebApi_get("WebCustom_Entry", "isCT1PORTSupported", "h") = "Yes"  then %>
				setDisplay('secBind',0);
			setDisplay('legend_port_bindding',0);
	<% else %>
			setDisplay('secBind',1);
			setDisplay('legend_port_bindding',1);
	<% end if %>
	<% end if %>
			if(wanMode.value == "Bridge")
			{
				setDisplay('secNat',0);
				nat.value = "Disable";
			}
			else
			{
				setDisplay('secNat',1);
			}
		}
		if (AddFlag == true)
		{
			if (serviceList.value == "OTHER" && wanMode.value == "Bridge")
			{
				cb_dhcprelay.checked = true;
			}
			else
			{
				cb_dhcprelay.checked = false;
			}
		}
		IpVersionChange();
		MTUDispChange();
		MultiVIDDispChange();
		dsliteShow();
		pdEnableShow();
		dhcpEnableShow();
		pppoeProxyShow();
		ppp_dialMethodChg();
	}
}
function onSelectSvrList()
{
//	pdDefaultSel = 1;
	enabledhcpSel = 1;
	onChangeSvrList();
	with (getElById('wan_form'))
	{
		if (serviceList.value == "OTHER" && wanMode.value == "Bridge")
		{
			cb_dhcprelay.checked = true;
		}
		else
		{
			cb_dhcprelay.checked = false;
		}
		if (serviceList.value == "OTHER") {
			showRoute("0");
		}
		else {
			if (wanMode.value == "Route") {
				showRoute("1");
			}
			else {
				showRoute("0");
			}
		}
	}
}
function ServiceListLoad(isBridge)
{
	var bridgeArray = new Array('INTERNET', 'OTHER'	);
	var i = 0;
	var status = '<% tcWebApi_get("WanInfo_WanIF","ServiceList","s") %>';
	var isSel = 0;
	var routeArray = new Array('INTERNET', 'OTHER');
	with ( getElById('serviceList') )
	{
		options.length = 0;
		if (document.getElementById('serviceList').parentNode.getElementsByClassName("select-items")[0]) {
			document.getElementById('serviceList').parentNode.getElementsByClassName("select-items")[0].innerHTML = "";
			document.getElementById('serviceList').parentNode.getElementsByClassName("select-selected")[0].innerHTML = "";
		}
		if ( 1 == isBridge )
		{
			for( i=0; i< bridgeArray.length; i++)
			{
				var is_selected = false;
				if ( status == bridgeArray[i] )
				{
					is_selected = true;
					isSel = i;
				}
				cs_addoption(document.getElementById('serviceList'),bridgeArray[i], bridgeArray[i]); 
			}
			cs_chooseoption(document.getElementById('serviceList'), isSel);
		}
		else
		{
			for( i=0; i< routeArray.length; i++)
			{
				var is_selected = false;
				if ( status == routeArray[i] )
				{
					is_selected = true;
					isSel = i;
				}
				cs_addoption(document.getElementById('serviceList'),routeArray[i], routeArray[i]);
			}
			cs_chooseoption(document.getElementById('serviceList'), isSel);
		}
		if ( -1 == isWanModeChg )
			isWanModeChg = isBridge;
		else
		{
			if ( isWanModeChg != isBridge )
			{
				isWanModeChg = isBridge;
				onSelectSvrList();
			}
		}
	}
}
function IpModeChange()
{
	with (getElById('wan_form'))
	{
		var ipVer = getRadioVal("IpVersion");
		if (IpMode[0].checked == true)
		{
		setDisplay('secStaticItems',0);
		setDisplay('secPppoeItems',0);
		document.wan_form.ISPTypeValue.value = "0";
			if("IPv4/IPv6" == ipVer){
				if(getSelectVal('linkMode') == 'linkIP')
					WriteIPv6List(0);
			}
		}
		else if (IpMode[1].checked == true)
		{
		setDisplay('secStaticItems',1);
		setDisplay('secPppoeItems',0);
		document.wan_form.ISPTypeValue.value = "1";
			if("IPv4/IPv6" == ipVer){
				if(getSelectVal('linkMode') == 'linkIP')
					WriteIPv6List(2);
			}
		}
		else if (IpMode[2].checked == true)
		{
		setDisplay('secStaticItems',0);
		setDisplay('secPppoeItems',1);
		document.wan_form.ISPTypeValue.value = "2";
		}
		else if (IpMode[3].checked == true)
		{
		setDisplay('secStaticItems',0);
		setDisplay('secPppoeItems',1);
		document.wan_form.ISPTypeValue.value = "3";
		}
		else if (IpMode[4].checked == true)
		{
		setDisplay('secStaticItems',1);
		setDisplay('secPppoeItems',0);
		document.wan_form.ISPTypeValue.value = "4";
		}
	}
}
function DialMethodChange()
{
<% if tcWebApi_get("WebCustom_Entry", "isPPPoEOnDemandWEBUISupported", "h") <> "Yes"  then %>
<% if TCWebApi_get("WebCustom_Entry","isPPPoEOnDemandSupported","h" ) = "Yes" then %>
	setDisplay('secIdleTime',0);
	setDisplay('secManualDial',0);
<% else %>
	var cntMode = getSelectVal('DialMethod');
	if (cntMode == 'AlwaysOn')
	{
		setDisplay('secIdleTime',0);
		setDisplay('secManualDial',0);
		setText('ConnectionFlag', "Connect_Keep_Alive");
	}
	else if (cntMode == 'Manual')
	{
		setDisplay('secIdleTime',0);
		setDisplay('secManualDial',1);
		setText('ConnectionFlag', "Connect_Manually");
		if(0 == ppp_flag){
			setDisable('pppDialButton',1);
			setText('pppDialButton', '<%tcWebApi_get("String_Entry","DialManualText","s")%>');
		}
		else if(1 == ppp_flag){
			if(0 == manual_flag){
				setDisable('pppDialButton',0);
				setText('pppDialButton', '<%tcWebApi_get("String_Entry","DisConnectText","s")%>');
				setText('pppManualStatus_Flag', 'disconnect');
			}
			else{
				setDisable('pppDialButton',0);
				setText('pppDialButton', '<%tcWebApi_get("String_Entry","DialManualText","s")%>');
				setText('pppManualStatus_Flag', 'connect');
			}
		}
		else
		{
			setDisable('pppDialButton',1);
			setText('pppDialButton', '<%tcWebApi_get("String_Entry","DialManualText","s")%>');
		}
	}
<% end if %>
<% end if %>
}
function WanModeChange()
{
with (getElById('wan_form'))
{
	if (wanMode.value == "Route")
	{
		ServiceListLoad(0);
		setDisplay('secIpMode',1);
		setDisplay('secRouteItems',1);
		setDisplay('divLink', 1);
		setDisplay('secDhcp',1);
		setDisplay('secStatic',1);
		setDisplay('secPppoe',1);
		setDisplay('secbridgeDhcprelay',0);
		setDisplay('secBridgeType',0);
		if (serviceList.value == "TR069" || serviceList.value == "VOICE" || serviceList.value == "TR069_VOICE")
		{
			setDisplay('secNat',0);
		}
		else
		{
			setDisplay('secNat',1);
		}
		setDisplay('secIgmp',1);
		IpModeChange();
<%if tcWebApi_get("WebCustom_Entry","isCTPONC9Supported","h" ) = "Yes" then%>
		setDisplay('secCloneMAC', 1);
<%end if%>
		$("#WanModeHeader").text("<%tcWebApi_get("String_Entry","WanRouteSettings","s")%>");
		if (serviceList.value == "INTERNET") {
			showRoute("1");
		}
		else {
			showRoute("0");
		}
	}
	else if (wanMode.value == "Bridge")
	{
		ServiceListLoad(1);
		setDisplay('secIpMode',0);
		setDisplay('secRouteItems',0);
		setDisplay('divLink', 0);
		setDisplay('secStaticItems',0);
		setDisplay('secPppoeItems',0);
		setDisplay('secDhcp',0);
		setDisplay('secStatic',0);
		setDisplay('secPppoe',0);
		setDisplay('secBridgeType',1);
		setDisplay('cb_dhcprelay',1);
		getElement('secbridgeDhcprelay').style.display = "";
		//setRadio("IpVersion", "IPv4");
		setDisplay('secNat',0);
		nat.value = "Disable";
		setDisplay('secIgmp',0);
<%if tcWebApi_get("WebCustom_Entry","isCTPONC9Supported","h" ) = "Yes" then%>
		setDisplay('secCloneMAC', 0);
<%end if%>
		$("#WanModeHeader").text("<%tcWebApi_get("String_Entry","WanBridgeSettings","s")%>");
		showRoute("0");
	}
	else if (wanMode.value == "multMode")
	{
		setDisplay('secIpMode',1);
		setDisplay('secRouteItems',1);
		setDisplay('secDhcp',0);
		setDisplay('secStatic',0);
		setDisplay('secPppoe',1);
		setDisplay('secbridgeDhcprelay',0);
		IpMode[2].checked = true;
		setDisplay('secNat',1);
		setDisplay('secIgmp',1);
		IpModeChange();
		$("#WanModeHeader").text("MultiWAN Settings");
	}
	if (AddFlag == true)
	{
		if (serviceList.value == "OTHER" && wanMode.value == "Bridge")
		{
			cb_dhcprelay.checked = true;
		}
		else
		{
			cb_dhcprelay.checked = false;
		}
	}
	IpVersionChange();
		MTUDispChange();
		MultiVIDDispChange();
	dsliteShow();
	pdEnableShow();
	dhcpEnableShow();
	pppoeProxyShow();
	ppp_dialMethodChg();
}
}
function showRoute(showhide) {
	if (showhide == "1") {
		$("#secRoutev4").show();
		$("#secRoutev6").show();
		if (document.wan_form.IpVersion.value == "IPv4") {
			$("#cb_routev6").attr("checked",false);
			$("#secRoutev6").hide();
		}
		if (document.wan_form.IpVersion.value == "IPv6") {
			$("#cb_routev4").attr("checked",false);
			$("#secRoutev4").hide();
		}
	}
	else {
		$("#cb_routev4").attr("checked",false);
		$("#cb_routev6").attr("checked",false);
		$("#secRoutev4").hide();
		$("#secRoutev6").hide();
	}
}
function showUI() {
	// ONT-269 
	if (document.getElementById('wanId').length >= 7) {
		$("#btnAddCnt").hide();
	}
	if (document.getElementById('wanId').value == "0") {
		$("#btnRemoveCnt").hide(); // Do not allow to remove Wan0
	}
	<% if tcwebApi_get("WanInfo_WanIF","is_omci","h") = "1" then %>
	disable_all_input();
	<% end if %>
	with (getElById('wan_form'))
	{
		Wan_Flag.value = "0";
		var wanStatus = "<% tcWebApi_get("WanInfo_Common","ErrCode","s") %>";
		if((0 != parseInt(wanStatus)) && (wanStatus != "N/A"))
		{
			if(99 == parseInt(wanStatus))
			{
				alert(msg[5]);
			}
			else{
				alert(msg[parseInt(wanStatus)]);
			}
			submitAsync("wan_form");
		}
		oldIpVer = getRadioVal("IpVersion");
		if ((CurWan.length-1) > 0)
		{
			WanModeChange();
			if (serviceList.value == "TR069" || serviceList.value == "VOICE" || serviceList.value == "TR069_VOICE" )
			{
				dhcpv6pdflag.value = "No";
				setDisplay('secBind',0);
				setDisplay('secNat',0);
				setDisplay('legend_port_bindding',0);
				clearBindList();
			}
			else
			{
				var ipVer = getRadioVal("IpVersion");
				setDisplay('secBind',1);
				setDisplay('legend_port_bindding',1);
				if((wanMode.value == "Bridge") || ("IPv6" == ipVer)) setDisplay('secNat',0);
				else setDisplay('secNat',1);
			}
			if(linkMode.value == "linkPPP")
				DialMethodChange();
			VLANModeChg();
			WanCurrIFIdx.value = getIFIdxvidDomain(getSelectVal('wanId'));
		}
		else
		{
			IpMode[2].checked = false;
			onChangeSvrList(1);
			ServiceListLoad(0);
		}
		var isCYE8SFUSupported="<% tcwebApi_get("WebCustom_Entry","isCYE8SFUSupported","s") %>";
		var wanuilimit="<% tcWebApi_get("WanInfo_Common","NOWANUILIMIT","s") %>";
		if("Yes" == isCYE8SFUSupported && "1" != wanuilimit){
		  $("#btnAddCnt").hide();
		  btnRemoveCnt.style.display="none";
		}
	}
	onSelectSvrList();
}
function cb_enblServiceChange()
{
	if(document.wan_form.cb_enblService.checked)
		document.wan_form.WanActive.value = "Yes";
	else
		document.wan_form.WanActive.value = "No";
}
function EnableDHCPRealy()
{
	if(document.wan_form.cb_dhcprelay.checked)
		document.wan_form.dhcprelay.value = "Yes";
	else
		document.wan_form.dhcprelay.value = "No";
}
function EnableNatClick()
{
	if(document.wan_form.cb_nat.checked)
		document.wan_form.nat.value = "Enable";
	else
		document.wan_form.nat.value = "Disable";
}
function ManualCntSubmit()
{
	if (AddFlag == true)
	{
		return;
	}
	setDisable('btnRemoveCnt',1);
	setDisable('btnOK',1);
	$("#btnAddCnt").prop("disabled",true);
	setDisable('pppDialButton',1);
	document.wan_form.Wan_Flag.value = "4";
	submitAsync("wan_form");
}
function cb_pdEnableChange()
{
		var pdEnable = getCheckVal('cb_enabledpd');
		pdModeShow(pdEnable);
}
function OnIPv6Changed()
{
with (getElById('wan_form'))
{
	var linkstr = getSelectVal('linkMode');
	var AddrType = getSelectVal('IdIpv6AddrType');
	if (AddrType == 'SLAAC')
	{
				setDisplay('TrIpv6Addr', 0);
				setDisplay('TrIpv6Dns1', 0);
				setDisplay('TrIpv6Dns2', 0);
				setDisplay('TrIpv6GatewayInfo', 0);
				setDisplay('TrIpv6Gateway', 0);
				ISPTypeValue.value = "0";
	}
	else if (AddrType == 'DHCP')
	{
				setDisplay('TrIpv6Addr', 0);
				setDisplay('TrIpv6Dns1', 0);
				setDisplay('TrIpv6Dns2', 0);
				setDisplay('TrIpv6Gateway', 1);
				setDisplay('TrIpv6GatewayInfo', 1);
				ISPTypeValue.value = "0";
	}
	else if (AddrType == 'Static')
	{
				setDisplay('TrIpv6Addr', 1);
				setDisplay('TrIpv6Dns1', 1);
				setDisplay('TrIpv6Dns2', 1);
				setDisplay('TrIpv6Gateway', 1);
				setDisplay('TrIpv6GatewayInfo', 1);
				ISPTypeValue.value = "1";
	}
	dsliteShow();
	pdEnableShow();
}
}
function linkModeSelect()
{
	with (getElById('wan_form'))
	{
		isNeedChange = 1;
		var ipVer = getRadioVal("IpVersion");
		if (getSelectVal('linkMode') == 'linkIP')
		{
			if("IPv6" == ipVer)
				WriteIPv6List(1);
			else if("IPv4/IPv6" == ipVer)
			{
				if(IpMode[0].checked)
					WriteIPv6List(0);
				else if(IpMode[1].checked)
					WriteIPv6List(2);
				else
					WriteIPv6List(0);
			}
			setDisplay("secDhcp", 1);
			setDisplay('secStatic',1);
			if (SelWanIndex != -1)
			{
			}
			else
			{
				IpMode[0].checked = true;
			}
		}
		else
		{
			if("IPv4" != ipVer)
				WriteIPv6List(0);
			setDisplay("secDhcp", 0);
			setDisplay('secStatic',0);
			IpMode[2].checked = true;
			DialMethodChange();
		}
		setDisplay('secPppoe',0);
		IpModeChange();
		IpVersionChange();
		MTUDispChange();
		dsliteShow();
		pdEnableShow();
		dhcpEnableShow();
		pppoeProxyShow();
		ppp_dialMethodChg();
	}
}
function WanModeSelect()
{
	isNeedChange = 1;
	WanModeChange();
	linkModeSelect();
	with (getElById('wan_form'))
	{
	if (serviceList.value == "OTHER" && wanMode.value == "Bridge")
	{
	cb_dhcprelay.checked = true;
	}
	else
	{
	cb_dhcprelay.checked = false;
	}
		if ( serviceList.value != "TR069"
	&& serviceList.value != "VOICE"
	&& serviceList.value != "TR069_VOICE"
	 && 'Route' == wanMode.value )
		{
			nat.value = "Enable";
			setCheck('cb_nat', 1);
		}
	}
}
function AddOption(selItem,value,text,ifSelected)
{
	var option = document.createElement("option");
	option.innerHTML = text;
	option.value = value;
	option.selected = ifSelected;
	selItem.appendChild(option);
}
function RemoveOption(selItem,index)
{
	selItem.removeChild(selItem.options[index]);
}
function resetText()
{
	var Inputs = document.getElementsByTagName("input");
	for (var i = 0; i < Inputs.length; i++)
	{
	if (Inputs[i].type == "text" || Inputs[i].type == "password" )
	{
	Inputs[i].value = '';
	}
	}
}
function WanIdChange()
{
	document.wan_form.Wan_Flag.value  = "2";
	document.wan_form.curSetIndex.value = getSelectVal('wanId');	
	submitAsync("wan_form");
}
function lockObj(objName, readST)
{
	if ( null != getElById(objName) )
	{
		getElById(objName).readOnly = readST;
		getElById(objName).style.color = readST ? 'gray' : '';
	}
}
function btnAddWanCnt()
{
	if (CurWan.length >= 8)
	{
		alert("<%tcWebApi_get("String_Entry","OnlyCreateEightWANText","s")%>");
		return;
	}
	if (AddFlag == true)
	{
		alert("<%tcWebApi_get("String_Entry","SaveConnectionText","s")%>");
		return;
	}
<% if tcwebApi_get("WanInfo_Common","NoGUIAccessLimit","h" ) <> "1" then %>
	LockTR69Node(0);
<% end if %>
	AddFlag = true;
	<% if tcwebApi_get("WanInfo_WanIF","is_omci","h") = "1" then %>
	enable_all_input();
	$("#omci_note").hide();
	<% end if %>
	resetText();
	with (getElById('wan_form'))
	{
		cs_addoption(getElementByName('wanId'),-1,'<%tcWebApi_get("String_Entry","NewWANConnectionText","s")%>',true);
		$("#btnAddCnt").prop("disabled",true);
		setSelect('linkMode', 'linkPPP');	
<% if tcwebApi_get("WanInfo_Common","NoGUIAccessLimit","h" ) <> "1" then %>
		isAddBtnClick = 1;
		ServiceListLoad(1);
<% end if %>
		setSelect('serviceList','INTERNET');
		setText('ConnectionFlag', "Connect_Keep_Alive");
		setCheck('cb_enblService',1);
		setSelect('wanMode',"Route");
		setSelect('bridgeMode', "PPPoE_Bridged");
<% if tcWebApi_get("WebCustom_Entry", "isPPPoEOnDemandWEBUISupported", "h") = "Yes"  then %>
		setSelect('ppp_DialMethod', "Connect_Keep_Alive");
		pppTimeOut.value = 30;
		pppondemand_idletime.value = parseInt(pppTimeOut.value) * 60;
<% end if %>
		lockObj('pppUserName',false);
		lockObj('pppPassword',false);
		lockObj('vlan',false);
		SelWanIndex = -1;
		enabledhcpSel = 1;
		WanModeChange();
		onChangeSvrList();
		IpMode[2].checked = true;
		IpModeChange();
		VLANModeChg();
<% if tcWebApi_get("WebCustom_Entry", "isMultiLanSupported","h") = "Yes" then %>
		var LanNum = 8;
<% else %>
		var LanNum = 4;
<% end if %>			
		for (var i = 0; i < LanNum; i++)
		{
			var checkString = 'cb_bindlan' + (i+1);
			setCheck(checkString,0);			
		}
<% if tcWebApi_get("WebCustom_Entry", "isMultiUserITFSupported","h") = "Yes" then %>
		var WlanNum = 8;
<% else %>
		var WlanNum = 4;
<% end if %>
		for (var i = 0; i < WlanNum; i++)
		{
			checkString = 'cb_bindwireless' + (i+1);
			setCheck(checkString,0);
<% if tcWebApi_get("WebCustom_Entry", "isWLanACSupported","h") = "Yes" then %>	 			
			checkString = 'cb_bindwirelessac' + (i+1);
			setCheck(checkString,0);
<% end if %>			
		}
		setRadio('pdmode', 'Yes');
<%if tcWebApi_get("WebCustom_Entry","isCTPONC9Supported","h" ) = "Yes" then%>
		setText('wanhwaddress', '00:00:00:00:00:00');
<%end if%>
		$("#cb_routev4").attr("checked",false);
		$("#cb_routev6").attr("checked",false);
	}
}
function btnRemoveWanCnt()
{
	if ((CurWan.length - 1) == 0)
	{
		alert("<%tcWebApi_get("String_Entry","FailWANConnection1Text","s")%>");
		return;
	}
	if (AddFlag == true)
	{
		alert("<%tcWebApi_get("String_Entry","FailWANConnection2Text","s")%>");
		return;
	}
	if (confirm("<%tcWebApi_get("String_Entry","DeleteWANConnection1Text","s")%>") == false)
		return;
<%if tcWebApi_get("WanInfo_WanIF","DefRoute4","h") = "1" then%>
	alert("<%tcWebApi_get("String_Entry","FailWANConnection3Text","s")%>");
	return;
<%end if%>
	var	vForm = document.wan_form;
	vForm.Wan_Flag.value = "3";
	for(var i=0; i<(CurWan.length-1); i++)
	{
		if(CurWan[i].domain != vForm.curSetIndex.value)
		{
			vForm.afterdeleteFlag.value = CurWan[i].domain;
			break;
		}
	}
	setDisable('btnRemoveCnt',1);
	setDisable('btnOK',1);
	setDisable('btnAddCnt',1);
	vForm.OperatorStyle.value = "Del";
	submitAsync("wan_form");
}
function CancelAddCnt()
{
	with (getElById('wan_form'))
	{
		cs_removeoption(getElement('wanId'),wanId.length - 1);
		AddFlag = false;
		btnAddCnt.disabled = false;
	}
}
function onCancel()
{
	var wanIdItem = getElement('wanId');
	if (wanIdItem.value == -1)
	{
		CancelAddCnt();
		if (wanIdItem.length > 0)
		{
			WanIdChange();
		}
	}
	else RefreshPage();
}
function ClearStatusVar()
{
	wanList = '';
	pvcByUseIndex = -1;
	changePVCFlag = true;
}
function getLinkType(mode,ipMode,brMode)
{
	if (mode == "Route")
	{
		if (ipMode == 'PPPoA')
		{
			return 'PPPoA';
		}
		else if (ipMode == 'IPoA')
		{
			return 'IPoA';
		}
		else if (ipMode == 'CIP')
		{
			return 'CIP';
		}
		else
		{
			return 'EoA';
		}
	}
	else if (mode == "Bridge")
	{
		return 'EoA';
	}
}
function getWanType(mode,ipMode,brMode)
{
	var LinkType = getLinkType(mode,ipMode,brMode);
	if (mode == 'Bridge' && LinkType == 'EoA')
	{
		if (brMode == 'IP_Bridged')
		{
			return 'WANIPConnection';
		}
		else
		{
			return 'WANPPPConnection';
		}
	}
	if ((LinkType == 'EoA' && ipMode == 'PPPoE') || (LinkType == 'PPPoA'))
	{
		return 'WANPPPConnection';
	}
	else if ((LinkType == 'EoA' && ipMode != 'PPPoE') || (LinkType == 'IPoA') || (LinkType == 'CIP'))
	{
		return 'WANIPConnection';
	}
}
function getMaxIFIdx()
{
	var IFIdxLen = IFIdxArray.length;
	var IFIdxStoreV = 0;
	var i = 0;
	var IFIdxV = 0;
	if ( isPlusInteger(IFIdxStore) )
		IFIdxStoreV = parseInt(IFIdxStore);
	IFIdxStoreV ++;
	for ( i = IFIdxStoreV; i <= 99; i ++ )
	{
		if (!isIdExist(i))
			return i;
	}
	for ( i = 1; i < IFIdxStoreV; i ++ )
	{
		if (!isIdExist(i))
			return i;
	}
	return 1; 
}
function isIdExist(ifIdx)
{
	var i = 0;
	var IFIdxV = 0;
	var IFIdxLen = IFIdxArray.length;
	for ( i = 0; i < IFIdxLen; i ++ )
	{
		IFIdxV = parseInt(IFIdxArray[i]);
		if ( IFIdxV == ifIdx )
			return true;
	}
	return false;
}
function isDigit(val) {
	if (val < '0' || val > '9')
		return false;
	return true;
}
function isDecimalDigit(digit)
{
	if ( digit == "" )
	{
		return false;
	}
	for ( var i = 0 ; i < digit.length ; i++ )
	{
		if ( !isDigit(digit.charAt(i)) )
		{
			return false;
		}
	}
	return true;
}
function isUseableIpAddress(address)
{
	var num = 0;
	var addrParts = address.split('.');
	if (addrParts.length != 4)
	{
		return false;
	}
	if (isDecimalDigit(addrParts[0]) == false)
	{
		return false;
	}
	num = parseInt(addrParts[0]);
	if (!(num >= 1 && num <= 223 && num != 127))
	{
		return false;
	}
	for (var i = 1; i <= 2; i++)
	{
		if (isDecimalDigit(addrParts[i]) == false)
		{
			return false;
		}
		num = parseInt(addrParts[i]);
		if (!(num >= 0 && num <= 255))
		{
			return false;
		}
	}
	if (isDecimalDigit(addrParts[3]) == false)
	{
		return false;
	}
	num = parseInt(addrParts[3]);
	if (!(num >= 1 && num <= 254))
	{
		return false;
	}
	return true;
}
function CheckForm(type)
{
	if (type == 0)
	{
		return true;
	}
	with (getElById('wan_form'))
	{
		ClearStatusVar();
		if (wanId.length == 0)
		{
		alert("<%tcWebApi_get("String_Entry","NoWanConnectionText","s")%>");
		return false;
		}
		if ( serviceList.value.indexOf('TR069') >= 0 )
		{
			for(var i=0; i< (CurWan.length-1); i++)
			{
				if ( false == AddFlag && curSetIndex.value == CurWan[i].domain )
					continue;
				if ( CurWan[i].WanName.indexOf('TR069') >= 0 )
				{
					alert('<%tcWebApi_get("String_Entry","OnlyCreateOneText","s")%>');
					return false;
				}
			}
		}
		if ( 'TAG' == VLANMode.value )
		{
			var v = vlan.value;
			if(isPlusInteger(v) == false)
			{
				alert("VLAN ID <%tcWebApi_get("String_Entry","IsInvalidText","s")%>!");
				return false;
			}
			else
			{
				if ((v == "") || (v < 1) || (v > 4094))
				{
				alert("VLAN ID <%tcWebApi_get("String_Entry","IsInvalidText","s")%>!");
				return false;
				}
			}
		}
		if ( 'TAG' == VLANMode.value )
		{
			var v = v8021P.value;
			if (isPlusInteger(v) == false)
			{
				alert("802.1p <%tcWebApi_get("String_Entry","IsInvalidText","s")%>!");
				return false;
			}
			else
			{
				if ((v == "") || (v < 0) || (v > 7))
				{
					alert("802.1p <%tcWebApi_get("String_Entry","IsInvalidText","s")%>!");
					return false;
				}
			}
		}
		if ( 'none' != getElement('mulvidsec').style.display )
		{
			var v = MulticastVID.value;
			<% if tcwebApi_get("WanInfo_WanIF","is_omci","h") <> "1" then %>
			if ( 0 != v.length)
			{
				if (isPlusInteger(v) == false)
				{
					alert("<%tcWebApi_get("String_Entry","MulticastText","s")%> VLAN ID <%tcWebApi_get("String_Entry","IsInvalidText","s")%>!");
					return false;
				}
				else
				{
					if ( v < 1 || v > 4094 )
					{
						alert("<%tcWebApi_get("String_Entry","MulticastText","s")%> VLAN ID <%tcWebApi_get("String_Entry","IsInvalidText","s")%>!");
						return false;
					}
				}
			}
			<%end if %>
			MulVIDUsed.value = 'Yes';
		}
		else
			MulVIDUsed.value = 'No';
		if ( 'none' != getElement('MTUsec').style.display )
		{
			var v = MTU.value;
			if (isPlusInteger(v) == false)
			{
				alert("MTU <%tcWebApi_get("String_Entry","IsInvalidText","s")%>!");
				return false;
			}
			else
			{
				if (getSelectVal('linkMode') == 'linkPPP')
				{
					if ('IPv4' == getRadioVal('IpVersion'))
					{
						if ((v == '') || ( 0 != v && (v < 128) || (v > 1492)))
						{
							alert("<%tcWebApi_get("String_Entry","InvalidMTU1Text","s")%>");
							return false;
						}
					}
					else
					{
	<% if tcwebApi_get("WebCustom_Entry","isDSLiteSupported","h" ) = "Yes" then %>
					if (getCheckVal('cb_enabledslite') == 1){
						if ((v == '') || ( 0 != v && (v < 1320) || (v > 1492)))
						{
							alert("<%tcWebApi_get("String_Entry","InvalidMTU2Text","s")%>");
							return false;
						}					
					}else{
	<% end if %>
						if ((v == '') || ( 0 != v && (v < 1280) || (v > 1492)))
						{
							alert("<%tcWebApi_get("String_Entry","InvalidMTU3Text","s")%>");
							return false;
						}					
	<% if tcwebApi_get("WebCustom_Entry","isDSLiteSupported","h" ) = "Yes" then %>
					}
	<% end if %>			
					}
				}
				else
				{
					if ('IPv4' == getRadioVal('IpVersion'))
					{				
						if ((v == '') || ( 0 != v && (v < 576) || (v > 1500)))
						{
							alert("<%tcWebApi_get("String_Entry","InvalidMTU4Text","s")%>");
							return false;
						}
					}
					else
					{
	<% if tcwebApi_get("WebCustom_Entry","isDSLiteSupported","h" ) = "Yes" then %>
						if (getCheckVal('cb_enabledslite') == 1){
							if ((v == '') || ( 0 != v && (v < 1320) || (v > 1500)))
							{
								alert("<%tcWebApi_get("String_Entry","InvalidMTU5Text","s")%>");
								return false;
							}				
						}else{
	<% end if %>
						if ((v == '') || ( 0 != v && (v < 1280) || (v > 1500)))
						{
							alert("<%tcWebApi_get("String_Entry","InvalidMTU6Text","s")%>");
							return false;
						}
	<% if tcwebApi_get("WebCustom_Entry","isDSLiteSupported","h" ) = "Yes" then %>
					}
	<% end if %>
					}
				}				
			}
		}
		if ( 'none' != getElement('PDEnableSec').style.display )
		{
			PDUsed.value = 'Yes';
			if (getCheckVal('cb_enabledpd') == 1)
				enablepd.value = 'Yes';
			else
				enablepd.value = 'No';
		}
		else
			PDUsed.value = 'No';
		if ( 'none' != getElement('pdmode_1').style.display )
		{
			pdmodeUsed.value = 'Yes';
			if ( getRadioVal('pdmode') == 'No' )
			{
				var prefixObjs = pdprefix.value.split('/');
				if ( prefixObjs.length != 2 )
				{
					alert("<%tcWebApi_get("String_Entry","InvalidAddressFormatText","s")%> XXXX:XXXX:XXXX:XXXX::/XX");
					return false;	
				}
				if ( true != isGlobalIpv6Address(prefixObjs[0]) )
				{
					alert("<%tcWebApi_get("String_Entry","InvalidIPPrefixText","s")%> XXXX.XXXX.XXXX.XXXX::");
					return false;
				}
				var TemLen = parseInt(prefixObjs[1]);
				if ( true != isPlusInteger(prefixObjs[1]) || true == isNaN(TemLen) || TemLen > 64 || TemLen < 16)
				{
					alert("<%tcWebApi_get("String_Entry","InvalidLengthText","s")%>");
					return false;	
				}
				switch ( CheckPDTime(pdprefixptime.value, pdprefixvtime.value) )
				{
					case 1 :
						alert('<%tcWebApi_get("String_Entry","PrefixPrimaryTimeText","s")%>" ' + pdprefixptime.value + '" <%tcWebApi_get("String_Entry","IsInvalidText","s")%>!');
						return false;
					case 2 :
						alert('<%tcWebApi_get("String_Entry","PrefixLeaseTimeText","s")%> "' + pdprefixvtime.value + '" <%tcWebApi_get("String_Entry","IsInvalidText","s")%>!');
						return false;
					case 3 :
						alert('<%tcWebApi_get("String_Entry","PrefixLeaseTimeText","s")%> ' + pdprefixvtime.value + ' <%tcWebApi_get("String_Entry","GreaterThanPrimaryTimeText","s")%> ' + pdprefixptime.value);
						return false;
				}
			}
		}
		else
			pdmodeUsed.value = 'No';
		if ( 'none' != getElement('enabledhcpsec').style.display )
		{
			if (getCheckVal('cb_enabledhcp') == 1)
				enable_dhcp.value = '1';
			else
				enable_dhcp.value = '0';
		}
		else
			enable_dhcp.value = '0';
		if (getElement('secPppoeItems').style.display != "none")
		{
			if (getElement('secIdleTime').style.display != "none")
			{
			<% if tcWebApi_get("WebCustom_Entry", "isPPPoEOnDemandWEBUISupported", "h") = "Yes"  then %>
				var idletime_val = pppTimeOut.value;
				if ( 0 == idletime_val.length
						|| false == isPlusInteger(idletime_val)
						|| parseInt(idletime_val) < 1 )
				{
					alert('<%tcWebApi_get("String_Entry","TimeOut1Text","s")%>');
					return false;
				}
				pppondemand_idletime.value = parseInt(idletime_val) * 60;
			<% else %>
				if (isPlusInteger(pppTimeOut.value) == false)
				{
					alert("<%tcWebApi_get("String_Entry","TimeOut2Text","s")%>");
					return false;
				}
				else
				{
					if ((getElement('pppTimeOut').value < 1) || (getElement('pppTimeOut').value > 4320)
					|| (getElement('pppTimeOut').value == ''))
					{
						alert("<%tcWebApi_get("String_Entry","TimeOut2Text","s")%>");
						return false;
					}
				}
			<% end if %>
			}
			if ( (document.wan_form.wanMode.value == 'Route') && (document.wan_form.linkMode.value == 'linkPPP')) {
				if (pppUserName.value.length == 0) {
					alert("<%tcWebApi_get("String_Entry","AdminJS5Text","s")%>");
					return false;
				}
				if (pppPassword.value.length == 0) {
					alert("<%tcWebApi_get("String_Entry","AdminJS0Text","s")%>");
					return false;
				}
				if (isValidNameEx(pppUserName.value) == false)
				{
				alert("<%tcWebApi_get("String_Entry","InvalidUserNameText","s")%>");
				return false;
				}
				if (isValidNameEx(pppPassword.value) == false)
				{
				alert("<%tcWebApi_get("String_Entry","InvalidPasswordText","s")%>");
				return false;
				}
			}
		}
		if ((getElement('secStaticItems').style.display != "none")
		&& ("IPv6" != getRadioVal("IpVersion")))
		{
			if (WanIP != null)
			{
				var iloop;
				for (iloop = 0; iloop< WanIP.length-1; iloop++)
				{
					if ( (vpi != WanIP[iloop].atmVpi) && (vci != WanIP[iloop].atmVci))
					{
						if ( wanIpAddress.value == WanIP[iloop].wanIpAddress)
						{
						alert("IP<%tcWebApi_get("String_Entry","AddressAndText","s")%>" + WanIP[iloop].conName + "<%tcWebApi_get("String_Entry","ConflictText","s")%>") ;
						return false;
						}
					}
				}
			}
			if (!isAbcIpAddress(wanIpAddress.value))
			{
				alert("<%tcWebApi_get("String_Entry","InvalidIPAddressText","s")%>");
				wanIpAddress.focus();
				return false;
			}
			if (!isValidSubnetMask(wanSubnetMask.value))
			{
				alert("<%tcWebApi_get("String_Entry","InvalidMaskText","s")%>");
				wanSubnetMask.focus();
				return false;
			}
			if (!isHostIpWithSubnetMask(wanIpAddress.value, wanSubnetMask.value))
			{
				alert("<%tcWebApi_get("String_Entry","IPAndMaskNotMatchText","s")%>");
				wanIpAddress.focus();
				return false;
			}
			if (!isAbcIpAddress(defaultGateway.value))
			{
				alert("<%tcWebApi_get("String_Entry","InvalidGetwayText","s")%>");
				defaultGateway.focus();
				return false;
			}
			if (!isAbcIpAddress(dnsPrimary.value))
			{
				alert("<%tcWebApi_get("String_Entry","DNSInvalid1Text","s")%>");
				dnsPrimary.focus();
				return false;
			}
			if (!isUseableIpAddress(dnsPrimary.value))
			{
				alert("<%tcWebApi_get("String_Entry","DNSInvalid1Text","s")%>");
				dnsPrimary.focus();
				return false;
			}
			if (!isAbcIpAddress(dnsSecondary.value))
			{
				alert("<%tcWebApi_get("String_Entry","DNSInvalid2Text","s")%>");
				dnsSecondary.focus();
				return false;
			}
			if (!isUseableIpAddress(dnsSecondary.value))
			{
				alert("<%tcWebApi_get("String_Entry","DNSInvalid2Text","s")%>");
				dnsSecondary.focus();
				return false;
			}
		}
		if ((secIPv6Div.style.display != "none"))
		{
			if ('IPv4' != getRadioVal('IpVersion'))
			{
				if (TrIpv6Addr.style.display != "none")
				{
					if (!isGlobalIpv6Address(getValue('IdIpv6Addr')))
					{
					alert("<%tcWebApi_get("String_Entry","IPv6NotCorrect1Text","s")%>");
					return false;
					}
					var v = getValue('IdIpv6PrefixLen');
					if(isPlusInteger(v) == false)
					{
						alert("<%tcWebApi_get("String_Entry","IPv6NotCorrect2Text","s")%>");
						return false;
					}
					else
					{
						if ((v == "") || (v <= 0) || (v > 128))
						{
							alert("<%tcWebApi_get("String_Entry","IPv6NotCorrect2Text","s")%>");
							return false;
						}
						if (v.length > 1 && v.charAt(0) == '0')
						{
							alert("<%tcWebApi_get("String_Entry","IPv6NotCorrect2Text","s")%>");
							return false;
						}
					}
					if (!isUnicastIpv6Address(getValue('IdIpv6Dns1')))
					{
						alert("<%tcWebApi_get("String_Entry","IPv6NotCorrect3Text","s")%>");
						return false;
					}
					var v1 = getValue('IdIpv6Dns2');
					if (v1 != '' && !isUnicastIpv6Address(v1))
					{
						alert("<%tcWebApi_get("String_Entry","IPv6NotCorrect4Text","s")%>");
						return false;
					}
				}
				var v2 = getValue('IdIpv6Gateway');
				if (v2 != '' && !isUnicastIpv6Address(v2))
				{
					alert("<%tcWebApi_get("String_Entry","IPv6NotCorrect5Text","s")%>");
					return false;
				}
			}
		}
	<%if TCWebApi_get("WebCustom_Entry","isDSLiteSupported","h" ) = "Yes" then%>
		if ( 'none' != getElement('dslite_1').style.display )
		{
				if (getCheckVal('cb_enabledslite') == 1)
					enabledslite.value = 'Yes';
				else
					enabledslite.value = 'No';
				dsliteUsed.value = 'Yes';
		}
		else
			dsliteUsed.value = 'No';
	<%end if%>
	<%if tcWebApi_get("WebCustom_Entry","isCTPONC9Supported","h" ) = "Yes" then%>
		if ( !checkWANMac( wanhwaddress.value ) )
		{
			alert('<%tcWebApi_get("String_Entry","MACInvalidText","s")%>');
			return false;	
		}
		wanhwaddress.value = wanhwaddress.value.replace( /-/g , ':' );
	<%end if%>
	<%if TCWebApi_get("WebCustom_Entry","isPPPoEProxySupported","h" ) = "Yes" then%>
		if ( 'none' != getElement('ppp_proxy_bi').style.display )
		{
			ppp_proxy_biUsed.value = 'Yes';
			if ( '1' == getRadioVal("ppp_proxy_bi_mode") && 'none' != getElement('ppp_proxy_user').style.display )
			{
				var pppmaxUser = parseInt(pppproxy_user.value);
				if ( true != isPlusInteger(pppproxy_user.value) || true == isNaN(pppmaxUser) || pppmaxUser > 4 || pppmaxUser < 1)
				{
					alert("<%tcWebApi_get("String_Entry","MaxNumberInvalidText","s")%>");
					return false;
				}
			}
			if ( 0 != getRadioVal("ppp_proxy_bi_mode") )
			{
				if ( 1 == checkDupPPPBi() )
				{
					alert("<%tcWebApi_get("String_Entry","SupportWAN1Text","s")%>");
					return false;
				}
			}
		}
		else
			ppp_proxy_biUsed.value = 'No';
	<%else%>
		if ( 'none' != getElement('ppp_bi').style.display )
		{
			pppbiUsed.value = 'Yes';
			if ( getCheckVal('cb_enable_pppbi') == '1' )
			{
				if ( 1 == checkDupPPPBi() )
				{
						alert("<%tcWebApi_get("String_Entry","SupportWAN2Text","s")%>");
						return false;
				}
				enablepppbi.value = 'Yes';
			}
			else
				enablepppbi.value = 'No';
		}
		else
			pppbiUsed.value = 'No';
	<%end if%>
	}
	<%if TCWebApi_get("WebCustom_Entry","isCTPONC9Supported","h" ) = "Yes" then%>
	function checkHexMAC(byteMAC)
	{
		var idx = 0;
		var c;
		for ( idx = 0; idx < byteMAC.length; idx ++ )
		{
				c = byteMAC.charAt(idx);
				if ( !((c >= '0' && c <= '9')
				     || (c >= 'a' && c <= 'f')) )
				    return false;
		}
		return true;	
	}
	function isSameObj(objs, oneobj)
	{
		var idx = 0;
		for ( idx = 0; idx < objs.length; idx ++ )
		{
				if ( 	objs[idx] != oneobj )
					return false;
		}
		return true;
	}
	function checkWANMac( mac )
	{
		var chkMAC = mac.toLowerCase();
		var macObjs;
		var keys = new Array(':', '-');
		var idx = 0;
		if ( 17 != chkMAC.length )
			return false;
		if ( chkMAC.indexOf( keys[0] ) >= 0 )
			macObjs = chkMAC.split( keys[0] );
		else
			macObjs = chkMAC.split( keys[1] );
		if ( 6 != macObjs.length )
			return false;
		for ( idx = 0; idx < macObjs.length; idx ++ )
		{
				if ( 	2 != macObjs[idx].length )
					return false;
	      if ( !checkHexMAC(macObjs[idx]) )
	      	return false;
		}
		if ( isSameObj(macObjs, 'ff') )
			return false;
		if ( 0x01 == ( macObjs[0] & 0x01 ) ) // multicast mac
			return false;
		return true;
	}
<%end if%>
	mode = getSelectVal('wanMode');
	ipMode = getRadioVal('IpMode');
	brMode = getSelectVal('bridgeMode');
	var type = getLinkType(mode,ipMode,brMode);
	var wanType = getWanType(mode,ipMode,brMode);
	var BindArray = new Array();
	var j = 0;
	for (var i = 1; i <= 4; i++)
	{
		var len = 'InternetGatewayDevice.LANDevice.1.'.length;
		if (getCheckVal('cb_bindlan'+i) == 1)
		BindArray[j++] = getValue('cb_bindlan'+i).substr(len);
		if (getCheckVal('cb_bindwireless'+i) == 1)
			BindArray[j++] = getValue('cb_bindwireless'+i).substr(len);
	}
	if (BindArray.length > 0)
	{
		for (var j = 0; j < Wan.length; j++)
		{
			if ((j != SelWanIndex) && (Wan[j].bind != ""))
			{
				if (mode == "Bridge")
				{
					for (i = 0; i < BindArray.length; i++)
					{
						if (Wan[j].bind.indexOf(BindArray[i]) >= 0)
						{
							alert('<%tcWebApi_get("String_Entry","ConnectionConflictText","s")%>');
							return false;
						}
					}
				}
				else
				{
					if (getRadioVal('IpVersion') == 'IPv4')
					{
						if ((Wan[j].ConnectionType.indexOf("Bridge") >= 0)
						|| (Wan[j].xIpv4Enable == 1))
						{
							for (i = 0; i < BindArray.length; i++)
							{
								if (Wan[j].bind.indexOf(BindArray[i]) >= 0)
								{
									alert('<%tcWebApi_get("String_Entry","ConnectionConflictText","s")%>');
									return false;
								}
							}
						}
					}
					else if (getRadioVal('IpVersion') == 'IPv6')
					{
						if ((Wan[j].ConnectionType.indexOf("Bridge") >= 0)
						|| (Wan[j].xIpv6Enable == 1))
						{
							for (i = 0; i < BindArray.length; i++)
							{
								if (Wan[j].bind.indexOf(BindArray[i]) >= 0)
								{
									alert('<%tcWebApi_get("String_Entry","ConnectionConflictText","s")%>');
									return false;
								}
							}
						}
					}
					else
					{
						for (i = 0; i < BindArray.length; i++)
						{
							if (Wan[j].bind.indexOf(BindArray[i]) >= 0)
							{
								alert('<%tcWebApi_get("String_Entry","ConnectionConflictText","s")%>');
								return false;
							}
						}
					}
				}
			}
		}
	}
	if (AddFlag == true)
	{
		var count = 0;
		var i;
		if (AddFlag == true)
		{
			for (i = 0; i < Wan.length; i++)
			{
				if (Wan[i].atmVpi == vpi && Wan[i].atmVci == vci)
				{
					count++;
				}
			}
			if (count >= 4)
			{
				alert('<%tcWebApi_get("String_Entry","PVCAdd1Text","s")%>');
				return false;
			}
		}
		count = 0;
		if (wanType == 'WANIPConnection') 
		{
			for (i = 0; i < Wan.length; i++)
			{
				if (Wan[i].wanConn == 'IPCon' && Wan[i].atmVpi == vpi
				&& Wan[i].atmVci == vci)
				{
					count++;
				}
			}
			if (count >= 3)
			{
				alert('<%tcWebApi_get("String_Entry","PVCAdd2Text","s")%>');
				return false;
			}
		}
		else if (mode == 'Bridge') 
		{
			for (i = 0; i < Wan.length; i++)
			{
				if ((Wan[i].ConnectionType == 'PPP' || Wan[i].ConnectionType == 'IP' || Wan[i].wanConn == 'IPCon')
				&& Wan[i].atmVpi == vpi
				&& Wan[i].atmVci == vci)
				{
					count++;
				}
			}
			if (count >= 3)
			{
				alert('<%tcWebApi_get("String_Entry","PVCAdd3Text","s")%>');
				return false;
			}
		}
		else 
		{
			for (i = 0; i < Wan.length; i++)
			{
				if ((Wan[i].wanConn == 'PPPCon' && Wan[i].ConnectionType == 'IP_Routed')
				&& Wan[i].atmVpi == vpi
				&& Wan[i].atmVci == vci)
				{
					count++;
				}
			}
			if (count >= 4)
			{
				alert('<%tcWebApi_get("String_Entry","PVCAdd3Text","s")%>');
				return false;
			}
		}
	}
	if (CntPvc.length >= 9 && GetWanIndexPvcByUse(vpi,vci) == -1)
	{
		if (AddFlag == true)
		{
			alert("<%tcWebApi_get("String_Entry","OnlyCreateEightPVCText","s")%>");
			return false;
		}
	}
	return true;
}
function v4v6BindCheck(curindex, v4BindIdx, v6BindIdx)
{
<%if TCWebApi_get("WebCustom_Entry","isDSLiteSupported","h" ) = "Yes" then%>
	if ( ( curindex == v4BindIdx && (-1 == v6BindIdx ) )
		|| ( curindex == v4BindIdx && curindex == v6BindIdx )
		|| ( curindex == v6BindIdx && (-1 == v4BindIdx ) )
		|| ( curindex == v6BindIdx && curindex == v4BindIdx ) )
		return 1;
	return 0;
<%end if%>
}
//type: 
//0: Add action
//1: Modify action
function	checkBandBoxStatus(type)
{
//lan
	var strCurBind = "";
<% if tcWebApi_get("WebCustom_Entry", "isWLanACSupported","h") = "Yes" then %>
	var aCurBindFlag = new Array(12);
<% else %>
	var aCurBindFlag = new Array(8);
<% end if %>
	aCurBindFlag[0] = "<% tcWebApi_get("WanInfo_WanIF","LAN1","s") %>";
	if(aCurBindFlag[0] != "N/A")
	{
		aCurBindFlag[1] = "<% tcWebApi_get("WanInfo_WanIF","LAN2","s") %>";
		aCurBindFlag[2] = "<% tcWebApi_get("WanInfo_WanIF","LAN3","s") %>";
		aCurBindFlag[3] = "<% tcWebApi_get("WanInfo_WanIF","LAN4","s") %>";
		aCurBindFlag[4] = "<% tcWebApi_get("WanInfo_WanIF","SSID1","s") %>";
		aCurBindFlag[5] = "<% tcWebApi_get("WanInfo_WanIF","SSID2","s") %>";
		aCurBindFlag[6] = "<% tcWebApi_get("WanInfo_WanIF","SSID3","s") %>";
		aCurBindFlag[7] = "<% tcWebApi_get("WanInfo_WanIF","SSID4","s") %>";
<% if tcWebApi_get("WebCustom_Entry", "isWLanACSupported","h") = "Yes" then %>
		aCurBindFlag[8] = "No";
		aCurBindFlag[9] = "No";
		aCurBindFlag[10] = "<% tcWebApi_get("WanInfo_WanIF","SSIDAC1","s") %>";
		aCurBindFlag[11] = "<% tcWebApi_get("WanInfo_WanIF","SSIDAC2","s") %>";
		aCurBindFlag[12] = "<% tcWebApi_get("WanInfo_WanIF","SSIDAC3","s") %>";
		aCurBindFlag[13] = "<% tcWebApi_get("WanInfo_WanIF","SSIDAC4","s") %>";
		for(k=0; k<14; k++)
<% else %>
		for(k=0; k<8; k++)
<% end if %>
		{
			strCurBind = strCurBind + aCurBindFlag[k] + ",";
		}
	}
	var strBindFlag = "";
	var nInterfaces = CurWan.length-1;
	var vForm = document.wan_form;
	if(vForm.cb_bindlan1.checked)
		vForm.bindlan1.value = "Yes";
	else vForm.bindlan1.value = "No";
	strBindFlag = strBindFlag + vForm.bindlan1.value + ",";
	if(vForm.cb_bindlan2.checked)
		vForm.bindlan2.value = "Yes";
	else vForm.bindlan2.value = "No";
	strBindFlag = strBindFlag + vForm.bindlan2.value + ",";
	if(vForm.cb_bindlan3.checked)
		vForm.bindlan3.value = "Yes";
	else vForm.bindlan3.value = "No";
	strBindFlag = strBindFlag + vForm.bindlan3.value + ",";
	if(vForm.cb_bindlan4.checked)
		vForm.bindlan4.value = "Yes";
	else vForm.bindlan4.value = "No";
	strBindFlag = strBindFlag + vForm.bindlan4.value + ",";
	/*wireless*/
	if(vForm.cb_bindwireless1.checked)
		vForm.bindwireless1.value = "Yes";
	else vForm.bindwireless1.value = "No";
	strBindFlag = strBindFlag + vForm.bindwireless1.value + ",";
	if(vForm.cb_bindwireless2.checked)
		vForm.bindwireless2.value = "Yes";
	else vForm.bindwireless2.value = "No";
	strBindFlag = strBindFlag + vForm.bindwireless2.value + ",";
	if(vForm.cb_bindwireless3.checked)
		vForm.bindwireless3.value = "Yes";
	else vForm.bindwireless3.value = "No";
	strBindFlag = strBindFlag + vForm.bindwireless3.value + ",";
	if(vForm.cb_bindwireless4.checked)
		vForm.bindwireless4.value = "Yes";
	else vForm.bindwireless4.value = "No";
	strBindFlag = strBindFlag + vForm.bindwireless4.value;
<% if tcWebApi_get("WebCustom_Entry", "isWLanACSupported","h") = "Yes" then %>
	strBindFlag = strBindFlag + ",No,No,";
/*wireless 5g*/
	if(vForm.cb_bindwirelessac1.checked)
		vForm.bindwirelessac1.value = "Yes";
	else vForm.bindwirelessac1.value = "No";
	strBindFlag = strBindFlag + vForm.bindwirelessac1.value + ",";
	if(vForm.cb_bindwirelessac2.checked)
		vForm.bindwirelessac2.value = "Yes";
	else vForm.bindwirelessac2.value = "No";
	strBindFlag = strBindFlag + vForm.bindwirelessac2.value + ",";
	if(vForm.cb_bindwirelessac3.checked)
		vForm.bindwirelessac3.value = "Yes";
	else vForm.bindwirelessac3.value = "No";
	strBindFlag = strBindFlag + vForm.bindwirelessac3.value + ",";
	if(vForm.cb_bindwirelessac4.checked)
		vForm.bindwirelessac4.value = "Yes";
	else vForm.bindwirelessac4.value = "No";
	strBindFlag = strBindFlag + vForm.bindwirelessac4.value;	
<% end if %>
	var aTemp1 = new Array();
	var aTemp2 = new Array();
	var aTemp3 = new Array();
<%if TCWebApi_get("WebCustom_Entry","isPPPoEProxySupported","h" ) = "Yes" then%>
		if ( 'none' != getElement('ppp_proxy_bi').style.display )
		{
			if ( getRadioVal("ppp_proxy_bi_mode") == '1' )
				return true;
		}
<%end if%>
	if(vBindStatus != "N/A")
	{
		aTemp1 = vBindStatus.split(',');
		aTemp2 = strBindFlag.split(',');
		aTemp3 = strCurBind.split(',');
		/*check ip version;*/
		var strIpversion = vForm.IPVersionValue.value;/*current ip version;*/
<%if TCWebApi_get("WebCustom_Entry","isDSLiteSupported","h" ) = "Yes" then%>
		if ( 'none' != getElement('dslite_1').style.display )
		{
			if (getCheckVal('cb_enabledslite') == 1)
					strIpversion = "IPv4/IPv6";
		}	
<%end if%>
<% if tcWebApi_get("WebCustom_Entry", "isWLanACSupported","h") = "Yes" then %>	
		for(var i=0; i<14; i++)
<% else %>
		for(var i=0; i<8; i++)
<% end if %>
		{
			if((aTemp1[i] == "Yes") && (aTemp2[i] == "Yes"))
			{
<%if TCWebApi_get("WebCustom_Entry","isDSLiteSupported","h" ) = "Yes" then%>
				if (1 == type) /* modify action*/
				{
<% if tcWebApi_get("WebCustom_Entry", "isWLanACSupported","h") = "Yes" then %>	
					if ( ("IPv4" == strIpversion && vForm.curSetIndex.value == parseInt(aTemp1[42+2*i]))
						 || ("IPv6" == strIpversion && vForm.curSetIndex.value == parseInt(aTemp1[42+2*i+1]))
						 || ("IPv4/IPv6" == strIpversion && v4v6BindCheck(vForm.curSetIndex.value, parseInt(aTemp1[42+2*i]), parseInt(aTemp1[42+2*i+1]))) )
						continue;
<% else %>
					if ( ("IPv4" == strIpversion && vForm.curSetIndex.value == parseInt(aTemp1[24+2*i]))
						 || ("IPv6" == strIpversion && vForm.curSetIndex.value == parseInt(aTemp1[24+2*i+1]))
						 || ("IPv4/IPv6" == strIpversion && v4v6BindCheck(vForm.curSetIndex.value, parseInt(aTemp1[24+2*i]), parseInt(aTemp1[24+2*i+1]))) )
						continue;
<% end if %>
				}
<%else%>
				/*continue if it do modify action and the port is bind */
				if((1 == type) && (aTemp3[i] == "Yes")){
					if(0 == ipvChanged)/*ip version  has not changed*/
						continue;
					else{
						/*if("IPv4/IPv6" == strIpversion){*/
							if(3 == ipvChanged){/*ipv4/v6->ipv4 or ipv6*/
								continue;
							}
							else if(1 == ipvChanged){/*ipv4->ipv4/ipv6*/
<% if tcWebApi_get("WebCustom_Entry", "isWLanACSupported","h") = "Yes" then %>
								if(0 == aTemp1[14+2*i+1])/*if ipv6 is not binded, can ok*/
<% else %>	
								if(0 == aTemp1[8+2*i+1])/*if ipv6 is not binded, can ok*/
<% end if %>
									continue;
							}
							else if(2 == ipvChanged){/*ipv6->ipv4/ipv6*/
<% if tcWebApi_get("WebCustom_Entry", "isWLanACSupported","h") = "Yes" then %>	
								if(0 == aTemp1[14+2*i])/*if ipv4 is not binded, can ok*/
<% else %>	
								if(0 == aTemp1[8+2*i])/*if ipv4 is not binded, can ok*/
<% end if %>
									continue;
							}
						/*}*/
					}
				}
<%end if%>
<% if tcWebApi_get("WebCustom_Entry", "isWLanACSupported","h") = "Yes" then %>	
				if((("IPv4" == strIpversion) && (0 == aTemp1[14+2*i])) || (("IPv6" == strIpversion) && (0 == aTemp1[14+2*i+1]))){	
					continue;
				}
<% else %>
				if((("IPv4" == strIpversion) && (0 == aTemp1[8+2*i])) || (("IPv6" == strIpversion) && (0 == aTemp1[8+2*i+1]))){
					continue;
				}
<% end if %>					
				var strindex;
				if(i < 4)
				{
					strindex = i+1;
					alert("Lan" + strindex.toString() + "<%tcWebApi_get("String_Entry","RepeatBindText","s")%>");
				}
<% if tcWebApi_get("WebCustom_Entry", "isWLanACSupported","h") = "Yes" then %>	
				else if(i >=4 && i < 8)
				{
					strindex = i - 3;
						alert("SSID" + strindex.toString() + "<%tcWebApi_get("String_Entry","RepeatBindText","s")%>");
				}
				else
				{
					strindex = i - 9;
					alert("SSIDAC" + strindex.toString() + "<%tcWebApi_get("String_Entry","RepeatBindText","s")%>");
				}
<% else %>
				else
				{
					strindex = i - 3;
					alert("SSID" + strindex.toString() + "<%tcWebApi_get("String_Entry","RepeatBindText","s")%>");
				}
<% end if %>
				return false;
			}
		}	
	}
	return true;
}
function	checkBandBoxStatus1(type)
{
	var strCurBind = "";
	var aCurBindFlag = new Array(24);
	aCurBindFlag[0] = "<% tcWebApi_get("WanInfo_WanIF","LAN1","s") %>";
	if(aCurBindFlag[0] != "N/A")
	{
		aCurBindFlag[1] = "<% tcWebApi_get("WanInfo_WanIF","LAN2","s") %>";
		aCurBindFlag[2] = "<% tcWebApi_get("WanInfo_WanIF","LAN3","s") %>";
		aCurBindFlag[3] = "<% tcWebApi_get("WanInfo_WanIF","LAN4","s") %>";
		aCurBindFlag[4] = "<% tcWebApi_get("WanInfo_WanIF","LAN5","s") %>";
		aCurBindFlag[5] = "<% tcWebApi_get("WanInfo_WanIF","LAN6","s") %>";
		aCurBindFlag[6] = "<% tcWebApi_get("WanInfo_WanIF","LAN7","s") %>";
		aCurBindFlag[7] = "<% tcWebApi_get("WanInfo_WanIF","LAN8","s") %>";
		aCurBindFlag[8] = "<% tcWebApi_get("WanInfo_WanIF","SSID1","s") %>";
		aCurBindFlag[9] = "<% tcWebApi_get("WanInfo_WanIF","SSID2","s") %>";
		aCurBindFlag[10] = "<% tcWebApi_get("WanInfo_WanIF","SSID3","s") %>";
		aCurBindFlag[11] = "<% tcWebApi_get("WanInfo_WanIF","SSID4","s") %>";
		aCurBindFlag[12] = "<% tcWebApi_get("WanInfo_WanIF","SSID5","s") %>";
		aCurBindFlag[13] = "<% tcWebApi_get("WanInfo_WanIF","SSID6","s") %>";
		aCurBindFlag[14] = "<% tcWebApi_get("WanInfo_WanIF","SSID7","s") %>";
		aCurBindFlag[15] = "<% tcWebApi_get("WanInfo_WanIF","SSID8","s") %>";
		aCurBindFlag[16] = "<% tcWebApi_get("WanInfo_WanIF","SSIDAC1","s") %>";
		aCurBindFlag[17] = "<% tcWebApi_get("WanInfo_WanIF","SSIDAC2","s") %>";
		aCurBindFlag[18] = "<% tcWebApi_get("WanInfo_WanIF","SSIDAC3","s") %>";
		aCurBindFlag[19] = "<% tcWebApi_get("WanInfo_WanIF","SSIDAC4","s") %>";
		aCurBindFlag[20] = "<% tcWebApi_get("WanInfo_WanIF","SSIDAC5","s") %>";
		aCurBindFlag[21] = "<% tcWebApi_get("WanInfo_WanIF","SSIDAC6","s") %>";
		aCurBindFlag[22] = "<% tcWebApi_get("WanInfo_WanIF","SSIDAC7","s") %>";
		aCurBindFlag[23] = "<% tcWebApi_get("WanInfo_WanIF","SSIDAC8","s") %>";
		for(k=0; k<24; k++)
		{
			strCurBind = strCurBind + aCurBindFlag[k] + ",";
		}
	}
	var strBindFlag = "";
	var nInterfaces = CurWan.length-1;
	var vForm = document.wan_form;
	if(vForm.cb_bindlan1.checked)
		vForm.bindlan1.value = "Yes";
	else vForm.bindlan1.value = "No";
	strBindFlag = strBindFlag + vForm.bindlan1.value + ",";
	if(vForm.cb_bindlan2.checked)
		vForm.bindlan2.value = "Yes";
	else vForm.bindlan2.value = "No";
	strBindFlag = strBindFlag + vForm.bindlan2.value + ",";
	if(vForm.cb_bindlan3.checked)
		vForm.bindlan3.value = "Yes";
	else vForm.bindlan3.value = "No";
	strBindFlag = strBindFlag + vForm.bindlan3.value + ",";
	if(vForm.cb_bindlan4.checked)
		vForm.bindlan4.value = "Yes";
	else vForm.bindlan4.value = "No";
	strBindFlag = strBindFlag + vForm.bindlan4.value + ",";
	if(vForm.cb_bindlan5.checked)
		vForm.bindlan5.value = "Yes";
	else vForm.bindlan5.value = "No";
	strBindFlag = strBindFlag + vForm.bindlan5.value + ",";
	if(vForm.cb_bindlan6.checked)
		vForm.bindlan6.value = "Yes";
	else vForm.bindlan6.value = "No";
	strBindFlag = strBindFlag + vForm.bindlan6.value + ",";
	if(vForm.cb_bindlan7.checked)
		vForm.bindlan7.value = "Yes";
	else vForm.bindlan7.value = "No";
	strBindFlag = strBindFlag + vForm.bindlan7.value + ",";
	if(vForm.cb_bindlan8.checked)
		vForm.bindlan8.value = "Yes";
	else vForm.bindlan8.value = "No";
	strBindFlag = strBindFlag + vForm.bindlan8.value + ",";
//wireless
	if(vForm.cb_bindwireless1.checked)
		vForm.bindwireless1.value = "Yes";
	else vForm.bindwireless1.value = "No";
	strBindFlag = strBindFlag + vForm.bindwireless1.value + ",";
	if(vForm.cb_bindwireless2.checked)
		vForm.bindwireless2.value = "Yes";
	else vForm.bindwireless2.value = "No";
	strBindFlag = strBindFlag + vForm.bindwireless2.value + ",";
	if(vForm.cb_bindwireless3.checked)
		vForm.bindwireless3.value = "Yes";
	else vForm.bindwireless3.value = "No";
	strBindFlag = strBindFlag + vForm.bindwireless3.value + ",";
	if(vForm.cb_bindwireless4.checked)
		vForm.bindwireless4.value = "Yes";
	else vForm.bindwireless4.value = "No";
	strBindFlag = strBindFlag + vForm.bindwireless4.value;
	strBindFlag = strBindFlag + ",";
	if(vForm.cb_bindwireless5.checked)
		vForm.bindwireless5.value = "Yes";
	else vForm.bindwireless5.value = "No";
	strBindFlag = strBindFlag + vForm.bindwireless5.value + ",";
	if(vForm.cb_bindwireless6.checked)
		vForm.bindwireless6.value = "Yes";
	else vForm.bindwireless6.value = "No";
	strBindFlag = strBindFlag + vForm.bindwireless6.value + ",";
	if(vForm.cb_bindwireless7.checked)
		vForm.bindwireless7.value = "Yes";
	else vForm.bindwireless7.value = "No";
	strBindFlag = strBindFlag + vForm.bindwireless7.value + ",";
	if(vForm.cb_bindwireless8.checked)
		vForm.bindwireless8.value = "Yes";
	else vForm.bindwireless8.value = "No";
	strBindFlag = strBindFlag + vForm.bindwireless8.value;
	strBindFlag = strBindFlag + ",";
//wireless 5g
	if(vForm.cb_bindwirelessac1.checked)
		vForm.bindwirelessac1.value = "Yes";
	else vForm.bindwirelessac1.value = "No";
	strBindFlag = strBindFlag + vForm.bindwirelessac1.value + ",";
	if(vForm.cb_bindwirelessac2.checked)
		vForm.bindwirelessac2.value = "Yes";
	else vForm.bindwirelessac2.value = "No";
	strBindFlag = strBindFlag + vForm.bindwirelessac2.value + ",";
	if(vForm.cb_bindwirelessac3.checked)
		vForm.bindwirelessac3.value = "Yes";
	else vForm.bindwirelessac3.value = "No";
	strBindFlag = strBindFlag + vForm.bindwirelessac3.value + ",";
	if(vForm.cb_bindwirelessac4.checked)
		vForm.bindwirelessac4.value = "Yes";
	else vForm.bindwirelessac4.value = "No";
	strBindFlag = strBindFlag + vForm.bindwirelessac4.value;	
	strBindFlag = strBindFlag + ",";
	if(vForm.cb_bindwirelessac5.checked)
		vForm.bindwirelessac5.value = "Yes";
	else vForm.bindwirelessac5.value = "No";
	strBindFlag = strBindFlag + vForm.bindwirelessac5.value + ",";
	if(vForm.cb_bindwirelessac6.checked)
		vForm.bindwirelessac6.value = "Yes";
	else vForm.bindwirelessac6.value = "No";
	strBindFlag = strBindFlag + vForm.bindwirelessac6.value + ",";
	if(vForm.cb_bindwirelessac7.checked)
		vForm.bindwirelessac7.value = "Yes";
	else vForm.bindwirelessac7.value = "No";
	strBindFlag = strBindFlag + vForm.bindwirelessac7.value + ",";
	if(vForm.cb_bindwirelessac8.checked)
		vForm.bindwirelessac8.value = "Yes";
	else vForm.bindwirelessac8.value = "No";
	strBindFlag = strBindFlag + vForm.bindwirelessac8.value + ",";
	strBindFlag = strBindFlag + "No,No";
	var aTemp1 = new Array();
	var aTemp2 = new Array();
	var aTemp3 = new Array();
<%if TCWebApi_get("WebCustom_Entry","isPPPoEProxySupported","h" ) = "Yes" then%>
		if ( 'none' != getElement('ppp_proxy_bi').style.display )
		{
			if ( getRadioVal("ppp_proxy_bi_mode") == '1' )
				return true;
		}
<%end if%>
	if(vBindStatus != "N/A")
	{
		aTemp1 = vBindStatus.split(',');
		aTemp2 = strBindFlag.split(',');
		aTemp3 = strCurBind.split(',');
		//check ip version;
		var strIpversion = vForm.IPVersionValue.value;//current ip version;
<%if TCWebApi_get("WebCustom_Entry","isDSLiteSupported","h" ) = "Yes" then%>
		if ( 'none' != getElement('dslite_1').style.display )
		{
			if (getCheckVal('cb_enabledslite') == 1)
					strIpversion = "IPv4/IPv6";
		}	
<%end if%>
		for(var i=0; i<26; i++)
		{
			if((aTemp1[i] == "Yes") && (aTemp2[i] == "Yes"))
			{
<%if TCWebApi_get("WebCustom_Entry","isDSLiteSupported","h" ) = "Yes" then%>
				if (1 == type) // modify action
				{
					if ( ("IPv4" == strIpversion && vForm.curSetIndex.value == parseInt(aTemp1[78+2*i]))
						 || ("IPv6" == strIpversion && vForm.curSetIndex.value == parseInt(aTemp1[78+2*i+1]))
						 || ("IPv4/IPv6" == strIpversion && v4v6BindCheck(vForm.curSetIndex.value, parseInt(aTemp1[78+2*i]), parseInt(aTemp1[78+2*i+1]))) )
						continue;
				}
<%else%>
				//continue if it do modify action and the port is bind 
				if((1 == type) && (aTemp3[i] == "Yes")){
					if(0 == ipvChanged)//ip version  has not changed
						continue;
					else{
						//if("IPv4/IPv6" == strIpversion){
							if(3 == ipvChanged){//ipv4/v6->ipv4 or ipv6
								continue;
							}
							else if(1 == ipvChanged){//ipv4->ipv4/ipv6
								if(0 == aTemp1[26+2*i+1])//if ipv6 is not binded, can ok
									continue;
							}
							else if(2 == ipvChanged){//ipv6->ipv4/ipv6
								if(0 == aTemp1[26+2*i])//if ipv4 is not binded, can ok
									continue;
							}
					}
				}
<%end if%>
				if((("IPv4" == strIpversion) && (0 == aTemp1[26+2*i])) || (("IPv6" == strIpversion) && (0 == aTemp1[26+2*i+1]))){	
					continue;
				}
				var strindex;
				if(i < 8)
				{
					strindex = i+1;
					alert("Lan" + strindex.toString() + "<%tcWebApi_get("String_Entry","RepeatBindText","s")%>");
				}
				else if(i >=8 && i < 16)
				{
					strindex = i - 7;
					alert("SSID" + strindex.toString() + "<%tcWebApi_get("String_Entry","RepeatBindText","s")%>");
				}
				else
				{
					strindex = i - 15;
					alert("SSIDAC" + strindex.toString() + "<%tcWebApi_get("String_Entry","RepeatBindText","s")%>");
				}
				return false;
			}
		}	
	}
	return true;
}
function getENCAPstatus()
{
	with (getElById('wan_form'))
	{
		if(wanMode.value == "Bridge")
		{
			ISPTypeValue.value = "3";
			EnCAPFlag.value = "1483 Bridged IP LLC";
		}
		else
		{
			if(linkMode.value == "linkPPP")
			{
				ISPTypeValue.value = "2";//pppoe mode
				EnCAPFlag.value = "PPPoE LLC";
			}
			else
				EnCAPFlag.value = "1483 Bridged IP LLC";
		}
	}
}
function CheckIpVersionState()
{
	var vForm = document.wan_form;
	ipvChanged = 0;
	vForm.IPVersionValue.value = "<% tcWebApi_get("WanInfo_WanIF","IPVERSION","s") %>";
	var vValue = getRadioVal("IpVersion");
	if(vForm.IPVersionValue.value != vValue){
		if(vForm.IPVersionValue.value == "IPv4")
			ipvChanged = 1;
		else if(vForm.IPVersionValue.value == "IPv6")
			ipvChanged = 2;
		else ipvChanged = 3;
	}
	vForm.IPVersionValue.value = vValue;
	with (getElById('wan_form'))
	{
		if(IdIpv6AddrType.value == "SLAAC")
			pppv6Mode.value = "No";
		else if(IdIpv6AddrType.value == "DHCP")
			pppv6Mode.value = "Yes";
		else
			pppv6Mode.value = "N/A";	
	}
}
function CheckPDTime(Time1,Time2)
{
	var TemTime1 = Time1;
	var TemTime2 = Time2;
	if ( TemTime1.length > 10 || '' == TemTime1 )
		return 1;
	if ( TemTime2.length > 10 || '' == TemTime2 )
		return 2;
	if ( true != isPlusInteger(TemTime1))
		return 1;
	if ( true != isPlusInteger(TemTime2))
		return 2;
	TemTime1 = parseInt(Time1);
	TemTime2 = parseInt(Time2);
	if ( TemTime1 > 4294967295 || TemTime1 < 600 )
		return 1;
	if ( TemTime2 > 4294967295 || TemTime2 < 600 )
		return 2;
	if ( TemTime2 <= TemTime1 )
			return 3;
	return true;
}
function CheckDupVLANID() 
{
	var rq_vlanid = document.getElementById("vlan").value;
	var a = document.getElementById("wanId");
	var curWanName = a[a.selectedIndex].innerHTML;
	var curMode = document.wan_form.wanMode.value[0]; /* Only get the first char of wan mode */
	var curVLANMode = document.getElementById("VLANMode").value;
	var curVlanid = document.getElementById("vlan").value;
	var iwan_attr;
	for (var i = 0; i < WanNameList.length; i++)
	{
		if (WanNameList[i] != curWanName)
		{
			iwan_attr = WanNameList[i].split('_'); /* [idx, service, R/B , 'VID', vid] */
			if (curVLANMode == "TAG") {
				if ((curMode == iwan_attr[2]) && (curVlanid == iwan_attr[4])) {
					alert("<%tcWebApi_get("String_Entry","WANDuplicateVIDText","s")%>");
					return false;
				}
			}
			else if (WanVlanModeList[i] == curVLANMode) {
				if (curMode == iwan_attr[2]) {
					alert("<%tcWebApi_get("String_Entry","WANDuplicateVIDText","s")%>");
					return false;
				}
			}
		}
	}
	return true;
}
function doSubmit()
{
	if(CheckForm(1) == false)
		return false;
	if(CheckDupVLANID() == false)
	{
		return false;
	}
	getENCAPstatus();
	CheckIpVersionState();
	cb_enblServiceChange();
	EnableDHCPRealy();
	var	vForm = document.wan_form;
	if(vForm.linkMode.value == "linkPPP")
	{
		DialMethodChange();
		setText('pppManualStatus_Flag', 'disconnect');
	}
	vForm.Wan_Flag.value = "1";
	if(AddFlag == true){
		vForm.OperatorStyle.value = "Add";//add new
<% if tcWebApi_get("WebCustom_Entry", "isMultiUserITFSupported","h") = "Yes" then %>
		if(checkBandBoxStatus1(0) == false)
<% elseif  tcwebApi_get("WebCustom_Entry","isMultiLanSupported","h") = "Yes" then %>
		if(checkBandBoxStatus1(0) == false)
<% else %>
		if(checkBandBoxStatus(0) == false)
<% end if %>	
			return false;
		vForm.WanCurrIFIdx.value = getMaxIFIdx();
	}
	else{
		vForm.OperatorStyle.value = "Modify";//modify
<% if tcWebApi_get("WebCustom_Entry", "isMultiUserITFSupported","h") = "Yes" then %>
		if(checkBandBoxStatus1(1) == false)
<% elseif  tcwebApi_get("WebCustom_Entry","isMultiLanSupported","h") = "Yes" then %>
		if(checkBandBoxStatus1(1) == false)
<% else %>
		if(checkBandBoxStatus(1) == false)
<% end if %>	
			return false;
	}
	setDisable('btnRemoveCnt',1);
	setDisable('btnOK',1);
	setDisable('btnAddCnt',1);
	submitAsync("wan_form");
}
function disable_all_input() {
	var elements = document.wan_form.elements;
	for (var i = 0; i < elements.length; i++) {
		if (elements[i].tagName.toLocaleLowerCase() == "input") {
			if (elements[i].type.toLocaleLowerCase() != "hidden") {
				if (elements[i].id.indexOf("cb_bindwireless") != 0) {
					elements[i].disabled = true;
				}
			}
		}
		if (elements[i].tagName.toLocaleLowerCase() == "select") {
			if (elements[i].id != "wanId") {
				elements[i].disabled = true;
				elements[i].parentElement.classList.add("select-disable");
			}
		}
	}
}
function enable_all_input() {
	var elements = document.wan_form.elements;
	for (var i = 0; i < elements.length; i++) {
		if (elements[i].tagName.toLocaleLowerCase() == "input") {
			if (elements[i].type.toLocaleLowerCase() != "hidden") {
				elements[i].disabled = false;
			}
		}
		if (elements[i].tagName.toLocaleLowerCase() == "select") {
			if (elements[i].id != "wanId") {
				elements[i].disabled = false;
				elements[i].parentElement.classList.remove("select-disable");
			}
		}
	}
}
		</script>
	</head>
	<body class="container" onload="showUI();" id="">
<header class="fixed-top"><nav id="top-nav" class="navbar navbar-expand-lg container"><a class="navbar-brand " href="/cgi-bin/home.asp"><div><img src="/img/logo_home.png" width="100" height="18" alt=""><div style="font-family: sans-serif; font-weight: bold;font-size: 12px;color: #000; margin-top: 0">OPTICAL NETWORK TERMINATION</div></div></a><button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"><em class="fas fa-align-justify"></em></span></button><div class="collapse navbar-collapse" id="navbarCollapse"><ul class="navbar-nav mr-auto sidenav" id="navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/home.asp"><%tcWebApi_get("String_Entry","NavigationHomeText","s")%><span class="sr-only"></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/deviceinfo.asp"><%tcWebApi_get("String_Entry","NavigationStatusDeviceText","s")%><span class="sr-only"></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/wifi-mesh-topology.asp"><%tcWebApi_get("String_Entry","EasyMeshStatus5Text","s")%><span class="sr-only"></span></a></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#status-menu" aria-controls="status-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NavigationStatusStatisticsText","s")%></a><ul class="nav-second-level collapse" id="status-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/sta-statistics.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationTrafficText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/sta-wifiusers.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationStatusUsersText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/sta-users.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","ARPStatusText","s")%></span></a></li></ul></li><li class="nav-item active"><a class="nav-link nav-link-collapse nav-link-show" href="#" id="hasSubItems" data-toggle="collapse" data-target="#network-menu" aria-controls="network-menu" aria-expanded="true"><%tcWebApi_get("String_Entry","NAVNetwork","s")%></a><ul class="nav-second-level show" id="network-menu" data-parent="#navAccordion"><li class="nav-item active"><a class="nav-link" href="/cgi-bin/net-wan.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationBasInternetText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/net-lan.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationBasLANText","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#wifi-menu" aria-controls="wifi-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NAVWifi","s")%></a><ul class="nav-second-level collapse" id="wifi-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/wifi.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationWiFiSettingsText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/wifi-11ac.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationWiFi11acSettingsText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/wifi-mesh.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationMesh","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#firewall-menu" aria-controls="firewall-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NavigationAdvFirewallText","s")%></a><ul class="nav-second-level collapse" id="firewall-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-spi.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","ContentFirewallText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-urlfilter.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","FILTERTYPE_index2","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-macfilter.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVL2Filter","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-parentalcontrol.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","ParentalControlText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/safehome.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","SafehomeText","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#apps-menu" aria-controls="apps-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NAVApplication","s")%></a><ul class="nav-second-level collapse" id="apps-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-dmz.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NatTopDMZText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-portforwarding.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NatVirsvrText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-sslim.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","SessionLimit","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-route.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","StaticRouteText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-ddns.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","dyDNS1Text","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-wifischeduling.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","WifiSchedulingText","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#tools-menu" aria-controls="tools-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NavigationMaintenanceText","s")%></a><ul class="nav-second-level collapse" id="tools-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-admin.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationMainAdminText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-time.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVSysTime","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-firmware.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationMainFirmwareText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-config.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVConfig","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-diagnostic.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationMainDiagnosticsText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-wan2lan.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","Wan2lanText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-log.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVLogs","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-reboot.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","RebootText","s")%></span></a></li></ul></li></ul><div class="top-item-groups"><form name="LanguageForm" method="POST" action="/cgi-bin/net-wan.asp" class="nav-item dropdown"><input type="hidden" name="TokenString" value="<%tcWebApi_getToken()%>"><input type="hidden" name="Language_Flag" value="<% tcWebApi_get("LanguageSwitch_Entry","Type","s") %>"><a class="nav-link dropdown-toggle" href="#" id="LanguageDropdown" role="button" data-toggle="dropdown" aria-expanded="false"><% tcWebApi_get("String_Entry","LoginLanguage","s") %></a><ul class="dropdown-menu" aria-labelledby="LanguageDropdown"><li><a class="dropdown-item <% if tcWebApi_get("LanguageSwitch_Entry","Type","h") = "1" then asp_Write("active") end if %>" href="#" onclick="submitLanguageForm(1);"><% tcWebApi_get("String_Entry","LanguageVIELong","s") %></a></li><li><a class="dropdown-item <% if tcWebApi_get("LanguageSwitch_Entry","Type","h") = "2" then asp_Write("active") end if %>" href="#" onclick="submitLanguageForm(2);"><% tcWebApi_get("String_Entry","LanguageENGLong","s") %></a></li></ul></form><div id="signout" class="nav-item"><a class="nav-link" href="javascript:doLogout();"><em class="fa fa-sign-out-alt"></em><span class="nav-link-text"><% tcWebApi_get("String_Entry","LogoutText","s") %></span></a></div></div></div></header></nav><% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then
	if tcWebApi_get("Mesh_Common", "DeviceRole", "h") = "2" then %>
		<script language='javascript'>
		document.getElementById("network-menu").children[0].style="display: none";
		document.getElementById("network-menu").children[1].style="display: none";
		document.getElementById("wifi-menu").children[0].style="display: none";
		document.getElementById("wifi-menu").children[1].style="display: none";
		</script>
<% end if end if %>		<div id="content">
			<form class="form-inline" METHOD="POST" ACTION="/cgi-bin/net-wan.asp" name="wan_form" >
			<input type="hidden" name="TokenString" value="<%tcWebApi_getToken()%>">
			<div class="row row-w-100">
				<div class="widget col-xs-12 col-lg-12">
					<header><%tcWebApi_get("String_Entry","NavigationBasInternetText","s")%></header>
					<div class="widget-body">
						<fieldset>
							<div class="form-group">
								<label class="col-lg-5" for="ethIpAddress"><%tcWebApi_get("String_Entry","ConnectionNameText","s")%></label>
								<input type="hidden" id="curSetIndex" name="curSetIndex" value="<% tcWebApi_get("WanInfo_Common","CurIFIndex","s") %>">
								<input type="hidden" id="WanActive" name="WanActive" value="<% tcWebApi_get("WanInfo_WanIF","Active","s") %>">
								<input type="hidden" id="WanCurrIFIdx" name="WanCurrIFIdx" value='1'>
								<div class="col-lg-7 custom-select">
									<select onChange=WanIdChange()  name=wanId id='wanId' >
									</select>
									<script language=JavaScript type=text/javascript>
									  WriteWanNameSelected();
									</script>
									<input type="hidden" id="Wan_Flag" name="Wan_Flag" value="0">
									<input type="hidden" id="EnCAPFlag" name="EnCAPFlag" value="PPPoE">
									<input type="hidden" id="PPPGetIpFlag" name="PPPGetIpFlag" value="Dynamic">
									<input type="hidden" id="ConnectionFlag" name="ConnectionFlag" value="<% tcWebApi_get("WanInfo_WanIF","CONNECTION","s") %>">
									<input type="hidden" id="Enable_Flag" name="Enable_Flag" value="Yes">
									<input type="hidden" id="Disable_Flag" name="Disable_Flag" value="No">
									<input type="hidden" id="afterdeleteFlag" name="afterdeleteFlag" value="0">
									<input type="hidden" id="OperatorStyle" name="OperatorStyle" value="Add">
									<input type="hidden" id="dhcpv6pdflag" name="dhcpv6pdflag" value="Yes">
									<input type="hidden" id="pppManualStatus_Flag" name="pppManualStatus_Flag" value="<% tcWebApi_get("WanInfo_WanIF","PPPManualStatus","s") %>">
								</div>
								<% if tcwebApi_get("WanInfo_WanIF","is_omci","h") = "1" then %>
								<label class="input-description font-italic offset-lg-5 col-lg-7" id="omci_note">
									<%tcwebApi_get("String_Entry","WanIsOMCIText","s")%>
								</label> 
								<%end if %>
							</div>
							<div class="form-group">
								<div class="offset-lg-5 button">
									<button id="btnAddCnt" type="button" class="small-button action-button" onclick="btnAddWanCnt();" title="<%tcWebApi_get("String_Entry","AddWanTitle","s")%>"><%tcWebApi_get("String_Entry","ButtonAddText","s")%></button>
									<button id="btnRemoveCnt" type="button" class="small-button action-button" <% if tcwebApi_get("WanInfo_WanIF","is_omci","h") = "1" then %>style="display:none"<% end if %> onclick="btnRemoveWanCnt();" title="<%tcWebApi_get("String_Entry","DeleteWanTitle","s")%>"><%tcWebApi_get("String_Entry","ButtonDeleteText","s")%></button>
												</div>
							</div>
							<div  class="form-group">
								<label class="col-lg-5" for="wanMode"><%tcWebApi_get("String_Entry","ModeText","s")%></label>
								<div class="col-lg-7 custom-select">
									<select id=select2 onChange=WanModeSelect() name="wanMode" id="wanMode">
										<option value="Route" <%if tcWebApi_get("WanInfo_WanIF","WanMode","h") = "Route" then asp_Write("selected") end if%>>Route </option>
										<option value="Bridge" <%if tcWebApi_get("WanInfo_WanIF","WanMode","h") = "Bridge" then asp_Write("selected") end if%>>Bridge </option>
								  </select>
								</div>
							</div>
							<div  class="form-group">
								<label class="col-lg-5" for="cb_enblService"><%tcWebApi_get("String_Entry","EnableText","s")%></label>
								<label class="toggle-switch">
									<input id=cb_enblService onclick=cb_enblServiceChange() type=checkbox name=cb_enblService <%if tcWebApi_get("WanInfo_WanIF","Active","h") = "Yes" then asp_Write("checked") end if%>>
									<span class="slider"></span>
									<input id=enblService type=hidden name="enblService">
								</label>
							</div>
							<div  class="form-group">
								<label class="col-lg-5" for="serviceList"><%tcWebApi_get("String_Entry","BearerServiceText","s")%></label>
								<div class="col-lg-7 custom-select">
									<select id=serviceList onchange=onSelectSvrList() name=serviceList></select>
								</div>
							</div>
							<div  class="form-group" id=divIpVersion>
								<label class="col-lg-5"><%tcWebApi_get("String_Entry","ProtocolVersionText","s")%></label>
								<div class="custom-control custom-radio col-lg-2">
									<INPUT class="custom-control-input" id="IpVersion_0" onclick="pdDefaultSel=1;IpVersionChange();MTUDispChange();" type=radio value="IPv4" name="IpVersion" <%if tcWebApi_get("WanInfo_WanIF","IPVERSION", "h") = "IPv4" then asp_Write("checked") elseif tcWebApi_get("Wan_Entry","IPVERSION","h") = "N/A" then asp_Write("checked") end if%>>
									<label class="custom-control-label" for="IpVersion_0">IPv4</label>
								</div>
								<div class="custom-control custom-radio col-lg-2">
									<INPUT class="custom-control-input" id="IpVersion_1" onclick="pdDefaultSel=1;IpVersionChange();MTUDispChange();" type=radio value="IPv6" name="IpVersion" <%if tcWebApi_get("WanInfo_WanIF","IPVERSION","h") = "IPv6" then  asp_Write("checked") end if%>>
									<label class="custom-control-label" for="IpVersion_1">IPv6</label>
								</div>
								<div class="custom-control custom-radio col-lg-2">
									<INPUT class="custom-control-input" id="IpVersion_2" onclick="pdDefaultSel=1;IpVersionChange();MTUDispChange();" type=radio value="IPv4/IPv6" name="IpVersion" <%if tcWebApi_get("WanInfo_WanIF","IPVERSION","h") = "IPv4/IPv6" then asp_Write("checked") end if%>>
									<label class="custom-control-label" for="IpVersion_2">IPv4/IPv6</label>
								</div>
								<input type="hidden" id="IPVersionValue" name="IPVersionValue" value="IPv4/IPv6">
								<input type="hidden" id="ISPTypeValue" name="ISPTypeValue" value="<% tcWebApi_get("WanInfo_WanIF","ISP","s") %>">
							</div>
						</fieldset>
					</div>
					<header id="WanModeHeader"><%tcWebApi_get("String_Entry","WanRouteSettings","s")%></header>
					<div class="widget-body">
						<fieldset>
							<legend><%tcWebApi_get("String_Entry","GeneralText","s")%></legend>
							<div  class="form-group" id=divLink>
								<label class="col-lg-5" for="linkMode"><%tcWebApi_get("String_Entry","LinkModeText","s")%></label>
								<div class="col-lg-7 custom-select">
									<SELECT id=linkMode onchange="pdDefaultSel = 1;linkModeSelect()" name="linkMode">
										<OPTION value="linkIP" <%if tcWebApi_get("WanInfo_WanIF","LinkMode","h") = "linkIP" then asp_Write("selected") end if%>><%tcWebApi_get("String_Entry","ConnectIPText","s")%>
										<OPTION value="linkPPP" <%if tcWebApi_get("WanInfo_WanIF","LinkMode","h") = "linkPPP" then asp_Write("selected") end if%>><%tcWebApi_get("String_Entry","ConnectPPPText","s")%>
									</SELECT>
								</div>
							</div>
							<div id=secIpMode>
								<div class="form-group" id=secDhcp>
									<div class="custom-control custom-radio offset-lg-2 col-lg-3">
										<INPUT class="custom-control-input" onclick="IpModeChange()" type=radio value="DHCP" id="IpMode_dynamic" name="IpMode" <%if tcWebApi_get("WanInfo_WanIF","ISP","h") = "0" then asp_Write("checked") end if%>>
										<label class="custom-control-label" for="IpMode_dynamic">DHCP</label>
									</div>
									<label class="pl-lg-0 col-lg-7"><%tcWebApi_get("String_Entry","GetIPFromISPText","s")%></label>
								</div>
								<div class="form-group" id=secStatic>
									<div class="custom-control custom-radio offset-lg-2 col-lg-3">
										<INPUT class="custom-control-input" onclick="IpModeChange()" type=radio value="Static" id="IpMode_staic" name="IpMode" <%if tcWebApi_get("WanInfo_WanIF","ISP","h") = "1" then asp_Write("checked") end if%>>
										<label class="custom-control-label" for="IpMode_staic">Static</label>
									</div>
									<label class="pl-lg-0 col-lg-7"><%tcWebApi_get("String_Entry","GetStaticIPFromISPText","s")%></label>
								</div>
								<div class="form-group" id="secPppoe" style="display:none;">
									<div class="custom-control custom-radio offset-lg-2 col-lg-3">
										<INPUT class="custom-control-input" onclick="IpModeChange()" type=radio value="PPPoE" id="IpMode_PPPoE" name="IpMode" <%if tcWebApi_get("WanInfo_WanIF","ISP","h") = "2" then asp_Write("checked") end if%>>
										<label class="custom-control-label" for="IpMode_PPPoE">PPPoE</label>
									</div>
									<label class="pl-lg-0 col-lg-7"><%tcWebApi_get("String_Entry","ISPUsePPPoEText","s")%></label>
								</div>
								<div class="form-group" id="secPppoa" style="display:none;">
									<div class="custom-control custom-radio offset-lg-2 col-lg-3">
										<INPUT class="custom-control-input" onclick="IpModeChange()" type=radio value="PPPoA" id="IpMode_PPPoA" name="IpMode" <%if tcWebApi_get("WanInfo_WanIF","ISP","h") = "3" then asp_Write("checked") end if%>>
										<label class="custom-control-label" for="IpMode_PPPoA">PPPoA</label>
									</div>
									<label class="pl-lg-0 col-lg-7"><%tcWebApi_get("String_Entry","ISPUsePPPoAText","s")%></label>
								</div>
								<div class="form-group" id="secIpoa" style="display:none;">
									<div class="custom-control custom-radio offset-lg-2 col-lg-3">
										<INPUT class="custom-control-input" onclick="IpModeChange()" type=radio value="IPoA" id="IpMode_IPoA" name="IpMode" <%if tcWebApi_get("WanInfo_WanIF","ISP","h") = "4" then asp_Write("checked") end if%>>
										<label class="custom-control-label" for="IpMode_IPoA">IPoA</label>
									</div>
									<label class="pl-lg-0 col-lg-7"><%tcWebApi_get("String_Entry","ISPUseIPoAText","s")%></label>
								</div>
							</div>
						</fieldset>
						<fieldset>
							<legend id="WANIPCommonOptionText"><%tcWebApi_get("String_Entry","WANIPCommonOptionText","s")%></legend>
							<div class="form-group" id="MTUsec">
								<label class="col-lg-5" for=MTU>MTU</label>
								<input type="text" class="form-control col-lg-5" id=MTU maxLength=4 size=5 name=MTU value="<%if tcWebApi_get("WanInfo_WanIF","MTU","h") <> "N/A" then tcWebApi_get("WanInfo_WanIF","MTU","s") end if%>">&nbsp;
								<label id='MIUDescrip'>[1-1500]</label>
							</div>
							<div class="form-group" id="secIgmp" style="display: none">
								<label class="col-lg-5" for=cb_enblIgmp><%tcWebApi_get("String_Entry","EnableIGMPText","s")%></label>
								<label class="toggle-switch">
									<INPUT id=cb_enblIgmp type=checkbox name="cb_enblIgmp" <%if tcWebApi_get("WanInfo_WanIF","IGMPproxy","h") = "Yes" then asp_Write("checked") end if%>>
									<span class="slider"></span>
									<INPUT id=enblIgmp type=hidden value="No" name=enblIgmp>
								</label>
							</div>
							<div class="form-group" id="secNat">
								<label class="col-lg-5" for=cb_nat><%tcWebApi_get("String_Entry","EnableNATText","s")%></label>
								<label class="toggle-switch">
									<INPUT id=cb_nat type=checkbox name=cb_nat onClick="EnableNatClick()" <%if tcWebApi_get("WanInfo_WanIF","NATENABLE","h") = "Enable" then asp_Write("checked") end if%>>
									<span class="slider"></span>
									<INPUT id=nat type=hidden value="<% tcWebApi_get("WanInfo_WanIF","NATENABLE","s") %>" name="nat">
								</label>
							</div>
							<div class="form-group" id="secRoutev4">
								<label class="col-lg-5" for=cb_routev4><%tcWebApi_get("String_Entry","DefaultRouteText","s")%> IPv4</label>
								<label class="toggle-switch">
									<INPUT id=cb_routev4 type=checkbox name=cb_routev4 <%if tcWebApi_get("WanInfo_WanIF","DefRoute4","h") = "1" then asp_Write("checked") end if%>>
									<span class="slider"></span>
								</label>
							</div>
						</fieldset>
						<fieldset>
							<div class="form-group"  id=secBridgeType style="DISPLAY: none">
								<label class="col-lg-5"><%tcWebApi_get("String_Entry","BridgeModeText","s")%></label>
								<div class="col-lg-7 custom-select">
									<SELECT id=bridgeMode onchange="pdDefaultSel = 1;linkModeSelect()" name="bridgeMode">
										<OPTION value="PPPoE_Bridged" <%if tcWebApi_get("WanInfo_WanIF","BridgeMode","h") = "PPPoE_Bridged" then asp_Write("selected") end if%>>PPPoE_Bridged</OPTION> 
										<OPTION value="IP_Bridged" <%if tcWebApi_get("WanInfo_WanIF","BridgeMode","h") = "IP_Bridged" then asp_Write("selected") end if%>>IP_Bridged</OPTION>
									</SELECT>
								</div>
							</div>
							<div class="form-group d-none"  id=secbridgeDhcprelay style="DISPLAY: none">
								<label class="col-lg-5" for="cb_dhcprelay"><%tcWebApi_get("String_Entry","DHCPTransmissionText","s")%></label>
								<label class="toggle-switch">
									<INPUT id=cb_dhcprelay type=checkbox name=cb_dhcprelay onClick="EnableDHCPRealy()" <%if tcWebApi_get("WanInfo_WanIF","DHCPRealy","h") = "Yes" then asp_Write("checked") end if%>>
									<span class="slider"></span>
									<input type="hidden" id="dhcprelay" name="dhcprelay" value="No">
								</label>
							</div>
							<INPUT id=multMode type=hidden value=0 name=multMode>
						</fieldset>
						<fieldset>
							<legend><%tcWebApi_get("String_Entry","VLANOptionsText","s")%></legend>
							<div class="form-group">
								<label class="col-lg-5"><%tcWebApi_get("String_Entry","VLANModeText","s")%></label>
								<div class="col-lg-5 custom-select">
									<select id='VLANMode' onChange="VLANModeChg()" size=1 name='VLANMode'>
										<option value="TAG" <%if tcWebApi_get("WanInfo_WanIF","VLANMode","h") = "TAG" then asp_Write("selected") end if%>>TAG
										<option value="UNTAG"  <%if tcWebApi_get("WanInfo_WanIF","VLANMode","h") = "UNTAG" then asp_Write("selected") end if%>>UNTAG
										<option value="TRANSPARENT" <%if tcWebApi_get("WanInfo_WanIF","VLANMode","h") = "TRANSPARENT" then asp_Write("selected") end if%>>TRANSPARENT
									</select>
								</div>
							</div>
							<div class="form-group" id="vlansec">
								<label class="col-lg-5" for=vlan>VLAN ID</label>
								<input type="text" class="form-control col-lg-5" id=vlan maxLength=4 size=5 name=vlan value="<%if tcWebApi_get("WanInfo_WanIF","VLANID","h") <> "N/A" then tcWebApi_get("WanInfo_WanIF","VLANID","s") end if%>">
								<INPUT id=vlanId type=hidden name=vlanId value="No">
								<INPUT id=vlanUNTAG type=hidden name=vlanUNTAG value="4096">
								<INPUT id=vlanTRANSPARENT type=hidden name=vlanTRANSPARENT value="4097">
								<label>&nbsp;[1-4094]</label>
							</div>
							<div class="form-group" id="priosec">
								<label class="col-lg-5" for=v8021P>802.1p</label>
								<input type="text" class="form-control col-lg-5" id=v8021P maxLength=1 size=5 name=v8021P value="<%if tcWebApi_get("WanInfo_WanIF","dot1pData","h") <> "N/A" then tcWebApi_get("WanInfo_WanIF","dot1pData","s") end if%>">
								<INPUT id=vlanPri type=hidden name=vlanPri value="No">
								<INPUT id=vlanPriNone type=hidden name=vlanPriNone value="0">
								<label>&nbsp;[0-7]</label>
							</div>
							<div class="form-group" id="mulvidsec">
								<label class="col-lg-5" for=MulticastVID><%tcWebApi_get("String_Entry","MulticastText","s")%> VLAN ID</label>
								<input type="text" class="form-control col-lg-5" id=MulticastVID maxLength=4 size=5 name=MulticastVID value="<%if tcWebApi_get("WanInfo_WanIF","MulticastVID","h") <> "N/A" then tcWebApi_get("WanInfo_WanIF","MulticastVID","s") end if%>">
								<input type="hidden" id="MulVIDUsed" name="MulVIDUsed" value="No">
								<label>&nbsp;[1-4094]</label>
							</div>
						</fieldset>
						<fieldset id=secRouteItems>
						<div id="secStaticItems"  style="DISPLAY: none">
							<legend><%tcWebApi_get("String_Entry","IPv4OptionsText","s")%></legend>
							<div class="form-group">
								<label class="col-lg-5" for=wanIpAddress><%tcWebApi_get("String_Entry","LANIPAddressText","s")%></label>
								<input type="text" class="form-control col-lg-7" id=wanIpAddress maxLength=15 size=15 name=wanIpAddress value="<%if TCWebApi_get("WanInfo_WanIF","IPADDR","h" ) <> "N/A" then TCWebApi_get("WanInfo_WanIF","IPADDR","s" ) end if %>">
							</div>
							<div class="form-group">
								<label class="col-lg-5" for=wanSubnetMask><%tcWebApi_get("String_Entry","SubnetMaskText","s")%></label>
								<input type="text" class="form-control col-lg-7" id=wanSubnetMask maxLength=15 size=15 name=wanSubnetMask value="<%if TCWebApi_get("WanInfo_WanIF","NETMASK","h" ) <> "N/A" then TCWebApi_get("WanInfo_WanIF","NETMASK","s" ) end if %>">
							</div>
							<div class="form-group">
								<label class="col-lg-5" for=defaultGateway><%tcWebApi_get("String_Entry","DefaultGatewayText","s")%></label>
								<input type="text" class="form-control col-lg-7" id=defaultGateway maxLength=15 size=15 name=defaultGateway value="<%if TCWebApi_get("WanInfo_WanIF","GATEWAY","h" ) <> "N/A" then TCWebApi_get("WanInfo_WanIF","GATEWAY","s" ) end if %>">
							</div>
							<div class="form-group">
								<label class="col-lg-5" for=dnsPrimary><%tcWebApi_get("String_Entry","LANPrimaryDNSText","s")%></label>
								<input type="text" class="form-control col-lg-7" id=dnsPrimary maxLength=15 size=15 name=dnsPrimary value="<%if tcWebApi_get("WanInfo_WanIF","DNS","h") <> "N/A" then tcWebApi_get("WanInfo_WanIF","DNS","s") end if%>">
							</div>
							<div class="form-group">
								<label class="col-lg-5" for=dnsSecondary><%tcWebApi_get("String_Entry","LANSecondaryDNSText","s")%></label>
								<input type="text" class="form-control col-lg-7" id=dnsSecondary maxLength=15 size=15 name=dnsSecondary value="<%if tcWebApi_get("WanInfo_WanIF","SecDNS","h") <> "N/A" then tcWebApi_get("WanInfo_WanIF","SecDNS","s") end if%>">
							</div>
						</div>
						<div id=secPppoeItems style="display:none;">
							<legend><%tcWebApi_get("String_Entry","PPPoEOptionsText","s")%></legend>
							<div class="form-group">
								<label class="col-lg-5" for=pppUserName><%tcWebApi_get("String_Entry","QSWanUser","s")%></label>
								<input type="text" class="form-control col-lg-7" id=pppUserName maxLength=64 size=15 name=pppUserName value="<%if TCWebApi_get("WanInfo_WanIF","USERNAME","h" ) <> "N/A" then TCWebApi_get("WanInfo_WanIF","USERNAME","s" ) end if %>">
							</div>
							<div class="form-group">
								<label class="col-lg-5" for=wanIpAddress><%tcWebApi_get("String_Entry","QSWanPass","s")%></label>
								<div class="input-group col-lg-7 px-0">
									<input class="form-control" id=pppPassword type=password maxLength=64 size=15 name=pppPassword value="<% if TCWebApi_get("WanInfo_WanIF","PASSWORD","h" ) <> "N/A" then TCWebApi_get("WanInfo_WanIF","PASSWORD","s" ) end if %>">
									<div class="input-group-addon show-password-btn">
										<a href="#" id="pw-eye"><i class="fa fa-eye-slash" aria-hidden="true"></i></a>
									</div>
								</div>
							</div>
							<div class="form-group"  style="DISPLAY: none">
								<label class="col-lg-5" for=pppUserName><%tcWebApi_get("String_Entry","ServerNameText","s")%></label>
								<input type="text" class="form-control col-lg-7" id=pppServerName style="FONT-FAMILY: '<%tcWebApi_get("String_Entry","NewRomanText","s")%>'"  maxLength=63 size=15 name=pppServerName>
							</div>
<% if tcWebApi_get("WebCustom_Entry", "isPPPoEOnDemandWEBUISupported", "h") = "Yes"  then %>
							<div class="form-group">
								<label class="col-lg-5" for=wanIpAddress><%tcWebApi_get("String_Entry","DialModeText","s")%></label>
								<div class="col-lg-7 custom-select">
									<select id='ppp_DialMethod' onChange="ppp_dialMethodChg()" size=1 name='ppp_DialMethod'>
										<OPTION value="Connect_Keep_Alive" <%if TCWebApi_get("WanInfo_WanIF","CONNECTION","h" ) = "Connect_Keep_Alive" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","AutoConnet1Text","s")%></OPTION>
<% if tcWebApi_get("WebCustom_Entry","isPPPoEOnDemandSupported","h" ) = "Yes" then %>
										<OPTION value="Connect_on_Demand" <%if tcWebApi_get("WanInfo_WanIF","CONNECTION","h") = "Connect_on_Demand" then asp_Write("selected")  end if%>><%tcWebApi_get("String_Entry","AutoConnet2Text","s")%></OPTION>
<% end if %>
									</select>
									<SELECT id='DialMethod' name='DialMethod' style='DISPLAY: none'>
									</SELECT>
								</div>
							</div>
<% else %>
<% if TCWebApi_get("WebCustom_Entry","isPPPoEOnDemandSupported","h" ) = "Yes" then %>
							<div class="form-group" style='DISPLAY: none'>
								<label class="col-lg-5" for=wanIpAddress><%tcWebApi_get("String_Entry","DialModeText","s")%></label>
								<select id='DialMethod' onChange="DialMethodChange()" size=1 name='DialMethod'></select>
							</div>
<% else %>
							<div class="form-group" style='DISPLAY: none'>
								<label class="col-lg-5" for=wanIpAddress><%tcWebApi_get("String_Entry","DialModeText","s")%></label>
								<select id='DialMethod' onChange="DialMethodChange()" size=1 name='DialMethod'>
									<OPTION value="AlwaysOn" <%if TCWebApi_get("WanInfo_WanIF","CONNECTION","h" ) = "Connect_Keep_Alive" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","AutoConnet1Text","s")%></OPTION> 
									<OPTION value="Manual" <%if tcWebApi_get("WanInfo_WanIF","CONNECTION","h") = "Connect_Manually" then asp_Write("selected")  end if%>><%tcWebApi_get("String_Entry","ManualText","s")%></OPTION>
								</select>
							</div>	
<% end if %>
<% end if %>
							<div class="form-group" id=secManualDial style='DISPLAY: none'>
								<INPUT id=pppDialButton onclick=ManualCntSubmit() type=button value="<%tcWebApi_get("String_Entry","ManualText","s")%>" name=pppDialButton> 
							</div>
							<div class="form-group"  id=secIdleTime style="DISPLAY: none">
<% if tcWebApi_get("WebCustom_Entry", "isPPPoEOnDemandWEBUISupported", "h") = "Yes"  then %>
								<label class="col-lg-8" for=><%tcWebApi_get("String_Entry","NoTrafficText","s")%></label>
								<input type="hidden" id='pppondemand_idletime' name='pppondemand_idletime' value="<%if tcWebApi_get("WanInfo_WanIF","CLOSEIFIDLE","h") <> "N/A" then tcWebApi_get("WanInfo_WanIF","CLOSEIFIDLE","s") end if%>" >
<% else %>
								<label class="col-lg-8">&nbsp;<%tcWebApi_get("String_Entry","IdleTimeoutText","s")%>[1-4320]</label>
<% end if %>
								<input type="text" class="form-control col-lg-7" id=pppTimeOut maxLength=4 size=4 name=pppTimeOut>
<% if tcWebApi_get("WebCustom_Entry", "isPPPoEOnDemandWEBUISupported", "h") = "Yes"  then %>
								<%tcWebApi_get("String_Entry","MinuteDisconnectText","s")%>
<% end if %>
                                <input type="hidden" id="pppv6Mode" name="pppv6Mode" value="0">
							</div>
<%if TCWebApi_get("WebCustom_Entry","isPPPoEProxySupported","h" ) = "Yes" then%>
							<div class="form-group">
								<label class="col-lg-5" id='ppp_proxy_bi'><%tcWebApi_get("String_Entry","AgentOrBridgeText","s")%></label>
								<div class="custom-control custom-radio col-lg-3">
									<INPUT id='ppp_proxy_bi_mode_0' onclick='ppp_proxy_bi_Change()' type=radio value="0" name="ppp_proxy_bi_mode" <%if tcWebApi_get("WanInfo_WanIF","pppProxyBiMode", "h") = "0" then asp_Write("checked") elseif tcWebApi_get("WanInfo_WanIF","pppProxyBiMode", "h") = "N/A" then asp_Write("checked") end if%>>
									<label class="custom-control-label" for="ppp_proxy_bi_mode_0">²»ÆôÓÃPPPoE´úÀí»òPPPoEÂ·ÓÉÇÅ»ìºÏ</label>
								</div>
								<div class="custom-control custom-radio col-lg-3">
									 <INPUT id='ppp_proxy_bi_mode_1' onclick='ppp_proxy_bi_Change()' type=radio value="1" name="ppp_proxy_bi_mode" <%if tcWebApi_get("WanInfo_WanIF","pppProxyBiMode","h") = "1" then asp_Write("checked") end if%>>
									<label class="custom-control-label" for="ppp_proxy_bi_mode_1">ÆôÓÃPPPoE´úÀí</label>
								</div>
								<div class="custom-control custom-radio col-lg-3">
									 <INPUT id='ppp_proxy_bi_mode_2' onclick='ppp_proxy_bi_Change()' type=radio value="2" name="ppp_proxy_bi_mode" <%if tcWebApi_get("WanInfo_WanIF","pppProxyBiMode","h") = "2" then asp_Write("checked") end if%>>
									<label class="custom-control-label" for="ppp_proxy_bi_mode_2">ÆôÓÃPPPoEÂ·ÓÉÇÅ»ìºÏÄ£Ê½</label>
								</div>
								<INPUT id='ppp_proxy_biUsed' type=hidden name='ppp_proxy_biUsed'>
			              		<INPUT id='ppp_proxy_bi_disable' type=hidden name='ppp_proxy_bi_disable' value='0'>
			              		<INPUT id='pppproxyDisabled' type=hidden name='pppproxyDisabled' value='0'>
			              		<INPUT id='pppbiDisabled' type=hidden name='pppbiDisabled' value='No'>
					            <INPUT id='pppproxyEnabled' type=hidden name='pppproxyEnabled' value='1'>
			              		<INPUT id='pppbiEnabled' type=hidden name='pppbiEnabled' value='Yes'>
							</div>
							<div class="form-group" id='ppp_proxy_user'>
								<label class="col-lg-5" for=pppproxy_user><%tcWebApi_get("String_Entry","MaximalProxyUserText","s")%></label>
								<input type="text" class="form-control col-lg-7" id='pppproxy_user' maxLength=1 size=3 name='pppproxy_user' value="<%if tcWebApi_get("WanInfo_WanIF","ProxyMaxUser","h") <> "N/A" then tcWebApi_get("WanInfo_WanIF","ProxyMaxUser","s") end if%>">
								<INPUT id='pppproxy_user_zero' type=hidden name='pppproxy_user_zero' value='0'>
							</div>
<% else %>
						<div class="d-none">
							<div class="form-group" id='ppp_bi'>
								<label class="col-lg-5" for=cb_enable_pppbi><%tcWebApi_get("String_Entry","RouterBridgeModeText","s")%></label>
								<label class="toggle-switch">
									<input type="checkbox" id='cb_enable_pppbi' type=checkbox name='cb_enable_pppbi' <%if tcWebApi_get("WanInfo_WanIF","BridgeInterface","h") = "Yes" then asp_Write("checked") end if%>>
									<span class="slider"></span>
								</label>
                        		<INPUT id='enablepppbi' type=hidden name='enablepppbi'>
                        		<INPUT id='pppbiUsed' type=hidden name='pppbiUsed'>
                        		<INPUT id='pppbiDisabled' type=hidden name='pppbiDisabled' value='No'>
							</div>
						</div>
<% end if %>
						</div>
						</fieldset>
						<fieldset id=secIPv6Div style="display:none">
							<legend><%tcWebApi_get("String_Entry","IPv6OptionsText","s")%></legend>
							<div class="form-group" id=TrIpv6AddrType>
								<label class="col-lg-5" for=IdIpv6AddrType><%tcWebApi_get("String_Entry","StyleOfAcquiringIPv6Text","s")%></label>
								<div class="col-lg-7 custom-select">
									<select id="IdIpv6AddrType" style="WIDTH: 130px" onChange="pdDefaultSel=1;OnIPv6Changed();" name="IdIpv6AddrType">
										<option value="SLAAC" <%if TCWebApi_get("WanInfo_WanIF","DHCPv6","h" ) = "No" then asp_Write("selected") end if %>>SLAAC 
                            		    <option value="DHCP" <%if TCWebApi_get("WanInfo_WanIF","DHCPv6","h" ) = "Yes" then asp_Write("selected") end if %>>DHCP
										<option value="Static" <%if TCWebApi_get("WanInfo_WanIF","DHCPv6","h" ) = "N/A" then asp_Write("selected") end if %>>Static 
									</select>
								</div>
							</div>
							<div class="form-group" id='TrIpv6Addr'>
								<label class="col-lg-5" for=IdIpv6Addr><%tcWebApi_get("String_Entry","AddressText","s")%></label>
								<INPUT  class="form-control col-lg-5" id=IdIpv6Addr maxLength=39 size=36 name=IdIpv6Addr value="<%if TCWebApi_get("WanInfo_WanIF","IPADDR6","h" ) <> "N/A" then TCWebApi_get("WanInfo_WanIF","IPADDR6","s" ) end if %>">&nbsp;/&nbsp;
								<INPUT  class="form-control col-lg-1" id=IdIpv6PrefixLen maxLength=3 size=3 name=IdIpv6PrefixLen value="<% if TCWebApi_get("WanInfo_WanIF","PREFIX6","h" ) <> "N/A" then TCWebApi_get("WanInfo_WanIF","PREFIX6","s" ) end if %>">
							</div>
							<div class="form-group" id='TrIpv6Gateway'>
								<label class="col-lg-5" for=IdIpv6Addr>IPv6 <%tcWebApi_get("String_Entry","DefaultGatewayText","s")%></label>
								<INPUT id=IdIpv6Gateway  class="form-control col-lg-7" maxLength=39 size=36 name=IdIpv6Gateway value="">
								<script language="JavaScript" type="text/JavaScript">
									var ipv6gwstr = "<% tcWebApi_get("WanInfo_WanIF","GATEWAY6","s" ) %>";
									if("N/A" == ipv6gwstr)
										setText('IdIpv6Gateway', "");
									else
										setText('IdIpv6Gateway', ipv6gwstr);
								</script>
								<label id="TrIpv6GatewayInfo" class="input-description offset-lg-5 col-lg-7">(<%tcWebApi_get("String_Entry","AutoAcquireText","s")%>)</label>
							</div>
							<div class="form-group" id=TrIpv6Dns1>
								<label class="col-lg-5"><%tcWebApi_get("String_Entry","PrimaryIPv6DNSServerText","s")%></label>
								<input type="text" class="form-control col-lg-7" id=IdIpv6Dns1 maxLength=39 size=36 name=IdIpv6Dns1 value="<%if tcWebApi_get("WanInfo_WanIF","DNS6","h") <> "N/A" then tcWebApi_get("WanInfo_WanIF","DNS6","s") end if%>">
							</div>
							<div class="form-group" id=TrIpv6Dns2>
								<label class="col-lg-5"><%tcWebApi_get("String_Entry","SecondaryIPv6DNSServerText","s")%></label>
								<input type="text" class="form-control col-lg-7" id=IdIpv6Dns2 maxLength=39 size=36 name=IdIpv6Dns2 value="<%if tcWebApi_get("WanInfo_WanIF","SecDNS6","h") <> "N/A" then tcWebApi_get("WanInfo_WanIF","SecDNS6","s") end if%>">
							</div>
							<div class="form-group"  id='PDEnableSec'>
								<label class="col-lg-5" for="cb_enabledpd" id='PDEnableDescrip'><%tcWebApi_get("String_Entry","EnablePDText","s")%></label>
								<label class="toggle-switch">
									<input id='cb_enabledpd' type=checkbox onclick='cb_pdEnableChange()' name='cb_enabledpd' <%if tcWebApi_get("WanInfo_WanIF","PDEnable","h") = "Yes" then asp_Write("checked") end if%>>
									<span class="slider"></span>
                            		<INPUT id='enablepd' type=hidden name='enablepd'>
                           		 	<INPUT id='PDUsed' type=hidden name='PDUsed'>
                          		  	<INPUT id='PDDisabled' type=hidden name='PDDisabled' value='No'>
								</label>
							</div>
							<div class="form-group" id='pdmode_1'>
								<label class="col-lg-5"><%tcWebApi_get("String_Entry","PrefixModeText","s")%></label>
								<div class="custom-control custom-radio col-lg-3">
									<input class="custom-control-input" id='pdmode_0' onclick='pdmodeChange()' type=radio value="Yes" name="pdmode" <%if tcWebApi_get("WanInfo_WanIF","PDOrigin", "h") <> "Static" then asp_Write("checked") end if%>>
									<label class="custom-control-label" for="pdmode_0">Auto</label>
								</div>
								<div class="custom-control custom-radio  col-lg-3">
									<input class="custom-control-input" id='pdmode_1' onclick='pdmodeChange()' type=radio value="No" name="pdmode" <%if tcWebApi_get("WanInfo_WanIF","PDOrigin","h") = "Static" then asp_Write("checked") end if%>>
									<label class="custom-control-label" for="pdmode_1">Manual</label>
								</div>
				                <INPUT id='pdmodeUsed' type=hidden name='pdmodeUsed'>
				                <INPUT id='pdmodeDisabled' type=hidden name='pdmodeDisabled' value='No'>
				                <INPUT id='pdmodeAuto' type=hidden name='pdmodeAuto' value='PrefixDelegation'>
				                <INPUT id='pdmodeStatic' type=hidden name='pdmodeStatic' value='Static'>
				                <INPUT id='pdmodeNone' type=hidden name='pdmodeNone' value='None'>
							</div>
							<div class="form-group" id=pdmode_2>
								<label class="col-lg-5"><%tcWebApi_get("String_Entry","PrefixAddressText","s")%></label>
								<input type="text" class="form-control col-lg-7" id='pdprefix' maxLength=39 size=36 name='pdprefix' value="<%if tcWebApi_get("WanInfo_WanIF","PDPrefix","h") <> "N/A" then tcWebApi_get("WanInfo_WanIF","PDPrefix","s") end if%>">
							</div>
							<div class="form-group" id=pdmode_3>
								<label class="col-lg-5"><%tcWebApi_get("String_Entry","PrimaryTimeText","s")%></label>
								<input type="text" class="form-control col-lg-3" id='pdprefixptime' maxLength=10 size=10 name='pdprefixptime' value="<%if tcWebApi_get("WanInfo_WanIF","PrefixPltime","h") <> "N/A" then tcWebApi_get("WanInfo_WanIF","PrefixPltime","s") end if%>">
								<em class="mandatory-sign"></em>
								<label>[600 - 4294967295 s]</label>
							</div>
							<div class="form-group" id=pdmode_4>
								<label class="col-lg-5"><%tcWebApi_get("String_Entry","LeaseTimeText","s")%></label>
								<input type="text" class="form-control col-lg-3" id='pdprefixvtime' maxLength=10 size=10 name='pdprefixvtime' value="<%if tcWebApi_get("WanInfo_WanIF","PrefixVltime","h") <> "N/A" then tcWebApi_get("WanInfo_WanIF","PrefixVltime","s") end if%>">
				                <em class="mandatory-sign"></em>
								<label>[600 - 4294967295 s]</label>
							</div>
							<div class="form-group" id="secRoutev6">
								<label class="col-lg-5" for=cb_routev6><%tcWebApi_get("String_Entry","DefaultRouteText","s")%> IPv6</label>
								<label class="toggle-switch">
									<INPUT id=cb_routev6 type=checkbox name=cb_routev6 <%if tcWebApi_get("WanInfo_WanIF","DefRoute6","h") = "1" then asp_Write("checked") end if%>>
									<span class="slider"></span>
								</label>
							</div>
<%if TCWebApi_get("WebCustom_Entry","isDSLiteSupported","h" ) = "Yes" then%>
							<div class="form-group" id=dslite_1>
								<label class="col-lg-5"><%tcWebApi_get("String_Entry","DSLiteEnableText","s")%></label>
								<label class="toggle-switch">
									<input id='cb_enabledslite' onclick=cb_enabledsliteChange() type=checkbox name='cb_enabledslite' <%if tcWebApi_get("WanInfo_WanIF","DsliteEnable","h") = "Yes" then asp_Write("checked") end if%>>
									<span class="slider"></span>
									<INPUT id='enabledslite' type=hidden name='enabledslite'>
									<INPUT id='dsliteUsed' type=hidden name='dsliteUsed'>
									<INPUT id='dsliteDisabled' type=hidden name='dsliteDisabled' value='No'>
								</label>
							</div>
							<div class="form-group" id='dslite_2'>
								<label class="col-lg-5"><%tcWebApi_get("String_Entry","DSLiteModeText","s")%></label>
								<div class="custom-control custom-radio col-lg-3">
									<input class="custom-control-input" id='dslitemode_0' onclick='dslitemodeChange()' type=radio value="0" name="dslitemode" <%if tcWebApi_get("WanInfo_WanIF","DsliteMode", "h") = "0" then asp_Write("checked") elseif tcWebApi_get("WanInfo_WanIF","DsliteMode","h") = "N/A" then asp_Write("checked") end if%>>
									<label class="custom-control-label" for="dslitemode_0">Auto</label>
								</div>
								<div class="custom-control custom-radio  col-lg-3">
									<input class="custom-control-input" id='dslitemode_1' onclick='dslitemodeChange()' type=radio value="1" name="dslitemode" <%if tcWebApi_get("WanInfo_WanIF","DsliteMode","h") = "1" then  asp_Write("checked") end if%>>
									<label class="custom-control-label" for="dslitemode_1">Manual</label>
								</div>
							</div>
							<div class="form-group" id=dslite_3>
								<label class="col-lg-5"><%tcWebApi_get("String_Entry","DSLiteServerText","s")%></label>
								<input type="text" class="form-control col-lg-5" id='dsliteaddress' maxLength=39 size=36 name='dsliteaddress' value="<%if tcWebApi_get("WanInfo_WanIF","DsliteAddr","h") <> "N/A" then tcWebApi_get("WanInfo_WanIF","DsliteAddr","s") end if%>">
							</div>
<%end if%>
						</fieldset>
<%if tcWebApi_get("WebCustom_Entry","isCTPONC9Supported","h" ) = "Yes" then%>
						<script language='JavaScript' type='text/JavaScript'>
							function CloneMAC()
							{
								var pcMAC = '<%tcWebApi_get("PC","PCMAC","s")%>';
								with ( getElById('wan_form') )
								{
									if ( 0 != pcMAC.length
											&& 'N/A' != pcMAC )
									{
										wanhwaddress.value = pcMAC;
										alert('<%tcWebApi_get("String_Entry","AccquireSuccessText","s")%>');
									}
									else
										alert('<%tcWebApi_get("String_Entry","FailAcquireText","s")%>');
								}
							}
						</script>
						<fieldset id=secCloneMAC>
							<div class="form-group">
								<label class="col-lg-5"><%tcWebApi_get("String_Entry","WANAddressText","s")%></label>
								<input type="text" class="form-control col-lg-5" id='wanhwaddress' maxLength=17 size=20 name='wanhwaddress' value="<%if tcWebApi_get("WanInfo_WanIF","WanHWAddr","h") <> "N/A" then tcWebApi_get("WanInfo_WanIF","WanHWAddr","s") else asp_write("00:00:00:00:00:00") end if%>">
								<input id='btnCloneMAC' name='btnCloneMAC' onclick='CloneMAC()' type=button value='<%tcWebApi_get("String_Entry","AcquireText","s")%>PC MAC'>
								<label class="input-description offset-lg-5 col-lg-7"><%tcWebApi_get("String_Entry","NoModificationText","s")%></label>
							</div>
						</fieldset>
<%end if%>
						<fieldset>
							<legend id="legend_port_bindding"><%tcWebApi_get("String_Entry","PortBindingOptionsText","s")%></legend>
							<div class="form-group" id=secBind>
								<label class="col-lg-5"><%tcWebApi_get("String_Entry","BindingOptionText","s")%></label>
								<div class="col-lg-7 d-flex">
									<div class="custom-control custom-checkbox col-lg-3" id=secLan1>
										<INPUT id=cb_bindlan1 type=checkbox name=cb_bindlan1 <%if tcWebApi_get("WanInfo_WanIF","LAN1","h") = "Yes" then asp_Write("checked") end if%> class="custom-control-input" >
										<label class="custom-control-label" for="cb_bindlan1">LAN1</label>
										<INPUT id=bindlan1 type=hidden value=0 name=bindlan1>
									</div>
									<div class="custom-control custom-checkbox col-lg-3" id=secLan2>
										<INPUT id=cb_bindlan2 type=checkbox name=cb_bindlan2 <%if tcWebApi_get("WanInfo_WanIF","LAN2","h") = "Yes" then asp_Write("checked") end if%> class="custom-control-input" >
										<label class="custom-control-label" for="cb_bindlan2">LAN2</label>
										<INPUT id=bindlan2 type=hidden value=0 name=bindlan2>
									</div>
									<div class="custom-control custom-checkbox col-lg-3" id=secLan3>
										<INPUT id=cb_bindlan3 type=checkbox name=cb_bindlan3 <%if tcWebApi_get("WanInfo_WanIF","LAN3","h") = "Yes" then asp_Write("checked") end if%> class="custom-control-input" >
										<label class="custom-control-label" for="cb_bindlan3">LAN3</label>
										<INPUT id=bindlan3 type=hidden value=0 name=bindlan3>
									</div>
									<div class="custom-control custom-checkbox col-lg-3" id=secLan4>
										<INPUT id=cb_bindlan4 type=checkbox name=cb_bindlan4 <%if tcWebApi_get("WanInfo_WanIF","LAN4","h") = "Yes" then asp_Write("checked") end if%> class="custom-control-input" >
										<label class="custom-control-label" for="cb_bindlan4">LAN4</label>
										<INPUT id=bindlan4 type=hidden value=0 name=bindlan4>
									</div>
								</div>
								<div class="col-lg-7 d-flex" id=LanBindExt>
									<div class="custom-control custom-checkbox col-lg-3" id=secLan5>
										<INPUT id=cb_bindlan5 type=checkbox name=cb_bindlan5 <%if tcWebApi_get("WanInfo_WanIF","LAN5","h") = "Yes" then asp_Write("checked") end if%> class="custom-control-input" >
										<label class="custom-control-label" for="cb_bindlan5">LAN5</label>
										<INPUT id=bindlan5 type=hidden value=0 name=bindlan5>
									</div>
									<div class="custom-control custom-checkbox col-lg-3" id=secLan6>
										<INPUT id=cb_bindlan6 type=checkbox name=cb_bindlan6 <%if tcWebApi_get("WanInfo_WanIF","LAN6","h") = "Yes" then asp_Write("checked") end if%> class="custom-control-input" >
										<label class="custom-control-label" for="cb_bindlan6">LAN6</label>
										<INPUT id=bindlan6 type=hidden value=0 name=bindlan6>
									</div>
									<div class="custom-control custom-checkbox col-lg-3" id=secLan7>
										<INPUT id=cb_bindlan7 type=checkbox name=cb_bindlan7 <%if tcWebApi_get("WanInfo_WanIF","LAN7","h") = "Yes" then asp_Write("checked") end if%> class="custom-control-input" >
										<label class="custom-control-label" for="cb_bindlan7">LAN7</label>
										<INPUT id=bindlan7 type=hidden value=0 name=bindlan7>
									</div>
									<div class="custom-control custom-checkbox col-lg-3" id=secLan8>
										<INPUT id=cb_bindlan8 type=checkbox name=cb_bindlan8 <%if tcWebApi_get("WanInfo_WanIF","LAN8","h") = "Yes" then asp_Write("checked") end if%> class="custom-control-input" >
										<label class="custom-control-label" for="cb_bindlan8">LAN8</label>
										<INPUT id=bindlan8 type=hidden value=0 name=bindlan8>
									</div>
								</div>
								<div id="wlanBindTab"  class="offset-lg-5 col-lg-7 d-flex">
									<div class="custom-control custom-checkbox col-lg-3" id=secWireless1>
										<INPUT id=cb_bindwireless1 type=checkbox name=cb_bindwireless1 <%if tcWebApi_get("WanInfo_WanIF","SSID1","h") = "Yes" then asp_Write("checked") end if%> class="custom-control-input" >
										<label class="custom-control-label" for="cb_bindwireless1">SSID1</label>
										<INPUT id=bindwireless1 type=hidden value=0 name=bindwireless1>
									</div>
									<div class="custom-control custom-checkbox col-lg-3" id=secWireless2>
										<INPUT id=cb_bindwireless2 type=checkbox name=cb_bindwireless2 <%if tcWebApi_get("WanInfo_WanIF","SSID2","h") = "Yes" then asp_Write("checked") end if%> class="custom-control-input" >
										<label class="custom-control-label" for="cb_bindwireless2">SSID2</label>
										<INPUT id=bindwireless2 type=hidden value=0 name=bindwireless2>
									</div>
									<div class="custom-control custom-checkbox col-lg-3" id=secWireless3>
										<INPUT id=cb_bindwireless3 type=checkbox name=cb_bindwireless3 <%if tcWebApi_get("WanInfo_WanIF","SSID3","h") = "Yes" then asp_Write("checked") end if%> class="custom-control-input" >
										<label class="custom-control-label" for="cb_bindwireless3">SSID3</label>
										<INPUT id=bindwireless3 type=hidden value=0 name=bindwireless3>
									</div>
									<div class="custom-control custom-checkbox col-lg-3" id=secWireless4>
										<INPUT id=cb_bindwireless4 type=checkbox name=cb_bindwireless4 <%if tcWebApi_get("WanInfo_WanIF","SSID4","h") = "Yes" then asp_Write("checked") end if%> class="custom-control-input" >
										<label class="custom-control-label" for="cb_bindwireless4">SSID4</label>
										<INPUT id=bindwireless4 type=hidden value=0 name=bindwireless4>
									</div>
<% if TCWebApi_get("WebCustom_Entry","isMultiUserITFSupported","h" ) = "Yes" then %>
								<div id="wlanBindSSIDExt"   class="col-lg-12">
									<div class="custom-control custom-checkbox col-lg-3" id=secWireless5>
										<INPUT id=cb_bindwireless5 type=checkbox name=cb_bindwireless5 <%if tcWebApi_get("WanInfo_WanIF","SSID5","h") = "Yes" then asp_Write("checked") end if%> class="custom-control-input" >
										<label class="custom-control-label" for="cb_bindwireless5">SSID5</label>
										<INPUT id=bindwireless5 type=hidden value=0 name=bindwireless5>
									</div>
									<div class="custom-control custom-checkbox col-lg-3" id=secWireless6>
										<INPUT id=cb_bindwireless6 type=checkbox name=cb_bindwireless6 <%if tcWebApi_get("WanInfo_WanIF","SSID6","h") = "Yes" then asp_Write("checked") end if%> class="custom-control-input" >
										<label class="custom-control-label" for="cb_bindwireless6">SSID6</label>
										<INPUT id=bindwireless6 type=hidden value=0 name=bindwireless6>
									</div>
									<div class="custom-control custom-checkbox col-lg-3" id=secWireless7>
										<INPUT id=cb_bindwireless7 type=checkbox name=cb_bindwireless7 <%if tcWebApi_get("WanInfo_WanIF","SSID7","h") = "Yes" then asp_Write("checked") end if%> class="custom-control-input" >
										<label class="custom-control-label" for="cb_bindwireless7">SSID7</label>
										<INPUT id=bindwireless7 type=hidden value=0 name=bindwireless7>
									</div>
									<div class="custom-control custom-checkbox col-lg-3" id=secWireless8>
										<INPUT id=cb_bindwireless8 type=checkbox name=cb_bindwireless8 <%if tcWebApi_get("WanInfo_WanIF","SSID8","h") = "Yes" then asp_Write("checked") end if%> class="custom-control-input" >
										<label class="custom-control-label" for="cb_bindwireless8">SSID8</label>
										<INPUT id=bindwireless8 type=hidden value=0 name=bindwireless8>
									</div>
								</div>
<% end if %>
								</div>
								<div id="wlanacBindTab"   class="offset-lg-5 col-lg-7 d-flex">
									<div class="custom-control custom-checkbox col-lg-3" id=secWirelessac1>
										<INPUT id=cb_bindwirelessac1 type=checkbox name=cb_bindwirelessac1 <%if tcWebApi_get("WanInfo_WanIF","SSIDAC1","h") = "Yes" then asp_Write("checked") end if%> class="custom-control-input" >
										<label class="custom-control-label" for="cb_bindwirelessac1">SSIDAC1</label>
										<INPUT id=bindwirelessac1 type=hidden value=0 name=bindwirelessac1>
									</div>
									<div class="custom-control custom-checkbox col-lg-3" id=secWirelessac2>
										<INPUT id=cb_bindwirelessac2 type=checkbox name=cb_bindwirelessac2 <%if tcWebApi_get("WanInfo_WanIF","SSIDAC2","h") = "Yes" then asp_Write("checked") end if%> class="custom-control-input" >
										<label class="custom-control-label" for="cb_bindwirelessac2">SSIDAC2</label>
										<INPUT id=bindwirelessac2 type=hidden value=0 name=bindwirelessac2>
									</div>
									<div class="custom-control custom-checkbox col-lg-3" id=secWirelessac3>
										<INPUT id=cb_bindwirelessac3 type=checkbox name=cb_bindwirelessac3 <%if tcWebApi_get("WanInfo_WanIF","SSIDAC3","h") = "Yes" then asp_Write("checked") end if%> class="custom-control-input" >
										<label class="custom-control-label" for="cb_bindwirelessac3">SSIDAC3</label>
										<INPUT id=bindwirelessac3 type=hidden value=0 name=bindwirelessac3>
									</div>
									<div class="custom-control custom-checkbox col-lg-3" id=secWirelessac4>
										<INPUT id=cb_bindwirelessac4 type=checkbox name=cb_bindwirelessac4 <%if tcWebApi_get("WanInfo_WanIF","SSIDAC4","h") = "Yes" then asp_Write("checked") end if%> class="custom-control-input" >
										<label class="custom-control-label" for="cb_bindwirelessac4">SSIDAC4</label>
										<INPUT id=bindwirelessac4 type=hidden value=0 name=bindwirelessac4>
									</div>
								<div id="wlanacBindSSIDExt"   class="col-lg-12">
									<div class="custom-control custom-checkbox col-lg-3" id=secWirelessac5>
										<INPUT id=cb_bindwirelessac5 type=checkbox name=cb_bindwirelessac5 <%if tcWebApi_get("WanInfo_WanIF","SSIDAC5","h") = "Yes" then asp_Write("checked") end if%> class="custom-control-input" >
										<label class="custom-control-label" for="cb_bindwirelessac5">SSIDAC5</label>
										<INPUT id=bindwirelessac5 type=hidden value=0 name=bindwirelessac5>
									</div>
									<div class="custom-control custom-checkbox col-lg-3" id=secWirelessac6>
										<INPUT id=cb_bindwirelessac6 type=checkbox name=cb_bindwirelessac6 <%if tcWebApi_get("WanInfo_WanIF","SSIDAC6","h") = "Yes" then asp_Write("checked") end if%> class="custom-control-input" >
										<label class="custom-control-label" for="cb_bindwirelessac6">SSIDAC6</label>
										<INPUT id=bindwirelessac6 type=hidden value=0 name=bindwirelessac6>
									</div>
									<div class="custom-control custom-checkbox col-lg-3" id=secWirelessac7>
										<INPUT id=cb_bindwirelessac7 type=checkbox name=cb_bindwirelessac7 <%if tcWebApi_get("WanInfo_WanIF","SSIDAC7","h") = "Yes" then asp_Write("checked") end if%> class="custom-control-input" >
										<label class="custom-control-label" for="cb_bindwirelessac7">SSIDAC7</label>
										<INPUT id=bindwirelessac7 type=hidden value=0 name=bindwirelessac7>
									</div>
									<div class="custom-control custom-checkbox col-lg-3" id=secWirelessac8>
										<INPUT id=cb_bindwirelessac8 type=checkbox name=cb_bindwirelessac8 <%if tcWebApi_get("WanInfo_WanIF","SSIDAC8","h") = "Yes" then asp_Write("checked") end if%> class="custom-control-input" >
										<label class="custom-control-label" for="cb_bindwirelessac8">SSIDAC8</label>
										<INPUT id=bindwirelessac8 type=hidden value=0 name=bindwirelessac8>
									</div>
								</div>
								</div>
								<script language="JavaScript" type="text/JavaScript">
<% if tcWebApi_get("WebCustom_Entry", "isHideLan4Supported","h") = "Yes" then %>
								  	setDisplay('secLan4', 0);
  <% end if %>
<% if tcWebApi_get("WebCustom_Entry", "isMultiLanSupported","h") <> "Yes" then %>
								  	setDisplay('secLan5', 0);
								  	setDisplay('secLan6', 0);
								  	setDisplay('secLan7', 0);
									setDisplay('secLan8', 0);
									setDisplay('LanBindExt', 0);
<% end if %>
								  var validSSID = "<% tcWebApi_get("WLan_Common","BssidNum","s") %>";
								  var validNum = parseInt(validSSID);
								  var validSSID = "<% tcWebApi_get("WLan_Common","BssidNum","s") %>";
								  if(validSSID == "1"){
								  	setDisplay('secWireless1', 1);
								  	setDisplay('secWireless2', 0);
								  	setDisplay('secWireless3', 0);
									setDisplay('secWireless4', 0);
									setDisplay('secWireless5', 0);
								  	setDisplay('secWireless6', 0);
								  	setDisplay('secWireless7', 0);
									setDisplay('secWireless8', 0);
									setDisplay('wlanBindSSIDExt', 0);
								  }
								  else if(validSSID == "2"){
								  	setDisplay('secWireless1', 1);
								  	setDisplay('secWireless2', 1);
								  	setDisplay('secWireless3', 0);
									setDisplay('secWireless4', 0);
									setDisplay('secWireless5', 0);
								  	setDisplay('secWireless6', 0);
								  	setDisplay('secWireless7', 0);
									setDisplay('secWireless8', 0);
									setDisplay('wlanBindSSIDExt', 0);
								  }
								  else if(validSSID == "3"){
									setDisplay('secWireless1', 1);
								  	setDisplay('secWireless2', 1);
								  	setDisplay('secWireless3', 1);
									setDisplay('secWireless4', 0);
									setDisplay('secWireless5', 0);
								  	setDisplay('secWireless6', 0);
								  	setDisplay('secWireless7', 0);
									setDisplay('secWireless8', 0);
									setDisplay('wlanBindSSIDExt', 0);
								  }
								  else if(validSSID == "4"){
									setDisplay('secWireless1', 1);
								  	setDisplay('secWireless2', 1);
								  	setDisplay('secWireless3', 1);
									setDisplay('secWireless4', 1);
									setDisplay('secWireless5', 0);
								  	setDisplay('secWireless6', 0);
								  	setDisplay('secWireless7', 0);
									setDisplay('secWireless8', 0);
									setDisplay('wlanBindSSIDExt', 0);
								  }
<% if tcWebApi_get("WebCustom_Entry", "isMultiUserITFSupported","h") <> "Yes" then %>
								 else if(validNum > 4){
									setDisplay('secWireless1', 1);
								  	setDisplay('secWireless2', 1);
								  	setDisplay('secWireless3', 1);
									setDisplay('secWireless4', 1);
									setDisplay('secWireless5', 0);
								  	setDisplay('secWireless6', 0);
								  	setDisplay('secWireless7', 0);
									setDisplay('secWireless8', 0);
									setDisplay('wlanBindSSIDExt', 0);
								  }
<% else %>
								  else if(validSSID == "5"){
								  	setDisplay('secWireless1', 1);
								  	setDisplay('secWireless2', 1);
								  	setDisplay('secWireless3', 1);
									setDisplay('secWireless4', 1);
								  	setDisplay('secWireless5', 1);
								  	setDisplay('secWireless6', 0);
								  	setDisplay('secWireless7', 0);
									setDisplay('secWireless8', 0);
								  }
								  else if(validSSID == "6"){
								  	setDisplay('secWireless1', 1);
								  	setDisplay('secWireless2', 1);
								  	setDisplay('secWireless3', 1);
									setDisplay('secWireless4', 1);
								  	setDisplay('secWireless5', 1);
								  	setDisplay('secWireless6', 1);
								  	setDisplay('secWireless7', 0);
									setDisplay('secWireless8', 0);
								  }
								  else if(validSSID == "7"){
									setDisplay('secWireless1', 1);
								  	setDisplay('secWireless2', 1);
								  	setDisplay('secWireless3', 1);
									setDisplay('secWireless4', 1);
								  	setDisplay('secWireless5', 1);
								  	setDisplay('secWireless6', 1);
								  	setDisplay('secWireless7', 1);
									setDisplay('secWireless8', 0);
								  }
								  else if(validSSID >= 8){
									setDisplay('secWireless1', 1);
								  	setDisplay('secWireless2', 1);
								  	setDisplay('secWireless3', 1);
									setDisplay('secWireless4', 1);
								  	setDisplay('secWireless5', 1);
								  	setDisplay('secWireless6', 1);
								  	setDisplay('secWireless7', 1);
									setDisplay('secWireless8', 1);
									setDisplay('wlanBindSSIDExt', 1);
								  }
<% end if %>
								  //wireless 5g
								  var validacSSID = "<% tcWebApi_get("WLan11ac_Common","BssidNum","s") %>";	
									var validAcNum = parseInt(validSSID);
								  if(validacSSID == "1"){
								  	setDisplay('secWirelessac1', 1);
								  	setDisplay('secWirelessac2', 0);
								  	setDisplay('secWirelessac3', 0);
									setDisplay('secWirelessac4', 0);
									setDisplay('secWirelessac5', 0);
									setDisplay('secWirelessac6', 0);
									setDisplay('secWirelessac7', 0);
									setDisplay('secWirelessac8', 0);
									setDisplay('wlanacBindSSIDExt', 0);
								  }
								  else if(validacSSID == "2"){
								  	setDisplay('secWirelessac1', 1);
								  	setDisplay('secWirelessac2', 1);
								  	setDisplay('secWirelessac3', 0);
									setDisplay('secWirelessac4', 0);
									setDisplay('secWirelessac5', 0);
									setDisplay('secWirelessac6', 0);
									setDisplay('secWirelessac7', 0);
									setDisplay('secWirelessac8', 0);
									setDisplay('wlanacBindSSIDExt', 0);
								  }
								  else if(validacSSID == "3"){
									setDisplay('secWirelessac1', 1);
								  	setDisplay('secWirelessac2', 1);
								  	setDisplay('secWirelessac3', 1);
									setDisplay('secWirelessac4', 0);
									setDisplay('secWirelessac5', 0);
									setDisplay('secWirelessac6', 0);
									setDisplay('secWirelessac7', 0);
									setDisplay('secWirelessac8', 0);
									setDisplay('wlanacBindSSIDExt', 0);
								  }
								  else if(validacSSID == "4"){
									setDisplay('secWirelessac1', 1);
								  	setDisplay('secWirelessac2', 1);
								  	setDisplay('secWirelessac3', 1);
									setDisplay('secWirelessac4', 1);
									setDisplay('secWirelessac5', 0);
									setDisplay('secWirelessac6', 0);
									setDisplay('secWirelessac7', 0);
									setDisplay('secWirelessac8', 0);
									setDisplay('wlanacBindSSIDExt', 0);
								  }
<% if tcWebApi_get("WebCustom_Entry", "isMultiUserITFSupported","h") <> "Yes" then %>
								 else if(validAcNum > 4){
									setDisplay('secWirelessac1', 1);
								  	setDisplay('secWirelessac2', 1);
								  	setDisplay('secWirelessac3', 1);
									setDisplay('secWirelessac4', 1);
									setDisplay('secWirelessac5', 0);
									setDisplay('secWirelessac6', 0);
									setDisplay('secWirelessac7', 0);
									setDisplay('secWirelessac8', 0);
									setDisplay('wlanacBindSSIDExt', 0);
								  }
<% else %>
								  else if(validacSSID == "5"){
								  	setDisplay('secWirelessac1', 1);
								  	setDisplay('secWirelessac2', 1);
								  	setDisplay('secWirelessac3', 1);
									setDisplay('secWirelessac4', 1);
									setDisplay('secWirelessac5', 1);
									setDisplay('secWirelessac6', 0);
									setDisplay('secWirelessac7', 0);
									setDisplay('secWirelessac8', 0);
								  }
								  else if(validacSSID == "6"){
								  	setDisplay('secWirelessac1', 1);
								  	setDisplay('secWirelessac2', 1);
								  	setDisplay('secWirelessac3', 1);
									setDisplay('secWirelessac4', 1);
									setDisplay('secWirelessac5', 1);
									setDisplay('secWirelessac6', 1);
									setDisplay('secWirelessac7', 0);
									setDisplay('secWirelessac8', 0);
								  }
								  else if(validacSSID == "7"){
									setDisplay('secWirelessac1', 1);
								  	setDisplay('secWirelessac2', 1);
								  	setDisplay('secWirelessac3', 1);
									setDisplay('secWirelessac4', 1);
									setDisplay('secWirelessac5', 1);
									setDisplay('secWirelessac6', 1);
									setDisplay('secWirelessac7', 1);
									setDisplay('secWirelessac8', 0);
								  }
								  else if(validAcNum >= 8){
									setDisplay('secWirelessac1', 1);
								  	setDisplay('secWirelessac2', 1);
								  	setDisplay('secWirelessac3', 1);
									setDisplay('secWirelessac4', 1);
									setDisplay('secWirelessac5', 1);
									setDisplay('secWirelessac6', 1);
									setDisplay('secWirelessac7', 1);
									setDisplay('secWirelessac8', 1);
								  }
<% end if %>
<% if tcwebApi_get("WebCustom_Entry","isCT1PORTSupported","h") = "Yes" then %>
										setDisplay('secLan2', 0);
<% end if %>
<% if tcwebApi_get("WebCustom_Entry","isCT2PORTSSupported","h") = "Yes" then %>
								  	setDisplay('secLan3', 0);
										setDisplay('secLan4', 0);
<% end if %>
<% if TCWebApi_get("WebCustom_Entry","isWLanSupported","h" ) <> "Yes" then %>
										setDisplay('wlanBindTab', 0);
<% end if %>
<% if TCWebApi_get("WebCustom_Entry","isWLanACSupported","h" ) <> "Yes" then %>
										setDisplay('wlanacBindTab', 0);
<% end if %>
								  </script>
							</div>
							<div  class="form-group" id=enabledhcpsec>
								<label class="col-lg-5" for="cb_enabledhcp"><%tcWebApi_get("String_Entry","DHCPServerEnableText","s")%></label>
								<label class="toggle-switch">
									<INPUT id='cb_enabledhcp' type=checkbox name='cb_enabledhcp' <%if tcWebApi_get("WanInfo_WanIF","DHCPEnable","h") = "1" then asp_Write("checked") end if%>>
									<span class="slider"></span>
									<INPUT id='enable_dhcp' type=hidden name='enable_dhcp'>
								</label>
							</div>
						</fieldset>
					</div>
				</div>
				<div class="col-lg-12 d-flex align-items-center justify-content-center">
					<button type="button" class="action-button small-button" onclick="onCancel();"><%tcWebApi_get("String_Entry","ButtonCancelText","s")%></button>
					<button id="btnOK" type="button" class="page-button small-button" onclick="doSubmit();"><%tcWebApi_get("String_Entry","ButtonApplyText","s")%></button>
				</div>
			</div>
			<INPUT id=pppIdleTimeout type=hidden value=0 name=pppIdleTimeout>
            <INPUT type=hidden name=xponstate value="Yes">
            <input type='hidden' id='Option60Enable1' name='Option60Enable1' value="<%if tcWebApi_get("WanInfo_WanIF","Option60Enable1","h") <> "N/A" then tcWebApi_get("WanInfo_WanIF","Option60Enable1","s") end if%>">
            <input type='hidden' id='Option60Enable2' name='Option60Enable2' value="<%if tcWebApi_get("WanInfo_WanIF","Option60Enable2","h") <> "N/A" then tcWebApi_get("WanInfo_WanIF","Option60Enable2","s") end if%>">
            <input type='hidden' id='Option60Enable3' name='Option60Enable3' value="<%if tcWebApi_get("WanInfo_WanIF","Option60Enable3","h") <> "N/A" then tcWebApi_get("WanInfo_WanIF","Option60Enable3","s") end if%>">
            <input type='hidden' id='Option60Enable4' name='Option60Enable4' value="<%if tcWebApi_get("WanInfo_WanIF","Option60Enable4","h") <> "N/A" then tcWebApi_get("WanInfo_WanIF","Option60Enable4","s") end if%>">
            <input type='hidden' id='Option60Type1' name='Option60Type1' value="<%if tcWebApi_get("WanInfo_WanIF","Option60Type1","h") <> "N/A" then tcWebApi_get("WanInfo_WanIF","Option60Type1","s") end if%>">
            <input type='hidden' id='Option60Type2' name='Option60Type2' value="<%if tcWebApi_get("WanInfo_WanIF","Option60Type2","h") <> "N/A" then tcWebApi_get("WanInfo_WanIF","Option60Type2","s") end if%>">
            <input type='hidden' id='Option60Type3' name='Option60Type3' value="<%if tcWebApi_get("WanInfo_WanIF","Option60Type3","h") <> "N/A" then tcWebApi_get("WanInfo_WanIF","Option60Type3","s") end if%>">
            <input type='hidden' id='Option60Type4' name='Option60Type4' value="<%if tcWebApi_get("WanInfo_WanIF","Option60Type4","h") <> "N/A" then tcWebApi_get("WanInfo_WanIF","Option60Type4","s") end if%>">
            <input type='hidden' id='Option60ValueMode1' name='Option60ValueMode1' value="<%if tcWebApi_get("WanInfo_WanIF","Option60ValueMode1","h") <> "N/A" then tcWebApi_get("WanInfo_WanIF","Option60ValueMode1","s") end if%>">
            <input type='hidden' id='Option60ValueMode2' name='Option60ValueMode2' value="<%if tcWebApi_get("WanInfo_WanIF","Option60ValueMode2","h") <> "N/A" then tcWebApi_get("WanInfo_WanIF","Option60ValueMode2","s") end if%>">
            <input type='hidden' id='Option60ValueMode3' name='Option60ValueMode3' value="<%if tcWebApi_get("WanInfo_WanIF","Option60ValueMode3","h") <> "N/A" then tcWebApi_get("WanInfo_WanIF","Option60ValueMode3","s") end if%>">
            <input type='hidden' id='Option60ValueMode4' name='Option60ValueMode4' value="<%if tcWebApi_get("WanInfo_WanIF","Option60ValueMode4","h") <> "N/A" then tcWebApi_get("WanInfo_WanIF","Option60ValueMode4","s") end if%>">
            <input type='hidden' id='Option60Value1' name='Option60Value1' value="<%if tcWebApi_get("WanInfo_WanIF","Option60Value1","h") <> "N/A" then tcWebApi_get("WanInfo_WanIF","Option60Value1","s") end if%>">
            <input type='hidden' id='Option60Value2' name='Option60Value2' value="<%if tcWebApi_get("WanInfo_WanIF","Option60Value2","h") <> "N/A" then tcWebApi_get("WanInfo_WanIF","Option60Value2","s") end if%>">
            <input type='hidden' id='Option60Value3' name='Option60Value3' value="<%if tcWebApi_get("WanInfo_WanIF","Option60Value3","h") <> "N/A" then tcWebApi_get("WanInfo_WanIF","Option60Value3","s") end if%>">
            <input type='hidden' id='Option60Value4' name='Option60Value4' value="<%if tcWebApi_get("WanInfo_WanIF","Option60Value4","h") <> "N/A" then tcWebApi_get("WanInfo_WanIF","Option60Value4","s") end if%>">
			</form>
		</div>
		<footer>
			<% if tcWebApi_get("String_Entry","BranchName","h") <> "Mytel" then %>	
			<p><%tcWebApi_get("String_Entry","SaleConsultantText","s")%>: <a href="tel:<%tcWebApi_get("String_Entry","SaleConsutantContact","h")%>"><%tcWebApi_get("String_Entry","SaleConsutantContact","s")%></a></p>
			<p><%tcWebApi_get("String_Entry","ReportProblemText","s")%>: <a href="tel:<%tcWebApi_get("String_Entry","ReportProblemsContact","h")%>"><%tcWebApi_get("String_Entry","ReportProblemsContact","s")%></a></p>
			<% else %>
			<p><%tcWebApi_get("String_Entry","SaleConsultantText","s")%>: <a href="tel:<%tcWebApi_get("String_Entry","SaleConsutantContact","h")%>"><%tcWebApi_get("String_Entry","SaleConsutantContact","s")%></a> <%tcWebApi_get("String_Entry","Redirect5Text","s")%> <a href="tel:<%tcWebApi_get("String_Entry","SaleConsutantContact2","h")%>"><%tcWebApi_get("String_Entry","SaleConsutantContact2","s")%></a></p>
			<p><%tcWebApi_get("String_Entry","ReportProblemText","s")%>: <a href="tel:<%tcWebApi_get("String_Entry","ReportProblemsContact","h")%>"><%tcWebApi_get("String_Entry","ReportProblemsContact","s")%></a> <%tcWebApi_get("String_Entry","Redirect5Text","s")%> <a href="tel:<%tcWebApi_get("String_Entry","ReportProblemsContact2","h")%>"><%tcWebApi_get("String_Entry","ReportProblemsContact2","s")%></a></p>
			<% end if %>
			<p>&copy; 2021 by VHT. All rights reserved.</p>
		</footer>
		<script language='javascript' src='/JS/user.js'></script>	<script language="JavaScript">
	var UsernameOpenFlag = "<%tcWebApi_get("dynCwmpAttr_Entry","aPPPUsername","s")%>";
	var PasswordOpenFlag = "<%tcWebApi_get("dynCwmpAttr_Entry","aPPPPassword","s")%>";
	var VLANIDOpenFlag = "<%tcWebApi_get("dynCwmpAttr_Entry","aVLANIDMark","s")%>";
	if(UsernameOpenFlag == "0")
		lockObj('pppUserName', true);
	if(PasswordOpenFlag == "0")
		lockObj('pppPassword', true);
	if(VLANIDOpenFlag == "0")
		lockObj('vlan', true);
	$(function () {
	  $('[data-toggle="tooltip"]').tooltip()
	})
	</script>
	</body>
</html>
