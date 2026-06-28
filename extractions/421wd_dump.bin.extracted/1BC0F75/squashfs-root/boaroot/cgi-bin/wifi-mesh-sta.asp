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
<title><%tcWebApi_get("String_Entry","BranchName","s")%> ONT - <%tcWebApi_get("String_Entry","EasyMeshStatus5Text","s")%></title>		<meta charset="utf-8">
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
			<% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then %>
			var get_device_role_timer_id;
			var get_al_mac_timer_id;
			var get_sta_steering_progress_timer_id;
			var get_bh_connection_status_timer_id;
			<% end if %>
			function JSO_Only_Status(staType)
			{
					var ret = ' { ' + 
						'"status": "' + staType + '"' + 
						' } ';
					return ret;
			}
			function JSO_get_apply_status()
			{
					var staType = 'DONE';
					var webstate = "<% tcWebApi_get("Mesh_action","map_action_complete","s") %>";
					if(1 == webstate)
					{
							staType = 'ON_PROGRESS';
					}
					else
					{
							staType = 'DONE';
					}
					var ret = JSO_Only_Status(staType);
					return ret;
			}
			function JSO_get_device_role()
			{
					var ret = '';
					var mapDevRole = "<% tcWebApi_get("Mesh_common","DeviceRole","s") %>";
			<% if mapDevRole <> "N/A" then %>
					ret = '{ ';
					ret = ret +	'"mapDevRole": "' + mapDevRole + '"';
					ret = ret + ' }';
			<% end if %>
					return ret;
			}
			function JSO_get_al_mac()
			{
					var ret = '';
					var al_mac = '';
					al_mac = "<% tcWebApi_get("Mesh_mapcfg","AL-MAC","s") %>";
			<% if al_mac <> "N/A" then %>
					ret = ' { ';
					ret = ret + '"status": "SUCCESS",';
					ret = ret + '"al_mac": "' + al_mac + '"';
					ret = ret + ' } ';
			<% end if %>
					return ret;
			}
			function JSO_get_sta_steering_progress()
			{
				<% if tcWebApi_get("Mesh_Common","DeviceRole","h") = "2"  then %>
				var ret = "<% tcWebApi_MeshJsonHook("mesh_get_sta_steering_progress") %>";
				<% end if %>
				return ret;
			}
			function JSO_get_sta_bh_interface()
			{
				<% if tcWebApi_get("Mesh_Common","DeviceRole","h") = "2"  then %>
				var ret = "<% tcWebApi_MeshJsonHook("mesh_get_sta_bh_interface") %>";
				<% end if %>
				return ret;
			}
			function getX_Response(type)
			{
					var X_Res='';
					try
					{
							switch(type)
							{
									case "get_apply_status":
										X_Res = JSO_get_apply_status();
										break;
									case "get_device_role":
										X_Res = JSO_get_device_role();
										break;
									case "get_al_mac":
							X_Res = JSO_get_al_mac();
							break;
						case "get_sta_steering_progress":
							X_Res = JSO_get_sta_steering_progress();
							break;
						case "get_sta_bh_interface":
							X_Res = JSO_get_sta_bh_interface();
										break;
									default:
										break;
							}
					}
					catch(e)
					{
							X_Res='';
					}
					return X_Res;
			}
			<% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then %>
			function clearAllTimers()
			{
					clearTimeout(get_device_role_timer_id);
					get_device_role_timer_id = null;
					clearTimeout(get_al_mac_timer_id);
					get_al_mac_timer_id = null;
				<% if tcWebApi_get("Mesh_common", "DeviceRole", "h") = "2" then %>
					clearTimeout(get_sta_steering_progress_timer_id);
					get_sta_steering_progress_timer_id = null;
					clearTimeout(get_bh_connection_status_timer_id);
					get_bh_connection_status_timer_id = null;
				<% end if %>
					clearTimeout(get_apply_status);
			}
			function getDeviceRole()
			{
					var XHR_type = 'get_device_role';
					var x_response = getX_Response(XHR_type);
					{
							try
							{
									var devRoleObj = JSON.parse(x_response);
									var devRole = parseInt(devRoleObj.mapDevRole);
									if(isNaN(devRole))
									{
											console.log("Incorrect Device Role",devRole);
											devRole = 0;
									}
									switch(devRole)
									{
											case 0: // Auto
													document.getElementById("map-cfg-tab-adv").style.display = "none";
													document.getElementById("map-cfg-tab-adv-pel").style.display = "none";
													document.getElementById("map-cfg-tab-action").style.display = "none";
													document.getElementById("map-cfg-tab-action-pel").style.display = "none";
													document.getElementById("map-cfg-tab-status").style.display = "none";
													document.getElementById("map-cfg-tab-status-pel").style.display = "none";
													document.getElementById("map-cfg-status").style.display = "none";
													document.getElementById("map-cfg-status-sta-steering-progress").style.display = "none";
													clearTimeout(get_device_role_timer_id);
													get_device_role_timer_id = null;
													if(document.getElementById("__activeTab").value == "basic")
													{
															get_device_role_timer_id = setTimeout(getDeviceRole, 1000);
													}
													break;
											case 1: // Controller
													document.getElementById("map-cfg-tab-adv").style.display = "";
													document.getElementById("map-cfg-tab-adv-pel").style.display = "";
													document.getElementById("map-cfg-tab-action").style.display = "";
													document.getElementById("map-cfg-tab-action-pel").style.display = "";
													document.getElementById("map-cfg-tab-status").style.display = "";
													document.getElementById("map-cfg-tab-status-pel").style.display = "";
													document.getElementById("map-cfg-status").style.display = "";
													document.getElementById("map-cfg-status-sta-steering-progress").style.display = "none";
													break;
											case 2: // Agent
													document.getElementById("map-cfg-tab-adv").style.display = "none";
													document.getElementById("map-cfg-tab-adv-pel").style.display = "none";
													document.getElementById("map-cfg-tab-action").style.display = "";
													document.getElementById("map-cfg-tab-action-pel").style.display = "";
													document.getElementById("map-cfg-tab-status").style.display = "";
													document.getElementById("map-cfg-tab-status-pel").style.display = "";
													document.getElementById("map-cfg-status").style.display = "";
													document.getElementById("map-cfg-status-sta-steering-progress").style.display = "";
													break;
											default:
													console.log("Invalid device role received: ",devRole);
													break;
									}
							}
							catch(e)
							{
									console.log("Incorrect response received for get device role request!");
									clearTimeout(get_device_role_timer_id);
									get_device_role_timer_id = null;
									if(document.getElementById("__activeTab").value == "basic")
									{
											get_device_role_timer_id = setTimeout(getDeviceRole, 5000);
									}
							}
					}
			}
			function getAlMac()
			{
				var XHR_type = '';
				XHR_type = 'get_al_mac';
					var x_response = getX_Response(XHR_type);
					{
							try
							{
									var r = JSON.parse(x_response);
									var mac_reg_exp = /[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}/;
									if (r['status'] == "SUCCESS" && mac_reg_exp.test(r['al_mac'])) 
									{
											document.getElementById("al_mac").innerHTML = r['al_mac'];
									}
									else
									{
											console.log("Incorrect AL-MAC received!",r['status'],r['al_mac']);
							if(document.getElementById("__activeTab").value == "status")
											{
													get_al_mac_timer_id = setTimeout(getAlMac,1000);
											}
									}
							}
							catch(e)
							{
									console.log("Incorrect response received for get AL-MAC request!");
						if(document.getElementById("__activeTab").value == "status")
									{
											get_al_mac_timer_id = setTimeout(getAlMac,1000);
									}
							}
					}
			}
			function displayRuntimeTopology()
			{
					var dev_role = "<% tcWebApi_get("Mesh_dat","MapEnable","s") %>";
					if(dev_role != "0" && dev_role != "1")
					{
							alert("Device Role is not configured yet!\nPlease configure the Device Role.");
							return;
					}
					location.href = '/cgi-bin/wifi-mesh-sta-runtime-topo.asp';
			}
			function dispFhStatusBss()
			{
					location.href = '/cgi-bin/wifi-mesh-sta-bssinfo.asp';
			}
			function dispBhLinkMetricsCtrler()
			{
							location.href = '/cgi-bin/wifi-mesh-sta-bh-link-metrics.asp';
			}
			function displayClientCapabilities()
			{
							location.href = '/cgi-bin/wifi-mesh-sta-client-cap.asp';
			}
			function displayApCapabilities()
			{
							location.href = '/cgi-bin/wifi-mesh-sta-ap-cap.asp';
			}
			function get_sta_steering_progress()
			{
				var XHR_type = 'get_sta_steering_progress';
				var x_response = getX_Response(XHR_type);
				{
					try
					{
						var rsp = JSON.parse(x_response);
						if(rsp.status == "SUCCESS")
						{
							document.getElementById("sta-steering-progress").innerHTML = rsp['sta_steering_info'];
						}
						else
						{
							console.log("Failed to get STA Steering Progress!\nStatus: ",rsp.status);
						}
						if(document.getElementById("__activeTab").value == "status")
						{
							get_sta_steering_progress_timer_id = setTimeout(checkWebStatus, 5000);
						}
					}
					catch(e)
					{
						console.log("Incorrect response!\nFailed to get STA Steering Progress!");
						if(document.getElementById("__activeTab").value == "status")
						{
							get_sta_steering_progress_timer_id = setTimeout(checkWebStatus, 5000);
						}
					}
				}
			}
			function get_sta_bh_interface()
			{
				var devRole =  "<% tcWebApi_get("Mesh_common","DeviceRole","s") %>";
				var staBhInfUl = document.getElementById("sta-bh-inf-ul");
				staBhInfUl.innerHTML = "";
				if((devRole == "Agent") || ("2" == devRole))
				{
					var XHR_type = 'get_sta_bh_interface';
						var x_response = getX_Response(XHR_type);
					{
						try
						{
							var rsp = JSON.parse(x_response);
							if(rsp.status == "SUCCESS")
							{
								staBhInfUl.parentNode.parentNode.style.display = "";
								var sta_bh_inf_arr = rsp.staBhInfStr.split(";");
								for(var idx=0; idx < sta_bh_inf_arr.length; idx++)
								{
									if(sta_bh_inf_arr[idx] == "")
									{
										continue;
									}
									var l = document.createElement("LI");
									var t = document.createTextNode(sta_bh_inf_arr[idx]);
									l.appendChild(t);
									staBhInfUl.appendChild(l);
								}
							}
							else
							{
								console.log("Failed to get STA BH Interface!\nStatus: ",rsp.status);
								if(document.getElementById("__activeTab").value == "status")
								{
									setTimeout(checkWebStatus, 5000);
								}
							}
						}
						catch(e)
						{
							console.log("Incorrect response!\nFailed to get STA BH Interface!");
							if(document.getElementById("__activeTab").value == "status")
							{
								setTimeout(checkWebStatus, 5000);
							}
						}
					}
				}
				else
				{
					staBhInfUl.parentNode.parentNode.style.display = "none";
				}
			}
			function get_ap_bh_inf_list()
			{
					var apBhInfList = document.getElementById("ap-bh-inf-list-ul");
					apBhInfList.innerHTML = "";
					var x_response = "<% tcWebApi_MeshJsonHook("mesh_get_ap_bh_inf_list") %>";
					{
							try
							{
									var rsp = JSON.parse(x_response);
									if(rsp.status == "SUCCESS")
									{
											var ap_bh_inf_list_arr = rsp.apBhInfListStr.split(";");
											for(var idx=0; idx < ap_bh_inf_list_arr.length; idx++)
											{
													if(ap_bh_inf_list_arr[idx] == "")
													{
															continue;
													}
													var l = document.createElement("LI");
													var t = document.createTextNode(ap_bh_inf_list_arr[idx]);
													l.appendChild(t);
													apBhInfList.appendChild(l);
											}
									}
									else
									{
											console.log("Failed to get AP BH Interface list!\nStatus: ",rsp.status);
											if(document.getElementById("__activeTab").value == "status")
											{
													setTimeout(checkWebStatus, 5000);
											}
									}
							}
							catch(e)
							{
									console.log("Incorrect response!\nFailed to get AP BH Interface list!");
									if(document.getElementById("__activeTab").value == "status")
									{
											setTimeout(checkWebStatus, 5000);
									}
							}
					}
			}
			function get_ap_fh_inf_list()
			{
					var apFhInfList = document.getElementById("ap-fh-inf-list-ul");
					apFhInfList.innerHTML = "";
					var x_response = "<% tcWebApi_MeshJsonHook("mesh_get_ap_fh_inf_list") %>";
					{
							try
							{
									var rsp = JSON.parse(x_response);
									if(rsp.status == "SUCCESS")
									{
											var ap_fh_inf_list_arr = rsp.apFhInfListStr.split(";");
											for(var idx=0; idx < ap_fh_inf_list_arr.length; idx++)
											{
													if(ap_fh_inf_list_arr[idx] == "")
													{
															continue;
													}
													var l = document.createElement("LI");
													var t = document.createTextNode(ap_fh_inf_list_arr[idx]);
													l.appendChild(t);
													apFhInfList.appendChild(l);
											}
									}
									else
									{
											console.log("Failed to get AP FH Interface list!\nStatus: ",rsp.status);
											if(document.getElementById("__activeTab").value == "status")
											{
													setTimeout(checkWebStatus, 5000);
											}
									}
							}
							catch(e)
							{
									console.log("Incorrect response!\nFailed to get AP FH Interface list!");
									if(document.getElementById("__activeTab").value == "status")
									{
											setTimeout(checkWebStatus, 5000);
									}
							}
					}
			}
			<% end if %>/* Mesh_mapdcfg.MapEnable=1 */
			function hi_status()
			{
			<% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then %>
				clearAllTimers();
				getAlMac();
			<% if tcWebApi_get("Mesh_common", "DeviceRole", "h") = "2" then %>
				get_sta_steering_progress();
				get_sta_bh_interface();
			<% end if %>
				get_ap_bh_inf_list();
				get_ap_fh_inf_list();
			<% end if %>/* Mesh_mapdcfg.MapEnable=1 */
			}
			function checkWebStatus()
			{
					location.href = '/cgi-bin/wifi_multi_ap_status.asp';
			}
			function get_apply_status_cb(rsp)
			{
					clearTimeout(checkWebStatus);
					try
					{
							var r = JSON.parse(rsp);
					}
					catch(e)
					{
							return;
					}
					if(r.status == "ON_PROGRESS")
					{
							var altmsg ="Device is applying the saved settings now!\n" +
									"It is recommended to wait until all the saved settings are applied.\n";
							//alert(altmsg);
							document.getElementById('map_cfgs_loading_div').style.display = '';
							document.getElementById('BusyMsg').style.display = '';
							document.getElementById('LOADING_MULTI_AP').style.display = 'none';
							document.getElementById('MULTI_AP_SETTINGS').style.display = 'none';
							setTimeout(checkWebStatus, 5000);
					}
			}
			function get_apply_status()
			{
					var XHR_type = 'get_apply_status';
					var x_response = getX_Response(XHR_type);
					{
							get_apply_status_cb(x_response);
					}
			}
			function LoadMapFrame ()
			{
					get_apply_status();
			<% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then %>
				var deviceRole = "<% tcWebApi_get("Mesh_common","DeviceRole","s") %>";
					if(deviceRole == "")
					{
						deviceRole = "0";
					}
				if(deviceRole != "0")
				{
					getDeviceRole();
				}
				hi_status();
			<% end if %>/* Mesh_mapdcfg.MapEnable=1 */
			}
			function LoadFrame ()
			{
					var isl1datSupported = 1;
			<% if tcWebApi_get("globalstate_common", "wlanLoad", "h") = "0" then %>
					isl1datSupported = 0;
			<% end if %>
					if(isl1datSupported)
					{
							setDisplay('l1datNot',0);
							setDisplay('l1datYes',1);
			<% if tcWebApi_get("WLan_Common", "MultiSSIDConfigEnable", "h") = "Yes" then if tcWebApi_get("Mesh_dat", "MapEnable", "h") <> "N/A" then %>
							LoadMapFrame();
			<% end if end if %>
					}
					else
					{
							setDisplay('l1datNot',1);
							setDisplay('l1datYes',0);
					}
			}
		</script>
	</head>
	<body onload="LoadFrame();" class="container">
<header class="fixed-top"><nav id="top-nav" class="navbar navbar-expand-lg container"><a class="navbar-brand " href="/cgi-bin/home.asp"><div><img src="/img/logo_home.png" width="100" height="18" alt=""><div style="font-family: sans-serif; font-weight: bold;font-size: 12px;color: #000; margin-top: 0">OPTICAL NETWORK TERMINATION</div></div></a><button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"><em class="fas fa-align-justify"></em></span></button><div class="collapse navbar-collapse" id="navbarCollapse"><ul class="navbar-nav mr-auto sidenav" id="navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/home.asp"><%tcWebApi_get("String_Entry","NavigationHomeText","s")%><span class="sr-only"></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/deviceinfo.asp"><%tcWebApi_get("String_Entry","NavigationStatusDeviceText","s")%><span class="sr-only"></span></a></li><li class="nav-item active"><a class="nav-link" href="/cgi-bin/wifi-mesh-topology.asp"><%tcWebApi_get("String_Entry","EasyMeshStatus5Text","s")%><span class="sr-only">(current)</span></a></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#status-menu" aria-controls="status-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NavigationStatusStatisticsText","s")%></a><ul class="nav-second-level collapse" id="status-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/sta-statistics.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationTrafficText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/sta-wifiusers.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationStatusUsersText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/sta-users.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","ARPStatusText","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#network-menu" aria-controls="network-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NAVNetwork","s")%></a><ul class="nav-second-level collapse" id="network-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/net-wan.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationBasInternetText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/net-lan.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationBasLANText","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#wifi-menu" aria-controls="wifi-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NAVWifi","s")%></a><ul class="nav-second-level collapse" id="wifi-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/wifi.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationWiFiSettingsText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/wifi-11ac.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationWiFi11acSettingsText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/wifi-mesh.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationMesh","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#firewall-menu" aria-controls="firewall-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NavigationAdvFirewallText","s")%></a><ul class="nav-second-level collapse" id="firewall-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-spi.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","ContentFirewallText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-urlfilter.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","FILTERTYPE_index2","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-macfilter.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVL2Filter","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-parentalcontrol.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","ParentalControlText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/safehome.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","SafehomeText","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#apps-menu" aria-controls="apps-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NAVApplication","s")%></a><ul class="nav-second-level collapse" id="apps-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-dmz.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NatTopDMZText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-portforwarding.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NatVirsvrText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-sslim.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","SessionLimit","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-route.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","StaticRouteText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-ddns.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","dyDNS1Text","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-wifischeduling.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","WifiSchedulingText","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#tools-menu" aria-controls="tools-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NavigationMaintenanceText","s")%></a><ul class="nav-second-level collapse" id="tools-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-admin.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationMainAdminText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-time.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVSysTime","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-firmware.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationMainFirmwareText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-config.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVConfig","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-diagnostic.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationMainDiagnosticsText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-wan2lan.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","Wan2lanText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-log.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVLogs","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-reboot.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","RebootText","s")%></span></a></li></ul></li></ul><div class="top-item-groups"><form name="LanguageForm" method="POST" action="/cgi-bin/wifi-mesh-sta.asp" class="nav-item dropdown"><input type="hidden" name="TokenString" value="<%tcWebApi_getToken()%>"><input type="hidden" name="Language_Flag" value="<% tcWebApi_get("LanguageSwitch_Entry","Type","s") %>"><a class="nav-link dropdown-toggle" href="#" id="LanguageDropdown" role="button" data-toggle="dropdown" aria-expanded="false"><% tcWebApi_get("String_Entry","LoginLanguage","s") %></a><ul class="dropdown-menu" aria-labelledby="LanguageDropdown"><li><a class="dropdown-item <% if tcWebApi_get("LanguageSwitch_Entry","Type","h") = "1" then asp_Write("active") end if %>" href="#" onclick="submitLanguageForm(1);"><% tcWebApi_get("String_Entry","LanguageVIELong","s") %></a></li><li><a class="dropdown-item <% if tcWebApi_get("LanguageSwitch_Entry","Type","h") = "2" then asp_Write("active") end if %>" href="#" onclick="submitLanguageForm(2);"><% tcWebApi_get("String_Entry","LanguageENGLong","s") %></a></li></ul></form><div id="signout" class="nav-item"><a class="nav-link" href="javascript:doLogout();"><em class="fa fa-sign-out-alt"></em><span class="nav-link-text"><% tcWebApi_get("String_Entry","LogoutText","s") %></span></a></div></div></div></header></nav><% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then
	if tcWebApi_get("Mesh_Common", "DeviceRole", "h") = "2" then %>
		<script language='javascript'>
		document.getElementById("network-menu").children[0].style="display: none";
		document.getElementById("network-menu").children[1].style="display: none";
		document.getElementById("wifi-menu").children[0].style="display: none";
		document.getElementById("wifi-menu").children[1].style="display: none";
		</script>
<% end if end if %>		<div id="content">
		<form class="form-inline" method="post" name="cbi" action="/cgi-bin/wifi-mesh-sta.asp" onsubmit="return validate_all()" autocomplete="off">
		<input type="hidden" name="TokenString" value="<%tcWebApi_getToken()%>">
		<input type="hidden" name="__activeTab" id="__activeTab" value="basic">
		<input type="hidden" name="SaveAll_Flag" value="0" />
		<input type="hidden" name="Save_Flag" value="0" />
		<input type="hidden" name="Action_Flag" value="0" />
		<input type="hidden" name="resetToDefaultEasyMesh_Flag" value="0" />
		<input type="hidden" name="wifi_trigger_onboarding_Flag" value="0" />
		<input type="hidden" name="ether_trigger_onboarding_Flag" value="0" />
		<input type="hidden" name="MeshTriggerFlag" value="<% tcWebApi_get("Mesh_Common","MeshTriggerFlag","s") %>" />
		<input type="hidden" name="Change_Flag" value="0" />
		<div class="row row-w-100">
			<div class="widget col-xs-12 col-lg-12">
				<ul class="row ul-tab">
					<li class="tab tab-disabled">
						<a href="/cgi-bin/wifi-mesh.asp"><%tcWebApi_get("String_Entry","EasyMeshBasicTest","s")%></a>
					</li>
					<li class="tab tab-disabled d-none">
						<a href="/cgi-bin/wifi-mesh-adv.asp"><%tcWebApi_get("String_Entry","EasyMeshAdvancedTest","s")%></a>
					</li>
					<li class="tab tab-disabled d-none">
						<a href="/cgi-bin/wifi-mesh-act.asp"><%tcWebApi_get("String_Entry","EasyMeshActionTest","s")%></a>
					</li>
					<li class="tab">
						<a href="/cgi-bin/wifi-mesh-sta.asp"><%tcWebApi_get("String_Entry","EasyMeshStatusTest","s")%></a>
					</li>
				</ul>
				<div class="widget-body">
					<fieldset>
						<div id="l1datNot">
							<% if tcWebApi_get("globalstate_common", "wlanLoad", "h") = "0" then %>
							<fieldset class="cbi-section">
								<legend class="alert-message error">l1profile.dat file is not available!</legend>
							</fieldset>
							<% end if %>
						</div>
						<div id="l1datYes">
							<% if tcWebApi_get("WLan_Common", "MultiSSIDConfigEnable", "h") = "No" then %>
							<div id="isMapSupportedNo">
								<fieldset class="cbi-section">
									<legend class="alert-message error"><%tcWebApi_get("String_Entry","EasyMeshBasic13Test","s")%></legend>
								</fieldset>
							</div>
							<% else %>
							<div id="isMapSupportedYes">
								<% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "N/A" then %>
								<div id="isMapCfgSupportedNo">
									<fieldset class="cbi-section">
										<legend class="alert-message error"><%tcWebApi_get("String_Entry","EasyMeshBasic14Test","s")%></legend>
									</fieldset>
								</div>
								<% else %>
								<div id="isMapCfgSupportedYes">
									<div id="map_cfgs_loading_div" style="display: none">
										<div class="alert-message form-group" id="BusyMsg" style="display:none;">
											<img src="/img/loading.gif" alt="" style="vertical-align:middle" width=30px/>
											<div style="padding-left: 15px">
												<label><%tcWebApi_get("String_Entry","EasyMeshBasic15Test","s")%></label>
												<label>After about 2 minutes, manually refresh the page.
											</label>
											</div>
										</div>
									</div>
									<div class="alert-message" id="LOADING_MULTI_AP" style="display:none;">
										<img src="/img/loading.gif" alt="" style="vertical-align:middle" />
										<big><strong><%tcWebApi_get("String_Entry","EasyMeshBasic16Test","s")%></strong></big>
									</div>
									<div id="MULTI_AP_SETTINGS">
										<input type="hidden" name="__activeTab" id="__activeTab" value="status">
										<% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then %>
										<div id="map_cfg_status">
											<div id="map-cfg-status-details">
												<div class="form-group" >
													<label class="col-lg-5">AL_MAC</label>
													<label class="status-value col-lg-5" id="al_mac"></label>
												</div>
												<div id="map-cfg-status-sta-steering-progress" style="display: none">
													<div class="form-group" >
														<label class="col-lg-5"><%tcWebApi_get("String_Entry","EasyMeshStatus1Text","s")%></label>
														<label class="status-value col-lg-5" id="sta-steering-progress"></label>
													</div>
													<div class="form-group">
														<label class="col-lg-5"><%tcWebApi_get("String_Entry","EasyMeshStatus2Text","s")%></label>
														<label class="status-value col-lg-5"><ul id="sta-bh-inf-ul"></ul></label>
													</div>
												</div>
												<div class="form-group">
													<label class="col-lg-5"><%tcWebApi_get("String_Entry","EasyMeshStatus3Text","s")%></label>
													<label class="status-value col-lg-5"><ul id="ap-bh-inf-list-ul"></ul></label>
												</div>
												<div class="form-group">
													<label class="col-lg-5"><%tcWebApi_get("String_Entry","EasyMeshStatus4Text","s")%></label>
													<label class="status-value col-lg-5"><ul id="ap-fh-inf-list-ul"></ul></label>
												</div>
												<div class="form-group">
													<label class="col-lg-5"><%tcWebApi_get("String_Entry","EasyMeshStatus5Text","s")%></label>
													<button type="button" class="small-button action-button text-left" id="display-runtime-topology-btn" onClick="displayRuntimeTopology()"><%tcWebApi_get("String_Entry","EasyMeshStatus10Text","s")%></button>
												</div>
												<div class="form-group">
													<label class="col-lg-5"><%tcWebApi_get("String_Entry","EasyMeshStatus6Text","s")%></label>
													<button type="button" class="small-button action-button text-left" id="ap-db-btn" onClick="displayApCapabilities()"><%tcWebApi_get("String_Entry","EasyMeshStatus11Text","s")%></button>
												</div>
												<div class="form-group">
													<label class="col-lg-5"><%tcWebApi_get("String_Entry","EasyMeshStatus7Text","s")%></label>
													<button type="button" class="small-button action-button text-left" id="client-db-btn" onClick="displayClientCapabilities()"><%tcWebApi_get("String_Entry","EasyMeshStatus12Text","s")%></button>
												</div>
												<div class="form-group">
													<label class="col-lg-5"><%tcWebApi_get("String_Entry","EasyMeshStatus8Text","s")%></label>
													<button type="button" class="small-button action-button text-left" id="disp-fh-status-bss" onClick="dispFhStatusBss()"><%tcWebApi_get("String_Entry","EasyMeshStatus13Text","s")%></button>
												</div>
												<div class="form-group">
													<label class="col-lg-5"><%tcWebApi_get("String_Entry","EasyMeshStatus9Text","s")%></label>
													<button type="button" class="small-button action-button text-left" id="disp-bh-link-metrics-ctrler" onClick="dispBhLinkMetricsCtrler()"><%tcWebApi_get("String_Entry","EasyMeshStatus14Text","s")%></button>
												</div>
											</div>
										</div>
										<%end if%>
									</div>
									<!-- isMapCfgSupportedYes -->
									<% end if %>
								</div>
								<!-- isMapSupportedYes -->
								<% end if %>
							</div>
							<!-- l1datYes -->
					</fieldset>
				</div>
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