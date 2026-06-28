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
		</script>	</head>
	<body class="container">
<header class="fixed-top"><nav id="top-nav" class="navbar navbar-expand-lg container"><a class="navbar-brand " href="/cgi-bin/home.asp"><div><img src="/img/logo_home.png" width="100" height="18" alt=""><div style="font-family: sans-serif; font-weight: bold;font-size: 12px;color: #000; margin-top: 0">OPTICAL NETWORK TERMINATION</div></div></a><button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"><em class="fas fa-align-justify"></em></span></button><div class="collapse navbar-collapse" id="navbarCollapse"><ul class="navbar-nav mr-auto sidenav" id="navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/home.asp"><%tcWebApi_get("String_Entry","NavigationHomeText","s")%><span class="sr-only"></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/deviceinfo.asp"><%tcWebApi_get("String_Entry","NavigationStatusDeviceText","s")%><span class="sr-only"></span></a></li><li class="nav-item active"><a class="nav-link" href="/cgi-bin/wifi-mesh-topology.asp"><%tcWebApi_get("String_Entry","EasyMeshStatus5Text","s")%><span class="sr-only">(current)</span></a></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#status-menu" aria-controls="status-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NavigationStatusStatisticsText","s")%></a><ul class="nav-second-level collapse" id="status-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/sta-statistics.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationTrafficText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/sta-wifiusers.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationStatusUsersText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/sta-users.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","ARPStatusText","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#network-menu" aria-controls="network-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NAVNetwork","s")%></a><ul class="nav-second-level collapse" id="network-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/net-wan.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationBasInternetText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/net-lan.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationBasLANText","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#wifi-menu" aria-controls="wifi-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NAVWifi","s")%></a><ul class="nav-second-level collapse" id="wifi-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/wifi.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationWiFiSettingsText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/wifi-11ac.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationWiFi11acSettingsText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/wifi-mesh.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationMesh","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#firewall-menu" aria-controls="firewall-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NavigationAdvFirewallText","s")%></a><ul class="nav-second-level collapse" id="firewall-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-spi.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","ContentFirewallText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-urlfilter.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","FILTERTYPE_index2","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-macfilter.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVL2Filter","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-parentalcontrol.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","ParentalControlText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/safehome.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","SafehomeText","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#apps-menu" aria-controls="apps-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NAVApplication","s")%></a><ul class="nav-second-level collapse" id="apps-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-dmz.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NatTopDMZText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-portforwarding.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NatVirsvrText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-sslim.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","SessionLimit","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-route.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","StaticRouteText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-ddns.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","dyDNS1Text","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-wifischeduling.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","WifiSchedulingText","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#tools-menu" aria-controls="tools-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NavigationMaintenanceText","s")%></a><ul class="nav-second-level collapse" id="tools-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-admin.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationMainAdminText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-time.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVSysTime","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-firmware.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationMainFirmwareText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-config.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVConfig","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-diagnostic.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationMainDiagnosticsText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-wan2lan.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","Wan2lanText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-log.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVLogs","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-reboot.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","RebootText","s")%></span></a></li></ul></li></ul><div class="top-item-groups"><form name="LanguageForm" method="POST" action="/cgi-bin/wifi-mesh-sta-ap-cap.asp" class="nav-item dropdown"><input type="hidden" name="TokenString" value="<%tcWebApi_getToken()%>"><input type="hidden" name="Language_Flag" value="<% tcWebApi_get("LanguageSwitch_Entry","Type","s") %>"><a class="nav-link dropdown-toggle" href="#" id="LanguageDropdown" role="button" data-toggle="dropdown" aria-expanded="false"><% tcWebApi_get("String_Entry","LoginLanguage","s") %></a><ul class="dropdown-menu" aria-labelledby="LanguageDropdown"><li><a class="dropdown-item <% if tcWebApi_get("LanguageSwitch_Entry","Type","h") = "1" then asp_Write("active") end if %>" href="#" onclick="submitLanguageForm(1);"><% tcWebApi_get("String_Entry","LanguageVIELong","s") %></a></li><li><a class="dropdown-item <% if tcWebApi_get("LanguageSwitch_Entry","Type","h") = "2" then asp_Write("active") end if %>" href="#" onclick="submitLanguageForm(2);"><% tcWebApi_get("String_Entry","LanguageENGLong","s") %></a></li></ul></form><div id="signout" class="nav-item"><a class="nav-link" href="javascript:doLogout();"><em class="fa fa-sign-out-alt"></em><span class="nav-link-text"><% tcWebApi_get("String_Entry","LogoutText","s") %></span></a></div></div></div></header></nav><% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then
	if tcWebApi_get("Mesh_Common", "DeviceRole", "h") = "2" then %>
		<script language='javascript'>
		document.getElementById("network-menu").children[0].style="display: none";
		document.getElementById("network-menu").children[1].style="display: none";
		document.getElementById("wifi-menu").children[0].style="display: none";
		document.getElementById("wifi-menu").children[1].style="display: none";
		</script>
<% end if end if %>		<div id="content">
		<form class="form-inline" method="post" name="cbi" action="/cgi-bin/wifi-mesh-sta-ap-cap.asp" autocomplete="off">
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
						<legend><%tcWebApi_get("String_Entry","EasyMeshApCapabilitiesText","s")%></legend>
						<div width=470 id="ap_db_display"></div>
					</fieldset>
				</div>
				<div class="col-lg-12 d-flex align-items-center justify-content-center">
					<a href="/cgi-bin/wifi-mesh-sta.asp"><button type="button" class="action-button small-button"><%tcWebApi_get("String_Entry","ButtonBackText","s")%></button></a>
				</div>
			</div>
		</div>
	</form>
	</div>
		<script type="text/javascript">
			var max_cellspan = 2;	
			function JSO_get_runtime_topology()
			{
					var ret = "<% tcWebApi_MeshJsonHook("mesh_get_run_time_topology") %>";
					ret = ret.replace(/\'/g,'\\\\u0022');
					ret = ret.replace(/\\\\u0022Pass-phrase\\\\u0022:/g,'\\\\u0022WPAPSK\\\\u0022:');
					return ret;
			}
			function set_max_cellspan(o)
			{
				for(var k in o)
				{
					var v = o[k];
					if (v instanceof Array)
					{
						max_cellspan++;
						for(var a_idx=0; a_idx < v.length; a_idx++)
						{
							if(((typeof v[a_idx]) == "object") && v[a_idx] != null)
							{
								set_max_cellspan(v[a_idx]);
							}
							else
							{
								console.log("set_max_cellspan: Incorrect Topology: Array element is not an object!",v[a_idx]);
							}
						}
					}
					else if(((typeof v) == "object") && v != null)
					{
						set_max_cellspan(v);
					}
				}
			}
			function set_rowspan(o)
			{
				var rowspan = 0;
				for(var k in o)
				{
					var v = o[k];
					if (v instanceof Array)
					{
						for(var a_idx=0; a_idx < v.length; a_idx++)
						{
							if(((typeof v[a_idx]) == "object") && v[a_idx] != null)
							{
								rowspan = rowspan + set_rowspan(v[a_idx]);
							}
							else
							{
								console.log("set_rowspan: Incorrect Topology: Array element is not an object!",v[a_idx]);
							}
						}
					}
					else if(((typeof v) == "object") && v != null)
					{
						rowspan = rowspan + set_rowspan(v);
					}
					else
					{
						rowspan++;
					}
				}
				return rowspan;
			}
			function obj_loop(table_id, row, o)
			{
				var cell;
				for(var k in o)
				{
					var v = o[k];
					if (v instanceof Array)
					{
						arr_loop(table_id, k, v);
					}
					else if(((typeof v) == "object") && v != null)
					{
						obj_loop(table_id, row, v);
					}
					else
					{
						if(row == null)
						{
							row = table_id.insertRow(-1);
						}
						cell = row.insertCell(-1);
						cell.innerHTML = k;
						cell = row.insertCell(-1);
						cell.colSpan = max_cellspan - row.cells.length + 1;
						cell.innerHTML = v;
						row = null;
					}
				}
			}
			function arr_loop(table_id, k, a)
			{
				var row, cell;
				for(var a_idx=0; a_idx < a.length; a_idx++)
				{
					var v = a[a_idx];
					if(((typeof v) == "object") && v != null)
					{
						row = table_id.insertRow(-1);
						cell = row.insertCell(-1);
						cell.rowSpan = set_rowspan(v);
						cell.style.verticalAlign  = "middle";
						cell.innerHTML = "<strong>" + k + ' - ' + (a_idx + 1) + "</strong>";
						obj_loop(table_id, row, v);
					}
					else
					{
						console.log("Incorrect Topology: Array element is not an object!",a);
					}
				}
			}
			function prep_bssinfo(dev1905Obj)
		{
				var tag_dev1905Obj = dev1905Obj;
			for(var radIdx=0; radIdx < tag_dev1905Obj['Radio Info'].length; radIdx++)
			{
				for(var bssIdx=0; bssIdx < tag_dev1905Obj['Radio Info'][radIdx]['BSSINFO'].length; bssIdx++)
				{
						var Security_val = '';
						if(tag_dev1905Obj['Radio Info'][radIdx]['BSSINFO'][bssIdx].hasOwnProperty('Security'))
						{
								Security_val = tag_dev1905Obj['Radio Info'][radIdx]['BSSINFO'][bssIdx]['Security'];
								if(Security_val == '0001')
								{
										if(tag_dev1905Obj['Radio Info'][radIdx]['BSSINFO'][bssIdx].hasOwnProperty('Encryption'))
										{
												tag_dev1905Obj['Radio Info'][radIdx]['BSSINFO'][bssIdx]['Encryption'] = '0001';
										}
										if(tag_dev1905Obj['Radio Info'][radIdx]['BSSINFO'][bssIdx].hasOwnProperty('WPAPSK'))
										{
												tag_dev1905Obj['Radio Info'][radIdx]['BSSINFO'][bssIdx]['WPAPSK'] = '';
										}
								}
						}
				}
			}
			return tag_dev1905Obj;
		}
			function draw_ap_db_table(jsTopoInfo)
			{
				var topoInfoArr = jsTopoInfo['topology information'];
				if(!(topoInfoArr instanceof Array))
				{
					console.log("Incorrect TopologyInfo: Value of topology information is not an Array!");
					return;
				}
				for(var idx_1905=0; idx_1905 < topoInfoArr.length; idx_1905++)
				{
						var obj_1905 = topoInfoArr[idx_1905];
					if(!obj_1905.hasOwnProperty('AL MAC') || ("00:00:00:00:00:00" == obj_1905['AL MAC']))
					{
							continue;
					}
					obj_1905 = prep_bssinfo(obj_1905);
					var ap_db_tbl = document.createElement("TABLE");
					ap_db_tbl.setAttribute("height", "100%");
					ap_db_tbl.setAttribute("cellSpacing", "0");
					ap_db_tbl.setAttribute("cellPadding", "0");
					ap_db_tbl.setAttribute("border", "1");
					var ap_db = {};
					ap_db["Radio Info"] = topoInfoArr[idx_1905]['Radio Info'];
					var dev1905div = document.createElement("div");
					dev1905div.setAttribute("class", "table1_head");
					var dev1905fb = document.createElement("b");
					var dev1905a = document.createElement("A");
					var dev1905text = document.createTextNode("Radio Info of 1905 Device - " + (idx_1905 + 1));
					dev1905a.setAttribute("href", "#");
					dev1905a.appendChild(dev1905text);
					dev1905fb.appendChild(dev1905a);
					dev1905div.appendChild(dev1905fb);
					document.getElementById("ap_db_display").appendChild(dev1905div);
					set_max_cellspan(ap_db);
					obj_loop(ap_db_tbl, null, ap_db);
					document.getElementById("ap_db_display").appendChild(ap_db_tbl);
				}
			}
			function checkWebStatus()
			{w
					location.href = '/cgi-bin/wifi-mesh-sta-ap-cap.asp';
			}
			function get_ap_db_cb(rsp)
			{
				try
				{
					var r = JSON.parse(rsp);
					if(r.status == "SUCCESS")
					{
							var tmp_jsTopoInfo = r.luaTopologyInfo;
							tmp_jsTopoInfo = tmp_jsTopoInfo.replace(/\\u0022/g, '\"');
							tmp_jsTopoInfo = tmp_jsTopoInfo.replace(/\\\\u0022/g, '\"');
						var jsTopoInfo = JSON.parse(tmp_jsTopoInfo);
						document.getElementById("ap_db_display").innerHTML = "";
						draw_ap_db_table(jsTopoInfo);
					}
					else
					{
						console.log("Failed to get AP DB!\nStatus: ",r.status);
					}
					setTimeout(checkWebStatus, 10000);
				}
				catch(e)
				{
					console.log("Incorrect response! Failed to get AP DB!",e.name,e.message);
					setTimeout(checkWebStatus, 10000);
				}
			}
			function get_ap_db()
			{
				document.getElementById("ap_db_display").innerHTML = "";
				var x_response = JSO_get_runtime_topology();
				get_ap_db_cb(x_response);
			}
			function LoadFrame()
			{
			}
			get_ap_db();
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
</html>