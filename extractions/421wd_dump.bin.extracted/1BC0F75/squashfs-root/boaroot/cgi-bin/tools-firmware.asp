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
if Request_Form("postflag") = "1" then
		tcWebApi_constSet("WebCustom_Entry","web_upgrade","1")
		TCWebApi_set("System_Entry","upgrade_fw","HTML_HEADER_TYPE")
		TCWebApi_commit("System_Entry")
end if	
%>
<!doctype html>
<html>
<%if tcWebApi_get("System_Entry","upgrade_fw_status","h") <> "SUCCESS" then%>
	<head>
<title><%tcWebApi_get("String_Entry","BranchName","s")%> ONT - <%tcWebApi_get("String_Entry","NavigationMainFirmwareText","s")%></title>		<meta charset="utf-8">
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
		</script>	<script type="text/javascript">
function doUpgrade() {
	var form=document.ConfigForm;
	var string = form.FW_UploadFile.value.search(/vG_ONU_/i);
	if (form.FW_UploadFile.value=="") {
		alert("<%tcWebApi_get("String_Entry","ManageUpgradeFileText","s")%>");
	}
	else {
		if (string >= 0)
		{
			document.getElementById("warn").innerHTML = "<%tcWebApi_get("String_Entry","ManagementUpgradeWaitText","s")%> ";
			form.postflag.value = "1";
			form.submit();
		}
		else
			alert("<%tcWebApi_get("String_Entry","ManagementUpgradeErrorText","s")%>");
	}
}
function onloadCheck() {
	UpgradeStatus = '<% tcWebApi_get("System_Entry","upgrade_fw_status","s")%>';
	if (UpgradeStatus == "NONE") {
		document.getElementById("warn").innerHTML="";
	}
	else if(UpgradeStatus == "SUCCESS")
	{
		document.getElementById("warn").innerHTML="<%tcWebApi_get("String_Entry","ManageUpgradeFilesucessText","s")%>";
	}
	else if (UpgradeStatus == "FAIL") {
		document.getElementById("warn").innerHTML="<%tcWebApi_get("String_Entry","ManageUpgradeFailText","s")%>";
	}
}
	</script>
	</head>
	<body onload="onloadCheck();" class="container">
<header class="fixed-top"><nav id="top-nav" class="navbar navbar-expand-lg container"><a class="navbar-brand " href="/cgi-bin/home.asp"><div><img src="/img/logo_home.png" width="100" height="18" alt=""><div style="font-family: sans-serif; font-weight: bold;font-size: 12px;color: #000; margin-top: 0">OPTICAL NETWORK TERMINATION</div></div></a><button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"><em class="fas fa-align-justify"></em></span></button><div class="collapse navbar-collapse" id="navbarCollapse"><ul class="navbar-nav mr-auto sidenav" id="navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/home.asp"><%tcWebApi_get("String_Entry","NavigationHomeText","s")%><span class="sr-only"></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/deviceinfo.asp"><%tcWebApi_get("String_Entry","NavigationStatusDeviceText","s")%><span class="sr-only"></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/wifi-mesh-topology.asp"><%tcWebApi_get("String_Entry","EasyMeshStatus5Text","s")%><span class="sr-only"></span></a></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#status-menu" aria-controls="status-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NavigationStatusStatisticsText","s")%></a><ul class="nav-second-level collapse" id="status-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/sta-statistics.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationTrafficText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/sta-wifiusers.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationStatusUsersText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/sta-users.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","ARPStatusText","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#network-menu" aria-controls="network-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NAVNetwork","s")%></a><ul class="nav-second-level collapse" id="network-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/net-wan.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationBasInternetText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/net-lan.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationBasLANText","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#wifi-menu" aria-controls="wifi-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NAVWifi","s")%></a><ul class="nav-second-level collapse" id="wifi-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/wifi.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationWiFiSettingsText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/wifi-11ac.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationWiFi11acSettingsText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/wifi-mesh.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationMesh","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#firewall-menu" aria-controls="firewall-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NavigationAdvFirewallText","s")%></a><ul class="nav-second-level collapse" id="firewall-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-spi.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","ContentFirewallText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-urlfilter.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","FILTERTYPE_index2","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-macfilter.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVL2Filter","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-parentalcontrol.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","ParentalControlText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/safehome.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","SafehomeText","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#apps-menu" aria-controls="apps-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NAVApplication","s")%></a><ul class="nav-second-level collapse" id="apps-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-dmz.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NatTopDMZText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-portforwarding.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NatVirsvrText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-sslim.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","SessionLimit","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-route.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","StaticRouteText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-ddns.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","dyDNS1Text","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-wifischeduling.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","WifiSchedulingText","s")%></span></a></li></ul></li><li class="nav-item active"><a class="nav-link nav-link-collapse nav-link-show" href="#" id="hasSubItems" data-toggle="collapse" data-target="#tools-menu" aria-controls="tools-menu" aria-expanded="true"><%tcWebApi_get("String_Entry","NavigationMaintenanceText","s")%></a><ul class="nav-second-level show" id="tools-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-admin.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationMainAdminText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-time.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVSysTime","s")%></span></a></li><li class="nav-item active"><a class="nav-link" href="/cgi-bin/tools-firmware.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationMainFirmwareText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-config.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVConfig","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-diagnostic.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationMainDiagnosticsText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-wan2lan.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","Wan2lanText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-log.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVLogs","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-reboot.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","RebootText","s")%></span></a></li></ul></li></ul><div class="top-item-groups"><form name="LanguageForm" method="POST" action="/cgi-bin/tools-firmware.asp" class="nav-item dropdown"><input type="hidden" name="TokenString" value="<%tcWebApi_getToken()%>"><input type="hidden" name="Language_Flag" value="<% tcWebApi_get("LanguageSwitch_Entry","Type","s") %>"><a class="nav-link dropdown-toggle" href="#" id="LanguageDropdown" role="button" data-toggle="dropdown" aria-expanded="false"><% tcWebApi_get("String_Entry","LoginLanguage","s") %></a><ul class="dropdown-menu" aria-labelledby="LanguageDropdown"><li><a class="dropdown-item <% if tcWebApi_get("LanguageSwitch_Entry","Type","h") = "1" then asp_Write("active") end if %>" href="#" onclick="submitLanguageForm(1);"><% tcWebApi_get("String_Entry","LanguageVIELong","s") %></a></li><li><a class="dropdown-item <% if tcWebApi_get("LanguageSwitch_Entry","Type","h") = "2" then asp_Write("active") end if %>" href="#" onclick="submitLanguageForm(2);"><% tcWebApi_get("String_Entry","LanguageENGLong","s") %></a></li></ul></form><div id="signout" class="nav-item"><a class="nav-link" href="javascript:doLogout();"><em class="fa fa-sign-out-alt"></em><span class="nav-link-text"><% tcWebApi_get("String_Entry","LogoutText","s") %></span></a></div></div></div></header></nav><% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then
	if tcWebApi_get("Mesh_Common", "DeviceRole", "h") = "2" then %>
		<script language='javascript'>
		document.getElementById("network-menu").children[0].style="display: none";
		document.getElementById("network-menu").children[1].style="display: none";
		document.getElementById("wifi-menu").children[0].style="display: none";
		document.getElementById("wifi-menu").children[1].style="display: none";
		</script>
<% end if end if %>		<div id="content">
			<form ENCTYPE="multipart/form-data" class="form-inline" METHOD="POST" ACTION="/cgi-bin/tools-firmware.asp" name="ConfigForm" >
			<INPUT TYPE="HIDDEN" NAME="postflag" VALUE="1">
			<input type="hidden" name="TokenString" value="<%tcWebApi_getToken()%>">
			<INPUT TYPE="HIDDEN" NAME="HTML_HEADER_TYPE" VALUE="2">
			<input name="upload_type" type="HIDDEN" value="4">
			<div class="row row-w-100">
				<div class="widget col-sm-12">
					<header><%tcWebApi_get("String_Entry","UpgradeFirmwareText","s")%></header>
					<div class=widget-body>
						<div class="form-group">
							<label class="col-sm-5"><%tcWebApi_get("String_Entry", "CurrentFirmwareVersionText", "s") %></label>
							<label class="status-value col-sm-7"><%If tcWebApi_get("DeviceInfo_devParaStatic","CustomerSWVersion","h") <> "N/A" Then tcWebApi_get("DeviceInfo_devParaStatic","CustomerSWVersion","s") end if%></label>
						</div>
						<div class="form-group">
							<label class="text-justify mb-2 col-sm-12"><%tcWebApi_get("String_Entry","UpgradeFirmwareNoteText","s")%><br><%tcWebApi_get("String_Entry","ManagementUpgradeNoticeText","s")%></label>
							<div class="custom-file col-sm-6 ml-3">
								<input type="file" class="custom-file-input" name="FW_UploadFile" id="FW_UploadFile">
								<label class="custom-file-label" for="FW_UploadFile"><%tcWebApi_get("String_Entry","ChooseFileText","s")%></label>
							</div>
						</div>
						<div class="form-group">
							<label ID="warn-fwversion" class="text-justify  col-sm-12"></label>
							<label ID="warn" class="text-justify  col-sm-12"></label>
						</div>
						<div class="col-sm-12 d-flex align-items-end justify-content-end">
							<button type="button" class="page-button small-button" onclick="doUpgrade();"><%tcWebApi_get("String_Entry","ButtonUpgradeText","s")%></button>
						</div>					
					</div>
				</div>
			</div>
			</form>
		</div>
<script>
// Add the following code if you want the name of the file appear on select
$(".custom-file-input").on("change", function() {
	$("#warn").text("");
  var market = "<%tcWebApi_get("String_Entry","BranchName","s")%>"
  var fileName = $(this).val().split("\\").pop();
  $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
  var old_version = "<%If tcWebApi_get("DeviceInfo_devParaStatic","CustomerSWVersion","h") <> "N/A" Then tcWebApi_get("DeviceInfo_devParaStatic","CustomerSWVersion","s") end if%>";
  var market_prefix = old_version.slice(0,2);
  if (!isNaN(parseInt(market_prefix[1]))) {
	market_prefix = 'V';
	console.log("Enter here")
  }
  old_version = old_version.replace(market_prefix, "");
  var version = fileName.split(/vG_ONU_/i);
  var string = "";
  if (version.length != 2) {
	$("#warn-fwversion").text("<%tcWebApi_get("String_Entry","FirmwareMayIncorrectText","s")%>");
	$("#warn-fwversion").css("color","#ff6633");
	return;
  }
  version = version[1].split(".bin");
  if (version.length != 2) {
	$("#warn-fwversion").text("<%tcWebApi_get("String_Entry","FirmwareMayIncorrectText","s")%>");
	$("#warn-fwversion").css("color","#ff6633");
	return;
  }
  version = version[0].replaceAll(".","");
  if (isNaN(parseInt(version))) {
	$("#warn-fwversion").text("<%tcWebApi_get("String_Entry","FirmwareMayIncorrectText","s")%>");
	$("#warn-fwversion").css("color","#ff6633");
	return;
  }
  market = market.toUpperCase();
  if(version.includes(market) || (market_prefix == 'V'))
  {
	console.log("include");
	version = version.replace(market,"");
  }
  else
  {
	console.log("not include")
	$("#warn-fwversion").text("<%tcWebApi_get("String_Entry","FirmwareMayIncorrectText","s")%>");
	$("#warn-fwversion").css("color","#ff6633");
	return;
  }
  string = "<%tcWebApi_get("String_Entry","NewFirmwareVersionText","s")%> " + market_prefix + version + ". ";
  if (parseInt(version) > parseInt(old_version)) {
	$("#warn-fwversion").css("color","green");
  }
  else {
	$("#warn-fwversion").css("color","#ff6633");
	string += "<%tcWebApi_get("String_Entry","NotNewerFirmwareVersionText","s")%>";
  }
  $("#warn-fwversion").text(string);
});
</script>
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
<%else%>
<% if tcwebApi_get("WebCustom_Entry","isAllinoneUploadSupported","h") ="Yes" then %>
<%if tcWebApi_get("System_Entry","upgrade_fw_type","h") = "5" then%>
<HEAD></HEAD>
<BODY><font color=red><%tcWebApi_get("String_Entry","ManageUpgradesucessText","s")%></font></BODY>
<%else%>
<HEAD><meta http-equiv="Refresh" content="115"; url="tools-firmware.asp"></HEAD>
<BODY><font color=red><%tcWebApi_get("String_Entry","ManageUpgradeFilesucessText","s")%></font></BODY>
<%end if%>
<%else%>
<HEAD><meta http-equiv="Refresh" content="115"; url="tools-firmware.asp">
<style>
	body {
		font-size: 14px;
		letter-spacing: 1;
		font-family: Arial, Helvetica, sans-serif;
		padding: 20px;
	}
</style>
</HEAD>
<BODY><font color=red><%tcWebApi_get("String_Entry","ManageUpgradeFilesucessText","s")%></font></BODY>
<%end if%>
<%end if%>
</html>
