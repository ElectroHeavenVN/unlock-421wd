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
If Request_Form("SaveFlag") = "1" Then 
    	if Request_Form("Enable_DyDNS") = "1" then
			tcWebApi_constSet("Ddns_Entry","Active","Yes")
    	    if tcWebApi_validate("server_mode=options|Yes|No&sysDNSHost=textlen|64&sysDNSUser=textlen|32&sysDNSPassword=textlen|32&Enable_Wildcard=options|Yes|No") = "1" then
        	    'ECONET-1242
            	TCWebApi_set("Ddns_Entry","Interface","ddns_interface")
            	TCWebApi_set("Ddns_Entry","ServerMode","server_mode")
            	if tcWebApi_validate("ddns_ServerName=textlen|64&server_manu=textlen|64") = "1" then
            	    If Request_Form("server_mode")="Yes" Then
                	    TCWebApi_set("Ddns_Entry","SERVERNAME","ddns_ServerName")
                	else
                	    TCWebApi_set("Ddns_Entry","SERVERNAME","server_manu")
                	    TCWebApi_set("Ddns_Entry","SERVICETYPE","service_type")
                	end if
            	end if
            	TCWebApi_set("Ddns_Entry","MYHOST","sysDNSHost")
            	TCWebApi_set("Ddns_Entry","USERNAME","sysDNSUser")
            	TCWebApi_set("Ddns_Entry","PASSWORD","sysDNSPassword")
            	TCWebApi_set("Ddns_Entry","WILDCARD","Enable_Wildcard")
        	end if
		else
			tcWebApi_constSet("Ddns_Entry","Active","No")
    	end if
      	tcWebApi_commit("Ddns_Entry")
    	TCWebApi_save();
End If
%>
<!doctype html>
<html>
	<head>
<title>Viettel ONT - <%tcWebApi_get("String_Entry","dyDNS1Text","s")%></title>		<meta charset="utf-8">
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
		</script>		<!-- Page specific scripts -->
		<script language=javascript src="/JS/util.js"></script>
		<script language="javascript" type=text/javascript>
		function servermodechange()
			{
			    var auto = document.DDNS_form.server_mode[0].checked;
			    with (document.DDNS_form)
			    {
				if(auto)
				{
				    document.getElementById("Server_auto").style.display="";
				    document.getElementById("Server_manu").style.display="none";
				    document.getElementById("Service_type").style.display="none";	// ONT-583
				    <% If TCWebApi_get("Ddns_Entry","ServerMode","h") = "No" then%>	
					document.DDNS_form.ddns_ServerName.value="www.dyndns.org";
				    <%end if%>
				}
				else
				{
				    document.getElementById("Server_auto").style.display="none";
				    document.getElementById("Server_manu").style.display="";
				    document.getElementById("Service_type").style.display="";	// ONT-583
				}
			    }
			}
			function servermodedisplay()
			{
			    var auto = document.DDNS_form.server_mode[0].checked;
			    with (document.DDNS_form)
			    {
				if(auto)
				{
				    document.getElementById("Server_auto").style.display="";
				    document.getElementById("Server_manu").style.display="none";
				    document.getElementById("Service_type").style.display="none";	// ONT-583
				}
				else
				{
				    document.getElementById("Server_auto").style.display="none";
				    document.getElementById("Server_manu").style.display="";
				    document.getElementById("Service_type").style.display="";	// ONT-583
				}
			    }
			}
			function ddnsSwitch(on_off)
			{
				if(document.getElementById('Enable_DyDNS').checked == false)
				{
				    //document.DDNS_form.elements[3].disabled = true;
				    //document.getElementById("ddns_interface").parentElement.classList.add("select-disable");
				    document.getElementById("DyDNSModeAuto").disabled = true;
				    document.getElementById("DyDNSModeManu").disabled = true;
				    document.getElementById("Serprovidermanu").disabled = true;
				    document.getElementById("Serproviderauto").parentElement.classList.add("select-disable");				
					document.getElementById("MyHostName").disabled = true;
					document.getElementById("Username").disabled = true;
					document.getElementById("Password").disabled = true;
					document.getElementById("YesWildcard").disabled = true;
					document.getElementById("NoWildcard").disabled = true;
					document.getElementById('apply_button').disabled = false;
					$('#ddns_content').hide();
					$('#no_available_wan').hide();
				    //for(i = 4; i < 11; i++)
					//document.DDNS_form.elements[i].disabled = true;
				}
				else
				{
					//document.getElementById("ddns_interface").parentElement.classList.remove("select-disable");
					document.getElementById("DyDNSModeAuto").disabled = false;
					document.getElementById("DyDNSModeManu").disabled = false;
					document.getElementById("Serprovidermanu").disabled = false;
					document.getElementById("Serproviderauto").parentElement.classList.remove("select-disable");
					document.getElementById("MyHostName").disabled = false;
					document.getElementById("Username").disabled = false;
					document.getElementById("Password").disabled = false;
					document.getElementById("YesWildcard").disabled = false;
					document.getElementById("NoWildcard").disabled = false;
					document.getElementById('apply_button').disabled = false;
					$('#ddns_content').show();
					$('#no_available_wan').hide();
					//document.DDNS_form.elements[2].disabled = false;
					//document.DDNS_form.elements[3].disabled = false;
					//for(i = 4; i < 12; i++)
					//document.DDNS_form.elements[i].disabled = false;
				}
				 servermodedisplay();
			}
			function checkSubmit()
			{
				if(document.getElementById("Enable_DyDNS").checked)
				{
					if (document.DDNS_form.server_mode[1].checked) {
						if(document.getElementById("Serprovidermanu").value.length == 0) 
						{
							alert('<%tcWebApi_get("String_Entry","DDNSMissingField","s")%>');
							document.getElementById("Serprovidermanu").focus();
							return false;
						}
						if(invalidCharCheck(document.getElementById("Serprovidermanu")) ) 
						{
							return false;
						}
						if(!isValidHostName(document.getElementById("Serprovidermanu").value) ) 
						{
							alert('<%tcWebApi_get("String_Entry","DDNSServiceProvider","s")%> <%tcWebApi_get("String_Entry","DDNSInvalid","s")%>')
							return false;
						}
					}
					for(i = 10; i <= 11; i++)
					{
						if(document.DDNS_form.elements[i].value.length == 0)
						{
							alert('<%tcWebApi_get("String_Entry","DDNSMissingField","s")%>');
							document.DDNS_form.elements[i].focus();
							return false;
						}
					}
					if(invalidCharCheck(document.DDNS_form.sysDNSHost) ) 
					{
						return false;
					}
					if (!isValidHostName(document.DDNS_form.sysDNSHost.value) ) 
					{
						alert('<%tcWebApi_get("String_Entry","DDNSHostName","s")%> <%tcWebApi_get("String_Entry","DDNSInvalid","s")%>')
						return false;
					}
					if(invalidCharCheck(document.DDNS_form.sysDNSUser) ) 
					{
						return false;
					}
					if(invalidCharCheck(document.DDNS_form.sysDNSPassword) ) 
					{
						return false;
					}
				}
				document.DDNS_form.SaveFlag.value = 1;
				submitAsync("DDNS_form");
			}
			function invalidCharCheck(object)
			{
				var len = object.value.length;
				var c;
				var i;
			    for (i = 0; i < len; i++)
			    {
				 	 var c = object.value.charAt(i);
				 	 if (c == '"' || c == ':' || c == '&' || c == '\'' || c == '(' || c== ')' || c==';' || c=='`' || c =='|' || c=='\\')
					 {
							alert('<%tcWebApi_get("String_Entry","DDNSInvalidCharacter","s")%>');      	  								    	    	   		
					 		return true;
					 }
			    }
				return false;
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
			// Checking condition: type = INTERNET, Active = Yes, Enable Nat 
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
			if (interface) {
				$("#ddns_interface_text").html(interface);
				$("#ddns_interface_text").show();
				$("#nat_enable_div").show();
				$("#apply_button").show();
				return 1;
			}
			else {
				/* No suitable interface for DDNS */
				$("#ddns_interface_text").html("<%tcWebApi_get("String_Entry","NatDMZNoInterfaceText","s")%>");
				$("#ddns_interface_text").show();
				return 0;
			}
			}
			/*ONT-733*/
			function onloadCheck()
			{
				$.ajax({
	   				url: "/cgi-bin/apps-ddns.cgi",
	   				method: 'GET', 
	   				complete: function(res){
	       				try 
	       				{ 
	       					var obj = JSON.parse(res.responseText);
		   					document.getElementById('status_ddns').innerHTML = obj.status + " \/ " + obj.time;
		   				}
		   				catch(err){ }
	        		}
	    		})
	   			refresh();
	   		}
			function refresh(){
				self.setTimeout("onloadCheck();", 2000)
			}
			function doLoad()
			{
				/* ONTW-244 */
				//doRemoveOptions(arPVCWebStatus, "Yes", "ddns_interface");
				if (!displayInterface())
				{
				//	return;
				}
				if (document.getElementById('Enable_DyDNS').checked) {
					ddnsSwitch(1);
				} else {
					ddnsSwitch(0);
				}
				/*if(document.DDNS_form.sysDNSPassword != null)
					document.DDNS_form.sysDNSPassword.value = ddnsPwd;*/
				/*ONT-733*/
				<% If TCWebApi_get("Ddns_Entry","Active","h") = "Yes" then %>
					refresh();
				<% end if %> 
			}
			function isValidHostName(addr)
			{
				var pattern1=/(?=^.{4,253}$)(^((?!-)[a-zA-Z0-9-]{0,62}[a-zA-Z0-9]\.)+[a-zA-Z]{2,63}$)/gm;
				var pattern2=/^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])$/gm;
				if (pattern1.test(addr))
					return true;
				else if (pattern2.test(addr))
					return true;
				else
					return false;
			}
	</script>
	<style>
			.custom_cb_table {
				padding-left:3rem;
			}
	</style>
</head>
<body class="container" onload="doLoad()">
<header class="fixed-top"><nav id="top-nav" class="navbar navbar-expand-lg container"><a class="navbar-brand " href="/cgi-bin/home.asp"><div><img src="/img/logo_home.png" width="100" height="18" alt=""><div style="font-family: sans-serif; font-weight: bold;font-size: 12px;color: #000; margin-top: 0">OPTICAL NETWORK TERMINATION</div></div></a><button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"><em class="fas fa-align-justify"></em></span></button><div class="collapse navbar-collapse" id="navbarCollapse"><ul class="navbar-nav mr-auto sidenav" id="navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/home.asp"><%tcWebApi_get("String_Entry","NavigationHomeText","s")%><span class="sr-only"></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/deviceinfo.asp"><%tcWebApi_get("String_Entry","NavigationStatusDeviceText","s")%><span class="sr-only"></span></a></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#status-menu" aria-controls="status-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NavigationStatusStatisticsText","s")%></a><ul class="nav-second-level collapse" id="status-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/sta-statistics.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationTrafficText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/sta-wifiusers.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationStatusUsersText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/sta-users.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","ARPStatusText","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#network-menu" aria-controls="network-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NAVNetwork","s")%></a><ul class="nav-second-level collapse" id="network-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/net-wan.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationBasInternetText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/net-lan.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationBasLANText","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#wifi-menu" aria-controls="wifi-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NAVWifi","s")%></a><ul class="nav-second-level collapse" id="wifi-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/wifi.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationWiFiSettingsText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/wifi-11ac.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationWiFi11acSettingsText","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#firewall-menu" aria-controls="firewall-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NavigationAdvFirewallText","s")%></a><ul class="nav-second-level collapse" id="firewall-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-spi.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","ContentFirewallText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-urlfilter.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","FILTERTYPE_index2","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-macfilter.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVL2Filter","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-parentalcontrol.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","ParentalControlText","s")%></span></a></li></ul></li><li class="nav-item active"><a class="nav-link nav-link-collapse nav-link-show" href="#" id="hasSubItems" data-toggle="collapse" data-target="#apps-menu" aria-controls="apps-menu" aria-expanded="true"><%tcWebApi_get("String_Entry","NAVApplication","s")%></a><ul class="nav-second-level show" id="apps-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-dmz.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NatTopDMZText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-portforwarding.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NatVirsvrText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-sslim.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","SessionLimit","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-route.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","StaticRouteText","s")%></span></a></li><li class="nav-item active"><a class="nav-link" href="/cgi-bin/apps-ddns.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","dyDNS1Text","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#tools-menu" aria-controls="tools-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NavigationMaintenanceText","s")%></a><ul class="nav-second-level collapse" id="tools-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-admin.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationMainAdminText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-time.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVSysTime","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-firmware.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationMainFirmwareText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-config.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVConfig","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-diagnostic.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationMainDiagnosticsText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-log.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVLogs","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-reboot.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","RebootText","s")%></span></a></li></ul></li></ul><div class="top-item-groups"><form name="LanguageForm" method="POST" action="/cgi-bin/apps-ddns.asp" class="nav-item dropdown"><input type="hidden" name="TokenString" value="<%tcWebApi_getToken()%>"><input type="hidden" name="Language_Flag" value="<% tcWebApi_get("LanguageSwitch_Entry","Type","s") %>"><a class="nav-link dropdown-toggle" href="#" id="LanguageDropdown" role="button" data-toggle="dropdown" aria-expanded="false"><% tcWebApi_get("String_Entry","LoginLanguage","s") %></a><ul class="dropdown-menu" aria-labelledby="LanguageDropdown"><li><a class="dropdown-item <% if tcWebApi_get("LanguageSwitch_Entry","Type","h") = "1" then asp_Write("active") end if %>" href="#" onclick="submitLanguageForm(1);"><% tcWebApi_get("String_Entry","LanguageVIELong","s") %></a></li><li><a class="dropdown-item <% if tcWebApi_get("LanguageSwitch_Entry","Type","h") = "2" then asp_Write("active") end if %>" href="#" onclick="submitLanguageForm(2);"><% tcWebApi_get("String_Entry","LanguageENGLong","s") %></a></li></ul></form><div id="signout" class="nav-item"><a class="nav-link" href="javascript:doLogout();"><em class="fa fa-sign-out-alt"></em><span class="nav-link-text"><% tcWebApi_get("String_Entry","LogoutText","s") %></span></a></div></div></div></header></nav><% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then
	if tcWebApi_get("Mesh_Common", "DeviceRole", "h") = "2" then %>
		<script language='javascript'>
		document.getElementById("wifi-menu").children[0].style="display: none";
		document.getElementById("wifi-menu").children[1].style="display: none";
		</script>
<% end if end if %>		<!-- #MAIN PANEL -->
<!-- MAIN CONTENT -->
	<div id="content">
		<form class="form-inline" METHOD="POST" ACTION="/cgi-bin/apps-ddns.asp" name="DDNS_form">
			<INPUT TYPE="HIDDEN" NAME="TokenString" VALUE="<%tcWebApi_getToken()%>">
			<div class="row row-w-100">
				<div class="widget col-xs-12 col-lg-12">
					<header><%tcWebApi_get("String_Entry","DDNS","s")%></header> 
					<div id="note">
						<script>
						function toggle_help_text() {
							if ($(".info-popup").css("display") == "none") {
								$(".info-popup").show();
							}
							else {
							$(".info-popup").hide();
							}
						}
						</script>
						<div id="top-info" class="top-info" >
							<a href="#" onclick="toggle_help_text()"><i class="fa fa-question-circle"></i></a>
							<div class="info-popup" style="display:none">
								<div class="arraw">
									<iframe src ="<% if tcwebApi_get("LanguageSwitch_Entry", "Type", "h") = "1" then %>/help/help_ddns_vn.html<% else %>/help/help_ddns_en.html<%end if %>" class="help-frame"></iframe>
									<a id="see-mor-instruction" href="#" onclick="toggle_help_text();"><%tcWebApi_get("String_Entry","DDNSHide","s")%></a>
								</div>
							</div>
						</div>
					</div>
				<!--Dynamic DNS active-->
					<div class="widget-body">
						<div class="form-group">
							<label class="col-xs-12 col-sm-4 control-label" for=""><%tcWebApi_get("String_Entry","DDNSInterface","s")%></label>
							<label class="col-xs-12 col-sm-6 control-label text-label inline-text" id="ddns_interface_text"></label>
							<input type="hidden" id="ddns_interface" name="ddns_interface" value="N/A">
						</div> 
						<div class="form-group">
							<label class="col-xs-12 col-sm-4 control-label"><%tcWebApi_get("String_Entry","DDNS","s")%></label>
						<!--	<div class="col-xs-4 col-sm-2 radio-container">
								<input type="radio" name="Enable_DyDNS" id="Enable_DyDNS" VALUE="Yes" <% If TCWebApi_get("Ddns_Entry","Active","h") = "Yes" then asp_Write("checked") end if%> onclick="ddnsSwitch(1)">
								<label for="Enable_DyDNS"><%tcWebApi_get("String_Entry","DDNSActivated","s")%></label> 
							</div>
							<div class="col-xs-4 col-sm-2 radio-container">
								<input type="radio" name="Enable_DyDNS" id="Disable_DyDNS" VALUE="No" <% If TCWebApi_get("Ddns_Entry","Active","h") = "No" then asp_Write("checked") end if%> onclick="ddnsSwitch(0)">
								<label for="Disable_DyDNS"><%tcWebApi_get("String_Entry","DDNSDeactivated","s")%></label> 
							</div> -->
							<label class="toggle-switch">
								<input type="checkbox" name="Enable_DyDNS" id="Enable_DyDNS" value="1" <% If TCWebApi_get("Ddns_Entry","Active","h") = "Yes" then asp_Write("checked") end if%> onclick="ddnsSwitch()">
								<span class="slider"></span>
							</label>
						</div>
						<!--Notification if no available wan
						<div id="no_available_wan">
							<div class="form-group">
								<label class="col-xs-12 col-sm-4 control-label"></label>
								<label class="col-xs-12 col-sm-6 control-label" style="text-align: left;">
										<%tcWebApi_get("String_Entry","DDNSNoWan","s")%>
								</label>
							</div>
						</div> -->
						<!--Notification if no available wan-->
						<!--Dynamic DNS active-->
						<div id="ddns_content" style="display: none">
							<!--Interface-->
							<!-- DDNS mode  -->
							<!-- ONT-733 remove service mode: default automatically-->
							<div class="form-group hidden" style="display:none;">
								<label class="col-xs-12 col-sm-4 control-label"><%tcWebApi_get("String_Entry","DDNSServiceMode","s")%></label>
								<div class="col-xs-4 col-sm-2 radio-container">
									<input type="radio" name="server_mode" id="DyDNSModeAuto" VALUE="Yes"  <%If TCWebApi_get("Ddns_Entry","ServerMode","h") = "Yes" then asp_Write("checked") end if%> onclick="servermodechange()">
									<label for="DyDNSModeAuto"><%tcWebApi_get("String_Entry","DDNSAuto","s")%></label> 
								</div>
								<div class="col-xs-4 col-sm-2 radio-container">
									<input type="radio" name="server_mode" id="DyDNSModeManu" VALUE="No" <% If TCWebApi_get("Ddns_Entry","ServerMode","h") = "No" then asp_Write("checked") end if%> onclick="servermodechange()">
									<label for="DyDNSModeManu"><%tcWebApi_get("String_Entry","DDNSManual","s")%></label> 
								</div>
							</div>
							<!--DDNS mode -->
							<!-- ONT-583 -->
							<div class="form-group" id="Service_type">
								<label class="col-xs-12 col-sm-4 control-label"><%tcWebApi_get("String_Entry","DDNSServiceType","s")%></label>
								<div class="col-xs-12 col-sm-4 custom-select>
									<select SIZE="1" NAME="service_type" id="ddns_servicetype">
										<option value="ezip" <% if tcWebApi_get("Ddns_Entry","SERVICETYPE","h") = "ezip" then asp_Write("selected") end if %>>ezip
										<option value="pgpow" <% if tcWebApi_get("Ddns_Entry","SERVICETYPE","h") = "pgpow" then asp_Write("selected") end if %>>pgpow
										<option value="dhs" <% if tcWebApi_get("Ddns_Entry","SERVICETYPE","h") = "dhs" then asp_Write("selected") end if %>>dhs
										<option value="dyndns" <% if tcWebApi_get("Ddns_Entry","SERVICETYPE","h") = "dyndns" then asp_Write("selected") end if %>>dyndns
										<option value="dyndns-static" <% if tcWebApi_get("Ddns_Entry","SERVICETYPE","h") = "dyndns-static" then asp_Write("selected") end if %>>dyndns-static
										<option value="dyndns-custom" <% if tcWebApi_get("Ddns_Entry","SERVICETYPE","h") = "dyndns-custom" then asp_Write("selected") end if %>>dyndns-custom
										<option value="ods" <% if tcWebApi_get("Ddns_Entry","SERVICETYPE","h") = "ods" then asp_Write("selected") end if %>>ods
										<option value="tzo" <% if tcWebApi_get("Ddns_Entry","SERVICETYPE","h") = "tzo" then asp_Write("selected") end if %>>tzo
										<option value="gnudip" <% if tcWebApi_get("Ddns_Entry","SERVICETYPE","h") = "gnudip" then asp_Write("selected") end if %>>gnudip
										<option value="easydns" <% if tcWebApi_get("Ddns_Entry","SERVICETYPE","h") = "easydns" then asp_Write("selected") end if %>>easydns
										<option value="justlinux" <% if tcWebApi_get("Ddns_Entry","SERVICETYPE","h") = "justlinux" then asp_Write("selected") end if %>>justlinux
										<option value="dyns" <% if tcWebApi_get("Ddns_Entry","SERVICETYPE","h") = "dyns" then asp_Write("selected") end if %>>dyns
										<option value="hn" <% if tcWebApi_get("Ddns_Entry","SERVICETYPE","h") = "hn" then asp_Write("selected") end if %>>hn
										<option value="zoneedit" <% if tcWebApi_get("Ddns_Entry","SERVICETYPE","h") = "zoneedit" then asp_Write("selected") end if %>>zoneedit
										<option value="heipv6tb" <% if tcWebApi_get("Ddns_Entry","SERVICETYPE","h") = "heipv6tb" then asp_Write("selected") end if %>>heipv6tb
										<!--ONT-637-->
										<option value="vddns" <% if tcWebApi_get("Ddns_Entry","SERVICETYPE","h") = "vddns" then asp_Write("selected") end if %>>vddns
										<!-- ECONET-1305 END-->
									</select>
								</div>
							</div>
							<!--Service provider/menu manual-->
							<div class="form-group" id="Server_manu">
								<label class="col-xs-12 col-sm-4 control-label"><%tcWebApi_get("String_Entry","DDNSService","s")%></label>
								<div class="col-sm-4 inputGroupContainer">
									<INPUT class="form-control" type="text" NAME="server_manu" SIZE="32" MAXLENGTH="64" VALUE="<% If tcWebApi_get("Ddns_Entry","SERVERNAME","h") <> "N/A" then tcWebApi_get("Ddns_Entry","SERVERNAME","s") end if%>" id="Serprovidermanu">   
								</div>
							</div>
							<!--Service provider/menu manual-->
							<!--Service provider/menu auto-->
							<div class="form-group" id="Server_auto">
								<label class="col-xs-12 col-sm-4 control-label"><%tcWebApi_get("String_Entry","DDNSServiceProvider","s")%></label>
								<div class="col-xs-12 col-sm-4 custom-select">
									<select SIZE="1" NAME="ddns_ServerName" id="Serproviderauto">
										<!-- ECONET-1305 START-->
										<!-- Removed legacy ddns server list. 
										<option value="www.dyndns.org" <% if tcWebApi_get("Ddns_Entry","SERVERNAME","h") = "www.dyndns.org" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","DDNSWebsite","s")%>
										<option value="www.tzo.net" <% if tcWebApi_get("Ddns_Entry","SERVERNAME","h") = "www.tzo.net" then asp_Write("selected") end if %>>www.tzo.net
										<option value="www.zoneedit.com" <% if tcWebApi_get("Ddns_Entry","SERVERNAME","h") = "www.zoneedit.com" then asp_Write("selected") end if %>>www.zoneedit.com
										<option value="www.dhs.org" <% if tcWebApi_get("Ddns_Entry","SERVERNAME","h") = "www.dhs.org" then asp_Write("selected") end if %>>www.dhs.org
											<%if tcWebApi_get("WebCustom_Entry","isC2TrueSupported","h") <> "Yes" then%>
										<option value="www.hn.org" <% if tcWebApi_get("Ddns_Entry","SERVERNAME","h") = "www.hn.org" then asp_Write("selected") end if %>>www.hn.org
										<option value="www.ez-ip.net" <% if tcWebApi_get("Ddns_Entry","SERVERNAME","h") = "www.ez-ip.net" then asp_Write("selected") end if %>>www.ez-ip.net
											<% end if %>
										<option value="www.easydns.com" <% if tcWebApi_get("Ddns_Entry","SERVERNAME","h") = "www.easydns.com" then asp_Write("selected") end if %>>www.easydns.com
											<%if tcWebApi_get("WebCustom_Entry","isNOIPSupported","h") = "Yes" then%>
										<option value="www.no-ip.net" <% if tcWebApi_get("Ddns_Entry","SERVERNAME","h") = "www.no-ip.com" then asp_Write("selected") end if %>>www.no-ip.com
											<% end if %>
										Added ddns server list from H640 ddns_list.conf-->
										<option value="www.dyndns.org" <% if tcWebApi_get("Ddns_Entry","SERVERNAME","h") = "www.dyndns.org" then asp_Write("selected") end if %>>www.dyndns.org
										<!--ONT-773 remove unsupported service provider
										<option value="www.ods.org" <% if tcWebApi_get("Ddns_Entry","SERVERNAME","h") = "www.ods.org" then asp_Write("selected") end if %>>www.ods.org
										<option value="www.easydns.com" <% if tcWebApi_get("Ddns_Entry","SERVERNAME","h") = "www.easydns.com" then asp_Write("selected") end if %>>www.easydns.com
										<option value="www.zoneedit.com" <% if tcWebApi_get("Ddns_Entry","SERVERNAME","h") = "www.zoneedit.com" then asp_Write("selected") end if %>>www.zoneedit.com 
										-->
										<option value="www.no-ip.com" <% if tcWebApi_get("Ddns_Entry","SERVERNAME","h") = "www.no-ip.com" then asp_Write("selected") end if %>>www.no-ip.com
										<!--<option value="www.vddns.vn" <% if tcWebApi_get("Ddns_Entry","SERVERNAME","h") = "www.vddns.vn" then asp_Write("selected") end if %>>www.vddns.vn-->
										<!-- ECONET-1305 END-->
									</select>
								</div>
							</div>
							<!--Service provider/menu auto-->
							<!--My host name-->
							<div class="form-group">
								<label class="col-xs-12 col-sm-4 control-label"><%tcWebApi_get("String_Entry","DDNSHostName","s")%></label>
								<INPUT class="col-sm-4 form-control" type="text" NAME="sysDNSHost" SIZE="32" MAXLENGTH="64" VALUE="<% If TCWebApi_get("Ddns_Entry","MYHOST","h") <> "N/A" then TCWebApi_get("Ddns_Entry","MYHOST","s") end if%>" id="MyHostName">   
							</div>
							<!--My host name-->
							<!--User name-->
							<div class="form-group">
								<label class="col-xs-12 col-sm-4 control-label"><%tcWebApi_get("String_Entry","DDNSUsername","s")%></label>
								<INPUT class="col-sm-4 form-control" type="text" NAME="sysDNSUser" MAXLENGTH="32" VALUE="<% If TCWebApi_get("Ddns_Entry","USERNAME","h") <> "N/A" then TCWebApi_get("Ddns_Entry","USERNAME","s") end if%>" id="Username">   
							</div>
							<!--User name-->
							<!--Password-->
							<div class="form-group">
								<label class="col-xs-12 col-sm-4 control-label"><%tcWebApi_get("String_Entry","DDNSPassword","s")%></label>
								<INPUT class="col-sm-4 form-control" TYPE="PASSWORD" NAME="sysDNSPassword" MAXLENGTH="32" id="Password" VALUE="<%If TCWebApi_get("Ddns_Entry","PASSWORD","h") <> "N/A" then TCWebApi_get("Ddns_Entry","PASSWORD","s") end if%>">   
							</div>
							<!--Password-->
							<!--Wildcard-->
							<!-- ONT-733 remove wildcard: default wildcard NO-->
							<div class="form-group hidden" style="display:none;">
								<label class="col-xs-12 col-sm-4 control-label"><%tcWebApi_get("String_Entry","DDNSWildcard","s")%></label>
								<div class="col-xs-4 col-sm-2 radio-container">
									<input type="radio" name="Enable_Wildcard" id="YesWildcard" VALUE="Yes"  <% If TCWebApi_get("Ddns_Entry","WILDCARD","h") = "Yes" then asp_Write("checked") end if%>>
									<label for="YesWildcard"><%tcWebApi_get("String_Entry","DDNSYes","s")%></label> 
								</div>
								<div class="col-xs-4 col-sm-2 radio-container">
									<input type="radio" name="Enable_Wildcard" id="NoWildcard" VALUE="No" <% If TCWebApi_get("Ddns_Entry","WILDCARD","h") = "No" then asp_Write("checked") end if%> >
									<label for="NoWildcard"><%tcWebApi_get("String_Entry","DDNSNo","s")%></label> 
								</div>
							</div>
							<!--Wildcard-->
							<!--Status-->
							<div class="form-group">
								<label class="col-xs-12 col-sm-4 control-label"><%tcWebApi_get("String_Entry","DDNSStatus","s")%></label>
								<label class="col-xs-12 col-sm-6 control-label" style="text-align: left;" id="status_ddns">
									<% If TCWebApi_get("Ddns_Entry","Active","h") = "No" then %>
											<%tcWebApi_get("String_Entry","DDNSUnconfigred","s")%>
										<% else %>
											<%tcWebApi_get("Ddns_Entry","ConnStatus","s")%> / <%tcWebApi_get("Ddns_Entry","lastUpdateTime","s")%>
										<% end if %>   
								</label>
							</div>
							<!--Status-->										
							<!--Save flag-->
							<INPUT TYPE="HIDDEN" NAME="SaveFlag" VALUE="0">
							<!--Save flag-->
						</div>
					</div>
				</div>
			</div>
		</form>
		<div class="col-lg-12 d-flex align-items-center justify-content-center">
			<button type="button" class="page-button small-button" onclick=" return checkSubmit()" name="apply_button" id= "apply_button"><%tcWebApi_get("String_Entry","ButtonApplyText","s")%></button>
		</div>														
	</div>
	<!-- END #MAIN PANEL -->
		<footer>
			<p><%tcWebApi_get("String_Entry","SaleConsultantText","s")%>: <a href="tel:18008168">18008168</a></p>
			<p><%tcWebApi_get("String_Entry","ReportProblemText","s")%>: <a href="tel:18008119">18008119</a></p>
			<p>&copy; 2021 by VHT. All rights reserved.</p>
		</footer>
		<script language='javascript' src='/JS/user.js'></script></body>
</html>
