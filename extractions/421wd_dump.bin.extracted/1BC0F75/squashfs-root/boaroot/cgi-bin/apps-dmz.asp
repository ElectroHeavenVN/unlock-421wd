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
if Request_Form("DMZ_Flag") = "1" then
	TCWebApi_set("WebCurSet_Entry","nat_pvc","DMZEntryCurIndex")
	TCWebApi_set("WebCurSet_Entry","dmz_ifidx","DMZEntryCurIndex")
	TCWebApi_commit("WebCurSet_Entry")
	TCWebApi_set("Dmz_Entry","IFName","DMZInterfaceInput")
	TCWebApi_set("Dmz_Entry","Active","EnableDMZ_Flag")
	if Request_Form("isAutoDMZSupported") = "1" then
		TCWebApi_set("Dmz_Common","UpdateDMZ_Active","AutoDMZ_Flag")
		TCWebApi_set("Dmz_Entry","AutoDMZ_Flag","AutoDMZ_Flag")
	end if
	TCWebApi_set("Dmz_Entry","DMZ_IP","DMZHostIPAddress")
	TCWebApi_commit("Dmz_Entry")
	tcWebApi_save()
end if
%>
<!doctype html>
<html>
	<head>
<title><%tcWebApi_get("String_Entry","BranchName","s")%> ONT - <%tcWebApi_get("String_Entry","NatTopDMZText","s")%></title>		<meta charset="utf-8">
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
		</script>		<script language=javascript src="/JS/util.js"></script>
		<script language="javascript" type=text/javascript>
		var WanInfo = new Array();
		var nEntryNum = <% tcWebApi_get("WanInfo_Common","CycleNum","s") %>;
		var vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
		var vEntryName = vArrayStr.split(',');
		vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
		var vEntryValue = vArrayStr.split(',');
		vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
		var vEntryIndex = vArrayStr.split(',');
		vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
		var vActive = vArrayStr.split(',');
		vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
		var vNATENABLE = vArrayStr.split(',');
		/*sort*/
		vEntryName = SortUtil.UpdateWanIFName( vEntryName, nEntryNum );
		vEntryValue = SortUtil.SortMyArray( vEntryValue );
		vEntryIndex = SortUtil.SortMyArray( vEntryIndex );
		vActive = SortUtil.SortMyArray( vActive );
		vNATENABLE = SortUtil.SortMyArray( vNATENABLE );
		nEntryNum = <% tcWebApi_get("WanInfo_Common","CycleNum","s") %>;
		vArrayStr = "<% tcWebApi_get("WanInfo_Common","DmzCycleValue","s") %>";
		var vDMZActive = vArrayStr.split(',');
		vArrayStr = "<% tcWebApi_get("WanInfo_Common","DmzCycleValue","s") %>";
		var vDMZIP = vArrayStr.split(',');
		vArrayStr = "<% tcWebApi_get("WanInfo_Common","AutoDMZ_Flag","s") %>";
		var vDMZAuto = vArrayStr.split(',');
		/*sort*/
		vDMZActive = SortUtil.SortMyArray( vDMZActive );
		vDMZIP = SortUtil.SortMyArray( vDMZIP );
		vDMZAuto = SortUtil.SortMyArray( vDMZAuto );
		var isWanInterfaceExist = false;
		var LanIP = "<%tcWebApi_get("Lan_Entry0","IP","s")%>";
		var LanMask = "<%tcWebApi_get("Lan_Entry0","netmask","s")%>"
		var WanIdx = 0;
		/* Wan Info */
		function stWanInfo(domain,Name,Enable,NATEnabled,ConnectionType,ServiceList,DMZEnable,DMZIP,DMZAuto)
		{
			this.domain = domain;
			this.key = this.domain;
			this.Name = Name;
			this.ConnectionType = ConnectionType;
			this.ServiceList = ServiceList;
			if(DMZAuto == "1")
				this.AutoDMZ_Flag = 1;
			else
				this.AutoDMZ_Flag = 0;
			if(DMZEnable == "Yes")
				this.DMZEnable = 1;
			else
				this.DMZEnable = 0;
			this.DMZIP = DMZIP;
			if(Enable == "Yes")
				this.Enable = 1;
			else
				this.Enable = 0;
			if(NATEnabled == "Enable")
				this.NATEnabled = 1;
			else
				this.NATEnabled = 0;		
			this.CntStatus = '';
		}
		for (i = 0; i < nEntryNum; i++)
		{
			WanInfo[i] = new stWanInfo(vEntryValue[i],vEntryName[i],vActive[i],vNATENABLE[i],vEntryName[i],vEntryName[i],vDMZActive[i],vDMZIP[i],vDMZAuto[i]);
		}
		function ip_poolcheck(ip,rouip,Mvalue){
			var digits1 = ip.split(".");
			var stIP = parseInt(digits1[0]<<24|digits1[1]<<16|digits1[2]<<8|digits1[3]);
			var digits2 = Mvalue.split(".");
			var maskvalue = parseInt(digits2[0]<<24|digits2[1]<<16|digits2[2]<<8|digits2[3]);
			var digits3 = rouip.split(".");
			var lanipvalue = parseInt(digits3[0]<<24|digits3[1]<<16|digits3[2]<<8|digits3[3]);
			if ((lanipvalue&maskvalue) == (stIP&maskvalue))
			{
				return true;
			}else
			{
				return false;
			}
		}
		function dmzClick()
		{
			if(getCheckVal('DMZEnable') == 0)
			{
				setText('DMZHostIPAddress', "");
				<%if tcWebApi_get("Dmz_Common","isAutoDMZSupported","h") = "Yes" then%>
				setCheck('AutoDMZEnable',0);
				document.dmzForm.AutoDMZEnable.disabled = true;
				<%end if%>
				document.dmzForm.DMZHostIPAddress.disabled = true;
			}
			else
			{	
				<%if tcWebApi_get("Dmz_Common","isAutoDMZSupported","h") = "Yes" then%>
				document.dmzForm.AutoDMZEnable.disabled = false;
				<%end if%>
				document.dmzForm.DMZHostIPAddress.disabled = false;
			}
		}
		function AutodmzClick()
		{
			if(getCheckVal('AutoDMZEnable') == 0)
			{
				document.dmzForm.DMZHostIPAddress.disabled = false;
			}
			else
			{
				document.dmzForm.DMZHostIPAddress.disabled = true;
			}
		}
		function ShowDMZ()
		{
			var Interface = getElById('DMZInterface');
			var index = WanIdx;
			if (index >=0)
			{
				if ((index < 0) || (index >= WanInfo.length))
				{
					return;
				}
				setCheck('DMZEnable',WanInfo[index].DMZEnable);
				<%if tcWebApi_get("Dmz_Common","isAutoDMZSupported","h") = "Yes" then%>
				setCheck('AutoDMZEnable',WanInfo[index].AutoDMZ_Flag);
				<%end if%>
				setText('DMZHostIPAddress',WanInfo[index].DMZIP);
				if (WanInfo[index].Enable == 0 || WanInfo[index].NATEnabled == 0)
				{
					setDisable('DMZEnable',1);
					<%if tcWebApi_get("Dmz_Common","isAutoDMZSupported","h") = "Yes" then%>
					setDisable('AutoDMZEnable',1);
					<%end if%>
					setDisable('DMZHostIPAddress',1);	
				}
				else
				{
					setDisable('DMZEnable',0);
					<%if tcWebApi_get("Dmz_Common","isAutoDMZSupported","h") = "Yes" then%>
					setDisable('AutoDMZEnable',0);
					<%end if%>
					setDisable('DMZHostIPAddress',0);
					if(WanInfo[index].DMZEnable)
					{	
						document.dmzForm.DMZHostIPAddress.disabled = false;
						<%if tcWebApi_get("Dmz_Common","isAutoDMZSupported","h") = "Yes" then%>
						document.dmzForm.AutoDMZEnable.disabled = false;
						if(WanInfo[index].AutoDMZ_Flag)
						{
							document.dmzForm.DMZHostIPAddress.disabled = true;
						}
						else
						{
							document.dmzForm.DMZHostIPAddress.disabled = false;
						}
						<%end if%>
					}
					else
					{
						setText('DMZHostIPAddress', "");
						<%if tcWebApi_get("Dmz_Common","isAutoDMZSupported","h") = "Yes" then%>
						document.dmzForm.AutoDMZEnable.disabled = true;
						<%end if%>
						document.dmzForm.DMZHostIPAddress.disabled = true;
					}			
				}
			}
		}
		function displayInterface() {
			var Wan_Indexes;
			var nEntryNum = "<% tcWebApi_get("WanInfo_Common","CycleNum","s") %>";
			//get all value
			// num 0
			var vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
			var Wan_WanName = vArrayStr.split(',');
			// num 1
			<% tcWebApi_get("WanInfo_Common","CycleValue","h") %>
			// num 2
			vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
			Wan_Indexes = vArrayStr.split(',');
			// num 3
			vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
			Wan_Actives = vArrayStr.split(',');
			// num 4		
			vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
			var WANEnNAT = vArrayStr.split(',');
			var interface = 0;
			var defaultRouteWanIdx = "<% tcWebApi_get("WanInfo_Common","DefRouteIndexv4","s") %>";
			// Checking condition: type = INTERNET, Active = Yes, EnableNat 
			for (var i = 0; i < nEntryNum; i++) {
				if ((Wan_WanName[i].indexOf("INTERNET") >= 0) && (Wan_Actives[i] == "Yes") && (WANEnNAT[i] == "Enable")) {	
					if(defaultRouteWanIdx != Wan_Indexes[i])
					{
						continue;
					}
					interface = Wan_WanName[i];
					break;
				}
			}
			WanIdx = i;
			DMZInterfaceInput.value = vEntryValue[i];
			if (interface) {
				$("#DMZInterface").html(interface);
				$("#DMZInterface").show();
				$("#nat_enable_div").show();
				$("#apply_button").show();
				isWanInterfaceExist = true;
				return 1;
			}
			else {
				/* No suitable interface for Port Forwarding */
				$("#DMZInterface").html("<%tcWebApi_get("String_Entry","NatDMZNoInterfaceText","s")%>");
				$("#DMZInterface").show();
				return 0;
			}
		}
		function LoadFrame()
		{
			displayInterface();
			ShowDMZ();
		}
		function CancelAddCnt()
		{
			with (getElById('PortMappingForm'))
			{
				cs_removeoption(getElement('DMZInterface'),DMZInterface.length - 1);
			}
		}
		function doCancel(){
			// var wanIdItem = getElement('DMZInterface');
			// if (wanIdItem.value == -1)
			// {
			// 	CancelAddCnt();
			// }
			// else
			// {
				RefreshPage();	
			// }
		}
		function CheckDMZ()
		{
			var i = 0;
			var bWANinterface = false;
			for (i = 0; i < WanInfo.length; i++)
			{
				if((WanInfo[i].ServiceList.indexOf('_TR069_')<0) || (WanInfo[i].ServiceList.indexOf('_INTERNET_')>-1))
				{
					bWANinterface = true;
				}
			}
			if (bWANinterface == false)
			{
				alert('<%tcWebApi_get("String_Entry","DMZWanAddText","s")%>');
				return false;
			}
			if (isWanInterfaceExist == false)
			{
				alert('<%tcWebApi_get("String_Entry","DMZWanAddText","s")%>');
				return false;
			}
			with (getElById('dmzForm'))
			{
				<%if tcWebApi_get("Dmz_Common","isAutoDMZSupported","h") = "Yes" then%>
				if (getCheckVal('AutoDMZEnable') == 1)
					return true;
				<%end if%>
				if (getCheckVal('DMZEnable') == 1)
				{
					if (getValue('DMZHostIPAddress') == "")
					{
						alert('<%tcWebApi_get("String_Entry","NatDmzAddrJS0Text","s")%>');
						return false;
					}
					else if ((isAbcIpAddress(getValue('DMZHostIPAddress'))== false)||(isBroadcastIpAddress(getValue('DMZHostIPAddress'))==true)
					||(isNtwkSgmtIpAddress(getValue('DMZHostIPAddress'))==true))
					{
						alert('<%tcWebApi_get("String_Entry","NatDmzAddrJS1Text","s")%>');
						return false;
					}
					if (!ip_poolcheck($('#DMZHostIPAddress').val(),LanIP,LanMask)) {
						alert("<%tcWebApi_get("String_Entry","NatSessionsLANSubnetText","s")%>");/* IP should be in subnet*/
						$('#DMZHostIPAddress').focus();
						return false;
					}
					if ($('#DMZHostIPAddress').val() == LanIP)
					{
						alert("<%tcWebApi_get("String_Entry","NatDmzAddrJS2Text","s")%>");
						$('#DMZHostIPAddress').focus();
						return false;
					}
				}
				else if (getCheckVal('DMZEnable') == 0 && getValue('DMZHostIPAddress') != "")
				{
					if ((isAbcIpAddress(getValue('DMZHostIPAddress'))== false)||(isBroadcastIpAddress(getValue('DMZHostIPAddress'))==true)
					||(isNtwkSgmtIpAddress(getValue('DMZHostIPAddress'))==true))
					{
						alert('<%tcWebApi_get("String_Entry","NatDmzAddrJS1Text","s")%>');
						return false;
					}
				}
			}
			return true;
		}
		function getEntryIndex(ctl)
		{
			for (i = 0; i < nEntryNum; i++)
			{
				if (getSelectVal(ctl) == vEntryValue[i])
					return vEntryIndex[i];
			}
			return 999;
		}
		function doSubmit(){
			if(CheckDMZ() == false)
				return;
			if(getCheckVal('DMZEnable') == 0)
				document.dmzForm.EnableDMZ_Flag.value = "No";
			else 
				document.dmzForm.EnableDMZ_Flag.value = "Yes";
			<%if tcWebApi_get("Dmz_Common","isAutoDMZSupported","h") = "Yes" then%>	
				if(getCheckVal('AutoDMZEnable') == 0)
					document.dmzForm.AutoDMZ_Flag.value = "0";
				else 
					document.dmzForm.AutoDMZ_Flag.value = "1";
			<%end if%>	
			document.dmzForm.DMZ_Flag.value = "1";
			document.dmzForm.DMZEntryCurIndex.value = WanIdx;
			// if( true == setEBooValueCookie(document.dmzForm) )
			// 	document.dmzForm.submit();
			submitAsync("dmzForm");
			}
		</script>
		<style>
			.custom_cb_table {
				padding-left:3rem;
			}
		</style>
	</head>
	<body onload="LoadFrame();" class="container">
<header class="fixed-top"><nav id="top-nav" class="navbar navbar-expand-lg container"><a class="navbar-brand " href="/cgi-bin/home.asp"><div><img src="/img/logo_home.png" width="100" height="18" alt=""><div style="font-family: sans-serif; font-weight: bold;font-size: 12px;color: #000; margin-top: 0">OPTICAL NETWORK TERMINATION</div></div></a><button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"><em class="fas fa-align-justify"></em></span></button><div class="collapse navbar-collapse" id="navbarCollapse"><ul class="navbar-nav mr-auto sidenav" id="navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/home.asp"><%tcWebApi_get("String_Entry","NavigationHomeText","s")%><span class="sr-only"></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/deviceinfo.asp"><%tcWebApi_get("String_Entry","NavigationStatusDeviceText","s")%><span class="sr-only"></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/wifi-mesh-topology.asp"><%tcWebApi_get("String_Entry","EasyMeshStatus5Text","s")%><span class="sr-only"></span></a></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#status-menu" aria-controls="status-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NavigationStatusStatisticsText","s")%></a><ul class="nav-second-level collapse" id="status-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/sta-statistics.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationTrafficText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/sta-wifiusers.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationStatusUsersText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/sta-users.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","ARPStatusText","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#network-menu" aria-controls="network-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NAVNetwork","s")%></a><ul class="nav-second-level collapse" id="network-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/net-wan.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationBasInternetText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/net-lan.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationBasLANText","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#wifi-menu" aria-controls="wifi-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NAVWifi","s")%></a><ul class="nav-second-level collapse" id="wifi-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/wifi.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationWiFiSettingsText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/wifi-11ac.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationWiFi11acSettingsText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/wifi-mesh.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationMesh","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#firewall-menu" aria-controls="firewall-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NavigationAdvFirewallText","s")%></a><ul class="nav-second-level collapse" id="firewall-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-spi.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","ContentFirewallText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-urlfilter.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","FILTERTYPE_index2","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-macfilter.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVL2Filter","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-parentalcontrol.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","ParentalControlText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/safehome.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","SafehomeText","s")%></span></a></li></ul></li><li class="nav-item active"><a class="nav-link nav-link-collapse nav-link-show" href="#" id="hasSubItems" data-toggle="collapse" data-target="#apps-menu" aria-controls="apps-menu" aria-expanded="true"><%tcWebApi_get("String_Entry","NAVApplication","s")%></a><ul class="nav-second-level show" id="apps-menu" data-parent="#navAccordion"><li class="nav-item active"><a class="nav-link" href="/cgi-bin/apps-dmz.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NatTopDMZText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-portforwarding.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NatVirsvrText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-sslim.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","SessionLimit","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-route.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","StaticRouteText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-ddns.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","dyDNS1Text","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-wifischeduling.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","WifiSchedulingText","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#tools-menu" aria-controls="tools-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NavigationMaintenanceText","s")%></a><ul class="nav-second-level collapse" id="tools-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-admin.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationMainAdminText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-time.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVSysTime","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-firmware.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationMainFirmwareText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-config.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVConfig","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-diagnostic.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationMainDiagnosticsText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-wan2lan.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","Wan2lanText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-log.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVLogs","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-reboot.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","RebootText","s")%></span></a></li></ul></li></ul><div class="top-item-groups"><form name="LanguageForm" method="POST" action="/cgi-bin/apps-dmz.asp" class="nav-item dropdown"><input type="hidden" name="TokenString" value="<%tcWebApi_getToken()%>"><input type="hidden" name="Language_Flag" value="<% tcWebApi_get("LanguageSwitch_Entry","Type","s") %>"><a class="nav-link dropdown-toggle" href="#" id="LanguageDropdown" role="button" data-toggle="dropdown" aria-expanded="false"><% tcWebApi_get("String_Entry","LoginLanguage","s") %></a><ul class="dropdown-menu" aria-labelledby="LanguageDropdown"><li><a class="dropdown-item <% if tcWebApi_get("LanguageSwitch_Entry","Type","h") = "1" then asp_Write("active") end if %>" href="#" onclick="submitLanguageForm(1);"><% tcWebApi_get("String_Entry","LanguageVIELong","s") %></a></li><li><a class="dropdown-item <% if tcWebApi_get("LanguageSwitch_Entry","Type","h") = "2" then asp_Write("active") end if %>" href="#" onclick="submitLanguageForm(2);"><% tcWebApi_get("String_Entry","LanguageENGLong","s") %></a></li></ul></form><div id="signout" class="nav-item"><a class="nav-link" href="javascript:doLogout();"><em class="fa fa-sign-out-alt"></em><span class="nav-link-text"><% tcWebApi_get("String_Entry","LogoutText","s") %></span></a></div></div></div></header></nav><% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then
	if tcWebApi_get("Mesh_Common", "DeviceRole", "h") = "2" then %>
		<script language='javascript'>
		document.getElementById("network-menu").children[0].style="display: none";
		document.getElementById("network-menu").children[1].style="display: none";
		document.getElementById("wifi-menu").children[0].style="display: none";
		document.getElementById("wifi-menu").children[1].style="display: none";
		</script>
<% end if end if %>		<div id="content">
			<form class="form-inline" METHOD="POST" ACTION="/cgi-bin/apps-dmz.asp" name="dmzForm" id="dmzForm" >
				<input type="hidden" name="TokenString" value="<%tcWebApi_getToken()%>">
                <input type="hidden" id="EnableDMZ_Flag" name="EnableDMZ_Flag" value="0">
            	<input type="hidden" id="DMZ_Flag" name="DMZ_Flag" value="0">
                <input type="hidden" id="DMZEntryCurIndex" name="DMZEntryCurIndex" value="0">
				<input type="hidden" id="AutoDMZ_Flag" name="AutoDMZ_Flag" value="0">
				<input type="hidden" id="isAutoDMZSupported" name="isAutoDMZSupported" value="<%if tcWebApi_get("Dmz_Common","isAutoDMZSupported","h") = "Yes" then asp_write("1") else asp_write("0") end if%>">
				<input type="hidden" id="DMZInterfaceInput" name="DMZInterfaceInput" value="nas0_0">
			<div class="row row-w-100">
				<div class="widget col-xs-12 col-lg-12">
					<header><%tcWebApi_get("String_Entry","DMZConfigurationText","s")%></header> 
					<div class="widget-body">
						<div class="form-group">
								<label class="col-lg-5" for=""><%tcWebApi_get("String_Entry","DMZInterfaceNameText","s")%></label>
								<label class="col-lg-7 text-label inline-text" id="DMZInterface"></label>
						</div>
						<div class="form-group">
								<label class="col-lg-5"><%tcWebApi_get("String_Entry","DMZEnableText","s")%></label>
								<label class="toggle-switch">
									<input type="checkbox" class="custom-control-input" name="DMZEnable" id="DMZEnable" onclick="dmzClick()">
									<span class="slider"></span>
								</label>
						</div>
						<%if tcWebApi_get("Dmz_Common","isAutoDMZSupported","h") = "Yes" Then%>
						<div class="form-group">
								<label class="col-lg-5"><%tcWebApi_get("String_Entry","DMZAutoEnableText","s")%></label>
								<div class="custom-control custom-checkbox col-lg-3">
									<input type="checkbox" class="custom-control-input" name="AutoDMZEnable" id="AutoDMZEnable" onclick="AutodmzClick()">
									<label class="custom-control-label" for="AutoDMZEnable"></label>
								</div>
						</div>
						<%end If%>
						<div class="form-group">
							<label class="col-lg-5" for="DMZHostIPAddress"><%tcWebApi_get("String_Entry","DMZLanIPAddressText","s")%></label> 
							<input type="text" class="form-control col-lg-7" name="DMZHostIPAddress" size="32" maxlength="30" id="DMZHostIPAddress" value="">
						</div>
					</div>
				</div>
				<div class="col-lg-12 d-flex align-items-center justify-content-center">
					<button type="button" class="page-button small-button" onclick="doSubmit();" name="ButtonApply" id= "ButtonApply"><%tcWebApi_get("String_Entry","DMZButtonApplyText","s")%></button>
					<button type="button" class="page-button small-button" onclick="doCancel();" name="ButtonCancel" id= "ButtonCancel"><%tcWebApi_get("String_Entry","DMZButtonCancelEditText","s")%></button>
				</div>
			</div>
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
		<script language='javascript' src='/JS/user.js'></script>	</body>
</html>
