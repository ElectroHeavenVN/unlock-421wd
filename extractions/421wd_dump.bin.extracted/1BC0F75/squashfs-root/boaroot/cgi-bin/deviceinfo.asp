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
<title><%tcWebApi_get("String_Entry","BranchName","s")%> ONT - <%tcWebApi_get("String_Entry","NavigationStatusDeviceText","s")%></title>		<meta charset="utf-8">
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
			function updateResult(item, val) {
				val1 = val.toLowerCase();
				if( val1 == "no attribute information")
				{
					document.getElementById(item).innerHTML = "N/A";
				}
				if( val1 == "no node information")
				{
					document.getElementById(item).innerHTML = "N/A";
				}
				else if (val1 == "up")
				{
				document.getElementById(item).innerHTML = "<%tcWebApi_get("String_Entry","DevicePortUpText","s")%>";
				}
				else if (val1 == "down")
				{	
					document.getElementById(item).innerHTML = "<%tcWebApi_get("String_Entry","DevicePortDownText","s")%>";
				}
				else if (val1 == "connected")
				{
					document.getElementById(item).innerHTML = "<%tcWebApi_get("String_Entry","CwmpConnText","s")%>";
				}
				else if (val1 == "connecterror")
				{
					document.getElementById(item).innerHTML = "<%tcWebApi_get("String_Entry","CwmpNotConnText","s")%>";
				}
				else if (val1 == "not connected")
				{
					document.getElementById(item).innerHTML = "<%tcWebApi_get("String_Entry","Dongle3GNotConnectText","s")%>";
				}
				else if (val1 == "connecting")
				{
					document.getElementById(item).innerHTML = "<%tcWebApi_get("String_Entry","Dongle3GConnectingText","s")%>";
				}
				else if (val == "Dynamic IP")
				{
					document.getElementById(item).innerHTML = "<%tcWebApi_get("String_Entry","WANDynamicIPText","s")%>";
				}
				else if (val == "Static IP")
				{
					document.getElementById(item).innerHTML = "<%tcWebApi_get("String_Entry","WANStaticIPText","s")%>";
				}
				else if (val == "Bridge")
				{
					document.getElementById(item).innerHTML = "<%tcWebApi_get("String_Entry","WANBridgeModeText","s")%>";
				}
				else if (val1 == "enabled")
				{
					document.getElementById(item).innerHTML = "<%tcWebApi_get("String_Entry","EnabledText","s")%>";
				}
				else if (val1 == "disabled")
				{
					document.getElementById(item).innerHTML = "<%tcWebApi_get("String_Entry","Disabled","s")%>";
				}
				else
				{
					document.getElementById(item).innerHTML = val;
				}
			}
			function tofixed2(a) {
				if (a < 10)
					return ('0' + a);
				else
					return a;
			}
			function translate_time(data) {
				if (isNaN(data)) {
					return ("N/A");
				}
				var h, m, s, string , day;
				s = parseInt(data);
				h = ( s - s%3600) / 3600;
				s = s%3600;
				m = ( s - s%60) / 60;
				s = s%60;
				day = ( h - h%24) / 24;
				h = h%24;
				h = tofixed2(h);
				m = tofixed2(m);
				s = tofixed2(s);
				if (day == 0) {
					string = h+':'+m+':'+s;
				}
				else {
					string = day + " <%tcWebApi_get("String_Entry","UserInfodayText","s")%> " + h + ':' + m + ':' + s;
				}
				return string;
			}
			var pvc_counts=<% tcWebApi_get("WanInfo_Common","CycleNum","s") %>;
			//get all value
			// num 0 - wan name
			var vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
			var Wan_WanName = vArrayStr.split(',');
			// num 1 - if name <% tcWebApi_get("WanInfo_Common","CycleValue","h") %>
			// num 2 - wan index
			vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
			var vEntryIndex = vArrayStr.split(',');
			// num 3 - wan enable
			vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
			var vWan_Active = vArrayStr.split(',');
			sortWAN(Wan_WanName, vEntryIndex);
			sortWAN(Wan_WanName, vWan_Active);
			sortWAN(Wan_WanName, Wan_WanName); // always sort WanName last;
			function WriteWanNameSelected() {
				var select = document.getElementById('WanIdx');
				var isSel = -1;
				for (var i = 0; i < pvc_counts; i++) {
					if ((vWan_Active[i] == "Yes") && (Wan_WanName[i].indexOf("TR069") < 0)) {
						var opt = new Option(Wan_WanName[i], vEntryIndex[i]);
						if ( document.deviceinfo_form.curSetIndex.value == vEntryIndex[i] )
						{
							opt.selected = true
							isSel = i;
						}
						select.options.add ( opt );
					}
				}
				if (-1 == isSel) {
					select[0].selected = true;
				}
			}
			/*
			function WanIndexConstruction(domain,WanName)
			{
				this.domain = domain;
				this.WanName = WanName;
			}
			function CheckWansActives()
			{
				var	nCurTemp = 0;
				var	vcurLinks = new Array(pvc_counts);
				for(var i=0; i<pvc_counts; i++)
				{	
					vcurLinks[nCurTemp++] = new WanIndexConstruction(vEntryIndex[i], Wan_WanName[i]);
				}
				var	vObjRet = new Array(nCurTemp+1);
				for(var m=0; m<nCurTemp; m++)
				{
					vObjRet[m] = vcurLinks[m];
				}
				vObjRet[nCurTemp] = null;
				return vObjRet;
			}
			var	CurWan = CheckWansActives();
			var WanNameObjs;
			function WriteWanNameSelected_old()
			{
				var WanIDNums = CurWan;
				var nlength = WanIDNums.length-1;
				var i = 0;
				var isSel = 0;
				if(nlength == 1) 
					document.deviceinfo_form.curSetIndex.value = WanIDNums[0].domain;
				WanNameObjs = new Array(nlength)
				for( i=0; i< nlength; i++)
				{
					WanNameObjs[i] = new WanNameObject(WanIDNums[i].domain, WanIDNums[i].WanName, IFIdxArray[i]);
				}
				WanNameObjs.sort(WanNameSort);
				with (getElById('WanIdx'))
				{
					for( i=0; i< WanNameObjs.length; i++)
					{
						var opt = new Option(WanNameObjs[i].IfaceName, WanNameObjs[i].IfaceDomain);
						if ( document.deviceinfo_form.curSetIndex.value == WanNameObjs[i].IfaceDomain )
						{
							opt.selected = true
							isSel = i;
						}
						options.add ( opt );
					}
				}
			}
			function WanNameObject(IFDomain, IFName, IFIdx)
			{
				this.IfaceDomain = IFDomain;
				this.IfaceName = IFName;
				this.IfaceIndex = IFIdx;
			} */
			function ShowWan() {
			var val = document.deviceinfo_form.WanIdx.value;
			var entry = parseInt(val)%8;
			var pvc = (parseInt(val) - entry)/8;
			$.ajax({
				url: "/cgi-bin/get_deviceinfo.cgi?val=" + val + "&pvc="+pvc+"&entry="+entry,
				method: 'GET', 
				complete: function(res){
					try {
							if (/iPad|iPhone|iPod/.test(navigator.userAgent) && !window.MSStream) {
								Pace.stop();
							}
							obj = JSON.parse(res.responseText);
							if (obj.wan_active != "Yes") {
								$("#wan-disabled").show();
								$("#wan-general").hide();
								$("#wan-ip4-group").hide();
								$("#wan-ip6-group").hide();
								return;
							}
							else {
								$("#wan-general").show();
								$("#wan-disabled").hide();
							}
							updateResult("wan-mac",obj.wan_mac)
							if (obj.wan_connect_type == "3") {
								updateResult("cont-type","Bridge")
								$("#ppp-time-div").hide();
								$("#wan-ip4-group").hide();
								$("#wan-ip6-group").hide();
							}
							else {
								if (obj.wan_connect_type == "0")
									updateResult("cont-type","Dynamic IP")
								else if (obj.wan_connect_type == "1")
									updateResult("cont-type","Static IP")
								else if (obj.wan_connect_type == "2")
									updateResult("cont-type","PPPoE")
								if (obj.wan_connect_type == "2") {
									$("#ppp-time-div").show();
									updateResult("ppp-time",translate_time(obj.ppp_con_time));
								}
								else {
									$("#ppp-time-div").hide();
								}
								$("#wan-ip4-group").hide();
								$("#wan-ip6-group").hide();
								if ((obj.wan_ipver == "IPv4") || (obj.wan_ipver == "IPv4/IPv6")) {
									$("#wan-ip4-group").show();
									updateResult("wan4_stt",obj.wan_ip_stt);
									updateResult("wan4_ip",obj.wan_ip_addr);
									updateResult("wan4_mask",obj.wan_ip_subnet);
									updateResult("wan4_gw",obj.wan_ip_gw);
									updateResult("wan4_dns1",obj.wan_ip_dns);
									updateResult("wan4_dns2",obj.wan_ip_dns2);
								}
								if ((obj.wan_ipver == "IPv6") || (obj.wan_ipver == "IPv4/IPv6")) {
									$("#wan-ip6-group").show();
									updateResult("wan6_stt",obj.wan_ipv6_stt);
									updateResult("wan6_ip",obj.wan_ipv6_addr);
									updateResult("wan6_gw",obj.wan_ipv6_gw);
									updateResult("wan6_pf",obj.wan_ipv6_pfix);
									updateResult("wan6_dns1",obj.wan_ipv6_dns);
									updateResult("wan6_dns2",obj.wan_ipv6_dns2);
									updateResult("wan6_pd",obj.wan_ipv6_prede);
								}
							}
							//ONTS-153-218
							if (obj.onustate == 5)
							{
								if (obj.link_state == "up") {
									document.getElementById("QIPONStt_status").style.color = "green";
									updateResult("QIPONStt_status", '<%tcWebApi_get("String_Entry","DevInfoConneText","s")%>'+' (O'+obj.onustate+')');
								}
								else {
									document.getElementById("QIPONStt_status").style.color = "red";
									updateResult("QIPONStt_status", '<%tcWebApi_get("String_Entry","DevInfoUnConneText","s")%>'+' (<%tcWebApi_get("String_Entry","DevInfoUnconfiguredText","s")%>)');
								}
							}
							else
							{
								document.getElementById("QIPONStt_status").style.color = "red";
								if (obj.onustate == 0)
									updateResult("QIPONStt_status", '<%tcWebApi_get("String_Entry","DevInfoUnConneText","s")%>'+' (O1)');
								else
									updateResult("QIPONStt_status", '<%tcWebApi_get("String_Entry","DevInfoUnConneText","s")%>'+' (O'+obj.onustate+')');
							}
							if (obj.ipv4_defaultroute == "" || obj.ipv4_defaultroute == "no node information")
							{
								document.getElementById("QIIP4Stt_status").style.color = "red";
								updateResult("QIIP4Stt_status", '<%tcWebApi_get("String_Entry","ErrorText","s")%>');
							}
							else
							{
								document.getElementById("QIIP4Stt_status").style.color = "green";
								updateResult("QIIP4Stt_status", obj.ipv4_defaultroute);
							}
							if (obj.ipv6_defaultroute == "" || obj.ipv6_defaultroute == "no node information")
							{
								document.getElementById("QIIP6Stt_status").style.color = "red";
								updateResult("QIIP6Stt_status", "<%tcWebApi_get("String_Entry","ErrorText","s")%>");
							}
							else
							{
								document.getElementById("QIIP6Stt_status").style.color = "green";
								updateResult("QIIP6Stt_status", obj.ipv6_defaultroute);	
							}
							if (obj.ping4_ret == "0" || obj.ping6_ret == "0")
							{
								document.getElementById("QII_status").style.color = "green";
								updateResult("QII_status", '<%tcWebApi_get("String_Entry","DevInfoConneText","s")%>');
							}
							else
							{
								document.getElementById("QII_status").style.color = "red";
								updateResult("QII_status", '<%tcWebApi_get("String_Entry","DevInfoUnConneText","s")%>');
							}
					}
					catch {
					}
				}
			})
			}
			function ShowLan()
			{
				var dhcp_enable="<%tcWebApi_get("Lan_Dhcp", "type", "s")%>";
				var dhcp6_enable="<%tcWebApi_get("Dhcp6s_Entry", "Enable", "s")%>";
				var PortConnSpeed = ["<% tcWebApi_get("Info_Ether","Port1Speed","s") %>", "<% tcWebApi_get("Info_Ether","Port2Speed","s") %>","<% tcWebApi_get("Info_Ether","Port3Speed","s") %>","<% tcWebApi_get("Info_Ether","Port4Speed","s") %>"];
				for (var i = 0; i < 4; i++) {
					if (PortConnSpeed[i] != "Down") {
						updateResult("lan_port" + (i + 1), "up");
						updateResult("lan_port" + (i + 1) + "_sp", PortConnSpeed[i]);
					}
					else {
						updateResult("lan_port" + (i + 1), "down");
						updateResult("lan_port" + (i + 1)+ "_sp", "down");
					}
				}
				if (dhcp_enable == "1") {
					updateResult("dhcp_enable", "Enabled");
				} else {
					updateResult("dhcp_enable", "Disabled");
				}
				if (dhcp6_enable == "1") {
					updateResult("dhcp6_enable", "Enabled");
				} else {
					updateResult("dhcp6_enable", "Disabled");
				}
			}
			function transTemperature(temperature)
			{
				var temp = Number(temperature);
				if (temp >= Math.pow(2, 15)){
					<% if tcwebApi_get("WebCustom_Entry","isCTPONGDTemperatureSupported","h") = "Yes" then %>	
						return -((Math.pow(2, 16)-temp)/256).toFixed(1);
					<% else %>
						return -Math.round((Math.pow(2, 16)-temp)/256);
					<% end if %>
				}else{
					<% if tcwebApi_get("WebCustom_Entry","isCTPONGDTemperatureSupported","h") = "Yes" then %>	
						return (temp/256).toFixed(1);
					<% else %>
						return Math.round(temp/256);
					<% end if %>
				}
			}		
			function ShowPonInfo()
			{
				var LinkState = '<% tcWebApi_get("XPON_Common","trafficStatus","s") %>';
				var SupplyVoltage = '<%tcWebApi_get("Info_PonPhy", "SupplyVoltage", "s")%>';
				var TxBiasCurrent = '<%tcWebApi_get("Info_PonPhy", "TxBiasCurrent", "s")%>';
				var Temperature = '<%tcWebApi_get("Info_PonPhy", "Temperature", "s")%>';
				var TxPower = '<%tcWebApi_get("Info_PonPhy", "TxPower", "s")%>';
				var RxPower = '<%tcWebApi_get("Info_PonPhy", "RxPower", "s")%>';
				var olt_type = '<%tcWebApi_get("GPON_OLT", "VendorId", "s")%>';
				var olt_type_code = [["ALCL", "HWTC", "ZTEG", "DSNW", "DSNW1"], ["ALU","Huawei", "ZTE", "DASAN", "DASAN"]];
				var phy_stat = '<% tcWebApi_get("XPON_Common","phyStatus","s") %>';
				updateResult("link_state", LinkState);
				$("#pon_rx_power").html((Math.round(Math.log((Number(RxPower))/10000)/(Math.log(10))*100)/10) + " dBm");
				$("#pon_bias_current").html(Number(TxBiasCurrent)*2/1000  + " mA");
				$("#pon_supply_voltage").html(Number(SupplyVoltage)/10 + " mV");
				$("#pon_tx_power").html(Math.round(Math.log((Number(TxPower))/10000)/(Math.log(10))*100)/10 + " dBm");	
				$("#pon_temperate").html(transTemperature(Temperature) + " &deg;C");
				if (LinkState == "up") {
					//ONTS-153-218
					document.getElementById("QIPONStt_RxPower").style.color = "green";
					document.getElementById("QIPONStt_TxPower").style.color = "green";
				}
				else //ONTS-153-218
				{
					document.getElementById("QIPONStt_TxPower").style.color = "red";
					document.getElementById("QIPONStt_RxPower").style.color = "red";
				}
				$("#QIPONStt_RxPower").html((Math.round(Math.log((Number(RxPower))/10000)/(Math.log(10))*100)/10) + " dBm");
				$("#QIPONStt_TxPower").html(Math.round(Math.log((Number(TxPower))/10000)/(Math.log(10))*100)/10 + " dBm");
				var i = olt_type_code[0].indexOf(olt_type)
				if (i >= 0) {
					$("#olt_type").html(olt_type_code[1][i]);
				}
				else {
					$("#olt_type").html(olt_type);
				}
			}
			function write_time() {
				var time, string, min, hour, day, month, year, timezone;
				time = '<%tcWebApi_get("DeviceInfo","cur_time2","s")%>';
				timezone = '<%tcWebApi_get("Timezone_Entry","TZ","s")%>';
				var curTimelist = time.split('/');
				if ( 5 == curTimelist.length )
				{
					month = tofixed2(parseInt(curTimelist[0]));
					day = tofixed2(parseInt(curTimelist[1]));
					year = curTimelist[2];
					hour = tofixed2(parseInt(curTimelist[3]));
					min = tofixed2(parseInt(curTimelist[4]));
					string = hour + ":" + min + "   ";
					string += day + "/" + month + "/" + year + " " + timezone;
					$("#system_time").html(string);
				}
				else {
					$("#system_time").html("N/A");
				}
			}
			function write_uptime() {
				var time;
				time = '<%tcWebApi_get("DeviceInfo","passedSystime","s")%>';
				var curTimelist = time.split(':');
				if ( 4 == curTimelist.length )
				{
					$("#system_uptime").html(curTimelist[0] + " <%tcWebApi_get("String_Entry","UserInfodayText","s")%> " + curTimelist[1] + ":"+ curTimelist[2] + ":"+ curTimelist[3]);
				}
				else {
					$("#system_uptime").html(time);
				}
			}
			function ShowTr069() {
				var ip = "<%TCWebApi_get("WanInfo_Entry8","IP","s")%>";
				var result = "<%TCWebApi_get("Cwmp_Entry","Inform_Status","s")%>";
				if (result == "8") {
					$("#tr069-sta-1").html("<%tcWebApi_get("String_Entry","CwmpConnText","s")%>");
				}
				else {
					$("#tr069-sta-1").html("<%tcWebApi_get("String_Entry","CwmpNotConnText","s")%>");
				}
				updateResult("tr069-ip",ip);
			}
			function ShowUI() {
				if ("<%tcWebApi_get("Wan_Common", "ProfileBridge", "s") %>" == "1") {
					$("#InternetInfoDiv").hide();
				};
				write_time();
				write_uptime();
				ShowTr069();
				ShowWan();
				ShowLan();
				ShowPonInfo();
			}
		</script>
	</head>
	<body onload="ShowUI();" class="container">
<header class="fixed-top"><nav id="top-nav" class="navbar navbar-expand-lg container"><a class="navbar-brand " href="/cgi-bin/home.asp"><div><img src="/img/logo_home.png" width="100" height="18" alt=""><div style="font-family: sans-serif; font-weight: bold;font-size: 12px;color: #000; margin-top: 0">OPTICAL NETWORK TERMINATION</div></div></a><button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"><em class="fas fa-align-justify"></em></span></button><div class="collapse navbar-collapse" id="navbarCollapse"><ul class="navbar-nav mr-auto sidenav" id="navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/home.asp"><%tcWebApi_get("String_Entry","NavigationHomeText","s")%><span class="sr-only"></span></a></li><li class="nav-item active"><a class="nav-link" href="/cgi-bin/deviceinfo.asp"><%tcWebApi_get("String_Entry","NavigationStatusDeviceText","s")%><span class="sr-only">(current)</span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/wifi-mesh-topology.asp"><%tcWebApi_get("String_Entry","EasyMeshStatus5Text","s")%><span class="sr-only"></span></a></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#status-menu" aria-controls="status-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NavigationStatusStatisticsText","s")%></a><ul class="nav-second-level collapse" id="status-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/sta-statistics.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationTrafficText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/sta-wifiusers.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationStatusUsersText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/sta-users.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","ARPStatusText","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#network-menu" aria-controls="network-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NAVNetwork","s")%></a><ul class="nav-second-level collapse" id="network-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/net-wan.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationBasInternetText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/net-lan.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationBasLANText","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#wifi-menu" aria-controls="wifi-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NAVWifi","s")%></a><ul class="nav-second-level collapse" id="wifi-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/wifi.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationWiFiSettingsText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/wifi-11ac.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationWiFi11acSettingsText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/wifi-mesh.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationMesh","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#firewall-menu" aria-controls="firewall-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NavigationAdvFirewallText","s")%></a><ul class="nav-second-level collapse" id="firewall-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-spi.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","ContentFirewallText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-urlfilter.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","FILTERTYPE_index2","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-macfilter.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVL2Filter","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-parentalcontrol.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","ParentalControlText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/safehome.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","SafehomeText","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#apps-menu" aria-controls="apps-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NAVApplication","s")%></a><ul class="nav-second-level collapse" id="apps-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-dmz.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NatTopDMZText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-portforwarding.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NatVirsvrText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-sslim.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","SessionLimit","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-route.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","StaticRouteText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-ddns.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","dyDNS1Text","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-wifischeduling.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","WifiSchedulingText","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#tools-menu" aria-controls="tools-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NavigationMaintenanceText","s")%></a><ul class="nav-second-level collapse" id="tools-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-admin.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationMainAdminText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-time.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVSysTime","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-firmware.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationMainFirmwareText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-config.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVConfig","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-diagnostic.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationMainDiagnosticsText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-wan2lan.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","Wan2lanText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-log.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVLogs","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-reboot.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","RebootText","s")%></span></a></li></ul></li></ul><div class="top-item-groups"><form name="LanguageForm" method="POST" action="/cgi-bin/deviceinfo.asp" class="nav-item dropdown"><input type="hidden" name="TokenString" value="<%tcWebApi_getToken()%>"><input type="hidden" name="Language_Flag" value="<% tcWebApi_get("LanguageSwitch_Entry","Type","s") %>"><a class="nav-link dropdown-toggle" href="#" id="LanguageDropdown" role="button" data-toggle="dropdown" aria-expanded="false"><% tcWebApi_get("String_Entry","LoginLanguage","s") %></a><ul class="dropdown-menu" aria-labelledby="LanguageDropdown"><li><a class="dropdown-item <% if tcWebApi_get("LanguageSwitch_Entry","Type","h") = "1" then asp_Write("active") end if %>" href="#" onclick="submitLanguageForm(1);"><% tcWebApi_get("String_Entry","LanguageVIELong","s") %></a></li><li><a class="dropdown-item <% if tcWebApi_get("LanguageSwitch_Entry","Type","h") = "2" then asp_Write("active") end if %>" href="#" onclick="submitLanguageForm(2);"><% tcWebApi_get("String_Entry","LanguageENGLong","s") %></a></li></ul></form><div id="signout" class="nav-item"><a class="nav-link" href="javascript:doLogout();"><em class="fa fa-sign-out-alt"></em><span class="nav-link-text"><% tcWebApi_get("String_Entry","LogoutText","s") %></span></a></div></div></div></header></nav><% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then
	if tcWebApi_get("Mesh_Common", "DeviceRole", "h") = "2" then %>
		<script language='javascript'>
		document.getElementById("network-menu").children[0].style="display: none";
		document.getElementById("network-menu").children[1].style="display: none";
		document.getElementById("wifi-menu").children[0].style="display: none";
		document.getElementById("wifi-menu").children[1].style="display: none";
		</script>
<% end if end if %>		<div id="content">
			<form class="form-inline" METHOD="POST" ACTION="/cgi-bin/deviceinfo.asp" name="deviceinfo_form" style="align-items: flex-start;">
			<div class="row row-w-100">
			<!--ONTS-153-218-->
			<div class="col-sm-12 col-xl-12">
				<div class="widget">
					<header><%tcWebApi_get("String_Entry","QuickInfo","s")%></header>
					<div class="d-flex flex-wrap widget-body">
						<fieldset class="col-lg-6 mb-3">
							<legend><%tcWebApi_get("String_Entry","DevInfoPONInfText","s")%></legend>
							<div class="form-group">
								<label class="col-lg-6"><%tcWebApi_get("String_Entry","OpticalRecPower","s")%></label>
								<label class="status-value col-lg-6" id="QIPONStt_RxPower"></label>
							</div>
							<div class="form-group">
								<label class="col-lg-6"><%tcWebApi_get("String_Entry","OpticalTraPower","s")%></label>
								<label class="status-value col-lg-6" id="QIPONStt_TxPower"></label>
							</div>
							<div class="form-group">
								<label class="col-lg-6"><%tcWebApi_get("String_Entry","OpticalStatus","s")%></label>
								<label class="status-value col-lg-6" id="QIPONStt_status"></label>
							</div>
						</fieldset>
						<fieldset class="col-lg-6 mb-3" id="InternetInfoDiv">
							<legend><%tcWebApi_get("String_Entry","InternetInfo","s")%></legend>
							<div class="form-group">
								<label class="col-lg-6"><%tcWebApi_get("String_Entry","LANLocalIPText","s")%></label>
								<label class="status-value col-lg-6" id="QIIP4Stt_status"></label>
							</div>
							<div class="form-group">
								<label class="col-lg-6"><%tcWebApi_get("String_Entry","LANIPv6Text","s")%></label>
								<label class="status-value col-lg-6" id="QIIP6Stt_status" style="overflow-x:auto"></label>
							</div>
							<div class="form-group">
								<label class="col-lg-6"><%tcWebApi_get("String_Entry","InternetStatus","s")%></label>
								<label class="status-value col-lg-6" id="QII_status"></label>
							</div>
						</fieldset>
					</div>
				</div>
			</div>
			<div class="col-sm-12 col-xl-6">
				<div class="widget">
					<header><%tcWebApi_get("String_Entry", "NavigationStatusDeviceText", "s") %></header>
					<div class="widget-body">
						<fieldset>
							<legend>
								<%tcWebApi_get("String_Entry", "GeneralInfomationText", "s") %>
							</legend>
<% if tcWebApi_get("DeviceName","DeviceName","h") <> "N/A" then %>
							<div class="form-group">
								<label class="col-lg-5">Device Name</label>
								<label class="status-value col-lg-7"><%tcWebApi_get("DeviceName","DeviceName","s")%></label>
							</div>
<% end if %>
							<div class="form-group">
								<label class="col-lg-5"><%tcWebApi_get("String_Entry", "ModelNameText", "s") %></label>
								<label class="status-value col-lg-7"><%tcWebApi_get("DeviceInfo_devParaStatic","ModelName","s")%></label>
							</div>
							<div class="form-group">
								<label class="col-lg-5"><%tcWebApi_get("String_Entry", "FirmwareVersionText", "s") %></label>
								<label class="status-value col-lg-7"><%If tcWebApi_get("DeviceInfo_devParaStatic","CustomerSWVersion","h") <> "N/A" Then tcWebApi_get("DeviceInfo_devParaStatic","CustomerSWVersion","s") end if%></label>
							</div>
							<div class="form-group">
								<label class="col-lg-5"><%tcWebApi_get("String_Entry", "GPONSerialNumberText", "s") %></label>
								<label class="status-value col-lg-7"><%tcWebApi_get("GPON_ONU","SerialNumber","s")%></label>
							</div>
							<div class="form-group">
								<label class="col-lg-5"><%tcWebApi_get("String_Entry", "NetInfoMACAddressText", "s") %></label>
								<label class="status-value col-lg-7"><%tcWebApi_get("Info_Ether","mac","s")%></label>
							</div>
						</fieldset>
						<fieldset>
							<legend>
								<%tcWebApi_get("String_Entry", "TimeInfomationText", "s") %>
							</legend>
							<div class="form-group">
								<label class="col-lg-5"><%tcWebApi_get("String_Entry", "NAVSysTime", "s") %></label>
								<label class="status-value col-lg-7" id="system_time"></label>
							</div>
							<div class="form-group">
								<label class="col-lg-5"><%tcWebApi_get("String_Entry", "SystemUptimeText", "s") %></label>
								<label class="status-value col-lg-7" id="system_uptime"></label>
							</div>
						</fieldset>
						<fieldset>
							<legend>
								<%tcWebApi_get("String_Entry", "ResourceInformationText", "s") %>
							</legend>
							<div class="form-group">
								<label class="col-lg-5"><%tcWebApi_get("String_Entry", "CPULoadText", "s") %></label>
								<label class="status-value col-lg-7"><%tcWebApi_get("GlobalState_common","CpuUsage","s")%>%</label>
							</div>
							<div class="form-group">
								<label class="col-lg-5"><%tcWebApi_get("String_Entry", "MemoryUsageText", "s") %></label>
								<label class="status-value col-lg-7"><%tcWebApi_get("GlobalState_common","MemUsage","s")%>%</label>
							</div>
						</fieldset>
					</div>
				</div>
				<div class="widget">
					<header>LAN</header>
					<div class="widget-body">
						<fieldset>
							<legend>
								<%tcWebApi_get("String_Entry", "EthernetPortStatusText", "s") %>
							</legend>
							<div class="form-group col-sm-12 table-responsive">
								<table class="table-bordered-radius simple-table w-100">
									<thead>
										<tr>
											<th>LAN1</th>
											<th>LAN2</th>
											<th>LAN3</th>
											<th>LAN4</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td id="lan_port1"></td>
											<td id="lan_port2"></td>
											<td id="lan_port3"></td>
											<td id="lan_port4"></td>
										</tr>
										<tr>
											<td id="lan_port1_sp"></td>
											<td id="lan_port2_sp"></td>
											<td id="lan_port3_sp"></td>
											<td id="lan_port4_sp"></td>
										</tr>
									</tbody>
								</table>
							</div>
						</fieldset>
						<fieldset>
							<legend>IPv4</legend>
							<div class="form-group">
								<label class="col-lg-5"><%tcWebApi_get("String_Entry", "AddressText", "s") %></label>
								<label class="status-value col-lg-7"><%tcWebApi_get("Info_Ether","ip","s")%></label>
							</div>
							<div class="form-group">
								<label class="col-lg-5"><%tcWebApi_get("String_Entry", "SubnetMaskText", "s") %></label>
								<label class="status-value col-lg-7"><%tcWebApi_get("Lan_Entry","netmask","s")%></label>
							</div>
							<div class="form-group">
								<label class="col-lg-5"><%tcWebApi_get("String_Entry", "DHCPServerText", "s") %></label>
								<label class="status-value col-lg-7" id="dhcp_enable"></label>
							</div>
						</fieldset>
						<fieldset>
							<legend>
								IPv6
							</legend>
							<div class="form-group">
								<label class="col-lg-5"><%tcWebApi_get("String_Entry", "LinkLocalIpText", "s") %></label>
								<label class="status-value col-lg-7"><%tcWebApi_get("Lan_Entry","IP6","s")%>/<%tcWebApi_get("Lan_Entry","PREFIX6","s")%></label>
							</div>
							<div class="form-group">
								<label class="col-lg-5"><%tcWebApi_get("String_Entry", "LanGlobalIpText", "s") %></label>
								<label class="status-value col-lg-7" style="overflow-x: auto"><%tcWebApi_get("Info_Ether","ip6","s")%></label>
							</div>
							<div class="form-group">
								<label class="col-lg-5"><%tcWebApi_get("String_Entry", "DHCPv6ServerText", "s") %></label>
								<label class="status-value col-lg-7" id="dhcp6_enable"></label>
							</div>
						</fieldset>
					</div>
				</div>
				<div class="widget">
					<header>TR069</header>
					<div class="widget-body">
						<fieldset>
							<div class="form-group">
								<label class="col-lg-5"><%tcWebApi_get("String_Entry", "CwmpStatusPRISText", "s") %></label>
								<label class="status-value col-lg-7" id="tr069-sta-1"></label>
							</div>
							<div class="form-group">
								<label class="col-lg-5"><%tcWebApi_get("String_Entry", "Tr069InterfaceIpAddress", "s") %></label>
								<label class="status-value col-lg-7" id="tr069-ip"></label>
							</div>
						</fieldset>
					</div>
				</div>
			</div>
			<div class="col-xl-6">
				<div class="widget">
					<header>WAN</header>
					<div class="widget-body">
						<fieldset>
							<div class="form-group">
								<input type="hidden" id="curSetIndex" name="curSetIndex" value="<% tcWebApi_get("WanInfo_Common","CurIFIndex","s") %>">
								<div class="col-sm-12 custom-select custom-select-without-label">
									<select id="WanIdx" namne="WanIdx" onchange="ShowWan()"></select>
								</div>
								<script>WriteWanNameSelected()</script>
							</div>
						</fieldset>
						<fieldset id="wan-general">
							<div class="form-group">
								<label class="col-lg-5"><%tcWebApi_get("String_Entry", "ConnectionTypeText", "s") %></label>
								<label class="status-value col-lg-7" id="cont-type"></label>
							</div>
							<div class="form-group">
								<label class="col-lg-5"><%tcWebApi_get("String_Entry", "NetInfoMACAddressText", "s") %></label>
								<label class="status-value col-lg-7" id="wan-mac"></label>
							</div>
							<div class="form-group" id="ppp-time-div">
								<label class="col-lg-5"><%tcWebApi_get("String_Entry", "PPPUptimeText", "s") %></label>
								<label class="status-value col-lg-7" id="ppp-time"></label>
							</div>
						</fieldset>
						<fieldset id="wan-disabled" style="display: none">
							<p class="col-sm-12"><%tcWebApi_get("String_Entry", "WanInfoIsDisabledText", "s") %>&nbsp;<a href="/cgi-bin/net-wan.asp"><%tcWebApi_get("String_Entry", "NavigationBasInternetText", "s") %></a>.</p>
						</fieldset>
						<fieldset id="wan-ip4-group">
							<legend>IPv4</legend>
							<div class="form-group">
								<label class="col-lg-5"><%tcWebApi_get("String_Entry", "StatusText", "s") %></label>
								<label class="status-value col-lg-7" id="wan4_stt"></label>
							</div>
							<div class="form-group">
								<label class="col-lg-5"><%tcWebApi_get("String_Entry", "LANIPAddressText", "s") %></label>
								<label class="status-value col-lg-7" id="wan4_ip"></label>
							</div>
							<div class="form-group">
								<label class="col-lg-5"><%tcWebApi_get("String_Entry", "SubnetMaskText", "s") %></label>
								<label class="status-value col-lg-7" id="wan4_mask"></label>
							</div>
							<div class="form-group">
								<label class="col-lg-5"><%tcWebApi_get("String_Entry", "DefaultGatewayText", "s") %></label>
								<label class="status-value col-lg-7" id="wan4_gw"></label>
							</div>
							<div class="form-group">
								<label class="col-lg-5"><%tcWebApi_get("String_Entry", "LANPrimaryDNSText", "s") %></label>
								<label class="status-value col-lg-7" id="wan4_dns1"></label>
							</div>
							<div class="form-group">
								<label class="col-lg-5"><%tcWebApi_get("String_Entry", "LANSecondaryDNSText", "s") %></label>
								<label class="status-value col-lg-7" id="wan4_dns2"></label>
							</div>
						</fieldset>
						<fieldset id="wan-ip6-group">
							<legend>IPv6</legend>
							<div class="form-group">
								<label class="col-lg-5"><%tcWebApi_get("String_Entry", "StatusText", "s") %></label>
								<label class="status-value col-lg-7" id="wan6_stt"></label>
							</div>
							<div class="form-group">
								<label class="col-lg-5"><%tcWebApi_get("String_Entry", "LANIPAddressText", "s") %></label>
								<label class="status-value col-lg-7" id="wan6_ip" style="overflow-x: auto"></label>
							</div>
							<div class="form-group">
								<label class="col-lg-5"><%tcWebApi_get("String_Entry", "DHCP6Prefixv6LenText", "s") %></label>
								<label class="status-value col-lg-7" id="wan6_pf"></label>
							</div>
							<div class="form-group">
								<label class="col-lg-5"><%tcWebApi_get("String_Entry", "DefaultGatewayText", "s") %></label>
								<label class="status-value col-lg-7" id="wan6_gw"></label>
							</div>
							<div class="form-group">
								<label class="col-lg-5"><%tcWebApi_get("String_Entry", "LANPrimaryDNSText", "s") %></label>
								<label class="status-value col-lg-7" id="wan6_dns1"></label>
							</div>
							<div class="form-group">
								<label class="col-lg-5"><%tcWebApi_get("String_Entry", "LANSecondaryDNSText", "s") %></label>
								<label class="status-value col-lg-7" id="wan6_dns2"></label>
							</div>
							<div class="form-group">
								<label class="col-lg-5"><%tcWebApi_get("String_Entry", "PrefixDelegationText", "s") %></label>
								<label class="status-value col-lg-7" id="wan6_pd"></label>
							</div>
						</fieldset>
					</div>
				</div>
				<div class="widget">
					<header><%tcWebApi_get("String_Entry", "DevInfoPONInfText", "s") %></header>
					<div class="widget-body">
						<fieldset>
							<legend>
								GPON
							</legend>
							<div class="form-group">
								<label class="col-lg-5"><%tcWebApi_get("String_Entry", "XPONFirmwareVersionText", "s") %></label>
								<label class="status-value col-lg-7"><%tcWebApi_get("GPON_ONU","Version","s")%></label>
							</div>
							<div class="form-group">
								<label class="col-lg-5"><%tcWebApi_get("String_Entry", "LinkStateText", "s") %></label>
								<label class="status-value col-lg-7" id="link_state"></label>
							</div>
							<div class="form-group">
								<label class="col-lg-5"><%tcWebApi_get("String_Entry", "OltTypeText", "s") %></label>
								<label class="status-value col-lg-7" id="olt_type"></label>
							</div>
							<div class="form-group">
								<label class="col-lg-5"><%tcWebApi_get("String_Entry", "OpticalTypeText", "s") %></label>
								<label class="status-value col-lg-7">B+</label>
							</div>
						</fieldset>
						<fieldset>
							<legend>
								Transceiver
							</legend>
							<div class="form-group">
								<label class="col-lg-5"><%tcWebApi_get("String_Entry", "RxPowerText", "s") %></label>
								<label class="status-value col-lg-7" id="pon_rx_power">-</label>
							</div>
							<div class="form-group">
								<label class="col-lg-5"><%tcWebApi_get("String_Entry", "TxPowerText", "s") %></label>
								<label class="status-value col-lg-7" id="pon_tx_power">-</label>
							</div>
							<div class="form-group">
								<label class="col-lg-5"><%tcWebApi_get("String_Entry", "TxBiasCurrentText", "s") %></label>
								<label class="status-value col-lg-7" id="pon_bias_current">-</label>
							</div>
							<div class="form-group">
								<label class="col-lg-5"><%tcWebApi_get("String_Entry", "SupplyVoltageText", "s") %></label>
								<label class="status-value col-lg-7" id="pon_supply_voltage">-</label>
							</div>
							<div class="form-group">
								<label class="col-lg-5"><%tcWebApi_get("String_Entry", "TemperatureText", "s") %></label>
								<label class="status-value col-lg-7" id="pon_temperate">-</label>
							</div>
						</fieldset>
					</div>
				</div>
			</div>
			<div class="col-lg-12 d-flex align-items-center justify-content-center">
				<button type="button" class="page-button large-button" onclick="reloadAsGet();"><%tcWebApi_get("String_Entry","ButtonRefreshText","s")%></button>
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
