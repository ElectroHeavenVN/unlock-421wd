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
<!doctype html>
<html>
	<head>
<title>Viettel ONT - <%tcWebApi_get("String_Entry","ARPStatusText","s")%></title>		<meta charset="utf-8">
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
		</script>		<SCRIPT language=JavaScript src="/JS/printtable.js"></SCRIPT>
		<SCRIPT language=JavaScript type=text/javascript>
			var aryInfoTemp = "<% tcWebApi_get("Info_Ether","PortIP","s") %>";
			var PortIp = aryInfoTemp.split(',');
			var dhcpnum = PortIp.length - 1;
			aryInfoTemp = "<% tcWebApi_get("Info_Ether","PortMac","s") %>";
			aryInfoTemp += "<% tcWebApi_get("Info_Ether","PortMac2","s") %>";
			var PortMac = aryInfoTemp.split(',');
			aryInfoTemp = "<% tcWebApi_get("Info_Ether","PortDHCP","s") %>";
			var PortDhcp = aryInfoTemp.split(',');
			aryInfoTemp = "<% tcWebApi_get("Info_Ether","PortExpire","s") %>";
			var PortExpireTime = aryInfoTemp.split(',');
			aryInfoTemp = "<% tcWebApi_get("Info_Ether","HostName","s") %>";
			var PortHostName = aryInfoTemp.split(',');
			var DeviceInfo =  [["0","Computer","  "," ","0"," Static "],null];
			var huhu;
<% if tcWebApi_get("Lan_Dhcp","type","h") = "1" then %>
			var reserved_ip = [
				"<%tcWebApi_get("Dhcpd_Entry0","IP","s") %>",
				"<%tcWebApi_get("Dhcpd_Entry1","IP","s") %>",
				"<%tcWebApi_get("Dhcpd_Entry2","IP","s") %>",
				"<%tcWebApi_get("Dhcpd_Entry3","IP","s") %>",
				"<%tcWebApi_get("Dhcpd_Entry4","IP","s") %>",
				"<%tcWebApi_get("Dhcpd_Entry5","IP","s") %>",
				"<%tcWebApi_get("Dhcpd_Entry6","IP","s") %>",
				"<%tcWebApi_get("Dhcpd_Entry7","IP","s") %>"
			];
			var reserved_mac = [
				"<%tcWebApi_get("Dhcpd_Entry0","MAC","s") %>",
				"<%tcWebApi_get("Dhcpd_Entry1","MAC","s") %>",
				"<%tcWebApi_get("Dhcpd_Entry2","MAC","s") %>",
				"<%tcWebApi_get("Dhcpd_Entry3","MAC","s") %>",
				"<%tcWebApi_get("Dhcpd_Entry4","MAC","s") %>",
				"<%tcWebApi_get("Dhcpd_Entry5","MAC","s") %>",
				"<%tcWebApi_get("Dhcpd_Entry6","MAC","s") %>",
				"<%tcWebApi_get("Dhcpd_Entry7","MAC","s") %>"
			];
<% end if %>
			var PacketInfo = new Array();
			PacketInfo = [["0","0","0","0","0","0","0","0","0"],null];
			Ethernet = [["0","Disabled","560097","4123","0","0","3096680","5897","0","0"],["InternetGatewayDevice.LANDevice.1.LANEthernetInterfaceConfig.2","Up","560097","4123","0","0","3096680","5897","0","0"],["InternetGatewayDevice.LANDevice.1.LANEthernetInterfaceConfig.3","Disabled","560362","4124","0","0","3096680","5897","0","0"],["InternetGatewayDevice.LANDevice.1.LANEthernetInterfaceConfig.4","Disabled","560362","4124","0","0","3096680","5897","0","0"],null]
			var i = 0;
			var LanInfo = new Array();
			var addressNum = 0;
			var i = 0;
			function ipv6cnst(domain,ipv6address)
			{
				this.domain = domain;
				this.ipv6address = ipv6address.split(',');
				addressNum = this.ipv6address.length;
			}
			var ipv6infost = new Array(new ipv6cnst("1","1111:db8:1::1,fe80::1"),new ipv6cnst("2","1111:db8:2::1,fe80::1"),new ipv6cnst("3","1111:db8:1::1,fe80::1"),null);
			function LanInfoConstruction(Device, IPAddr, MACAddr, Status)
			{
				this.Device = Device;
				this.IPAddr = IPAddr;
				this.MACAddr = MACAddr;
				this.Status = Status;
			}
			function DhcpServerRelTime(timeVal)
			{
				var timeString = "<%tcWebApi_get("String_Entry","UserInfoLeRemText","s")%>";
				if (timeVal == 0)
				{
				return '<%tcWebApi_get("String_Entry","UserInfoLeIFuText","s")%>';
				}
				if (timeVal >= 60*60*24)
				{
				timeString += parseInt(timeVal/(60*60*24)) + "<%tcWebApi_get("String_Entry","UserInfodayText","s")%>" ;
				timeVal %= 60*60*24;
				}
				if (timeVal >= 60*60)
				{
				timeString += parseInt(timeVal / (60*60)) + "<%tcWebApi_get("String_Entry","UserInfohourText","s")%>" ;
				timeVal %= 60*60;
				}
				if (timeVal >= 60)
				{
				timeString += parseInt(timeVal / (60)) + "<%tcWebApi_get("String_Entry","UserInfominuteText","s")%>" ;
				timeVal %= 60;
				}
				if (timeVal > 0)
				{
				timeString += timeVal + '<%tcWebApi_get("String_Entry","UserInfosecondText","s")%>';
				}
				return timeString;
			}
			function  isStaticByDhcp(index) {
				<% if tcWebApi_get("Lan_Dhcp","type","h") = "1" then %>
				for (var i = 0; i < 8; i++) {
					if ((reserved_ip[i] == PortIp[index]) && (reserved_mac[i] == PortMac[index]) )
					{
						return 1;
					}
				}
				return 0;
				<% else %>
					return 1;
				<% end if %>
			}
			function ShowUI() {
			}
		</script>
	</head>
	<body onload="ShowUI();" class="container">
<header class="fixed-top"><nav id="top-nav" class="navbar navbar-expand-lg container"><a class="navbar-brand " href="/cgi-bin/home.asp"><div><img src="/img/logo_home.png" width="100" height="18" alt=""><div style="font-family: sans-serif; font-weight: bold;font-size: 12px;color: #000; margin-top: 0">OPTICAL NETWORK TERMINATION</div></div></a><button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"><em class="fas fa-align-justify"></em></span></button><div class="collapse navbar-collapse" id="navbarCollapse"><ul class="navbar-nav mr-auto sidenav" id="navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/home.asp"><%tcWebApi_get("String_Entry","NavigationHomeText","s")%><span class="sr-only"></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/deviceinfo.asp"><%tcWebApi_get("String_Entry","NavigationStatusDeviceText","s")%><span class="sr-only"></span></a></li><li class="nav-item active"><a class="nav-link nav-link-collapse nav-link-show" href="#" id="hasSubItems" data-toggle="collapse" data-target="#status-menu" aria-controls="status-menu" aria-expanded="true"><%tcWebApi_get("String_Entry","NavigationStatusStatisticsText","s")%></a><ul class="nav-second-level show" id="status-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/sta-statistics.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationTrafficText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/sta-wifiusers.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationStatusUsersText","s")%></span></a></li><li class="nav-item active"><a class="nav-link" href="/cgi-bin/sta-users.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","ARPStatusText","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#network-menu" aria-controls="network-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NAVNetwork","s")%></a><ul class="nav-second-level collapse" id="network-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/net-wan.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationBasInternetText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/net-lan.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationBasLANText","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#wifi-menu" aria-controls="wifi-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NAVWifi","s")%></a><ul class="nav-second-level collapse" id="wifi-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/wifi.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationWiFiSettingsText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/wifi-11ac.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationWiFi11acSettingsText","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#firewall-menu" aria-controls="firewall-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NavigationAdvFirewallText","s")%></a><ul class="nav-second-level collapse" id="firewall-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-spi.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","ContentFirewallText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-urlfilter.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","FILTERTYPE_index2","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-macfilter.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVL2Filter","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-parentalcontrol.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","ParentalControlText","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#apps-menu" aria-controls="apps-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NAVApplication","s")%></a><ul class="nav-second-level collapse" id="apps-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-dmz.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NatTopDMZText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-portforwarding.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NatVirsvrText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-sslim.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","SessionLimit","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-route.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","StaticRouteText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-ddns.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","dyDNS1Text","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#tools-menu" aria-controls="tools-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NavigationMaintenanceText","s")%></a><ul class="nav-second-level collapse" id="tools-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-admin.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationMainAdminText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-time.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVSysTime","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-firmware.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationMainFirmwareText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-config.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVConfig","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-diagnostic.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationMainDiagnosticsText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-log.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVLogs","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-reboot.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","RebootText","s")%></span></a></li></ul></li></ul><div class="top-item-groups"><form name="LanguageForm" method="POST" action="/cgi-bin/sta-users.asp" class="nav-item dropdown"><input type="hidden" name="TokenString" value="<%tcWebApi_getToken()%>"><input type="hidden" name="Language_Flag" value="<% tcWebApi_get("LanguageSwitch_Entry","Type","s") %>"><a class="nav-link dropdown-toggle" href="#" id="LanguageDropdown" role="button" data-toggle="dropdown" aria-expanded="false"><% tcWebApi_get("String_Entry","LoginLanguage","s") %></a><ul class="dropdown-menu" aria-labelledby="LanguageDropdown"><li><a class="dropdown-item <% if tcWebApi_get("LanguageSwitch_Entry","Type","h") = "1" then asp_Write("active") end if %>" href="#" onclick="submitLanguageForm(1);"><% tcWebApi_get("String_Entry","LanguageVIELong","s") %></a></li><li><a class="dropdown-item <% if tcWebApi_get("LanguageSwitch_Entry","Type","h") = "2" then asp_Write("active") end if %>" href="#" onclick="submitLanguageForm(2);"><% tcWebApi_get("String_Entry","LanguageENGLong","s") %></a></li></ul></form><div id="signout" class="nav-item"><a class="nav-link" href="javascript:doLogout();"><em class="fa fa-sign-out-alt"></em><span class="nav-link-text"><% tcWebApi_get("String_Entry","LogoutText","s") %></span></a></div></div></div></header></nav><% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then
	if tcWebApi_get("Mesh_Common", "DeviceRole", "h") = "2" then %>
		<script language='javascript'>
		document.getElementById("wifi-menu").children[0].style="display: none";
		document.getElementById("wifi-menu").children[1].style="display: none";
		</script>
<% end if end if %>		<div id="content">
			<form class="form-inline" METHOD="POST" ACTION="/cgi-bin/deviceinfo.asp" name="deviceinfo_form" style="align-items: flex-start;">
			<div class="row row-w-100">
				<div class="widget col-sm-12">
					<header><%tcWebApi_get("String_Entry", "ARPStatusText", "s") %></header>
					<div class="table-responsive widget-table-body">
						<table class="table">
							<thead>
								<tr>
									<th scope="col"><%tcWebApi_get("String_Entry", "DeviceText", "s") %></th>
									<th scope="col"><%tcWebApi_get("String_Entry", "LANIPAddressText", "s") %></th>
									<th scope="col"><%tcWebApi_get("String_Entry", "NetInfoMACAddressText", "s") %></th>
									<th scope="col"><%tcWebApi_get("String_Entry", "StatusText", "s") %></th>
								</tr>
							</thead>
							<tbody id="device_list">
                    		<SCRIPT language=JavaScript type=text/javascript>
							for(i = 0; i < dhcpnum; i++)
								{
									if(PortIp[i] != "N/A" || PortMac[i] != "N/A")
									{
										if (PortIp[i].startsWith("fe80")) {
											continue; // skip Link local IP
										}
										document.write('<TR align="center">');
										if(PortHostName[i]=="")
										document.write('<TD align="center"> <%tcWebApi_get("String_Entry", "UnknownDeviceText", "s") %> &nbsp;</TD>');
										else
											document.write('<TD align="center">' + PortHostName[i] + '&nbsp;</TD>');
										document.write('<TD align="center">' + PortIp[i] + '&nbsp;</TD>');
										document.write('<TD align="center">' + PortMac[i] + '&nbsp;</TD>');
										if(PortDhcp[i] == "1")
										{
											if (isStaticByDhcp(i)) {
												document.write('<TD align="center">' + '<%tcWebApi_get("String_Entry","UserInfoStaallbyDHCPText","s")%>&nbsp;</TD>');
											}
											else {
												var arytemp = PortExpireTime[i].split(':');
												if("0" != arytemp[0]){
													document.write('<TD align="center">' + "<span><%tcWebApi_get("String_Entry","UserInfoLeRemText","s")%>:&nbsp;</span><br><span>" + arytemp[0] + " <%tcWebApi_get("String_Entry","UserInfodayText","s")%> " + arytemp[1] + " <%tcWebApi_get("String_Entry","UserInfohourText","s")%> " + arytemp[2] + " <%tcWebApi_get("String_Entry","UserInfominuteText","s")%> " + arytemp[3] + ' <%tcWebApi_get("String_Entry","UserInfosecondText","s")%></span></TD>');
												}
												else{
													if(("0:0:0:0" == PortExpireTime[i]) || ("0" == PortExpireTime[i]))
														document.write('<TD align="center">' + "<%tcWebApi_get("String_Entry","UserInfoLeIFuText","s")%>" + '&nbsp;</TD>');
													else{
															document.write('<TD align="center">' + "<span><%tcWebApi_get("String_Entry","UserInfoLeRemText","s")%>:</span><br><span>" + arytemp[1] + " <%tcWebApi_get("String_Entry","UserInfohourText","s")%> " + arytemp[2] + " <%tcWebApi_get("String_Entry","UserInfominuteText","s")%> " + arytemp[3] + ' <%tcWebApi_get("String_Entry","UserInfosecondText","s")%><span></TD>');
													}
												}
											}
										}
										else
										{
											document.write('<TD align="center">' + '<%tcWebApi_get("String_Entry","UserInfoStaallText","s")%>' + '&nbsp;</TD>');
										}
										document.write('</TR>');
									}						
								}
							</SCRIPT>
							</tbody>
						  </table>
					</div>
				</div>
				<div class="col-lg-12 d-flex align-items-center justify-content-center">
					<button type="button" class="page-button large-button" onclick="reloadAsGet();"><%tcWebApi_get("String_Entry","ButtonRefreshText","s")%></button>
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
