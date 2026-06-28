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
    tcWebApi_set("WebCurSet_Entry","diag_pvc","Test_PVC")
	tcWebApi_set("WebCurSet_Entry","diag_pvc_entry","Test_PVC_entry")
%>
<!doctype html>
<html>
	<head>
<title>Viettel ONT - <%tcWebApi_get("String_Entry","NavigationMainDiagnosticsText","s")%></title>		<meta charset="utf-8">
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
var pvc_counts=<% tcWebApi_get("WanInfo_Common","CycleNum","s") %>;
//get all value
// num 0
var vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
var Wan_WanName = vArrayStr.split(',');
vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
var Wan_If = vArrayStr.split(',');
<% tcWebApi_get("WanInfo_Common","CycleValue","h") %>
vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
var Wan_Active = vArrayStr.split(',');
<% tcWebApi_get("WanInfo_Common","CycleNum","h") %>
<% tcWebApi_constSet("WanInfo_Common", "CycleJump", "11") %>
// num 11
var CycleV = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
var dnslist = CycleV.split(',');
<% tcWebApi_get("WanInfo_Common","CycleNum","h") %>
<% tcWebApi_constSet("WanInfo_Common", "CycleJump", "20") %>
// num 20
CycleV = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
var IFIdxArray = CycleV.split(',');
vArrayStr = "<% tcWebApi_get("WanInfo_Common","ValidIFIndex","s") %>";
var vEntryIndex = vArrayStr.split(',');
var curWanIndex = "<% tcWebApi_get("WanInfo_Common","CurIFIndex","s") %>";
function WanIndexConstruction(domain,WanName)
{
	this.domain = domain;
	this.WanName = WanName;
}
function CheckWansActives()
{
	var	nCurTemp = 0;
	var	vcurLinks = new Array(pvc_counts);
	for(var i=0; i<pvc_counts; i++)
	{	
		vcurLinks[nCurTemp++] = new WanIndexConstruction(vEntryIndex[i], Wan_WanName[i]);
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
var WanNameObjs;
function WriteWanNameSelected()
{
	var WanIDNums = CurWan;
	var nlength = WanIDNums.length-1;
	var i = 0;
	var isSel = 0;
	if(nlength == 1) 
		document.diagnostic_form.curSetIndex.value = WanIDNums[0].domain;
	WanNameObjs = new Array(nlength)
	for( i=0; i< nlength; i++)
	{
		WanNameObjs[i] = new WanNameObject(WanIDNums[i].domain, WanIDNums[i].WanName, IFIdxArray[i]);
	}
	WanNameObjs.sort(WanNameSort);
	with (getElById('WanIdx'))
	{
		for( i=0; i< WanNameObjs.length; i++)
		{
			if (Wan_Active[i] != "Yes") {
				continue;
			}
			var opt = new Option(WanNameObjs[i].IfaceName, WanNameObjs[i].IfaceDomain);
			if ( document.diagnostic_form.curSetIndex.value == WanNameObjs[i].IfaceDomain )
			{
				opt.selected = true
				isSel = i;
			}
			options.add ( opt );
		}
	}
}
function WanNameObject(IFDomain, IFName, IFIdx)
{
	this.IfaceDomain = IFDomain;
	this.IfaceName = IFName;
	this.IfaceIndex = IFIdx;
}
var url;
var pingAddr;
var doType;
var sendNum;
var pSize;
var overTime;
var trHops;
var tokenString;
var wanDev;
var wanNum;
function ValidateIPaddress(ipaddress) 
{  
	if (/^(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$/.test(ipaddress)) 
	{  
		return true; 
	}  
	return false; 
}  
function is_domain(domain_string)
{
	var c;
	var ch = "-.ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
	for (var i = 0; i < domain_string.length; i++)
	{
		c = domain_string.charAt(i);
		if (ch.indexOf(c) == -1)
		{
			// alert(js_illegal_input="<%tcWebApi_get("String_Entry","SystemIllegalInputAlert","s")%>");
			return false;
		}
	}        
		return true;
}
function is_number(num_string,nMin,nMax)
{
	var c;
	var ch = "0123456789";
	if (num_string.length == 0)
	{
		return false;
	}
	for (var i = 0; i < num_string.length; i++)
	{
		c = num_string.charAt(i);
		if (ch.indexOf(c) == -1)
		{
			return false;
		}
	}
	if(parseInt(num_string,10) < nMin || parseInt(num_string,10) > nMax)
	{
		return false;
	}
	return true;
}
function chooseSwitch()
{
	if (document.getElementById("doType1").checked)
	{
		document.getElementById("sendNum").disabled = false;
		document.getElementById("pSize").disabled = false;
		document.getElementById("overTime").disabled = false;
		document.getElementById("trHops").disabled = true;
	}
	if (document.getElementById("doType2").checked)
	{
		document.getElementById("sendNum").disabled = true;
		document.getElementById("pSize").disabled = true;
		document.getElementById("overTime").disabled = true;
		document.getElementById("trHops").disabled = false;
	}
	document.getElementById("Lan_test").value = "N/A"
	document.getElementById("PonMac_test").value = "N/A"
	document.getElementById("PonLink_test").value = "N/A"
	document.getElementById("dns_test").value = "N/A"
}
function getDevName(wanNum)
{
	return Wan_If[vEntryIndex.indexOf(wanNum)];
}
function doGetPara()
{
	if(document.getElementById("pingAddr").value == "")
	{
		alert(js_ip_n_domain_req = "<%tcWebApi_get("String_Entry","SystemIPDomainAlert","s")%>");
		var element = document.getElementById("pingAddr");
		if(element)
		{
			  element.focus();
			  element.select();
		}
		  return false;
	}
	if(is_domain(document.getElementById("pingAddr").value)==false)
	{
		alert(js_ip_n_domain_req = "<%tcWebApi_get("String_Entry","SystemIPDomainAlert","s")%>");
		var element = document.getElementById("pingAddr");
		if(element)
		{
			element.focus();
			element.select();
		}
		return false;
	}
	if (document.getElementById("doType1").checked){
	if ((false == is_number(document.getElementById("sendNum").value, 1, 10)) || (document.getElementById("sendNum").value==""))
	{
		var element = document.getElementById("sendNum");
		if(element)
		{
			element.focus();
			element.select();
		}
		alert(js_send_num = "<%tcWebApi_get("String_Entry","SystemEnterNumber1","s")%>");
		return false;
	}
	if ((false == is_number(document.getElementById("pSize").value, 4, 1472)) || (document.getElementById("pSize").value==""))
	{
		var element = document.getElementById("pSize");
		if(element)
		{
			element.focus();
			element.select();
		}
		alert(js_p_size = "<%tcWebApi_get("String_Entry","SystemEnterNumber2","s")%>");
		return false;
	}
	if ((false == is_number(document.getElementById("overTime").value, 100, 2000)) || (document.getElementById("overTime").value==""))
	{
		var element = document.getElementById("overTime");
		if(element)
		{
			element.focus();
			element.select();
		}
		alert(js_over_time = "<%tcWebApi_get("String_Entry","SystemEnterNumber3","s")%>");
		return false;
	}
	}
	if (document.getElementById("doType2").checked)
	{
	if ((false == is_number(document.getElementById("trHops").value, 2, 30)) || (document.getElementById("trHops").value==""))
	{
		var element = document.getElementById("trHops");
		if(element)
		{
			element.focus();
			element.select();
		}
		alert(js_trhops = "<%tcWebApi_get("String_Entry","SystemEnterNumber4","s")%>");
		return false;
	}
	}
	if(document.getElementById("doType1").checked)
	{
		doType=document.getElementById("doType1").value;
	}
	else
	{
		doType=document.getElementById("doType2").value;
	}
	pingAddr = document.getElementById("pingAddr").value;
	sendNum = document.getElementById("sendNum").value;
	pSize = document.getElementById("pSize").value;
	overTime = document.getElementById("overTime").value;
	trHops = document.getElementById("trHops").value;
	tokenString = document.getElementById("Token").value;
	wanNum = document.getElementById("WanIdx").value;
	wanDev = getDevName(wanNum);
	url = "/cgi-bin/diag_tool.cgi?ping_addr="+pingAddr+"&doType="+doType+"&sendNum="+sendNum+"&pSize="+pSize+"&overTime="+overTime+"&trHops="+trHops+"&wanDev="+wanDev+"&wanDev="+wanNum;
	return true;
}
function httpGet(theUrl)
{
	var xmlHttp = new XMLHttpRequest();
	xmlHttp.open( "GET", theUrl, false ); // false for synchronous request
	xmlHttp.send( null );
	return xmlHttp.responseText;
}
function displayDiagResult() {
	var linenum = 2;
	var readNext = 1;
	var end = 0;
	timer = setInterval(function() { 
	   $.ajax({url: "/cgi-bin/diag_get_result.cgi?linenumber=" + linenum+"&TokenString="+tokenString, method: 'GET', complete: function(res){
			try { 
					var text = res.responseText;
					var line = "";
					if (text.length > 1)
					{
						if(readNext == 1)
						{
							linenum = linenum - 1;
							readNext = 0;
							if(text.match("END OF DIAG"))
								end = 1;
							return;
						}
					}
					if(readNext == 0)
					{
						line = text.substring(0, text.length -1);
						 if (1 == linenum)
						{
							updateResult("Lan_test", line);
							console.log(line);
						}
						else if (2 == linenum)
						{
							updateResult("PonMac_test", line);
							console.log(line);
						}
						else if (3 == linenum)
						{
							updateResult("PonLink_test", line);
							console.log(line);
						}
						else if (4 == linenum)
						{
							updateResult("dns_test", line);
							console.log(line);
						}
						else
						{
							if (line.length)
							{
								document.diagnostic_form.ping_result.value += line;
							}
							if (end == 1) 
							{
								document.diagnostic_form.ping_result.value += "\n DONE!";
								clearTimeout(timer);
								/*ONT-59*/
								document.getElementById("Exexute_Btn").disabled = false;
								cs_enable("WanIdx");
								/*ONT-59*/
							}
						}
						linenum = linenum + 2;
						readNext = 1;
					}
				}
			catch(err){ }
			}
		})}, 1000); 
}				
function DoRefresh() 
{
	submitAsync("diagnostic_form");
}
function httpGetAsync(theUrl, callback)
{
	var xmlHttp = new XMLHttpRequest();
	xmlHttp.onreadystatechange = function() { 
		if (xmlHttp.readyState == 4 && xmlHttp.status == 200)
			callback(xmlHttp.responseText);
	}
	xmlHttp.open("GET", theUrl, true); // true for asynchronous 
	xmlHttp.send(null);
}
function onDiagClick() {
	var test_status = ["Lan_test", "PonMac_test", "PonLink_test", "dns_test"]
	for (item of test_status) {
		document.getElementById(item).value = "N/A";
		document.getElementById(item).style.color="#009300";
	}
	cs_disable("WanIdx");
	if (!doGetPara()){
		return;
	}
	if (doType.match("ping")){
		/*ONT-59*/
		document.getElementById("Exexute_Btn").disabled = true;
		/*ONT-59*/
		document.diagnostic_form.ping_result.value = "Pinging processing...";
	}
	else {
		/*ONT-59*/
		document.getElementById("Exexute_Btn").disabled = true;
		/*ONT-59*/
		document.diagnostic_form.ping_result.value = "Traceroute processing...";
	}
	displayDiagResult();
	httpGetAsync(url,onPingSuccess);
}
function onPingSuccess(response) {
}
function updateResult(item, status) {
	if(-1 != status.indexOf("PASS"))
	{
		document.getElementById(item).value = "<%tcWebApi_get("String_Entry","PassText","s")%>";
		document.getElementById(item).style.color="#009300";
	}
	else if(-1 !=  status.indexOf("Fail") )
	{
		document.getElementById(item).value = "<%tcWebApi_get("String_Entry","FailText","s")%>";
		document.getElementById(item).style.color="red";
	}
	else if(-1 !=  status.indexOf("Skipped") )
	{
		document.getElementById(item).value = "<%tcWebApi_get("String_Entry","SkippedText","s")%>";
	}
	else if(-1 !=  status.indexOf("Wait") )
	{
		document.getElementById(item).value = "<%tcWebApi_get("String_Entry","WaitText","s")%>";
	}
	else
	{
	   document.getElementById(item).value = "N/A";
	}
}
function changewan() {
	var id = document.getElementById("WanIdx").value;
	$("#Test_PVC").val(id/8);
	$("#Test_PVC_entry").val(id%8);
	var dns = dnslist[vEntryIndex.indexOf(document.getElementById("WanIdx").value)];
	$("#dnsIP").text(dns);
}
function showUI() {
	var pvc="<% tcWebApi_get("WebCurSet_Entry","diag_pvc","s") %>";
	var entry="<% tcWebApi_get("WebCurSet_Entry","diag_pvc_entry","s") %>";
	if ((pvc != "N/A") && (entry != "N/A"))
		setSelect("WanIdx", parseInt(pvc)*8 + parseInt(entry));
	changewan();
}		
		</script>
	</head>
	<body onload="showUI();" class="container">
<header class="fixed-top"><nav id="top-nav" class="navbar navbar-expand-lg container"><a class="navbar-brand " href="/cgi-bin/home.asp"><div><img src="/img/logo_home.png" width="100" height="18" alt=""><div style="font-family: sans-serif; font-weight: bold;font-size: 12px;color: #000; margin-top: 0">OPTICAL NETWORK TERMINATION</div></div></a><button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"><em class="fas fa-align-justify"></em></span></button><div class="collapse navbar-collapse" id="navbarCollapse"><ul class="navbar-nav mr-auto sidenav" id="navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/home.asp"><%tcWebApi_get("String_Entry","NavigationHomeText","s")%><span class="sr-only"></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/deviceinfo.asp"><%tcWebApi_get("String_Entry","NavigationStatusDeviceText","s")%><span class="sr-only"></span></a></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#status-menu" aria-controls="status-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NavigationStatusStatisticsText","s")%></a><ul class="nav-second-level collapse" id="status-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/sta-statistics.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationTrafficText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/sta-wifiusers.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationStatusUsersText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/sta-users.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","ARPStatusText","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#network-menu" aria-controls="network-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NAVNetwork","s")%></a><ul class="nav-second-level collapse" id="network-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/net-wan.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationBasInternetText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/net-lan.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationBasLANText","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#wifi-menu" aria-controls="wifi-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NAVWifi","s")%></a><ul class="nav-second-level collapse" id="wifi-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/wifi.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationWiFiSettingsText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/wifi-11ac.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationWiFi11acSettingsText","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#firewall-menu" aria-controls="firewall-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NavigationAdvFirewallText","s")%></a><ul class="nav-second-level collapse" id="firewall-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-spi.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","ContentFirewallText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-urlfilter.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","FILTERTYPE_index2","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-macfilter.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVL2Filter","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-parentalcontrol.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","ParentalControlText","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#apps-menu" aria-controls="apps-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NAVApplication","s")%></a><ul class="nav-second-level collapse" id="apps-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-dmz.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NatTopDMZText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-portforwarding.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NatVirsvrText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-sslim.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","SessionLimit","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-route.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","StaticRouteText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-ddns.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","dyDNS1Text","s")%></span></a></li></ul></li><li class="nav-item active"><a class="nav-link nav-link-collapse nav-link-show" href="#" id="hasSubItems" data-toggle="collapse" data-target="#tools-menu" aria-controls="tools-menu" aria-expanded="true"><%tcWebApi_get("String_Entry","NavigationMaintenanceText","s")%></a><ul class="nav-second-level show" id="tools-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-admin.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationMainAdminText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-time.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVSysTime","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-firmware.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationMainFirmwareText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-config.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVConfig","s")%></span></a></li><li class="nav-item active"><a class="nav-link" href="/cgi-bin/tools-diagnostic.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationMainDiagnosticsText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-log.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVLogs","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-reboot.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","RebootText","s")%></span></a></li></ul></li></ul><div class="top-item-groups"><form name="LanguageForm" method="POST" action="/cgi-bin/tools-diagnostic.asp" class="nav-item dropdown"><input type="hidden" name="TokenString" value="<%tcWebApi_getToken()%>"><input type="hidden" name="Language_Flag" value="<% tcWebApi_get("LanguageSwitch_Entry","Type","s") %>"><a class="nav-link dropdown-toggle" href="#" id="LanguageDropdown" role="button" data-toggle="dropdown" aria-expanded="false"><% tcWebApi_get("String_Entry","LoginLanguage","s") %></a><ul class="dropdown-menu" aria-labelledby="LanguageDropdown"><li><a class="dropdown-item <% if tcWebApi_get("LanguageSwitch_Entry","Type","h") = "1" then asp_Write("active") end if %>" href="#" onclick="submitLanguageForm(1);"><% tcWebApi_get("String_Entry","LanguageVIELong","s") %></a></li><li><a class="dropdown-item <% if tcWebApi_get("LanguageSwitch_Entry","Type","h") = "2" then asp_Write("active") end if %>" href="#" onclick="submitLanguageForm(2);"><% tcWebApi_get("String_Entry","LanguageENGLong","s") %></a></li></ul></form><div id="signout" class="nav-item"><a class="nav-link" href="javascript:doLogout();"><em class="fa fa-sign-out-alt"></em><span class="nav-link-text"><% tcWebApi_get("String_Entry","LogoutText","s") %></span></a></div></div></div></header></nav><% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then
	if tcWebApi_get("Mesh_Common", "DeviceRole", "h") = "2" then %>
		<script language='javascript'>
		document.getElementById("wifi-menu").children[0].style="display: none";
		document.getElementById("wifi-menu").children[1].style="display: none";
		</script>
<% end if end if %>		<div id="content">
		<form class="form-inline" method="post" name="diagnostic_form" action="/cgi-bin/tools-diagnostic.asp" autocomplete="off">
		<INPUT TYPE="HIDDEN" NAME="TokenString" id="Token" VALUE="<%tcWebApi_getToken()%>">
		<div class="row row-w-100">
			<div class="widget col-xs-12 col-lg-12">
				<header><%tcWebApi_get("String_Entry","NavigationMainDiagnosticsText","s")%></header>
				<div class="widget-body">
					<fieldset>
						<legend>
							<%tcWebApi_get("String_Entry","ConfigurationText","s")%>
						</legend>
						<div class="form-group">
							<label class="col-lg-4"><%tcWebApi_get("String_Entry","ConnectionNameText","s")%></label>
							<input type="hidden" id="curSetIndex" name="curSetIndex" value="<% tcWebApi_get("WanInfo_Common","CurIFIndex","s") %>">
							<input type="hidden" id="Test_PVC" name="Test_PVC" >
							<input type="hidden" id="Test_PVC_entry" name="Test_PVC_entry">
							<div class="col-lg-7 custom-select">
								<select id="WanIdx" namne="WanIdx" onchange="changewan()"></select>
							</div>
							<script>WriteWanNameSelected()</script>
						</div>
						<div class="form-group">
							<label class="col-xs-8 col-sm-4 control-label"><%tcWebApi_get("String_Entry","TestconnectionText","s")%></label>
							<input class="status-value col-xs-3 col-sm-2" type="text" id="Lan_test" style="font-weight: bold; color: #009300; border: none;" size="30" maxlength="24" value="N/A" readonly>
						</div>
						<div class="form-group">
							<label class="col-xs-8 col-sm-4 control-label"><%tcWebApi_get("String_Entry","TestPonMacText","s")%></label>
							<input class="status-value col-xs-3 col-sm-2" type="text" id="PonMac_test" style="font-weight: bold; color: #009300; border: none;" size="30" maxlength="24" value="N/A" readonly>
						</div>
						<div class="form-group">
							<label class="col-xs-8 col-sm-4 control-label"><%tcWebApi_get("String_Entry","TestPonAppText","s")%></label>
							<input class="status-value col-xs-3 col-sm-2" type="text" id="PonLink_test" style="font-weight: bold; color: #009300; border: none;" size="30" maxlength="24" value="N/A" readonly>
						</div>
						<div class="form-group">
							<label class="col-xs-12 col-sm-4 control-label d-block"><%tcWebApi_get("String_Entry","TestendPingDNS0Text","s")%><font id="dnsIP"></font>)</label>
							<input class="status-value col-xs-12 col-sm-6" type="text" id="dns_test" style="font-weight: bold; color: #009300; border: none;" size="30" maxlength="24" value="N/A" readonly>
						</div>
						<div class="form-group">
							<label class="col-xs-12 col-sm-4 control-label"><%tcWebApi_get("String_Entry","DiagToolText","s")%></label>
							<div class="col-xs-4 col-sm-2 custom-control custom-radio">
							<input id="doType1" name="doType" class="custom-control-input"  onclick="chooseSwitch();" type="radio" value="ping" checked>
							<label class="custom-control-label" for="doType1">Ping</label></div>
							<div class="col-xs-4 col-sm-2 custom-control custom-radio">
							<input id="doType2" name="doType" class="custom-control-input"  onclick="chooseSwitch();" type="radio" value="tracert">
							<label class="custom-control-label" for="doType2">Traceroute</label></div>
						</div>
						<div id="t_ip_domain" class="form-group">
							<label class="col-xs-12 col-sm-4 control-label"> <%tcWebApi_get("String_Entry","LANIPAddressText","s")%>/ <%tcWebApi_get("String_Entry","DDNSHostName","s")%></label>
							<input class="form-control col-xs-12 col-sm-4 col-lg-3" id="pingAddr" maxlength="50" name="pingAddr" onkeydown="if(event.keyCode==13) return doOnEnter();" size="20" type="text" value=""> <input name="isNew" type="hidden" value="new">
						</div>
						<div id="number" class="form-group">
							<label class="col-xs-12 col-sm-4 control-label"><%tcWebApi_get("String_Entry","DiagPingCount","s")%></label>
							<input id="sendNum" class="form-control col-xs-5 col-sm-2" maxlength="2" name="sendNum" size="5" type="text" value="4">
							<div class="col-xs-7 col-sm-4 text-label inline-text">(1-10)</div>
						</div>
						<div id="size" class="form-group">
							<label class="col-xs-12 col-sm-4 control-label"><%tcWebApi_get("String_Entry","DiagPingPacketSize","s")%></label>
							<input class="form-control col-xs-5 col-sm-2" id="pSize" maxlength="4" name="pSize" size="5" type="text" value="64">
							<div class="col-xs-7 col-sm-4 text-label inline-text">(4-1472 Bytes)</div>
						</div>
						<div id="timeout" class="form-group">
							<label class="col-xs-12 col-sm-4 control-label"><%tcWebApi_get("String_Entry","DiagPingTimeout","s")%></label>
							<input class="form-control col-xs-5 col-sm-2 " id="overTime" maxlength="4" name="overTime" size="5" type="text" value="800">
							<div class="col-xs-7 col-sm-4 text-label inline-text">(100-2000 Milliseconds)</div>
						</div>
						<div id="hops" class="form-group">
							<label class="col-xs-12 col-sm-4 control-label"><%tcWebApi_get("String_Entry","DiagMaxTTL","s")%></label>
							<input class="form-control col-xs-5 col-sm-2" id="trHops" maxlength="2" name="trHops" size="5" type="text" value="20" disabled ><div class="col-xs-7 col-sm-4 text-label inline-text">(2-30)</div>
						</div>
						<div class="d-flex justify-content-end mb-2">
							<button name="PingBtn" id="Exexute_Btn" class="widget-button small-button" type="button" onClick="onDiagClick()">
								<%tcWebApi_get("String_Entry","ButtonDiagText","s")%>
							</button>
						</div>
						<div class="custom-scroll" style="overflow-y: auto; width: 100%">
							<textarea class="col-sm-12" readonly rows="15" cols="80" name="ping_result" style="font-size: 9pt; resize:none;"></textarea>
						</div>
					</fieldset>
				</div>
			</div>
			<div class="col-lg-12 d-flex align-items-center justify-content-center">
				<button id="btnOK" type="button" class="page-button small-button" onclick="DoRefresh();"><%tcWebApi_get("String_Entry","ButtonRefreshText","s")%></button>
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
