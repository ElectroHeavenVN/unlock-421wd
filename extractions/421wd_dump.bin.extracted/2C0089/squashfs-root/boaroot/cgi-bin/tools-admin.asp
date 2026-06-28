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
if Request_Form("adminFlag") = "1" Then
    if Request_Form("uiViewTools_Password") <> "" then
	    if Request_Form("uiViewTools_Password") = Request_Form("uiViewTools_PasswordConfirm") then
	        if tcWebApi_PassWdFormatCheck("uiViewTools_CurPassword", "uiViewTools_Password") = "0" Then
				tcWebApi_set("Account_Entry0","web_passwd","uiViewTools_Password")
				tcWebApi_commit("Account_Entry0")
                tcWebApiSessionAttr_Update("pwd_changed", "1")
	        else
	            if tcWebApi_PassWdFormatCheck("uiViewTools_CurPassword", "uiViewTools_Password") = "1" Then
	                tcWebApiSessionAttr_Update("wrong_passwd", "1")
	            else
	                tcWebApiSessionAttr_Update("weak_passwd", "1")
					tcWebApi_set("Account_Entry0","web_passwd","uiViewTools_Password")
					tcWebApi_commit("Account_Entry0")
                    tcWebApiSessionAttr_Update("pwd_changed", "1")
	            end if
	        end if
	    end if
    end if
	tcWebApi_save();
end if
if Request_Form("WANLANAccessFlag") = "1" Then
	tcWebApiSessionAttr_Update("acc_changed", "1")
end if
if Request_Form("AccessFlag") = "1" Then
	 if tcWebApi_validate("UseWAN0=options|No|Yes&UseLAN0=options|No|Yes") = "1" Then
		tcWebApi_set("Account_WebMng","UseWan","UseWAN0")
		tcWebApi_set("Account_WebMng","UseLan","UseLAN0")
		tcWebApi_commit("Account_Entry0")
    end if
	if tcWebApi_validate("StdioTimeOut=options|0|150|300|600|1200") = "1" Then
		tcWebApi_set("Account_Entry0","StdioTimeout","StdioTimeOut")
		tcWebApi_commit("Account_Entry0");
	end if
	if Request_Form("isChangePort") = "1" Then
		If tcWebApi_validate("http_port=integer|1|65535") = "1" Then
			If tcWebApi_validate("http_port=options|0|1|7|9|11|13|15|17|19|20|21|22|23|25|37|42|43|53|67|68|77|79|87|95|101|102|103|104|109|110|111|113|115|117|119|123|135|139|143|161|179|389|465|512|513|514|515|526|530|531|532|540|556|563|587|601|636|993|995|1900|2049|3659|4045|5060|5555|6000|6665|6666|6667|6668|6669|8081|8082|8888") = "0" Then
				TCWebApi_set("Account_WebMng","HttpPort","http_port")
			End If
		End If
		If tcWebApi_validate("https_port=integer|1|65535") = "1" Then
			If tcWebApi_validate("https_port=options|0|1|7|9|11|13|15|17|19|20|21|22|23|25|37|42|43|53|67|68|77|79|87|95|101|102|103|104|109|110|111|113|115|117|119|123|135|139|143|161|179|389|465|512|513|514|515|526|530|531|532|540|556|563|587|601|636|993|995|1900|2049|3659|4045|5060|5555|6000|6665|6666|6667|6668|6669|8081|8082|8888") = "0" Then
				TCWebApi_set("Account_WebMng","HttpsPort","https_port")
			End If
		End If
		tcWebApi_commit("Account_WebMng");
	end if
    tcWebApi_save();
end if
%>
<!doctype html>
<html>
	<head>
<title>Viettel ONT - <%tcWebApi_get("String_Entry","NavigationMainAdminText","s")%></title>		<meta charset="utf-8">
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
			var orig_http_port = "<% if tcWebApi_get("Account_WebMng","HttpPort","h") <> "N/A" then tcWebApi_get("Account_WebMng","HttpPort","s") else asp_Write("80") end if %>";
			var orig_https_port = "<% if tcWebApi_get("Account_WebMng","HttpsPort","h") <> "N/A" then tcWebApi_get("Account_WebMng","HttpsPort","s") else asp_Write("443") end if %>";															
			function isRestrictedPort(port)
			{
				var rest_ports = [0, 1, 7, 9, 11, 13, 15, 17, 19, 20, 21, 22, 23, 25, 37, 42, 43, 53, 67, 68, 77, 79, 87, 95, 101, 102, 103, 104, 109, 110, 111, 113, 115, 117, 119, 123, 135, 139, 143, 161, 179, 389, 465, 512, 513, 514, 515, 526, 530, 531, 532, 540, 556, 563, 587, 601, 636, 993, 995, 1900, 2049, 3659, 4045, 5060, 5555, 6000, 6665, 6666, 6667, 6668, 6669, 8081, 8082, 8888];
				var len = rest_ports.length;
				var ret = false;
				for (var i = 0; i < len; i++)
				{
					if (port == rest_ports[i])
					{
						ret = true;
						break;
					}
				}
				return ret;
			}
			function fresh()
			{
				var timeout = "<%tcWebApi_get("Account_Entry0", "StdioTimeout", "s")%>";
				localStorage.setItem('logout_timeout', Number(timeout));
				var curAcc = 0;
				<%if tcWebApiSessionAttr_Get("wrong_passwd") = "1" then%>
					alert("<%tcWebApi_get("String_Entry","WrongPasswd","s")%>");
					<%if request_Form("adminFlag") = "" then%>
						<%tcWebApiSessionAttr_Update("wrong_passwd", "0")%>
					<%end if%>
				<%end if%>
				<%if tcWebApiSessionAttr_Get("weak_passwd") = "1" then%>
					alert("<%tcWebApi_get("String_Entry","PasswdChangedWeak","s")%>");
					<%if request_Form("adminFlag") = "" then%>
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
				document.access_form.uiViewTools_Wan0.checked = (document.access_form.UseWAN0.value == "Yes");
				document.access_form.uiViewTools_Lan0.checked = (document.access_form.UseLAN0.value == "Yes");
			}
			function onDeleteSession(result)
			{
				ajax_submit('/cgi-bin/delete_all_session.cgi', null, null);
				doBrowserLogout();
				window.top.location= 'login.asp';
			}
			function doLogout()
			{
				ajax_submit('/cgi-bin/logout.cgi', null, onDeleteSession);
			}
			function SaveAdminForm()
			{
				if (document.admin_form.uiViewTools_Password.value.length != 0 || document.admin_form.uiViewTools_PasswordConfirm.value.length != 0 || document.admin_form.uiViewTools_CurPassword.value.length != 0) {
					/* VT-ONT ONT-44 */
					if (document.admin_form.uiViewTools_Password.value.length == 0 && document.admin_form.uiViewTools_PasswordConfirm.value.length == 0) {
						alert("<%tcWebApi_get("String_Entry","AdminJS0Text","s")%>");
						return -1;
					}
					else {
					/* End VT-ONT ONT-44 */
					var password = document.admin_form.uiViewTools_Password.value;
					<%if tcwebApi_get("WebCustom_Entry", "isCZGeneralSupported", "h")="Yes" Then%>
					if (password.length < 8 || password.length > 30) {
							alert("<%tcWebApi_get("String_Entry","AdminJS6Text","s")%>");
							return -1;
						}
					<%end if%>		
						for(var i = 0; i < password.length; i ++ ) {        /*VT-ONT ONT-388*/
						var ascNum = password.charCodeAt(i);
						if (ascNum < 33 || ascNum > 126 || ascNum == 59){
								alert("<%tcWebApi_get("String_Entry","AdminJS7Text","s")%>");
								return -1;
							}
						}                                                   /*End VT-ONT ONT-388*/
					if (document.admin_form.uiViewTools_Password.value != document.admin_form.uiViewTools_PasswordConfirm.value){
						alert("<%tcWebApi_get("String_Entry","AdminJS1Text","s")%>");
						return;
						}
					if (document.admin_form.uiViewTools_Password.value == document.admin_form.uiViewTools_CurPassword.value){
						alert("<%tcWebApi_get("String_Entry","AdminJS9Text","s")%>");
						return;
						}
					if(quotationCheck(document.admin_form.uiViewTools_Password, 30))
						return;
					}			
					document.admin_form.adminFlag.value=1;
				}
				submitAsync("admin_form");
			}
			function set_checked_value(isChecked, tgt_ctr) {
			  if (isChecked)
				tgt_ctr.value = "Yes";
			  else
				tgt_ctr.value = "No";
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
				if (j > limit_len)
				{
				alert('<%tcWebApi_get("String_Entry","AdminJS2Text","s")%>');
					return true;
				}
				return false;
			}
			function changeAccessInterface()
			{
				if (document.access_form.WANLANAccessFlag.value != 1)
				{
					document.access_form.WANLANAccessFlag.value=1;
				}
			}
			function checkStdioTimeOut(){
				var obj=document.getElementsByName("StdioTimeOut")[0];
				if(obj.value==""){
					alert("<%tcWebApi_get("String_Entry","LANJS52Text","s")%>")
					return false;
				}
				if(obj.value.match("[^0-9]") != null){
					alert("<%tcWebApi_get("String_Entry","LANJS53Text","s")%>");
				return false;
				}
				var Limit = parseInt(obj.value);
				if ( (Limit > 3600) || (Limit < 0) ) {
					alert("<%tcWebApi_get("String_Entry","LANJS54Text","s")%>");
					return false;
				}
				return true;
			}
			function SaveAccessForm()
			{
				if (!document.access_form.uiViewTools_Wan0.checked && !document.access_form.uiViewTools_Lan0.checked) {
					alert("<%tcWebApi_get("String_Entry","AdminJS10Text","s")%>");
					return -1;
				}
				set_checked_value(document.access_form.uiViewTools_Wan0.checked, document.access_form.UseWAN0);
				set_checked_value(document.access_form.uiViewTools_Lan0.checked, document.access_form.UseLAN0);	
				if(false == checkStdioTimeOut()){
						return;
					}
				if ((orig_http_port != $("#http_port").val()) || (orig_https_port != $("#https_port").val())) {
					var ip_address = "<% tcWebApi_get("Lan_Entry0","IP","s") %>";
					if (!isValidPort($("#http_port").val()) || !isValidPort($("#https_port").val())) {
						alert("<% tcWebApi_get("String_Entry","InvalidPortText","s")%>");
						return false;
					}
					if (isRestrictedPort( $("#http_port").val()) || isRestrictedPort( $("#https_port").val())) {
						alert("<% tcWebApi_get("String_Entry","ManagementWebPortRestrictedText","s")%>");
						return false;
					}
					if ($("#http_port").val() == $("#https_port").val()) {
						alert("<% tcWebApi_get("String_Entry","HttpPortDuplicateText","s")%>");
						return false;
					}
					document.access_form.isChangePort.value=1;
					alert("<% tcWebApi_get("String_Entry","AfterChangeWebPortAlert","s")%>\n\n http://"+ip_address+":"+$("#http_port").val()+"\n\n <% tcWebApi_get("String_Entry","orText","s")%>  https://"+ip_address+":"+$("#https_port").val())
				}
				document.access_form.AccessFlag.value=1;
				submitAsync("access_form");
			}
		</script>
	</head>
	<body onload="fresh();" class="container">
<header class="fixed-top"><nav id="top-nav" class="navbar navbar-expand-lg container"><a class="navbar-brand " href="/cgi-bin/home.asp"><div><img src="/img/logo_home.png" width="100" height="18" alt=""><div style="font-family: sans-serif; font-weight: bold;font-size: 12px;color: #000; margin-top: 0">OPTICAL NETWORK TERMINATION</div></div></a><button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"><em class="fas fa-align-justify"></em></span></button><div class="collapse navbar-collapse" id="navbarCollapse"><ul class="navbar-nav mr-auto sidenav" id="navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/home.asp"><%tcWebApi_get("String_Entry","NavigationHomeText","s")%><span class="sr-only"></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/deviceinfo.asp"><%tcWebApi_get("String_Entry","NavigationStatusDeviceText","s")%><span class="sr-only"></span></a></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#status-menu" aria-controls="status-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NavigationStatusStatisticsText","s")%></a><ul class="nav-second-level collapse" id="status-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/sta-statistics.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationTrafficText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/sta-wifiusers.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationStatusUsersText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/sta-users.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","ARPStatusText","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#network-menu" aria-controls="network-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NAVNetwork","s")%></a><ul class="nav-second-level collapse" id="network-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/net-wan.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationBasInternetText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/net-lan.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationBasLANText","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#wifi-menu" aria-controls="wifi-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NAVWifi","s")%></a><ul class="nav-second-level collapse" id="wifi-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/wifi.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationWiFiSettingsText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/wifi-11ac.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationWiFi11acSettingsText","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#firewall-menu" aria-controls="firewall-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NavigationAdvFirewallText","s")%></a><ul class="nav-second-level collapse" id="firewall-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-spi.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","ContentFirewallText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-urlfilter.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","FILTERTYPE_index2","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-macfilter.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVL2Filter","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-parentalcontrol.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","ParentalControlText","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#apps-menu" aria-controls="apps-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NAVApplication","s")%></a><ul class="nav-second-level collapse" id="apps-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-dmz.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NatTopDMZText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-portforwarding.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NatVirsvrText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-sslim.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","SessionLimit","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-route.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","StaticRouteText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-ddns.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","dyDNS1Text","s")%></span></a></li></ul></li><li class="nav-item active"><a class="nav-link nav-link-collapse nav-link-show" href="#" id="hasSubItems" data-toggle="collapse" data-target="#tools-menu" aria-controls="tools-menu" aria-expanded="true"><%tcWebApi_get("String_Entry","NavigationMaintenanceText","s")%></a><ul class="nav-second-level show" id="tools-menu" data-parent="#navAccordion"><li class="nav-item active"><a class="nav-link" href="/cgi-bin/tools-admin.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationMainAdminText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-time.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVSysTime","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-firmware.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationMainFirmwareText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-config.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVConfig","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-diagnostic.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationMainDiagnosticsText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-log.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVLogs","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-reboot.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","RebootText","s")%></span></a></li></ul></li></ul><div class="top-item-groups"><form name="LanguageForm" method="POST" action="/cgi-bin/tools-admin.asp" class="nav-item dropdown"><input type="hidden" name="TokenString" value="<%tcWebApi_getToken()%>"><input type="hidden" name="Language_Flag" value="<% tcWebApi_get("LanguageSwitch_Entry","Type","s") %>"><a class="nav-link dropdown-toggle" href="#" id="LanguageDropdown" role="button" data-toggle="dropdown" aria-expanded="false"><% tcWebApi_get("String_Entry","LoginLanguage","s") %></a><ul class="dropdown-menu" aria-labelledby="LanguageDropdown"><li><a class="dropdown-item <% if tcWebApi_get("LanguageSwitch_Entry","Type","h") = "1" then asp_Write("active") end if %>" href="#" onclick="submitLanguageForm(1);"><% tcWebApi_get("String_Entry","LanguageVIELong","s") %></a></li><li><a class="dropdown-item <% if tcWebApi_get("LanguageSwitch_Entry","Type","h") = "2" then asp_Write("active") end if %>" href="#" onclick="submitLanguageForm(2);"><% tcWebApi_get("String_Entry","LanguageENGLong","s") %></a></li></ul></form><div id="signout" class="nav-item"><a class="nav-link" href="javascript:doLogout();"><em class="fa fa-sign-out-alt"></em><span class="nav-link-text"><% tcWebApi_get("String_Entry","LogoutText","s") %></span></a></div></div></div></header></nav><% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then
	if tcWebApi_get("Mesh_Common", "DeviceRole", "h") = "2" then %>
		<script language='javascript'>
		document.getElementById("wifi-menu").children[0].style="display: none";
		document.getElementById("wifi-menu").children[1].style="display: none";
		</script>
<% end if end if %>		<div id="content">
		<form class="form-inline" method="post" name="admin_form" action="/cgi-bin/tools-admin.asp" autocomplete="off">
		<INPUT TYPE="HIDDEN" NAME="adminFlag" VALUE="0"></td>
		<INPUT TYPE="HIDDEN" NAME="TokenString" VALUE="<%tcWebApi_getToken()%>">
		<div class="row row-w-100">
			<div class="widget col-xs-12 col-lg-12">
				<header><%tcWebApi_get("String_Entry","AdminText","s")%></header>
				<div class="widget-body">
					<fieldset>
						<legend>
							<%tcWebApi_get("String_Entry","AccountText","s")%>
						</legend>
						<div class="form-group">
							<label class="col-xs-6 col-sm-5 control-label"><%tcWebApi_get("String_Entry","AdminUsernameText","s")%></label>
							<label class="col-xs-5 col-sm-6 text-label inline-text"><strong><%tcWebApi_get("Account_Entry0","username","s")%></strong></label>
						</div>
						<div class="form-group">
							<label class="col-xs-12 col-sm-5 control-label"><%tcWebApi_get("String_Entry","AdminCurPasswordText","s")%></label>
							<div class="col-xs-12 col-sm-5 inputGroupContainer">
								<input type="password" class="form-control" name="uiViewTools_CurPassword" SIZE="32" MAXLENGTH="30" VALUE=""/>
							</div>
						</div>
						<div class="form-group">
							<label class="col-xs-12 col-sm-5 control-label"><%tcWebApi_get("String_Entry","AdminNewPasswordText","s")%></label>
							<div class="col-xs-12 col-sm-5 inputGroupContainer">
								<input type="password" class="form-control" name="uiViewTools_Password" SIZE="32" MAXLENGTH="30" VALUE=""/>
							</div>
						</div>
						<div class="form-group">
							<label class="col-xs-12 col-sm-5 control-label"><%tcWebApi_get("String_Entry","AdminConfirmPasswordText","s")%></label>
							<div class="col-xs-12 col-sm-5 inputGroupContainer">
								<input type="password" class="form-control" name="uiViewTools_PasswordConfirm" SIZE="32" MAXLENGTH="30" VALUE=""/>
							</div>
						</div>
						<div class="form-group">
							<label class="hidden-xs col-sm-5 control-label"></label>
							<label class="info-text col-xs-12 col-sm-7"><%tcWebApi_get("String_Entry","PasswdGuide","s")%></label>
						</div>
					</fieldset>
				</div>
			</div>
			<div class="mb-3 col-lg-12 d-flex align-items-center justify-content-center">
				<button id="btnOK" type="button" class="page-button small-button" onclick="SaveAdminForm();"><%tcWebApi_get("String_Entry","ButtonApplyText","s")%></button>
			</div>
		</div>
		</form>
		<form class="form-inline" method="post" name="access_form" action="/cgi-bin/tools-admin.asp" autocomplete="off">
		<INPUT TYPE="HIDDEN" NAME="adminFlag" VALUE="0"></td>
		<INPUT TYPE="HIDDEN" NAME="TokenString" VALUE="<%tcWebApi_getToken()%>">
		<div class="row row-w-100">
			<div class="widget col-xs-12 col-lg-12">
				<INPUT TYPE="HIDDEN" NAME="AccessFlag" VALUE="0"></td>
				<INPUT TYPE="HIDDEN" NAME="WANLANAccessFlag" VALUE="0"></td>
				<INPUT TYPE="HIDDEN" NAME="UseWAN0" VALUE="<%tcWebApi_get("Account_WebMng","UseWan","s")%>">
				<INPUT TYPE="HIDDEN" NAME="UseLAN0" VALUE="<%tcWebApi_get("Account_WebMng","UseLan","s")%>">
				<INPUT TYPE="HIDDEN" NAME="isChangePort" VALUE="0">
				<header><%tcWebApi_get("String_Entry","AccessControlText","s")%></header>
				<div class="widget-body">
					<fieldset>
						<legend>
							<%tcWebApi_get("String_Entry","AccessControlText","s")%>
						</legend>
						<div class="form-group">
							<label class="col-xs-12 col-sm-5 control-label"><%tcWebApi_get("String_Entry","ACAllowAccess","s")%></label>
							<div class="col-xs-4 col-sm-1 custom-control custom-checkbox">
								<input class="custom-control-input" type="checkbox" id="uiViewTools_Wan0" name="uiViewTools_Wan0" onChange="changeAccessInterface()" ><label class="custom-control-label" for=uiViewTools_Wan0>WAN</label>
							</div>
							<div class="col-xs-4 col-sm-1 custom-control custom-checkbox">
								<input class="custom-control-input" type="checkbox" id="uiViewTools_Lan0" name="uiViewTools_Lan0" onChange="changeAccessInterface()" ><label class="custom-control-label" for=uiViewTools_Lan0>LAN</label>
							</div>
						</div>
						<div class="form-group">
							<label class="col-xs-12 col-sm-5 control-label"><%tcWebApi_get("String_Entry","LANStdioTimeoutText","s")%></label>
							<div class="col-xs-12 col-sm-3 custom-select">
								<SELECT NAME="StdioTimeOut" SIZE="1">
									<OPTION value="0" <% if tcWebApi_get("Account_Entry0","StdioTimeout","h") = "0" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","SsNolimitText","s")%>
									<OPTION value="150" <% if tcWebApi_get("Account_Entry0","StdioTimeout","h") = "150" then asp_Write("selected") end if %>>2.5 <%tcWebApi_get("String_Entry","UserInfominuteText","s")%>
									<OPTION value="300" <%If tcWebApi_get("Account_Entry0","StdioTimeout","h") = "300" then asp_Write("selected") end if%>>5 <%tcWebApi_get("String_Entry","UserInfominuteText","s")%>
									<OPTION value="600" <% if tcWebApi_get("Account_Entry0","StdioTimeout","h") = "600" then asp_Write("selected") end if %>>10 <%tcWebApi_get("String_Entry","UserInfominuteText","s")%>
									<!-- ONT-45 -->
									<OPTION value="1200" <% if tcWebApi_get("Account_Entry0","StdioTimeout","h") = "1200" then asp_Write("selected") end if %>>20 <%tcWebApi_get("String_Entry","UserInfominuteText","s")%>
									<!-- ONT-45 -->
								</SELECT>
							</div>
						</div>
					</fieldset>
					<fieldset>
						<legend>
							<%tcWebApi_get("String_Entry","WebManagementPortText","s")%>
						</legend>
						<div class="form-group">
							<label class="col-xs-12 col-sm-5 control-label"><%tcWebApi_get("String_Entry","HttpPortText","s")%></label>
							<input type="text" class="col-xs-12 col-sm-3 form-control" name="http_port" id="http_port" SIZE="5" MAXLENGTH="5" VALUE="<% if tcWebApi_get("Account_WebMng","HttpPort","h") <> "N/A" then tcWebApi_get("Account_WebMng","HttpPort","s") else asp_Write("80") end if %>"/>
						</div>
						<div class="form-group">
							<label class="col-xs-12 col-sm-5 control-label"><%tcWebApi_get("String_Entry","HttpsPortText","s")%></label>
							<input type="text" class="col-xs-12 col-sm-3 form-control" name="https_port" id="https_port" SIZE="5" MAXLENGTH="5" VALUE="<% if tcWebApi_get("Account_WebMng","HttpsPort","h") <> "N/A" then tcWebApi_get("Account_WebMng","HttpsPort","s") else asp_Write("443") end if %>"/>
						</div>
					</fieldset>
				</div>
			</div>
			<div class="col-lg-12 d-flex align-items-center justify-content-center">
				<button id="btnOK" type="button" class="page-button small-button" onclick="SaveAccessForm();"><%tcWebApi_get("String_Entry","ButtonApplyText","s")%></button>
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
