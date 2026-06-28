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
<header class="fixed-top"><nav id="top-nav" class="navbar navbar-expand-lg container"><a class="navbar-brand " href="/cgi-bin/home.asp"><div><img src="/img/logo_home.png" width="100" height="18" alt=""><div style="font-family: sans-serif; font-weight: bold;font-size: 12px;color: #000; margin-top: 0">OPTICAL NETWORK TERMINATION</div></div></a><button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"><em class="fas fa-align-justify"></em></span></button><div class="collapse navbar-collapse" id="navbarCollapse"><ul class="navbar-nav mr-auto sidenav" id="navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/home.asp"><%tcWebApi_get("String_Entry","NavigationHomeText","s")%><span class="sr-only"></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/deviceinfo.asp"><%tcWebApi_get("String_Entry","NavigationStatusDeviceText","s")%><span class="sr-only"></span></a></li><li class="nav-item active"><a class="nav-link" href="/cgi-bin/wifi-mesh-topology.asp"><%tcWebApi_get("String_Entry","EasyMeshStatus5Text","s")%><span class="sr-only">(current)</span></a></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#status-menu" aria-controls="status-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NavigationStatusStatisticsText","s")%></a><ul class="nav-second-level collapse" id="status-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/sta-statistics.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationTrafficText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/sta-wifiusers.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationStatusUsersText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/sta-users.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","ARPStatusText","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#network-menu" aria-controls="network-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NAVNetwork","s")%></a><ul class="nav-second-level collapse" id="network-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/net-wan.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationBasInternetText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/net-lan.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationBasLANText","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#wifi-menu" aria-controls="wifi-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NAVWifi","s")%></a><ul class="nav-second-level collapse" id="wifi-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/wifi.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationWiFiSettingsText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/wifi-11ac.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationWiFi11acSettingsText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/wifi-mesh.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationMesh","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#firewall-menu" aria-controls="firewall-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NavigationAdvFirewallText","s")%></a><ul class="nav-second-level collapse" id="firewall-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-spi.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","ContentFirewallText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-urlfilter.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","FILTERTYPE_index2","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-macfilter.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVL2Filter","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-parentalcontrol.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","ParentalControlText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/safehome.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","SafehomeText","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#apps-menu" aria-controls="apps-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NAVApplication","s")%></a><ul class="nav-second-level collapse" id="apps-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-dmz.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NatTopDMZText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-portforwarding.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NatVirsvrText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-sslim.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","SessionLimit","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-route.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","StaticRouteText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-ddns.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","dyDNS1Text","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-wifischeduling.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","WifiSchedulingText","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#tools-menu" aria-controls="tools-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NavigationMaintenanceText","s")%></a><ul class="nav-second-level collapse" id="tools-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-admin.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationMainAdminText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-time.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVSysTime","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-firmware.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationMainFirmwareText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-config.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVConfig","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-diagnostic.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationMainDiagnosticsText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-wan2lan.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","Wan2lanText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-log.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVLogs","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-reboot.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","RebootText","s")%></span></a></li></ul></li></ul><div class="top-item-groups"><form name="LanguageForm" method="POST" action="/cgi-bin/wifi-mesh-sta-runtime-topo.asp" class="nav-item dropdown"><input type="hidden" name="TokenString" value="<%tcWebApi_getToken()%>"><input type="hidden" name="Language_Flag" value="<% tcWebApi_get("LanguageSwitch_Entry","Type","s") %>"><a class="nav-link dropdown-toggle" href="#" id="LanguageDropdown" role="button" data-toggle="dropdown" aria-expanded="false"><% tcWebApi_get("String_Entry","LoginLanguage","s") %></a><ul class="dropdown-menu" aria-labelledby="LanguageDropdown"><li><a class="dropdown-item <% if tcWebApi_get("LanguageSwitch_Entry","Type","h") = "1" then asp_Write("active") end if %>" href="#" onclick="submitLanguageForm(1);"><% tcWebApi_get("String_Entry","LanguageVIELong","s") %></a></li><li><a class="dropdown-item <% if tcWebApi_get("LanguageSwitch_Entry","Type","h") = "2" then asp_Write("active") end if %>" href="#" onclick="submitLanguageForm(2);"><% tcWebApi_get("String_Entry","LanguageENGLong","s") %></a></li></ul></form><div id="signout" class="nav-item"><a class="nav-link" href="javascript:doLogout();"><em class="fa fa-sign-out-alt"></em><span class="nav-link-text"><% tcWebApi_get("String_Entry","LogoutText","s") %></span></a></div></div></div></header></nav><% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then
	if tcWebApi_get("Mesh_Common", "DeviceRole", "h") = "2" then %>
		<script language='javascript'>
		document.getElementById("network-menu").children[0].style="display: none";
		document.getElementById("network-menu").children[1].style="display: none";
		document.getElementById("wifi-menu").children[0].style="display: none";
		document.getElementById("wifi-menu").children[1].style="display: none";
		</script>
<% end if end if %>		<div id="content">
		<form class="form-inline" method="post" name="cbi" action="/cgi-bin/wifi-mesh-sta-runtime-topo.asp" autocomplete="off">
		<div class="row row-w-100">
			<div class="widget col-xs-12 col-lg-12">
				<ul class="row ul-tab">
					<li class="tab tab-disabled">
						<a href="/cgi-bin/wifi-mesh.asp"><%tcWebApi_get("String_Entry","EasyMeshBasicTest","s")%></a>
					</li>
					<li class="tab tab-disabled  d-none">
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
						<legend>Runtime Topology</legend>
						<div class="alert-message" id="getTopoInfoMsgDiv">
		    			<img src="/img/loading.gif" alt="" style="vertical-align:middle" width=30px/>
		    			<div style="padding-left: 15px">
								<label>Retrieving EasyMesh Run-time Topology Information!</label>
							</div>
						</div>
						<div class="alert-message error" style="display:none">
							<span><strong id="topoErrMsgDiv"></strong></span>
						</div>
						<div id="display_tree_vis" style="display:none"></div>
						<div class="form-group">
							<label class="col-lg-5"><%tcWebApi_get("String_Entry","EasyMeshRunTime1Text","s")%></label>
							<button class="small-button action-button" type="button" id="toggle_disp_tree_vis_detail_btn" onclick="toggle_disp_tree_vis_detail()" disabled="disabled">Show</button>
						</div>
						<div class="form-group">
							<label class="col-lg-5"><%tcWebApi_get("String_Entry","EasyMeshRunTime2Text","s")%></label>
							<button class="small-button action-button" type="button"  id="toggle_all_1905_dev_info_btn" onclick="toggle_disp_dev_table(this)" disabled="disabled">Show</button>
						</div>
						<div class="form-group" id="display_all_1905_dev_info_div" style="display:none">
						</div>
						<input type="hidden" name="Save_Flag" id="Save_Flag" value="0" />
						<div name="div_runtime_topology" id="div_runtime_topology" style="display:none"></div>
					</fieldset>
				</div>
				<div class="col-lg-12 d-flex align-items-center justify-content-center">
					<a href="/cgi-bin/wifi-mesh-sta.asp"><button type="button" class="action-button small-button"><%tcWebApi_get("String_Entry","ButtonBackText","s")%></button></a>
				</div>
			</div>
		</div>
		</form>
		</div>
		<script language="javascript" type=text/javascript>
			var max_cellspan = 2;
			if(typeof String.prototype.startsWith != 'function')
			{
					String.prototype.startsWith = function(prefix)
					{
							return this.slice(0, prefix.length) == prefix;
					}
			}
			function toggle_disp_tree_vis_detail()
			{
					window.open("/cgi-bin/wifi_map_get_run_time_topology_detail.asp","runtime_topology_detail","toolbar=no,menubar=no,height=400, width=800,location=0,left=200,top=200");
			}
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
	          if(k == "Device role")
	          {
	              v = get_dev_role_string(v);
	          }
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
	    function draw_topology_table(jsTopoInfo)
	    {
	        var tree_info = [];
	        var tree_info_count = 0;
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
	            var dev1905tbl = document.createElement("TABLE");
	            dev1905tbl.setAttribute("class", "cbi-section-table");
	            var dev1905fset = document.createElement("div");
	            dev1905fset.setAttribute("class", "table1_head");
	            var dev1905legend = document.createElement("p");
	            var dev1905a = document.createElement("A");
	            var dev1905text = document.createTextNode("1905 Device - " + (idx_1905 + 1));
	            dev1905a.setAttribute("href", "#");
	            dev1905a.appendChild(dev1905text);
	            dev1905legend.appendChild(dev1905a);
	            dev1905fset.appendChild(dev1905legend);
	            document.getElementById("display_all_1905_dev_info_div").appendChild(dev1905fset);
	            set_max_cellspan(obj_1905);
	            obj_loop(dev1905tbl, null, obj_1905);
	            tree_info[tree_info_count] = prep_tree_info(obj_1905);
	            document.getElementById("display_all_1905_dev_info_div").appendChild(dev1905tbl);
	            tree_info_count++;
	        }
	        tree_info.sort(function(a, b){return a.hopCount - b.hopCount});
	        disp_topology_vis(tree_info);
	    }
	    <% if tcWebApi_get("WebCustom_Entry","isNewEasyMeshSupport","h") = "Yes"  then %>
	    function prep_tree_info(dev1905Obj)
	    {
	        var node = {};
	        node["devRole"] = get_dev_role_string(dev1905Obj['Device role']);
	        node["alMac"] = dev1905Obj['AL MAC'];
	        node["hopCount"] = parseInt(dev1905Obj['Distance from controller']);
	        node['UplinkAlMac'] = dev1905Obj['Upstream 1905 device'];
	        node["wifistaInfo"] = {};
	        node["ethstaInfo"] = {};
	        for(var radIdx=0; radIdx < dev1905Obj['Radio Info'].length; radIdx++)
	        {
	            for(var bssIdx=0; bssIdx < dev1905Obj['Radio Info'][radIdx]['BSSINFO'].length; bssIdx++)
	            {
	                if(dev1905Obj['Radio Info'][radIdx]['BSSINFO'][bssIdx].hasOwnProperty('connected sta info'))
	                {
	                    for(var staIdx=0; staIdx < dev1905Obj['Radio Info'][radIdx]['BSSINFO'][bssIdx]["connected sta info"].length; staIdx++)
	                    {
	                        var ssid = dev1905Obj['Radio Info'][radIdx]['BSSINFO'][bssIdx]['SSID'];
													var staMac = dev1905Obj['Radio Info'][radIdx]['BSSINFO'][bssIdx]["connected sta info"][staIdx]['STA MAC address'];
													if (node["wifistaInfo"].hasOwnProperty(ssid))
													{
														node["wifistaInfo"][ssid].push(staMac);
													}
													else
													{
														node["wifistaInfo"][ssid] = Array(staMac);
													}
	                    }
	                }
	            }
	        }
	        for(var cliIdex = 0; cliIdex < dev1905Obj['Other Clients Info'].length; cliIdex++)
	        {
	        		if (dev1905Obj['Other Clients Info'][cliIdex].hasOwnProperty('Client Address'))
	        		{
	        			var cliAdd = dev1905Obj['Other Clients Info'][cliIdex]['Client Address'];
	        			var medium = dev1905Obj['Other Clients Info'][cliIdex]['Medium'];
	        			if (node["ethstaInfo"].hasOwnProperty(medium))
								{
									node["ethstaInfo"][medium].push(cliAdd);
								}
								else
								{
									node["ethstaInfo"][medium] = Array(cliAdd);
								}
	        		}
	        }
	        return node;
	    }
	    <% else %>
	    function prep_tree_info(dev1905Obj)
	    {
	        var node = {};
	        node["devRole"] = get_dev_role_string(dev1905Obj['Device role']);
	        node["alMac"] = dev1905Obj['AL MAC'];
	        node["hopCount"] = parseInt(dev1905Obj['Distance from controller']);
	        node['UplinkAlMac'] = dev1905Obj['Upstream 1905 device'];
	        node["staInfo"] = {};
	        for(var radIdx=0; radIdx < dev1905Obj['Radio Info'].length; radIdx++)
	        {
	            for(var bssIdx=0; bssIdx < dev1905Obj['Radio Info'][radIdx]['BSSINFO'].length; bssIdx++)
	            {
	                if(dev1905Obj['Radio Info'][radIdx]['BSSINFO'][bssIdx].hasOwnProperty('connected sta info'))
	                {
	                    for(var staIdx=0; staIdx < dev1905Obj['Radio Info'][radIdx]['BSSINFO'][bssIdx]["connected sta info"].length; staIdx++)
	                    {
	                        var ssid = dev1905Obj['Radio Info'][radIdx]['BSSINFO'][bssIdx]['SSID'];
							var staMac = dev1905Obj['Radio Info'][radIdx]['BSSINFO'][bssIdx]["connected sta info"][staIdx]['STA MAC address'];
							if (node["staInfo"].hasOwnProperty(ssid))
							{
								node["staInfo"][ssid].push(staMac);
							}
							else
							{
								node["staInfo"][ssid] = Array(staMac);
							}
	                    }
	                }
	            }
	        }
	        return node;
	    }
	    <% end if %>
	    function get_uplink_tree_info(tree_info, mac)
	    {
	        for(var nIdx=0; nIdx < tree_info.length; nIdx++)
	        {
	            if(tree_info[nIdx]['alMac'] == mac)
	            {
	                return '"' + tree_info[nIdx]['devRole'] + '\n' + "AL_MAC" + ' - ' + tree_info[nIdx]['alMac'] + '"';
	            }
	        }
	        return "";
	    }
	    <% if tcWebApi_get("WebCustom_Entry","isNewEasyMeshSupport","h") = "Yes"  then %>
	    function disp_topology_vis(tree_info)
	    {
	        var div = document.getElementById("display_tree_vis");
	        div.style.display = "";
	        var topoErrMsg = document.getElementById("topoErrMsgDiv");
	        topoErrMsg.innerHTML = "";
	        var str = "";
	        var numStaPerDev = 0;
	        console.log("TREE INFO VIS = ",tree_info);
	        for(var nIdx=0; nIdx < tree_info.length; nIdx++)
	       	{
	            if (tree_info[nIdx]['devRole'] == "Agent")
	            {
	                var upLinkNodeStr = get_uplink_tree_info(tree_info, tree_info[nIdx]['UplinkAlMac']);
	                if(upLinkNodeStr != "")
	                {
	                    str += '"' + tree_info[nIdx]['devRole'] + '\n' + "AL_MAC" + ' - ' + tree_info[nIdx]['alMac'] + '"' + '->' + upLinkNodeStr + " ";
	                }
	                else
	                {
	                    console.log("INFO: AGENT WITH NO UP-LINK MAC = ",tree_info[nIdx]['alMac']);
	                    topoErrMsg.innerHTML += "<br />ERROR: Agent with AL-MAC " + tree_info[nIdx]['alMac'] +" has no upstream 1905 device!";
	                    topoErrMsg.style.display = "";
	                }
	            }
	            for(var ssid in tree_info[nIdx]['wifistaInfo'])
	            {
	                var staIdx;
	                for(var staIdx=0; staIdx < tree_info[nIdx]['wifistaInfo'][ssid].length; staIdx++)
	                {
	                    var mac1stOctet = parseInt(tree_info[nIdx]['wifistaInfo'][ssid][staIdx].substring(0,2),16);
	                    str += '"STA\nMAC - ' + tree_info[nIdx]['wifistaInfo'][ssid][staIdx] + '\nSSID - ' + ssid + '"' + '->' + '"' + tree_info[nIdx]['devRole'] + '\n' + "AL_MAC" + ' - ' + tree_info[nIdx]['alMac'] + '"' + " ";
	                    numStaPerDev += 1;
	                }
	            }
	            for(var medium in tree_info[nIdx]['ethstaInfo'])
	            {
	                var ethstaIdx;
	                for(var ethstaIdx=0; ethstaIdx < tree_info[nIdx]['ethstaInfo'][medium].length; ethstaIdx++)
	                {
	                    var mac1stOctet = parseInt(tree_info[nIdx]['ethstaInfo'][medium][ethstaIdx].substring(0,2),16);
	                    if(mac1stOctet & 0x02)
	                    {
	                        continue;
	                    }
	                    str += '"STA\nMAC - ' + tree_info[nIdx]['ethstaInfo'][medium][ethstaIdx] + '\nMedium - ' + medium + '"' + '->' + '"' + tree_info[nIdx]['devRole'] + '\n' + "AL_MAC" + ' - ' + tree_info[nIdx]['alMac'] + '"' + " ";
	                    numStaPerDev += 1;
	                }
	            }
	            if (numStaPerDev == 0 && tree_info.length == 1 &&
	                (tree_info[nIdx]['devRole'] == "Controller" ||
	                tree_info[nIdx]['devRole'] == "Agent"))
	            {
	                str += '"' + tree_info[nIdx]['devRole'] + '\n' + 'AL_MAC' + ' - ' + tree_info[nIdx]['alMac'] + '"' + " ";
	            }
	        }
	        console.log("TREE INFO str = ",str);
	        var NewDOTstring = "dinetwork{"+str+"}";
	        var parsedData = vis.network.convertDot(NewDOTstring);
	        for(var count=0;count<parsedData.nodes.length;count++)
	        {
	            console.log("NODE LABEL = ",parsedData.nodes[count].label);
	            if(parsedData.nodes[count].label.startsWith('Agent'))
	            {
	                parsedData.nodes[count].color='Orange';
	            }
	            else if(parsedData.nodes[count].label.startsWith('STA'))
	            {
	                parsedData.nodes[count].color='Green';
	            }
	            else
	            {
	                parsedData.nodes[count].shape='box';
	            }
	        }
	        var data = {
	          nodes: parsedData.nodes,
	          edges: parsedData.edges
	        }
	        var options = parsedData.options;
	        // create a network
	        var network = new vis.Network(div, data, options);
	        network.setSize('440px','300px');
	    }
	    <% else %>
	    function disp_topology_vis(tree_info)
	    {
	        var div = document.getElementById("display_tree_vis");
	        div.style.display = "";
	        var topoErrMsg = document.getElementById("topoErrMsgDiv");
	        topoErrMsg.innerHTML = "";
	        var str = "";
	        var numStaPerDev = 0;
	        console.log("TREE INFO VIS = ",tree_info);
	        for(var nIdx=0; nIdx < tree_info.length; nIdx++)
	       	{
	            if (tree_info[nIdx]['devRole'] == "Agent")
	            {
	                var upLinkNodeStr = get_uplink_tree_info(tree_info, tree_info[nIdx]['UplinkAlMac']);
	                if(upLinkNodeStr != "")
	                {
	                    str += '"' + tree_info[nIdx]['devRole'] + '\n' + "AL_MAC" + ' - ' + tree_info[nIdx]['alMac'] + '"' + '->' + upLinkNodeStr + " ";
	                }
	                else
	                {
	                    console.log("INFO: AGENT WITH NO UP-LINK MAC = ",tree_info[nIdx]['alMac']);
	                    topoErrMsg.innerHTML += "<br />ERROR: Agent with AL-MAC " + tree_info[nIdx]['alMac'] +" has no upstream 1905 device!";
	                    topoErrMsg.style.display = "";
	                }
	            }
	            for(var ssid in tree_info[nIdx]['staInfo'])
	            {
	                var staIdx;
	                for(var staIdx=0; staIdx < tree_info[nIdx]['staInfo'][ssid].length; staIdx++)
	                {
	                    var mac1stOctet = parseInt(tree_info[nIdx]['staInfo'][ssid][staIdx].substring(0,2),16);
	                    str += '"STA\nMAC - ' + tree_info[nIdx]['staInfo'][ssid][staIdx] + '\nSSID - ' + ssid + '"' + '->' + '"' + tree_info[nIdx]['devRole'] + '\n' + "AL_MAC" + ' - ' + tree_info[nIdx]['alMac'] + '"' + " ";
	                    numStaPerDev += 1;
	                }
	            }
	            if (numStaPerDev == 0 && tree_info.length == 1 &&
	                (tree_info[nIdx]['devRole'] == "Controller" ||
	                tree_info[nIdx]['devRole'] == "Agent"))
	            {
	                str += '"' + tree_info[nIdx]['devRole'] + '\n' + 'AL_MAC' + ' - ' + tree_info[nIdx]['alMac'] + '"' + " ";
	            }
	        }
	        console.log("TREE INFO str = ",str);
	        var NewDOTstring = "dinetwork{"+str+"}";
	        var parsedData = vis.network.convertDot(NewDOTstring);
	        for(var count=0;count<parsedData.nodes.length;count++)
	        {
	            console.log("NODE LABEL = ",parsedData.nodes[count].label);
	            if(parsedData.nodes[count].label.startsWith('Agent'))
	            {
	                parsedData.nodes[count].color='Orange';
	            }
	            else if(parsedData.nodes[count].label.startsWith('STA'))
	            {
	                parsedData.nodes[count].color='Green';
	            }
	            else
	            {
	                parsedData.nodes[count].shape='box';
	            }
	        }
	        var data = {
	          nodes: parsedData.nodes,
	          edges: parsedData.edges
	        }
	        var options = parsedData.options;
	        // create a network
	        var network = new vis.Network(div, data, options);
	        network.setSize('440px','300px');
	    }
	    <% end if %>
	    function toggle_disp_dev_table(btn)
	    {
	        var div = document.getElementById("display_all_1905_dev_info_div");
	        var btn_str = btn.innerHTML;
	        if(btn_str.startsWith('<%tcWebApi_get("String_Entry","EasyMeshRunTime5Text","s")%>'))
	        {
	            btn.innerHTML = '<%tcWebApi_get("String_Entry","EasyMeshRunTime3Text","s")%>';
	            div.style.display = "";
	            if(div.children.length == 0)
	            {
	                div.innerHTML = "";
	                var b = document.createElement("BIG");
	                var s = document.createElement("STRONG");
	                s.setAttribute("class", "alert-message");
	                var t = document.createTextNode("<%tcWebApi_get("String_Entry","EasyMeshRunTime4Text","s")%>");
	                s.appendChild(t);
	                b.appendChild(s);
	                div.appendChild(b);
	            }
	        }
	        else
	        {
	            btn.innerHTML = '<%tcWebApi_get("String_Entry","EasyMeshRunTime2Text","s")%>';
	            div.style.display = "none";
	        }
	    }
	    function get_dev_role_string(devRole)
	    {
	        switch(parseInt(devRole))
	        {
	            case 1:
	                return 'Controller';
	            case 2:
	                return 'Agent';
	            default:
	                return 'Not Configured';
	        }
	    }
	    function get_run_time_topology_submit()
	    {
	    		location.href = '/cgi-bin/wifi-mesh-sta-runtime-topo.asp';
	    }
	    function get_run_time_topology_cb(rsp)
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
	                document.getElementById("display_all_1905_dev_info_div").innerHTML = "";
	                document.getElementById("display_tree_vis").innerHTML = "";
	                draw_topology_table(jsTopoInfo);
	            }
	            else
	            {
	                console.log("Failed to get Topology Info!\nStatus: ",r.status);
	            }
	            setTimeout(get_run_time_topology_submit, 15000);
	        }
	        catch(e)
	        {
	            console.log("Incorrect response! Failed to get Topology Info!",e.name,e.message);
	            setTimeout(get_run_time_topology_submit, 15000);
	        }
	    }
			function get_run_time_topology()
	    {
	        document.getElementById("topoErrMsgDiv").style.display = "none";
	        document.getElementById("display_all_1905_dev_info_div").style.display = "none";
	        document.getElementById("display_tree_vis").style.display = "none";
	        document.getElementById("toggle_disp_tree_vis_detail_btn").disabled = true;
	        document.getElementById("toggle_all_1905_dev_info_btn").disabled = true;
	        document.getElementById("toggle_all_1905_dev_info_btn").innerHTML = '<%tcWebApi_get("String_Entry","EasyMeshRunTime2Text","s")%>';
	        document.getElementById("getTopoInfoMsgDiv").style.display = "";
	        var x_response = JSO_get_runtime_topology();
	        document.getElementById('getTopoInfoMsgDiv').style.display = 'none';
	        get_run_time_topology_cb(x_response);
	        document.getElementById("toggle_disp_tree_vis_detail_btn").disabled = false;
	        document.getElementById("toggle_all_1905_dev_info_btn").disabled = false;
	    }
			get_run_time_topology();
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