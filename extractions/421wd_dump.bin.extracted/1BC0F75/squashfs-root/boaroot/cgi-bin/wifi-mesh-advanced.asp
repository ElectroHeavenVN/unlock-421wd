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
if Request_Form("Save_Flag") = "1" then
	if Request_Form("SaveAll_Flag") = "1" then
		if Request_Form("MapEnable") = "1" then
			TCWebApi_Set("Mesh_mapdcfg", "APSteerRssiTh", "APSteerRssiTh")
			TCWebApi_commit("Mesh_mapdcfg")
            TCWebApi_Set("Mesh_steercfg", "RSSISteeringEdge_DG", "APSteerDownTh")
            TCWebApi_Set("Mesh_steercfg", "RSSISteeringEdge_UG", "APSteerUpTh")
			TCWebApi_commit("Mesh_steercfg")
			TCWebApi_constSet("Mesh_common", "ReinitWifiFlag","1")
			TCWebApi_commit("Mesh_common")
		end if
	end if
	TCWebApi_save()
end if
%>
<!doctype html>
<html>
<head>
<title><%tcWebApi_get("String_Entry","BranchName","s")%> ONT - <%tcWebApi_get("String_Entry","NavigationMesh","s")%></title>		<meta charset="utf-8">
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
		</script>    <script language=JavaScript type=text/javascript>
    function formSubmit(saveAll)
        {
            if(document.cbi != null)
            {
                if(saveAll)
                {
                    console.log("Saveall_flag=1");
                        setText('SaveAll_Flag', 1);
                }
                else
                {
                        setText('SaveAll_Flag', 0);
                }
                setText('Save_Flag', 1);
                submitAsync("cbi");
            }
        }
        function validateApSteerRssiTh()
        {
            var apSteerRssiTh = document.getElementById("APSteerRssiTh").value;
            if (apSteerRssiTh == "" ||
                isNaN(apSteerRssiTh) ||
                !/^(0|-[1-9]|-[1-9][0-9])$/.test(apSteerRssiTh) ||
                parseInt(apSteerRssiTh) > 0 ||
                parseInt(apSteerRssiTh) < -90)
            {
                alert("<%tcWebApi_get("String_Entry","EasyMeshBasicAlert7Test","s")%>\n<%tcWebApi_get("String_Entry","EasyMeshBasicAlert8Test","s")%>");
                document.getElementById("APSteerRssiTh").focus();
                document.getElementById("APSteerRssiTh").select();
                return false;
            }
            return true;
        }
        function validateAPSteerDownTh()
        {
            var APSteerDownTh = document.getElementById("APSteerDownTh").value;
            if (APSteerDownTh == "" ||
                isNaN(APSteerDownTh) ||
                !/^(0|[1-9]|[1-9][0-9])$/.test(APSteerDownTh) ||
                parseInt(APSteerDownTh) < 0 ||
                parseInt(APSteerDownTh) > 50)
            {
                alert("<%tcWebApi_get("String_Entry","EasyMeshAdvanceAlert1Test","s")%>");
                document.getElementById("APSteerDownTh").focus();
                document.getElementById("APSteerDownTh").select();
                return false;
            }
            return true;
        }
        function validateAPSteerUpTh()
        {
            var APSteerUpTh = document.getElementById("APSteerUpTh").value;
            if (APSteerUpTh == "" ||
                isNaN(APSteerUpTh) ||
                !/^(0|[1-9]|[1-9][0-9])$/.test(APSteerUpTh) ||
                parseInt(APSteerUpTh) < 0 ||
                parseInt(APSteerUpTh) > 50)
            {
                alert("<%tcWebApi_get("String_Entry","EasyMeshAdvanceAlert1Test","s")%>");
                document.getElementById("APSteerUpTh").focus();
                document.getElementById("APSteerUpTh").select();
                return false;
            }
            return true;
        }
        function applyRssiTh()
        {
            // ONTS-797: fix validate RssiTh to prevent XSS
            return validateApSteerRssiTh() && validateAPSteerDownTh() && validateAPSteerUpTh();
        }
        function btnSave()
        {
            // ONTS-797: fix validate RssiTh to prevent XSS
            if (!applyRssiTh())
                return false;
            formSubmit(1);
        }
        </script>
</head>
<body class="container">
<header class="fixed-top"><nav id="top-nav" class="navbar navbar-expand-lg container"><a class="navbar-brand " href="/cgi-bin/home.asp"><div><img src="/img/logo_home.png" width="100" height="18" alt=""><div style="font-family: sans-serif; font-weight: bold;font-size: 12px;color: #000; margin-top: 0">OPTICAL NETWORK TERMINATION</div></div></a><button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"><em class="fas fa-align-justify"></em></span></button><div class="collapse navbar-collapse" id="navbarCollapse"><ul class="navbar-nav mr-auto sidenav" id="navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/home.asp"><%tcWebApi_get("String_Entry","NavigationHomeText","s")%><span class="sr-only"></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/deviceinfo.asp"><%tcWebApi_get("String_Entry","NavigationStatusDeviceText","s")%><span class="sr-only"></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/wifi-mesh-topology.asp"><%tcWebApi_get("String_Entry","EasyMeshStatus5Text","s")%><span class="sr-only"></span></a></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#status-menu" aria-controls="status-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NavigationStatusStatisticsText","s")%></a><ul class="nav-second-level collapse" id="status-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/sta-statistics.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationTrafficText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/sta-wifiusers.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationStatusUsersText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/sta-users.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","ARPStatusText","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#network-menu" aria-controls="network-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NAVNetwork","s")%></a><ul class="nav-second-level collapse" id="network-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/net-wan.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationBasInternetText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/net-lan.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationBasLANText","s")%></span></a></li></ul></li><li class="nav-item active"><a class="nav-link nav-link-collapse nav-link-show" href="#" id="hasSubItems" data-toggle="collapse" data-target="#wifi-menu" aria-controls="wifi-menu" aria-expanded="true"><%tcWebApi_get("String_Entry","NAVWifi","s")%></a><ul class="nav-second-level show" id="wifi-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/wifi.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationWiFiSettingsText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/wifi-11ac.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationWiFi11acSettingsText","s")%></span></a></li><li class="nav-item active"><a class="nav-link" href="/cgi-bin/wifi-mesh.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationMesh","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#firewall-menu" aria-controls="firewall-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NavigationAdvFirewallText","s")%></a><ul class="nav-second-level collapse" id="firewall-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-spi.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","ContentFirewallText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-urlfilter.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","FILTERTYPE_index2","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-macfilter.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVL2Filter","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-parentalcontrol.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","ParentalControlText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/safehome.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","SafehomeText","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#apps-menu" aria-controls="apps-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NAVApplication","s")%></a><ul class="nav-second-level collapse" id="apps-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-dmz.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NatTopDMZText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-portforwarding.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NatVirsvrText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-sslim.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","SessionLimit","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-route.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","StaticRouteText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-ddns.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","dyDNS1Text","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-wifischeduling.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","WifiSchedulingText","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#tools-menu" aria-controls="tools-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NavigationMaintenanceText","s")%></a><ul class="nav-second-level collapse" id="tools-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-admin.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationMainAdminText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-time.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVSysTime","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-firmware.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationMainFirmwareText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-config.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVConfig","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-diagnostic.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationMainDiagnosticsText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-wan2lan.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","Wan2lanText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-log.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVLogs","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-reboot.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","RebootText","s")%></span></a></li></ul></li></ul><div class="top-item-groups"><form name="LanguageForm" method="POST" action="/cgi-bin/wifi-mesh-advanced.asp" class="nav-item dropdown"><input type="hidden" name="TokenString" value="<%tcWebApi_getToken()%>"><input type="hidden" name="Language_Flag" value="<% tcWebApi_get("LanguageSwitch_Entry","Type","s") %>"><a class="nav-link dropdown-toggle" href="#" id="LanguageDropdown" role="button" data-toggle="dropdown" aria-expanded="false"><% tcWebApi_get("String_Entry","LoginLanguage","s") %></a><ul class="dropdown-menu" aria-labelledby="LanguageDropdown"><li><a class="dropdown-item <% if tcWebApi_get("LanguageSwitch_Entry","Type","h") = "1" then asp_Write("active") end if %>" href="#" onclick="submitLanguageForm(1);"><% tcWebApi_get("String_Entry","LanguageVIELong","s") %></a></li><li><a class="dropdown-item <% if tcWebApi_get("LanguageSwitch_Entry","Type","h") = "2" then asp_Write("active") end if %>" href="#" onclick="submitLanguageForm(2);"><% tcWebApi_get("String_Entry","LanguageENGLong","s") %></a></li></ul></form><div id="signout" class="nav-item"><a class="nav-link" href="javascript:doLogout();"><em class="fa fa-sign-out-alt"></em><span class="nav-link-text"><% tcWebApi_get("String_Entry","LogoutText","s") %></span></a></div></div></div></header></nav><% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then
	if tcWebApi_get("Mesh_Common", "DeviceRole", "h") = "2" then %>
		<script language='javascript'>
		document.getElementById("network-menu").children[0].style="display: none";
		document.getElementById("network-menu").children[1].style="display: none";
		document.getElementById("wifi-menu").children[0].style="display: none";
		document.getElementById("wifi-menu").children[1].style="display: none";
		</script>
<% end if end if %>    <div id="content">
        <form class="form-inline" method="post" name="cbi" action="/cgi-bin/wifi-mesh-advanced.asp" autocomplete="off">
            <input type="hidden" name="MapEnable" value="<% tcWebApi_get("Mesh_dat","MapEnable","s") %>" />
            <input type="hidden" name="TokenString" value="<%tcWebApi_getToken()%>">
            <input type="hidden" name="SaveAll_Flag" value="0" />
            <input type="hidden" name="Save_Flag" value="0" />
            <input type="hidden" name="Action_Flag" value="0" />
            <input type="hidden" name="apply_ap_steer_rssi_th_Flag" value="0" />
            <input type="hidden" name="MeshTriggerFlag" value="<% tcWebApi_get("Mesh_Common","MeshTriggerFlag","s") %>" />
            <div class="row row-w-100">
                <div class="widget col-xs-12 col-lg-12">
                    <ul class="row ul-tab">
                        <li class="tab tab-disabled">
                            <a href="/cgi-bin/wifi-mesh.asp">
                                <%tcWebApi_get("String_Entry","EasyMeshBasicTest","s")%>
                            </a>
                        </li>
                        <li class="tab">
                            <a href="/cgi-bin/wifi-mesh-advanced.asp">
                                <%tcWebApi_get("String_Entry","EasyMeshAdvancedTest","s")%>
                            </a>
                        </li>
                    </ul>
                    <div class="widget-body">
                        <fieldset>
                            <div class="form-group" id="map-cfg-adv-ap-steerth">
                                <label class="col-lg-5" for="APSteerRssiTh"><%tcWebApi_get("String_Entry","EasyMeshAdvanced6Test","s")%></label>
                                <input type="text" id="APSteerRssiTh" class="form-control col-lg-3" name="APSteerRssiTh" value="<%if tcWebApi_get("Mesh_mapdcfg","APSteerRssiTh","h" ) <> "N/A" then tcWebApi_get("Mesh_mapdcfg","APSteerRssiTh","s") end if %>" />
                                <label class="input-description col-lg-3 ml-auto"><%tcWebApi_get("String_Entry","EasyMeshAdvanced7Test","s")%></label>
                            </div>
                        </fieldset>
                        <fieldset>
                            <div class="form-group" id="map-cfg-adv-down-steerth">
                                <label class="col-lg-5" for="APSteerDownTh"><%tcWebApi_get("String_Entry","EasyMeshAdvance2Test","s")%></label>
                                <input type="text" id="APSteerDownTh" class="form-control col-lg-3" name="APSteerDownTh" value="<%if tcWebApi_get("mesh.steercfg","RSSISteeringEdge_DG","h" ) <> "N/A" then tcWebApi_get("mesh.steercfg","RSSISteeringEdge_DG","s") end if %>" />
                                <label class="input-description col-lg-3 ml-auto">0-50 dBm</label>
                            </div>
                        </fieldset>
                        <fieldset>
                            <div class="form-group" id="map-cfg-adv-up-steerth">
                                <label class="col-lg-5" for="APSteerUpTh"><%tcWebApi_get("String_Entry","EasyMeshAdvance3Test","s")%></label>
                                <input type="text" id="APSteerUpTh" class="form-control col-lg-3" name="APSteerUpTh" value="<%if tcWebApi_get("mesh.steercfg","RSSISteeringEdge_UG","h" ) <> "N/A" then tcWebApi_get("mesh.steercfg","RSSISteeringEdge_UG","s") end if %>" />
                                <label class="input-description col-lg-3 ml-auto">0-50 dBm</label>
                            </div>
                        </fieldset>
                    </div>
                </div>
                <div class="col-lg-12 d-flex align-items-center justify-content-center">
                    <button id="btnOK" type="button" class="page-button small-button" onclick="btnSave();"><%tcWebApi_get("String_Entry","ButtonApplyText","s")%></button>
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
		<script language='javascript' src='/JS/user.js'></script></body>
</html>