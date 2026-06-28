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
				TCWebApi_constSet("Mesh_dat", "MapEnable","1")
				' ONTS-
				' if Request_Form("SteerEnable") = "1" then
				' 	TCWebApi_Set("Mesh_common", "SteerEnable", "SteerEnable")
				' else
				' 	TCWebApi_constSet("Mesh_common", "SteerEnable", "0")
				' end if
				TCWebApi_Set("Mesh_common", "DeviceRole", "DeviceRole")
				if Request_Form("DeviceRole") = "0" then
					TCWebApi_Set("Mesh_mapdcfg", "BhPriority2G", "BhPriority2G")
					TCWebApi_Set("Mesh_mapdcfg", "BhPriority5GL", "BhPriority5GL")
					TCWebApi_Set("Mesh_mapdcfg", "BhPriority5GH", "BhPriority5GL")
				end if
				' ONTS-26: Set DhcpCtl when change role
				if Request_Form("DeviceRole") = "1" then
					TCWebApi_constSet("Mesh_mapdcfg", "DhcpCtl", "0")
				else
					if Request_Form("DeviceRole") = "2" then
						TCWebApi_constSet("Mesh_mapdcfg", "DhcpCtl", "1")
					end if
				end if
				if Request_Form("Change_Flag") = "1" then
					TCWebApi_constSet("Mesh_common", "ReinitWifiFlag","1")
					TCWebApi_commit("Mesh_mapdcfg") ' ONTS-26
					TCWebApi_commit("Mesh_dat")
					TCWebApi_commit("Mesh_common") ' ONTS-26
					' if Request_Form("MeshTriggerFlag") = "1" then
					' 	TCWebApi_commit("Mesh_common")
					' end if
				end if
			else
				TCWebApi_constSet("Mesh_dat", "MapEnable","0")
				TCWebApi_commit("Mesh_dat")
			end if
		else
			if Request_Form("Action_Flag") = "1" then
				if Request_Form("resetToDefaultEasyMesh_Flag") = "1" then
					TCWebApi_constSet("Mesh_action", "load_default_setting", "1")
					TCWebApi_commit("Mesh_action")
				end if
				if Request_Form("MapEnable") = "1" then
					if Request_Form("wifi_trigger_onboarding_Flag") = "1" then
						if Request_Form("ether_trigger_onboarding_Flag") = "0" then	
							TCWebApi_constSet("Mesh_action", "wifi_trigger_onboarding", "1")
							TCWebApi_constSet("Mesh_action", "ether_trigger_onboarding", "0")
							TCWebApi_commit("Mesh_action")
						end if
					end if
					if Request_Form("wifi_trigger_onboarding_Flag") = "0" then
						if Request_Form("ether_trigger_onboarding_Flag") = "1" then	
							TCWebApi_constSet("Mesh_action", "wifi_trigger_onboarding", "0")
							TCWebApi_constSet("Mesh_action", "ether_trigger_onboarding", "1")
							TCWebApi_commit("Mesh_action")
						end if
					end if
				end if
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
		</script>		<script language="javascript" type=text/javascript>															
			var webReloadFlag = 0;
			<% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then %>
			var get_device_role_timer_id;
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
				var webstate = "<% tcWebApi_get("Mesh_common","ReinitWifiFlag","s") %>";
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
			function JSO_get_runtime_topology()
			{
				var ret = "<% tcWebApi_MeshJsonHook("mesh_get_run_time_topology") %>";
				ret = ret.replace(/\'/g,'\\\\u0022');
				ret = ret.replace(/\\\\u0022Pass-phrase\\\\u0022:/g,'\\\\u0022WPAPSK\\\\u0022:');
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
						case "get_runtime_topology":
							X_Res = JSO_get_runtime_topology();
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
			function CheckWifi()
			{
					var isWifiSupport = "<% tcWebApi_get("Mesh_common","isMeshEncrypTypeAuthModeSupport","s") %>";
					if(isWifiSupport == "No")
					{
							alert("<%tcWebApi_get("String_Entry","EasyMeshBasicAlert12Test","s")%>");
							return 1;
					}
					return 0;
			}
			function MapEnableClick()
			{
				if(document.getElementById("MapEnable").checked)
				{
					if ( 1 == CheckWifi() )
					{
						var mapEnableRadio1 = document.getElementById("MapEnableOn");
						var mapEnableRadio2 = document.getElementById("MapEnableOff");
						mapEnableRadio1.checked = false;
						mapEnableRadio2.checked = true;
						return;
					}
					document.getElementById("appliedMapEnableDiffNA_MapEnableYes_basic").style.display = "";
					document.getElementById("map-cfg-basic-detail-setting").style.display = "";
					document.getElementById("map-cfg-basic-ap-onboarding").style.display = "none";
					var devRole = "<% tcWebApi_get("Mesh_common","DeviceRole","s") %>";
					switch(devRole)
					{
						case "1": // Controller
							document.getElementById("map-cfg-basic-devicerole-setting").style.display = "";
							//document.getElementById("map-cfg-basic-dev-role-configured-settings").style.display = "";
							document.getElementById("map-cfg-current-dev-role").style.display = "none";
							document.getElementById("map-cfg-back-haul-connection-status-settings").style.display = "none";
							break;
						case "2": // Agent
							document.getElementById("map-cfg-basic-devicerole-setting").style.display = "";
							//document.getElementById("map-cfg-basic-dev-role-configured-settings").style.display = "";
							document.getElementById("map-cfg-current-dev-role").style.display = "none";
							document.getElementById("map-cfg-back-haul-connection-status-settings").style.display = "none";
							break;
						default: // Auto
							//document.getElementById("map-cfg-basic-dev-role-configured-settings").style.display = "none";
							document.getElementById("map-cfg-back-haul-connection-status-settings").style.display = "none";
							break;
					}
				}
				else
				{
					/* ONTS-234 */
					document.getElementById("appliedMapEnableDiffNA_MapEnableYes_basic").style.display = "none";
				}
			}
			function validate_all()
			{
					var devRole = document.getElementById("DeviceRole");
					var mapEnableRadio = document.getElementById("MapEnableOn");
					if(devRole.type == "radio" && (!(mapEnableRadio.checked)))
					{
							alert("<%tcWebApi_get("String_Entry","EasyMeshBasicAlert1Test","s")%>");
							return false;
					}
			<% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then %>
					if(devRole.type != "select-one")
					{
							alert("<%tcWebApi_get("String_Entry","EasyMeshBasicAlert2Test","s")%>");
							return false;
					}
					var curDevRole = document.getElementById("current-dev-role").innerHTML;
					if (devRole.selectedIndex == 0)
					{
							if (curDevRole == "Not configured")
							{
									alert("<%tcWebApi_get("String_Entry","EasyMeshBasicAlert3Test","s")%>\n" +
												"<%tcWebApi_get("String_Entry","EasyMeshBasicAlert4Test","s")%>\n" +
												"<%tcWebApi_get("String_Entry","EasyMeshBasicAlert5Test","s")%>");
									return false;
							}
							if(curDevRole == "Controller")
							{
									devRole.selectedIndex = 0;
							}
							else if(curDevRole == "Agent")
							{
									devRole.selectedIndex = 1;
							}
							else
							{
									alert("<%tcWebApi_get("String_Entry","EasyMeshBasicAlert6Test","s")%>\n");
									return false;
							}
					}
					if(curDevRole == "Controller")
					{
							if(!validateControllerSettings())
							{
									return false;
							}
					}
			<% end if %>/* Mesh_mapdcfg.MapEnable=1 */
				document.getElementById("LOADING_MULTI_AP").style.display = "";
				document.getElementById("MULTI_AP_SETTINGS").style.display = ""; /* ONTS-234 */
				return true;
			}
			function resetToDefaultEasyMesh()
			{
			<% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then %>
					clearAllTimers();
			<% end if %>
					setText('resetToDefaultEasyMesh_Flag', 1);
					setText('Action_Flag', 1);							                        
						formSubmit(0);
			}
			<% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then %>
			function validateControllerSettings()
			{
					if (!validateApSteerRssiTh() ||
							!validateChannelUtilizationTh())
					{
							return false;
					}
					return true;
			}
			function validateApSteerRssiTh()
			{
					var apSteerRssiTh = "<% tcWebApi_get("Mesh_mapdcfg","APSteerRssiTh","s") %>";
					if (apSteerRssiTh == "" ||
							isNaN(apSteerRssiTh) ||
							!/^(0|-[1-9]|-[1-9][0-9])$/.test(apSteerRssiTh) ||
							parseInt(apSteerRssiTh) > 0 ||
							parseInt(apSteerRssiTh) < -90)
					{
							alert("<%tcWebApi_get("String_Entry","EasyMeshBasicAlert7Test","s")%>\n<%tcWebApi_get("String_Entry","EasyMeshBasicAlert8Test","s")%>");
					}
					return true;
			}
			function validateChannelUtilizationTh()
			{
					var channelUtilTh2G = "<% tcWebApi_get("Mesh_steercfg","CUOverloadTh_2G","s") %>";
					var channelUtilTh5GL = "<% tcWebApi_get("Mesh_steercfg","CUOverloadTh_5G_L","s") %>";
					var channelUtilTh5GH = channelUtilTh5GL;
					if (channelUtilTh2G == "" ||
							isNaN(channelUtilTh2G) ||
							!/^(0|[1-9]|[1-9][0-9]|100)$/.test(channelUtilTh2G) ||
							parseInt(channelUtilTh2G) < 0 ||
							parseInt(channelUtilTh2G) > 100)
					{
							alert("<%tcWebApi_get("String_Entry","EasyMeshBasicAlert9Test","s")%>\n<%tcWebApi_get("String_Entry","EasyMeshBasicAlert11Test","s")%>");
					}
					if (channelUtilTh5GL == "" ||
							isNaN(channelUtilTh5GL) ||
							!/^(0|[1-9]|[1-9][0-9]|100)$/.test(channelUtilTh5GL) ||
							parseInt(channelUtilTh5GL) < 0 ||
							parseInt(channelUtilTh5GL) > 100)
					{
							alert("<%tcWebApi_get("String_Entry","EasyMeshBasicAlert10Test","s")%>\n<%tcWebApi_get("String_Entry","EasyMeshBasicAlert11Test","s")%>");
					}
					return true;
			}
			function set_controller_validate_msg()
			{
				var apSteerRssiTh = "<% tcWebApi_get("Mesh_mapdcfg","APSteerRssiTh","s") %>";
				var channelUtilTh2G = "<% tcWebApi_get("Mesh_steercfg","CUOverloadTh_2G","s") %>";
				var channelUtilTh5GL = "<% tcWebApi_get("Mesh_steercfg","CUOverloadTh_5G_L","s") %>";
				var setting_error_msg_div = document.getElementById("map_validate_controller_settings_error_div");
				var rssi_error_msg_div = document.getElementById("map_validate_controller_rssith_error_msg");
				var radio_error_msg_div = document.getElementById("map_validate_controller_channelth_error_msg");
				setting_error_msg_div.style.display = "none";
				rssi_error_msg_div.style.display = "none";
				radio_error_msg_div.style.display = "none";
				if (apSteerRssiTh == "" ||
							isNaN(apSteerRssiTh) ||
							!/^(0|-[1-9]|-[1-9][0-9])$/.test(apSteerRssiTh) ||
							parseInt(apSteerRssiTh) > 0 ||
							parseInt(apSteerRssiTh) < -90)
					{
					setting_error_msg_div.style.display = "";
					rssi_error_msg_div.style.display = "";
					}
				if (channelUtilTh2G == "" ||
							isNaN(channelUtilTh2G) ||
							!/^(0|[1-9]|[1-9][0-9]|100)$/.test(channelUtilTh2G) ||
							parseInt(channelUtilTh2G) < 0 ||
							parseInt(channelUtilTh2G) > 100)
					{
					setting_error_msg_div.style.display = "";
					radio_error_msg_div.style.display = "";
					}
					if (channelUtilTh5GL == "" ||
							isNaN(channelUtilTh5GL) ||
							!/^(0|[1-9]|[1-9][0-9]|100)$/.test(channelUtilTh5GL) ||
							parseInt(channelUtilTh5GL) < 0 ||
							parseInt(channelUtilTh5GL) > 100)
					{
						setting_error_msg_div.style.display = "";
					radio_error_msg_div.style.display = "";
					}
			}
			function clearAllTimers()
			{
					clearTimeout(get_device_role_timer_id);
					get_device_role_timer_id = null;
					clearTimeout(get_apply_status);
			}
			function update_displayed_bh_connect_status(obj_1905)
			{
				var bhConStatus = document.getElementById("back-haul-connection-status");
				if(!obj_1905.hasOwnProperty('BH Info'))
				{
					console.log("Topology does not have BH Info Property!",obj_1905);
					bhConStatus.innerHTML = "<%tcWebApi_get("String_Entry","EasyMeshBasic19Test","s")%>";
					return;
				}
				console.log("Topology BH Info:  ! ", obj_1905['BH Info']);
				if(obj_1905['BH Info'].length == 0)
				{
					console.log("Topology does not have Backhaul Medium Type Property! ", obj_1905['BH Info'].length);
					bhConStatus.innerHTML = "<%tcWebApi_get("String_Entry","EasyMeshBasic19Test","s")%>";
					return;
				}
				var bhInfo = obj_1905['BH Info'][0];
				console.log("update_displayed_bh_connect_status ['Backhaul Medium Type']:  ", bhInfo['Backhaul Medium Type']);
				if ( bhInfo['Backhaul Medium Type'] == "Ethernet")
				{
					bhConStatus.innerHTML = "<%tcWebApi_get("String_Entry","EasyMeshBasic18Test","s")%>)";
				}
				else
				{
					bhConStatus.innerHTML = bhInfo['Backhaul Medium Type'];
				}
			}
			function find_own_topo_info_by_role(devRole, jsTopoInfo, alMac)
			{
				var tree_info = [];
				var topoInfoArr = jsTopoInfo['topology information'];
				var bhConStatus = document.getElementById("back-haul-connection-status");
				if(!(topoInfoArr instanceof Array))
				{
					console.log("Incorrect TopologyInfo: Value of topology information is not an Array!");
					bhConStatus.innerHTML = "<%tcWebApi_get("String_Entry","EasyMeshBasic19Test","s")%>";
					return;
				}
				for(var idx_1905=0; idx_1905 < topoInfoArr.length; idx_1905++)
				{ 
					var obj_1905 = topoInfoArr[idx_1905];
					if (obj_1905.hasOwnProperty('AL MAC') && (obj_1905['AL MAC'].toUpperCase() == alMac.toUpperCase()))
					{
						update_displayed_bh_connect_status(obj_1905);
						return;
					}
				}
				bhConStatus.innerHTML = "<%tcWebApi_get("String_Entry","EasyMeshBasic19Test","s")%>";
				console.log(alMac," AL-MAC NOT FOUND in Topology! Topology: ",jsTopoInfo);
			}
			function get_al_mac_by_role(devRole, jsTopoInfo)
			{
				var bhConStatus = document.getElementById("back-haul-connection-status");
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
							find_own_topo_info_by_role(devRole, jsTopoInfo, r['al_mac']);
						}
						else
						{
							console.log("Incorrect AL-MAC received!",r['status'],r['al_mac']);
							bhConStatus.innerHTML = "<%tcWebApi_get("String_Entry","EasyMeshBasic19Test","s")%>";
						}
					}
					catch(e)
					{
						console.log("Incorrect response received for get AL-MAC request!",e.name,e.message); 
						bhConStatus.innerHTML = "<%tcWebApi_get("String_Entry","EasyMeshBasic19Test","s")%>";
					}
				}
			}
			function get_bh_connection_status()
			{
				var devRole = document.getElementById("current-dev-role").innerHTML;
				var bhConStatus = document.getElementById("back-haul-connection-status");
				if(devRole == "Agent")
				{
					var XHR_type = 'get_runtime_topology';
					var x_response = getX_Response(XHR_type);
					{
						try
						{
							var r = JSON.parse(x_response);
							if(r.status == "SUCCESS")
							{
								console.log("get_bh_connection_status get topo ");
								var tmp_jsTopoInfo = r.luaTopologyInfo;
								tmp_jsTopoInfo = tmp_jsTopoInfo.replace(/\\u0022/g, '\"');
								tmp_jsTopoInfo = tmp_jsTopoInfo.replace(/\\\\u0022/g, '\"');
								var jsTopoInfo = JSON.parse(tmp_jsTopoInfo);
								get_al_mac_by_role(devRole, jsTopoInfo);
							}
							else
							{
								console.log("get_bh_connection_status() Failed to get Topology Info!\nStatus: ",r.status);
								bhConStatus.innerHTML = "<%tcWebApi_get("String_Entry","EasyMeshBasic19Test","s")%>";
							}
						}
						catch(e)
						{
							console.log("get_bh_connection_status() Incorrect response! Failed to get Topology Info!",e.name,e.message);
							bhConStatus.innerHTML = "<%tcWebApi_get("String_Entry","EasyMeshBasic19Test","s")%>";
						}
					}
				}
				else
				{
					bhConStatus.innerHTML = "<%tcWebApi_get("String_Entry","EasyMeshBasic19Test","s")%>";
					console.log("get_bh_connection_status not agent ");
				}
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
													document.getElementById("current-dev-role-during-not-configured-msg").style.display = "";
													//document.getElementById("map-cfg-basic-dev-role-configured-settings").style.display = "none";
													document.getElementById("map-cfg-back-haul-connection-status-settings").style.display = "none";
													document.getElementById("current-dev-role").innerHTML = "Not Configured";
													clearTimeout(get_device_role_timer_id);
													get_device_role_timer_id = null;
													if(document.getElementById("__activeTab").value == "basic")
													{
															get_device_role_timer_id = setTimeout(getDeviceRole, 1000);
													}
													break;
											case 1: // Controller
													document.getElementById("current-dev-role-during-not-configured-msg").style.display = "none";
													//document.getElementById("map-cfg-basic-dev-role-configured-settings").style.display = "";
													document.getElementById("map-cfg-back-haul-connection-status-settings").style.display = "none";
													document.getElementById("current-dev-role").innerHTML = "Controller";
													break;
											case 2: // Agent
													document.getElementById("current-dev-role-during-not-configured-msg").style.display = "none";
													//document.getElementById("map-cfg-basic-dev-role-configured-settings").style.display = "";
													document.getElementById("map-cfg-back-haul-connection-status-settings").style.display = "";
													document.getElementById("current-dev-role").innerHTML = "Agent";
													get_bh_connection_status();
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
			function deviceRoleOnChange(devRole)
			{
					devRole = parseInt(devRole);
					switch(devRole)
					{
							case 1: // Controller
									document.getElementById("DeviceRole").selectedIndex = 0;
									clearTimeout(get_device_role_timer_id);
									get_device_role_timer_id = null;
									break;
							case 2: // Agent
									document.getElementById("DeviceRole").selectedIndex = 1;
									clearTimeout(get_device_role_timer_id);
									get_device_role_timer_id = null;
									break;
							default:
									console.log("Invalid device role selected: ",devRole);
									break;
					}
			}
			function triggerMultiApOnBoarding()
			{
					/*Only Wi-Fi On-boarding*/
					var bh_val = 1;
					if(0 == bh_val)
					{
						setText('wifi_trigger_onboarding_Flag', 0);
						setText('ether_trigger_onboarding_Flag', 1);
					}
					else
					{
						setText('wifi_trigger_onboarding_Flag', 1);
						setText('ether_trigger_onboarding_Flag', 0);
					}
					setText('Action_Flag', 1);
					formSubmit(0);
			}
			<% end if %>/* Mesh_mapdcfg.MapEnable=1 */
			function checkWebStatus()
			{
					location.href = '/cgi-bin/wifi-mesh.asp';
			}
			function get_apply_status_cb(rsp)
			{
					clearTimeout(checkWebStatus);
					webReloadFlag = 0;
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
							document.getElementById('MULTI_AP_SETTINGS').style.display = 'none'; /* ONTS-234 */
							setTimeout(checkWebStatus, 5000);
							webReloadFlag = 1;
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
					if(webReloadFlag)
					{
						return;
					}
			<% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then %>
				var deviceRole = "<% tcWebApi_get("Mesh_common","DeviceRole","s") %>";
					if(deviceRole == "")
					{
							deviceRoleOnChange("0");
					}
					else
					{
							deviceRoleOnChange(deviceRole);
							if(deviceRole != "0")
							{
							getDeviceRole();
							if(deviceRole == "1")
							{
								set_controller_validate_msg();
							}
							}
					}
			<% end if %>/* Mesh_mapdcfg.MapEnable=1 */
			}
function formSubmit(saveAll)
{
		if(document.cbi != null)
		{
				if(saveAll)
				{
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
function btnSave()
{
		if(document.cbi != null)
		{
<% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then %>
				var DeviceRole=<% tcWebApi_get("Mesh_common","DeviceRole","s") %>;
				var devRole = document.getElementById("DeviceRole");
				if ((devRole.value != DeviceRole))
				{
					setText('Change_Flag', 1);
				}
<% else %>
				setText('Change_Flag', 1);
<% end if %>
				formSubmit(1);
		}
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
<% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "0" then %>
	setDisplay('appliedMapEnableDiffNA_MapEnableYes_basic', 0);
<% else %>
	setDisplay('appliedMapEnableDiffNA_MapEnableYes_basic', 1);
<% end if %>
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
<header class="fixed-top"><nav id="top-nav" class="navbar navbar-expand-lg container"><a class="navbar-brand " href="/cgi-bin/home.asp"><div><img src="/img/logo_home.png" width="100" height="18" alt=""><div style="font-family: sans-serif; font-weight: bold;font-size: 12px;color: #000; margin-top: 0">OPTICAL NETWORK TERMINATION</div></div></a><button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"><em class="fas fa-align-justify"></em></span></button><div class="collapse navbar-collapse" id="navbarCollapse"><ul class="navbar-nav mr-auto sidenav" id="navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/home.asp"><%tcWebApi_get("String_Entry","NavigationHomeText","s")%><span class="sr-only"></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/deviceinfo.asp"><%tcWebApi_get("String_Entry","NavigationStatusDeviceText","s")%><span class="sr-only"></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/wifi-mesh-topology.asp"><%tcWebApi_get("String_Entry","EasyMeshStatus5Text","s")%><span class="sr-only"></span></a></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#status-menu" aria-controls="status-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NavigationStatusStatisticsText","s")%></a><ul class="nav-second-level collapse" id="status-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/sta-statistics.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationTrafficText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/sta-wifiusers.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationStatusUsersText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/sta-users.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","ARPStatusText","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#network-menu" aria-controls="network-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NAVNetwork","s")%></a><ul class="nav-second-level collapse" id="network-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/net-wan.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationBasInternetText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/net-lan.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationBasLANText","s")%></span></a></li></ul></li><li class="nav-item active"><a class="nav-link nav-link-collapse nav-link-show" href="#" id="hasSubItems" data-toggle="collapse" data-target="#wifi-menu" aria-controls="wifi-menu" aria-expanded="true"><%tcWebApi_get("String_Entry","NAVWifi","s")%></a><ul class="nav-second-level show" id="wifi-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/wifi.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationWiFiSettingsText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/wifi-11ac.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationWiFi11acSettingsText","s")%></span></a></li><li class="nav-item active"><a class="nav-link" href="/cgi-bin/wifi-mesh.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationMesh","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#firewall-menu" aria-controls="firewall-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NavigationAdvFirewallText","s")%></a><ul class="nav-second-level collapse" id="firewall-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-spi.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","ContentFirewallText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-urlfilter.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","FILTERTYPE_index2","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-macfilter.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVL2Filter","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-parentalcontrol.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","ParentalControlText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/safehome.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","SafehomeText","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#apps-menu" aria-controls="apps-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NAVApplication","s")%></a><ul class="nav-second-level collapse" id="apps-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-dmz.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NatTopDMZText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-portforwarding.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NatVirsvrText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-sslim.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","SessionLimit","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-route.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","StaticRouteText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-ddns.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","dyDNS1Text","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-wifischeduling.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","WifiSchedulingText","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#tools-menu" aria-controls="tools-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NavigationMaintenanceText","s")%></a><ul class="nav-second-level collapse" id="tools-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-admin.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationMainAdminText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-time.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVSysTime","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-firmware.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationMainFirmwareText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-config.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVConfig","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-diagnostic.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationMainDiagnosticsText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-wan2lan.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","Wan2lanText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-log.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVLogs","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-reboot.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","RebootText","s")%></span></a></li></ul></li></ul><div class="top-item-groups"><form name="LanguageForm" method="POST" action="/cgi-bin/wifi-mesh.asp" class="nav-item dropdown"><input type="hidden" name="TokenString" value="<%tcWebApi_getToken()%>"><input type="hidden" name="Language_Flag" value="<% tcWebApi_get("LanguageSwitch_Entry","Type","s") %>"><a class="nav-link dropdown-toggle" href="#" id="LanguageDropdown" role="button" data-toggle="dropdown" aria-expanded="false"><% tcWebApi_get("String_Entry","LoginLanguage","s") %></a><ul class="dropdown-menu" aria-labelledby="LanguageDropdown"><li><a class="dropdown-item <% if tcWebApi_get("LanguageSwitch_Entry","Type","h") = "1" then asp_Write("active") end if %>" href="#" onclick="submitLanguageForm(1);"><% tcWebApi_get("String_Entry","LanguageVIELong","s") %></a></li><li><a class="dropdown-item <% if tcWebApi_get("LanguageSwitch_Entry","Type","h") = "2" then asp_Write("active") end if %>" href="#" onclick="submitLanguageForm(2);"><% tcWebApi_get("String_Entry","LanguageENGLong","s") %></a></li></ul></form><div id="signout" class="nav-item"><a class="nav-link" href="javascript:doLogout();"><em class="fa fa-sign-out-alt"></em><span class="nav-link-text"><% tcWebApi_get("String_Entry","LogoutText","s") %></span></a></div></div></div></header></nav><% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then
	if tcWebApi_get("Mesh_Common", "DeviceRole", "h") = "2" then %>
		<script language='javascript'>
		document.getElementById("network-menu").children[0].style="display: none";
		document.getElementById("network-menu").children[1].style="display: none";
		document.getElementById("wifi-menu").children[0].style="display: none";
		document.getElementById("wifi-menu").children[1].style="display: none";
		</script>
<% end if end if %>		<div id="content">
		<form class="form-inline" method="post" name="cbi" action="/cgi-bin/wifi-mesh.asp" onsubmit="return validate_all()" autocomplete="off">
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
					<li class="tab">
						<a href="/cgi-bin/wifi-mesh.asp"><%tcWebApi_get("String_Entry","EasyMeshBasicTest","s")%></a>
					</li>
					<li class="tab tab-disabled d-none">
						<a href="/cgi-bin/wifi-mesh-adv.asp"><%tcWebApi_get("String_Entry","EasyMeshAdvancedTest","s")%></a>
					</li>
					<li class="tab tab-disabled d-none">
						<a href="/cgi-bin/wifi-mesh-act.asp"><%tcWebApi_get("String_Entry","EasyMeshActionTest","s")%></a>
					</li>
					<li class="tab tab-disabled d-none">
						<a href="/cgi-bin/wifi-mesh-topology.asp"><%tcWebApi_get("String_Entry","EasyMeshStatusTest","s")%></a>
					</li>
					<% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then %>
					<% if tcWebApi_get("Mesh_common", "DeviceRole", "h") = "1" then %>
					<li class="tab tab-disabled">
						<a href="/cgi-bin/wifi-mesh-advanced.asp"><%tcWebApi_get("String_Entry","EasyMeshAdvancedTest","s")%></a>
					</li>
					<% end if %>
					<% end if %>
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
											</label>
											</div>
										</div>
									</div>
									<div class="alert-message" id="LOADING_MULTI_AP" style="display:none;">
										<img src="/img/loading.gif" alt="" style="vertical-align:middle" />
										<big><strong><%tcWebApi_get("String_Entry","EasyMeshBasic16Test","s")%></strong></big>
									</div>
									<div id="map_validate_controller_settings_error_div" style="display: none">
										<div id="map_validate_controller_rssith_error_msg" style="display: none" class="alert-message error"><big><strong>RSSI Threshold is incorrect!</big></strong></div>
										<div id="map_validate_controller_channelth_error_msg" style="display: none" class="alert-message error"><big><strong>2G/5G Channel Utilization Threshold is incorrect!</big></strong></div>
										<div id="map_validate_controller_error_msg" class="alert-message error"><big><strong>Please enter an integer number !</big></strong></div>
									</div>
									<div id="MULTI_AP_SETTINGS">
										<div id="map-cfg-basic">
											<div id="map-cfg-basic-meshenable-setting">
												<div class="form-group">
													<label class="col-lg-5" for="MapEnable"><%tcWebApi_get("String_Entry","EasyMeshBasic1Test","s")%></label>
													<label class="toggle-switch">
													<input type="checkbox" name="MapEnable" id="MapEnable" value="0" onchange="MapEnableClick()" onClick="this.blur();" <% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then %> checked="checked"<% end if %>>
													<span class="slider"></span>
													</label>
												</div>
												<div id="appliedMapEnableDiffNA_MapEnableYes_basic">
													<div class="form-group"id="map-cfg-basic-devicerole-setting">
														<label class="col-lg-5" for=""><%tcWebApi_get("String_Entry","EasyMeshBasic11Test","s")%></label>
														<div class="col-lg-3 custom-select">
															<select name="DeviceRole" id="DeviceRole" size="1" onchange="deviceRoleOnChange(this.value)">
																<option value="1" <% if tcwebApi_get("Mesh_Common","DeviceRole","h") = "1" then asp_Write("selected") end if %>>Controller</option>
																<option value="2" <% if tcwebApi_get("Mesh_Common","DeviceRole","h") = "2" then asp_Write("selected") end if %>>Agent</option>
															</select>
														</div>
													</div>
													<div id="map-cfg-basic-detail-setting">
														<div class="form-group" id="map-cfg-current-dev-role">
															<label class="col-lg-5"><%tcWebApi_get("String_Entry","EasyMeshBasic4Test","s")%></label>
															<label class="status-value col-lg-5" id="current-dev-role">Controller</label>
														</div>
														<div class="form-group" id="map-cfg-back-haul-connection-status-settings">
															<label class="col-lg-5"><%tcWebApi_get("String_Entry","EasyMeshBasic12Test","s")%></label>
															<label class="status-value col-lg-5" id="back-haul-connection-status"><%tcWebApi_get("String_Entry","EasyMeshBasic19Test","s")%></label>
														</div>
														<div class="form-group" id="map-cfg-basic-dev-role-configured-settings" style="display:none">
															<label class="col-lg-5" for="SteerEnable"><%tcWebApi_get("String_Entry","EasyMeshBasic10Test","s")%></label>
															<label class="toggle-switch">
															<input type="checkbox" name="SteerEnable" id="SteerEnable" value="0" <% if tcWebApi_get("Mesh_common", "SteerEnable", "h") = "1" then %> checked="checked"<% end if %>>
															<span class="slider"></span>
															</label>
														</div>
													</div>
													<div class="form-group" id="cfg-basic-setting-default" style="display:none">
														<label class="col-lg-5" for=""><%tcWebApi_get("String_Entry","EasyMeshBasic5Test","s")%></label>
														<input class="small-button action-button" type="button" value="<%tcWebApi_get("String_Entry","EasyMeshBasic6Test","s")%>" id="resetMap" onClick="resetToDefaultEasyMesh()" />
													</div>
													<div class="form-group" id="map-cfg-basic-ap-onboarding" style="display:none">
														<label class="col-lg-5" for=""><%tcWebApi_get("String_Entry","EasyMeshBasic7Test","s")%></label>
														<input class="small-button action-button" type="button" id="multi-ap-on-board-btn" value="<%tcWebApi_get("String_Entry","EasyMeshBasic8Test","s")%>" onClick="triggerMultiApOnBoarding()" />
														<label class="input-description font-italic offset-lg-5 col-lg-7"><%tcWebApi_get("String_Entry","EasyMeshBasic9Test","s")%></label>
													</div>
												</div>
												<div id="current-dev-role-during-not-configured-msg" style="display:none">
													<div class="alert-message" colspan="3">
														<strong>
														<%tcWebApi_get("String_Entry","EasyMeshBasic17Test","s")%>
														</strong>
													</div>
												</div>
											</div>
										</div>
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
				<div class="col-lg-12 d-flex align-items-center justify-content-center">
					<button id="btnOK" type="button" class="page-button small-button" onclick="btnSave();"><%tcWebApi_get("String_Entry","ButtonApplyText","s")%></button>
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
