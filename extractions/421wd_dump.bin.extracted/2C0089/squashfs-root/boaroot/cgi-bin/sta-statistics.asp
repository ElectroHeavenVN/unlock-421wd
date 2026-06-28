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
<title>Viettel ONT - <%tcWebApi_get("String_Entry","NavigationTrafficText","s")%></title>		<meta charset="utf-8">
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
		</script>		<script>
			var LanAttrList = ["tx_frames", "tx_multi", "tx_broad", "tx_uni", "tx_coll", "tx_err", "rx_frames", "rx_multi", "rx_broad", "rx_uni", "rx_crc", "rx_under"];
			var WifiAttrList = ["tx_pktwf", "rx_pktwf", "tx_errwf", "rx_errwf", "tx_dropwf", "rx_dropwf"];
			var Wifi11acAttrList = ["tx_pkt11ac", "rx_pkt11ac", "tx_err11ac", "rx_err11ac", "tx_drop11ac", "rx_drop11ac"];
			var PonAttrList = ["tx_frames_pon", "rx_frames_pon", "tx_bytes_pon", "rx_bytes_pon", "tx_multi_pon", "rx_multi_pon", "tx_broad_pon", "rx_broad_pon", "tx_coll_pon", "rx_crc_pon", "tx_err_pon", "rx_under_pon"];
			function update_value(obj, attr) {
				if (obj[attr] != undefined) {
					if ((obj[attr] == "no attribute information") || (obj[attr] == "no node information")) {
						$("#" + attr).text("N/A");
					}
					else {
						$("#" + attr).text(obj[attr]);
					}
				}
			}
			function ShowUI(node, subnode) {
				$.ajax({
					url: "/cgi-bin/get-sta-statistics.cgi?a=" + node + "&a=" + subnode,
					method: 'GET', 
					complete: function(res){
						try {
							if (/iPad|iPhone|iPod/.test(navigator.userAgent) && !window.MSStream) {
								Pace.stop();
							}
							obj = JSON.parse(res.responseText);
							if ((node == "1") ||  (node == "6")) {
								for (var i = 0; i < LanAttrList.length; i++) {
									update_value(obj, LanAttrList[i]);
								}
							}
							if ((node == "2") ||  (node == "6")) {
								for (var i = 0; i < WifiAttrList.length; i++) {
									update_value(obj, WifiAttrList[i]);
								}
							}
							if ((node == "3") ||  (node == "6")) {
								for (var i = 0; i < Wifi11acAttrList.length; i++) {
									update_value(obj, Wifi11acAttrList[i]);
								}
							}
							if ((node == "4") ||  (node == "6")) {
								for (var i = 0; i < PonAttrList.length; i++) {
									update_value(obj, PonAttrList[i]);
								}
							}
						}
						catch {
						}
					}
				})
			}
			function refresh_lan() {
				var subnode = $("#lan_menu").val();
				ShowUI("1",subnode);
			}
		</script>
	</head>
	<body onload="ShowUI('6');" class="container">
<header class="fixed-top"><nav id="top-nav" class="navbar navbar-expand-lg container"><a class="navbar-brand " href="/cgi-bin/home.asp"><div><img src="/img/logo_home.png" width="100" height="18" alt=""><div style="font-family: sans-serif; font-weight: bold;font-size: 12px;color: #000; margin-top: 0">OPTICAL NETWORK TERMINATION</div></div></a><button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"><em class="fas fa-align-justify"></em></span></button><div class="collapse navbar-collapse" id="navbarCollapse"><ul class="navbar-nav mr-auto sidenav" id="navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/home.asp"><%tcWebApi_get("String_Entry","NavigationHomeText","s")%><span class="sr-only"></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/deviceinfo.asp"><%tcWebApi_get("String_Entry","NavigationStatusDeviceText","s")%><span class="sr-only"></span></a></li><li class="nav-item active"><a class="nav-link nav-link-collapse nav-link-show" href="#" id="hasSubItems" data-toggle="collapse" data-target="#status-menu" aria-controls="status-menu" aria-expanded="true"><%tcWebApi_get("String_Entry","NavigationStatusStatisticsText","s")%></a><ul class="nav-second-level show" id="status-menu" data-parent="#navAccordion"><li class="nav-item active"><a class="nav-link" href="/cgi-bin/sta-statistics.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationTrafficText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/sta-wifiusers.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationStatusUsersText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/sta-users.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","ARPStatusText","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#network-menu" aria-controls="network-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NAVNetwork","s")%></a><ul class="nav-second-level collapse" id="network-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/net-wan.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationBasInternetText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/net-lan.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationBasLANText","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#wifi-menu" aria-controls="wifi-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NAVWifi","s")%></a><ul class="nav-second-level collapse" id="wifi-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/wifi.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationWiFiSettingsText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/wifi-11ac.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationWiFi11acSettingsText","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#firewall-menu" aria-controls="firewall-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NavigationAdvFirewallText","s")%></a><ul class="nav-second-level collapse" id="firewall-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-spi.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","ContentFirewallText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-urlfilter.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","FILTERTYPE_index2","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-macfilter.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVL2Filter","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-parentalcontrol.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","ParentalControlText","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#apps-menu" aria-controls="apps-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NAVApplication","s")%></a><ul class="nav-second-level collapse" id="apps-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-dmz.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NatTopDMZText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-portforwarding.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NatVirsvrText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-sslim.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","SessionLimit","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-route.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","StaticRouteText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-ddns.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","dyDNS1Text","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#tools-menu" aria-controls="tools-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NavigationMaintenanceText","s")%></a><ul class="nav-second-level collapse" id="tools-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-admin.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationMainAdminText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-time.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVSysTime","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-firmware.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationMainFirmwareText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-config.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVConfig","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-diagnostic.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationMainDiagnosticsText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-log.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVLogs","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-reboot.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","RebootText","s")%></span></a></li></ul></li></ul><div class="top-item-groups"><form name="LanguageForm" method="POST" action="/cgi-bin/sta-statistics.asp" class="nav-item dropdown"><input type="hidden" name="TokenString" value="<%tcWebApi_getToken()%>"><input type="hidden" name="Language_Flag" value="<% tcWebApi_get("LanguageSwitch_Entry","Type","s") %>"><a class="nav-link dropdown-toggle" href="#" id="LanguageDropdown" role="button" data-toggle="dropdown" aria-expanded="false"><% tcWebApi_get("String_Entry","LoginLanguage","s") %></a><ul class="dropdown-menu" aria-labelledby="LanguageDropdown"><li><a class="dropdown-item <% if tcWebApi_get("LanguageSwitch_Entry","Type","h") = "1" then asp_Write("active") end if %>" href="#" onclick="submitLanguageForm(1);"><% tcWebApi_get("String_Entry","LanguageVIELong","s") %></a></li><li><a class="dropdown-item <% if tcWebApi_get("LanguageSwitch_Entry","Type","h") = "2" then asp_Write("active") end if %>" href="#" onclick="submitLanguageForm(2);"><% tcWebApi_get("String_Entry","LanguageENGLong","s") %></a></li></ul></form><div id="signout" class="nav-item"><a class="nav-link" href="javascript:doLogout();"><em class="fa fa-sign-out-alt"></em><span class="nav-link-text"><% tcWebApi_get("String_Entry","LogoutText","s") %></span></a></div></div></div></header></nav><% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then
	if tcWebApi_get("Mesh_Common", "DeviceRole", "h") = "2" then %>
		<script language='javascript'>
		document.getElementById("wifi-menu").children[0].style="display: none";
		document.getElementById("wifi-menu").children[1].style="display: none";
		</script>
<% end if end if %>		<div id="content">
			<form class="form-inline" METHOD="POST" ACTION="/cgi-bin/deviceinfo.asp" name="deviceinfo_form" style="align-items: flex-start;">
			<div class="row row-w-100">
				<div class="widget col-sm-12 col-lg-6">
					<header>LAN</header>
						<div class="form-group">
							<label class="col-xs-4 col-sm-5 control-label">
								<%tcWebApi_get("String_Entry","InterfaceText","s")%>		
							</label>
							<div class="col-xs-6 col-sm-6 custom-select">
								<select id="lan_menu" onchange="refresh_lan()">
									<option value="1" selected>
										LAN1
									</option>
									<option value="2" >
										LAN2
									</option>
									<option value="3" >
										LAN3
									</option>
									<option value="4" >
										LAN4
									</option>
								</select>
							</div>
						</div>
						<div class="table-responsive widget-table-body">
						<table class="table">
							<thead>
								<tr>
									<th><%tcWebApi_get("String_Entry","StatisticsTransmitText","s")%></th>
									<th></th>
									<th><%tcWebApi_get("String_Entry","StatisticsReceiveText","s")%></th>
									<th ></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><%tcWebApi_get("String_Entry","StatisticsTrFramesText","s")%></td>
									<td id="tx_frames"></td>
									<td><%tcWebApi_get("String_Entry","StatisticsReFramesText","s")%></td>
									<td id="rx_frames"></td>
								  </tr>
								  <tr>
									<td><%tcWebApi_get("String_Entry","StatisticsTrMulticastText","s")%></td>
									<td id="tx_multi"></td>
									<td><%tcWebApi_get("String_Entry","StatisticsReMulticastText","s")%></td>
									<td id="rx_multi"></td>
								  </tr>
								  <tr>
									<td><%tcWebApi_get("String_Entry","StatisticsTrBroadcastText","s")%></td>
									<td id="tx_broad"></td>
									<td><%tcWebApi_get("String_Entry","StatisticsReBroadcastText","s")%></td>
									<td id="rx_broad"></td>
								</tr>
								<tr>
									<td><%tcWebApi_get("String_Entry","StatisticsTxUnicastText","s")%></td>
									<td id="tx_uni"></td>
									<td><%tcWebApi_get("String_Entry","StatisticsRxUnicastText","s")%></td>
									<td id="rx_uni"></td>
								</tr>
								<tr>
									<td><%tcWebApi_get("String_Entry","StatisticsTrCollisionText","s")%></td>
									<td id="tx_coll"></td>
									<td><%tcWebApi_get("String_Entry","StatisticsCRCErrorsText","s")%></td>
									<td id="rx_crc"></td>
								</tr>
								<tr>
									<td><%tcWebApi_get("String_Entry","StatisticsTrErrorFramesText","s")%></td>
									<td id="tx_err"></td>
									<td><%tcWebApi_get("String_Entry","StatisticsReUDsizeFramesText","s")%></td>
									<td id="rx_under"></td>
								</tr>
							</tbody>
						  </table>
					</div>
				</div>
				<div class="widget col-sm-12 col-lg-6">
					<header>PON</header>
					<div class="table-responsive widget-table-body">
						<table class="table">
							<thead>
								<tr>
									<th><%tcWebApi_get("String_Entry","StatisticsTransmitText","s")%></th>
									<th></th>
									<th><%tcWebApi_get("String_Entry","StatisticsReceiveText","s")%></th>
									<th ></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><%tcWebApi_get("String_Entry","StatisticsTxPacketsText","s")%></td>
									<td id="tx_frames_pon"></td>
									<td><%tcWebApi_get("String_Entry","StatisticsRxPacketsText","s")%></td>
									<td id="rx_frames_pon"></td>
								  </tr>
								  <tr>
									<td><%tcWebApi_get("String_Entry","StatisticsTxBytesText","s")%></td>
									<td id="tx_bytes_pon"></td>
									<td><%tcWebApi_get("String_Entry","StatisticsRxBytesText","s")%></td>
									<td id="rx_bytes_pon"></td>
								</tr>
								<tr>
									<td><%tcWebApi_get("String_Entry","StatisticsTrMulticastText","s")%></td>
									<td id="tx_multi_pon"></td>
									<td><%tcWebApi_get("String_Entry","StatisticsReMulticastText","s")%></td>
									<td id="rx_multi_pon"></td>
								</tr>
								<tr>
									<td><%tcWebApi_get("String_Entry","StatisticsTrBroadcastText","s")%></td>
									<td id="tx_broad_pon"></td>
									<td><%tcWebApi_get("String_Entry","StatisticsReBroadcastText","s")%></td>
									<td id="rx_broad_pon"></td>
								</tr>
								<tr>
									<td><%tcWebApi_get("String_Entry","StatisticsTrCollisionText","s")%></td>
									<td id="tx_coll_pon"></td>
									<td><%tcWebApi_get("String_Entry","StatisticsCRCErrorsText","s")%></td>
									<td id="rx_crc_pon"></td>
								</tr>
								<tr>
									<td><%tcWebApi_get("String_Entry","StatisticsTrErrorFramesText","s")%></td>
									<td id="tx_err_pon"></td>
									<td><%tcWebApi_get("String_Entry","StatisticsReUDsizeFramesText","s")%></td>
									<td id="rx_under_pon"></td>
								</tr>
							</tbody>
						  </table>
					</div>
				</div>
				<div class="widget col-sm-12 col-lg-6">
					<header>WiFi 2.4GHz</header>
					<div class="table-responsive widget-table-body">
						<table class="table">
							<thead>
								<tr>
									<th><%tcWebApi_get("String_Entry","StatisticsTransmitText","s")%></th>
									<th></th>
									<th><%tcWebApi_get("String_Entry","StatisticsReceiveText","s")%></th>
									<th ></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><%tcWebApi_get("String_Entry","StatisticsTxPacketsText","s")%></td>
									<td id="tx_pktwf"></td>
									<td><%tcWebApi_get("String_Entry","StatisticsRxPacketsText","s")%></td>
									<td id="rx_pktwf"></td>
								</tr>
								<tr>
									<td><%tcWebApi_get("String_Entry","StatisticsTxErrorsText","s")%></td>
									<td id="tx_errwf"></td>
									<td><%tcWebApi_get("String_Entry","StatisticsRxErrorsText","s")%></td>
									<td id="rx_errwf"></td>
								</tr>
								<tr>
									<td><%tcWebApi_get("String_Entry","StatisticsTxDropsText","s")%></td>
									<td id="tx_dropwf"></td>
									<td><%tcWebApi_get("String_Entry","StatisticsRxDropsText","s")%></td>
									<td id="rx_dropwf"></td>
								</tr>
							</tbody>
						  </table>
					</div>
				</div>
				<div class="widget col-sm-12 col-lg-6">
					<header>WiFi 5GHz</header>
					<div class="table-responsive widget-table-body">
						<table class="table">
							<thead>
								<tr>
									<th><%tcWebApi_get("String_Entry","StatisticsTransmitText","s")%></th>
									<th></th>
									<th><%tcWebApi_get("String_Entry","StatisticsReceiveText","s")%></th>
									<th ></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><%tcWebApi_get("String_Entry","StatisticsTxPacketsText","s")%></td>
									<td id="tx_pkt11ac"></td>
									<td><%tcWebApi_get("String_Entry","StatisticsRxPacketsText","s")%></td>
									<td id="rx_pkt11ac"></td>
								</tr>
								<tr>
									<td><%tcWebApi_get("String_Entry","StatisticsTxErrorsText","s")%></td>
									<td id="tx_err11ac"></td>
									<td><%tcWebApi_get("String_Entry","StatisticsRxErrorsText","s")%></td>
									<td id="rx_err11ac"></td>
								</tr>
								<tr>
									<td><%tcWebApi_get("String_Entry","StatisticsTxDropsText","s")%></td>
									<td id="tx_drop11ac"></td>
									<td><%tcWebApi_get("String_Entry","StatisticsRxDropsText","s")%></td>
									<td id="rx_drop11ac"></td>
								</tr>							</tbody>
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
