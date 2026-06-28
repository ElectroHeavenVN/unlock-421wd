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
if Request_Form("delFlag") = "1" then
	if Request_Form("hSrouteFlag0") <> "17" then 
		TCWebApi_set("WebCurSet_Entry","route_id","hSrouteFlag0")
		TCWebApi_unset("Route_Entry")
	end if
	if Request_Form("hSrouteFlag1") <> "17" then 
		TCWebApi_set("WebCurSet_Entry","route_id","hSrouteFlag1")
		TCWebApi_unset("Route_Entry")
	end if
	if Request_Form("hSrouteFlag2") <> "17" then 
		TCWebApi_set("WebCurSet_Entry","route_id","hSrouteFlag2")
		TCWebApi_unset("Route_Entry")
	end if
	if Request_Form("hSrouteFlag3") <> "17" then 
		TCWebApi_set("WebCurSet_Entry","route_id","hSrouteFlag3")
		TCWebApi_unset("Route_Entry")
	end if
	if Request_Form("hSrouteFlag4") <> "17" then 
		TCWebApi_set("WebCurSet_Entry","route_id","hSrouteFlag4")
		TCWebApi_unset("Route_Entry")
	end if
	if Request_Form("hSrouteFlag5") <> "17" then 
		TCWebApi_set("WebCurSet_Entry","route_id","hSrouteFlag5")
		TCWebApi_unset("Route_Entry")
	end if
	if Request_Form("hSrouteFlag6") <> "17" then 
		TCWebApi_set("WebCurSet_Entry","route_id","hSrouteFlag6")
		TCWebApi_unset("Route_Entry")
	end if
	if Request_Form("hSrouteFlag7") <> "17" then 
		TCWebApi_set("WebCurSet_Entry","route_id","hSrouteFlag7")
		TCWebApi_unset("Route_Entry")
	end if
	if Request_Form("hSrouteFlag8") <> "17" then 
		TCWebApi_set("WebCurSet_Entry","route_id","hSrouteFlag8")
		TCWebApi_unset("Route_Entry")
	end if
	if Request_Form("hSrouteFlag9") <> "17" then 
		TCWebApi_set("WebCurSet_Entry","route_id","hSrouteFlag9")
		TCWebApi_unset("Route_Entry")
	end if
	if Request_Form("hSrouteFlag10") <> "17" then 
		TCWebApi_set("WebCurSet_Entry","route_id","hSrouteFlag10")
		TCWebApi_unset("Route_Entry")
	end if
	if Request_Form("hSrouteFlag11") <> "17" then 
		TCWebApi_set("WebCurSet_Entry","route_id","hSrouteFlag11")
		TCWebApi_unset("Route_Entry")
	end if
	if Request_Form("hSrouteFlag12") <> "17" then 
		TCWebApi_set("WebCurSet_Entry","route_id","hSrouteFlag12")
		TCWebApi_unset("Route_Entry")
	end if
	if Request_Form("hSrouteFlag13") <> "17" then 
		TCWebApi_set("WebCurSet_Entry","route_id","hSrouteFlag13")
		TCWebApi_unset("Route_Entry")
	end if
	if Request_Form("hSrouteFlag14") <> "17" then 
		TCWebApi_set("WebCurSet_Entry","route_id","hSrouteFlag14")
		TCWebApi_unset("Route_Entry")
	end if
	if Request_Form("hSrouteFlag15") <> "17" then 
		TCWebApi_set("WebCurSet_Entry","route_id","hSrouteFlag15")
		TCWebApi_unset("Route_Entry")
	end if
	TCWebApi_commit("WebCurSet_Entry")
	TCWebApi_commit("Route_Entry")
	TCWebApi_save("Route_Entry")
end if
If Request_Form("Rip_Flag") = "1" then
	TCWebApi_set("WanInfo_Common","CurIFIndex","sel_Interface")
	TCWebApi_commit("WanInfo_Common")
elseif Request_Form("Rip_Flag") = "2" then 
	TCWebApi_set("WanInfo_Common","CurIFIndex","curSet_Flag")
	TCWebApi_set("WanInfo_WanPVC","Action","wanif_action")
	TCWebApi_set("WanInfo_WanIF","RIPVERSION","X_ATP_RIPOperation")
	TCWebApi_set("WanInfo_WanIF","DIRECTION","RouteProtocolRx")
	TCWebApi_commit("WanInfo_WanPVC")
	TCWebApi_save()
End if
%>
<%
if Request_Form("SaveFlag") = "1" then
	TCWebApi_set("WebCurSet_Entry","route_id","add_num")
	TCWebApi_set("Route_Entry","DST_IP","DestIPAddress")
	TCWebApi_set("Route_Entry","Sub_mask","DestSubnetMask")
	if Request_Form("gwflag") = "Yes" then
		TCWebApi_set("Route_Entry","Gateway","GatewayIPAddress")
	end if
	if Request_Form("ifflag") = "Yes" then
		TCWebApi_set("Route_Entry","Device","WanInterfaceFlag")
	end if
	TCWebApi_set("Route_Entry","metric","metricFlag")
	TCWebApi_commit("Route_Entry")
	TCWebApi_save() 
elseif Request_Form("SaveFlag") = "2" then
		TCWebApi_set("WebCurSet_Entry","wan_pvc","Interface")
end if
%>
<!doctype html>
<html>
	<head>
<title>Viettel ONT - <%tcWebApi_get("String_Entry","StaticRouteText","s")%></title>		<meta charset="utf-8">
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
			var nCount = 16;
			function CheckRoutesActives()
			{
				var	nCurTemp = 0;
				var	vDestIPAddress = new Array(nCount);
				var	vSub_mask = new Array(nCount);
				var	vGatewayIPAddress = new Array(nCount);
				var	vInterface = new Array(nCount);
				var	vcurLinks = new Array(nCount+3);
				var	vTemp;
				var	RouteNameTemp;
				vDestIPAddress[0] = "<% tcWebApi_get("Route_Entry0","DST_IP","s") %>";
				vDestIPAddress[1] = "<% tcWebApi_get("Route_Entry1","DST_IP","s") %>";
				vDestIPAddress[2] = "<% tcWebApi_get("Route_Entry2","DST_IP","s") %>";
				vDestIPAddress[3] = "<% tcWebApi_get("Route_Entry3","DST_IP","s") %>";
				vDestIPAddress[4] = "<% tcWebApi_get("Route_Entry4","DST_IP","s") %>";
				vDestIPAddress[5] = "<% tcWebApi_get("Route_Entry5","DST_IP","s") %>";
				vDestIPAddress[6] = "<% tcWebApi_get("Route_Entry6","DST_IP","s") %>";
				vDestIPAddress[7] = "<% tcWebApi_get("Route_Entry7","DST_IP","s") %>";
				vDestIPAddress[8] = "<% tcWebApi_get("Route_Entry8","DST_IP","s") %>";
				vDestIPAddress[9] = "<% tcWebApi_get("Route_Entry9","DST_IP","s") %>";
				vDestIPAddress[10] = "<% tcWebApi_get("Route_Entry10","DST_IP","s") %>";
				vDestIPAddress[11] = "<% tcWebApi_get("Route_Entry11","DST_IP","s") %>";
				vDestIPAddress[12] = "<% tcWebApi_get("Route_Entry12","DST_IP","s") %>";
				vDestIPAddress[13] = "<% tcWebApi_get("Route_Entry13","DST_IP","s") %>";
				vDestIPAddress[14] = "<% tcWebApi_get("Route_Entry14","DST_IP","s") %>";
				vDestIPAddress[15] = "<% tcWebApi_get("Route_Entry15","DST_IP","s") %>";
				vSub_mask[0] = "<% tcWebApi_get("Route_Entry0","Sub_mask","s") %>";
				vSub_mask[1] = "<% tcWebApi_get("Route_Entry1","Sub_mask","s") %>";
				vSub_mask[2] = "<% tcWebApi_get("Route_Entry2","Sub_mask","s") %>";
				vSub_mask[3] = "<% tcWebApi_get("Route_Entry3","Sub_mask","s") %>";
				vSub_mask[4] = "<% tcWebApi_get("Route_Entry4","Sub_mask","s") %>";
				vSub_mask[5] = "<% tcWebApi_get("Route_Entry5","Sub_mask","s") %>";
				vSub_mask[6] = "<% tcWebApi_get("Route_Entry6","Sub_mask","s") %>";
				vSub_mask[7] = "<% tcWebApi_get("Route_Entry7","Sub_mask","s") %>";
				vSub_mask[8] = "<% tcWebApi_get("Route_Entry8","Sub_mask","s") %>";
				vSub_mask[9] = "<% tcWebApi_get("Route_Entry9","Sub_mask","s") %>";
				vSub_mask[10] = "<% tcWebApi_get("Route_Entry10","Sub_mask","s") %>";
				vSub_mask[11] = "<% tcWebApi_get("Route_Entry11","Sub_mask","s") %>";
				vSub_mask[12] = "<% tcWebApi_get("Route_Entry12","Sub_mask","s") %>";
				vSub_mask[13] = "<% tcWebApi_get("Route_Entry13","Sub_mask","s") %>";
				vSub_mask[14] = "<% tcWebApi_get("Route_Entry14","Sub_mask","s") %>";
				vSub_mask[15] = "<% tcWebApi_get("Route_Entry15","Sub_mask","s") %>";
				vGatewayIPAddress[0] = "<% tcWebApi_get("Route_Entry0","Gateway","s") %>";
				vGatewayIPAddress[1] = "<% tcWebApi_get("Route_Entry1","Gateway","s") %>";
				vGatewayIPAddress[2] = "<% tcWebApi_get("Route_Entry2","Gateway","s") %>";
				vGatewayIPAddress[3] = "<% tcWebApi_get("Route_Entry3","Gateway","s") %>";
				vGatewayIPAddress[4] = "<% tcWebApi_get("Route_Entry4","Gateway","s") %>";
				vGatewayIPAddress[5] = "<% tcWebApi_get("Route_Entry5","Gateway","s") %>";
				vGatewayIPAddress[6] = "<% tcWebApi_get("Route_Entry6","Gateway","s") %>";
				vGatewayIPAddress[7] = "<% tcWebApi_get("Route_Entry7","Gateway","s") %>";
				vGatewayIPAddress[8] = "<% tcWebApi_get("Route_Entry8","Gateway","s") %>";
				vGatewayIPAddress[9] = "<% tcWebApi_get("Route_Entry9","Gateway","s") %>";
				vGatewayIPAddress[10] = "<% tcWebApi_get("Route_Entry10","Gateway","s") %>";
				vGatewayIPAddress[11] = "<% tcWebApi_get("Route_Entry11","Gateway","s") %>";
				vGatewayIPAddress[12] = "<% tcWebApi_get("Route_Entry12","Gateway","s") %>";
				vGatewayIPAddress[13] = "<% tcWebApi_get("Route_Entry13","Gateway","s") %>";
				vGatewayIPAddress[14] = "<% tcWebApi_get("Route_Entry14","Gateway","s") %>";
				vGatewayIPAddress[15] = "<% tcWebApi_get("Route_Entry15","Gateway","s") %>";
				vInterface[0] = "<% tcWebApi_get("Route_Entry0","Device","s") %>";
				vInterface[1] = "<% tcWebApi_get("Route_Entry1","Device","s") %>";
				vInterface[2] = "<% tcWebApi_get("Route_Entry2","Device","s") %>";
				vInterface[3] = "<% tcWebApi_get("Route_Entry3","Device","s") %>";
				vInterface[4] = "<% tcWebApi_get("Route_Entry4","Device","s") %>";
				vInterface[5] = "<% tcWebApi_get("Route_Entry5","Device","s") %>";
				vInterface[6] = "<% tcWebApi_get("Route_Entry6","Device","s") %>";
				vInterface[7] = "<% tcWebApi_get("Route_Entry7","Device","s") %>";
				vInterface[8] = "<% tcWebApi_get("Route_Entry8","Device","s") %>";
				vInterface[9] = "<% tcWebApi_get("Route_Entry9","Device","s") %>";
				vInterface[10] = "<% tcWebApi_get("Route_Entry10","Device","s") %>";
				vInterface[11] = "<% tcWebApi_get("Route_Entry11","Device","s") %>";
				vInterface[12] = "<% tcWebApi_get("Route_Entry12","Device","s") %>";
				vInterface[13] = "<% tcWebApi_get("Route_Entry13","Device","s") %>";
				vInterface[14] = "<% tcWebApi_get("Route_Entry14","Device","s") %>";
				vInterface[15] = "<% tcWebApi_get("Route_Entry15","Device","s") %>";
				for(var i=0; i<nCount; i++)
				{
					if(vDestIPAddress[i] != "N/A")
						vcurLinks[nCurTemp++] = new Array( i, vDestIPAddress[i], vGatewayIPAddress[i], vSub_mask[i], vInterface[i]);
				}
				var	vObjRet = new Array(nCurTemp);
				for(var m=0; m<nCurTemp; m++)
				{
					vObjRet[m] = vcurLinks[m];
				}
				return vObjRet;
			}
			var StaticRoute = CheckRoutesActives();
			function onloadCheck() {
				var table = document.getElementById("route-table");
				var line;
				for (var i = 0; i < StaticRoute.length; i++) {
					line = "<tr><td>" + StaticRoute[i][1] + "</td><td>" + StaticRoute[i][2] + "</td><td>"+ StaticRoute[i][3] + "</td><td>"+ StaticRoute[i][4] + "</td>";
					line += "<td><div class='custom-controll custom-checkbox custom_cb_table' style='margin-top: -0.75rem;'><input class='custom-control-input' type=checkbox name=hSrouteFlag"+ StaticRoute[i][0] + " id=hSrouteFlag"+ StaticRoute[i][0] + " value=" + StaticRoute[i][0]+ "><label class='custom-control-label' for=hSrouteFlag"+ StaticRoute[i][0]+"></label></div></td></tr>"
					table.innerHTML += line;
				}
			}
			function doDelete() {
				var form = document.ConfigForm;
				var has_checked = 0;
				for (var i = 0; i <= nCount; i++) {
					if (document.getElementById("hSrouteFlag" + i) != undefined) {
						if (document.getElementById("hSrouteFlag" + i).checked == true) {
							has_checked += 1;
						}
					}
				}
				if (!has_checked) {
					alert("<%tcWebApi_get("String_Entry","NoRuleSeletedText","s")%>");
					return;
				}
				form.delFlag.value = "1";
				submitAsync("ConfigForm");
			}
			var nEntryNum = <% tcWebApi_get("WanInfo_Common","CycleNum","s") %>;
			// num 0 
			var vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
			var vEntryName = vArrayStr.split(',');
			// num 1
			vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
			var vEntryValue = vArrayStr.split(',');
			<% tcWebApi_get("WanInfo_Common","CycleValue","h") %> // num 2 wan index
			// num 3 wan active
			vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
			var vWan_Active = vArrayStr.split(',');
			// num 4~5
			<% tcWebApi_constSet("WanInfo_Common", "CycleJump", "2") %>
			// num 6
			vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
			var Wan_IPVERSION = vArrayStr.split(',');
			vEntryName = SortUtil.UpdateWanIFName( vEntryName, nEntryNum );
			vEntryValue = SortUtil.SortMyArray( vEntryValue );
			Wan_IPVERSION = SortUtil.SortMyArray( Wan_IPVERSION );
			vWan_Active = SortUtil.SortMyArray( vWan_Active );
			function WriteWanNameSelected()
			{
				var select = document.getElementById('Interface');
				for (var i = 0; i < nEntryNum; i++)
				{
					if((vEntryName[i].indexOf('_INTERNET_')<0) || (vEntryName[i].indexOf('_B_')>-1)
					|| ('IPv6' == Wan_IPVERSION[i]) || ("Yes" != vWan_Active[i]))
							continue;
					var opt = new Option(vEntryName[i], vEntryValue[i]);
					select.options.add ( opt );
					//document.write('<option value=' + vEntryValue[i] + '>' + vEntryName[i] + '</option>');
				}
				var opt = new Option("LAN", "br0");
				select.options.add ( opt );
			}
			function doAdd() {
				$("#rule-table-div").hide();
				$("#btnADD").hide();
				$("#btnDELETE").hide();
				$("#new-rule-div").show();
				$("#btnAPPLY").show();
				$("#btnCANCEL").show();
			}
			function doCancel() {
				$("#rule-table-div").show();
				$("#btnADD").show();
				$("#btnDELETE").show();
				$("#new-rule-div").hide();
				$("#btnAPPLY").hide();
				$("#btnCANCEL").hide();
			}
			var host = [["InternetGatewayDevice.LANDevice.1.LANHostConfigManagement.IPInterface.1","192.168.1.1","255.255.255.0"],null];
			var IpAddress = host[0][1];
			var SubnetMask = host[0][2];		
			function getMostRightPosOf1(str)
			{
				for (i = str.length - 1; i >= 0; i--)
				{
					if (str.charAt(i) == '1')
					{
						break;
					}
				}
				return i;
			}
			function getBinaryString(str)
			{
				var numArr = [128, 64, 32, 16, 8, 4, 2, 1];
				var addrParts = str.split('.');
				if (addrParts.length < 3)
				{
					return "00000000000000000000000000000000";
				}
				var binstr = '';
				for (i = 0; i < 4; i++)
				{
					var num = parseInt(addrParts[i])
					for ( j = 0; j < numArr.length; j++ )
					{
						if ( (num & numArr[j]) != 0 )
						{
							binstr += '1';
						}
						else
						{
							binstr += '0';
						}
					}
				}
				return binstr;
			}
			function isMatchedIpAndMask(ip, mask)
			{
				var locIp = getBinaryString(ip);
				var locMask = getBinaryString(mask);
				if (locIp.length != locMask.length)
				{
					return false;
				}
				var most_right_pos_1 = getMostRightPosOf1(locMask);
				if (most_right_pos_1 == -1)
				{
					if (loaIp == '00000000000000000000000000000000')
					{
						return true;
					}
					else
					{
						return false;
					}
				}
				for (i = most_right_pos_1 + 1; i < locIp.length; i++)
				{
					if (locIp.charAt(i) != '0')
					{
						return false;
					}
				}
				return true;
			}
			function CheckForm(Form)
			{
				for (i = 0; i < StaticRoute.length - 1; i++)
				{
					if (StaticRoute[i][1] == getValue('DestIPAddress'))
					{
						alert('<%tcWebApi_get("String_Entry","IPAddressUsedText","s")%>');
						return false;
					}
				}
				with ( document.ConfigForm )
				{
					var DestIp = DestIPAddress.value;
					var index1 = IpAddress.lastIndexOf('.');
					var index2 = DestIp.lastIndexOf('.');
					if ( isValidIpAddress(DestIp) == false
					|| isDeIpAddress(DestIp) == true
					|| isBroadcastIpAddress(DestIp) == true
					|| isLoopIpAddress(DestIp) == true )
					{
						alert('<%tcWebApi_get("String_Entry","DestinationText","s")%> "' + DestIPAddress.value + '" <%tcWebApi_get("String_Entry","IsInvalidText","s")%>');
						return false;
					}
					if (IpAddress == DestIp
					|| (DestIp.substr(index1 + 1) == '0' && IpAddress.substr(0,index1) == DestIp.substr(0,index2)))
					{
						alert('<%tcWebApi_get("String_Entry","DestinationIPInvalidText","s")%>');
						return false;
					}
					if ( isValidSubnetMask(DestSubnetMask.value) == false &&  DestSubnetMask.value != '255.255.255.255')
					{
						alert('<%tcWebApi_get("String_Entry","SubnetMaskText","s")%>"' + DestSubnetMask.value + '" <%tcWebApi_get("String_Entry","IsInvalidText","s")%>');
						return false;
					}
					if (isMatchedIpAndMask(DestIPAddress.value, DestSubnetMask.value) == false)
					{
						alert('<%tcWebApi_get("String_Entry","DestinationIPAddressText","s")%> "' + DestIPAddress.value + '"<%tcWebApi_get("String_Entry","AndSubnetMaskText","s")%>"' + DestSubnetMask.value + '" <%tcWebApi_get("String_Entry","NotMatchText","s")%>');
						return false;
					}
					if (gwflag.checked == false && ifflag.checked == false)
					{
						alert('<%tcWebApi_get("String_Entry","SelectUseText","s")%>');
						return false;
					}
					if (gwflag.checked == true)
					{
						if ( isAbcIpAddress(GatewayIPAddress.value) == false )
						{
							alert('<%tcWebApi_get("String_Entry","DefaultGatewayText","s")%>"' + GatewayIPAddress.value + '" <%tcWebApi_get("String_Entry","IsInvalidText","s")%>');
							return false;
						}
					}
					else
					{
					}
					if (ifflag.checked == true)
					{
						var idx = Interface.selectedIndex;
						var WANId = Interface.options[idx].id;
						if ((idx != Interface.length - 1) && (Interface.value.indexOf('nas') > -1) && (gwflag.checked == false))
						{
							alert('<%tcWebApi_get("String_Entry","IPoESelectText","s")%>');
							return false;
						}
					}
					else
					{
					}
				}
				return true;
			}
			function doApply() {
				if (true == CheckForm(document.ConfigForm))
				{
					var vForm = document.ConfigForm;
					if(vForm.user_def_num.value >= 16)
					{
						alert("<%tcWebApi_get("String_Entry","Define16RoutesText","s")%>");
						return;
					}
					if(vForm.gwflag.checked)
						vForm.gwflag.value = "Yes";
					else vForm.gwflag.value = "No";
					if(vForm.ifflag.checked)
						vForm.ifflag.value = "Yes";
					else vForm.ifflag.value = "No";
					vForm.WanInterfaceFlag.value = vForm.Interface.value;
					vForm.SaveFlag.value = "1";
					submitAsync("ConfigForm");
				}
			}
			function ShowGateway() {
				if (document.ConfigForm.gwflag.checked) {
					$("#GatewayIPAddress").show();
				}
				else {
					$("#GatewayIPAddress").hide();
				}
			}
			function ShowDevice() {
				if (document.ConfigForm.ifflag.checked) {
					$("#Interface").parent().show();
				}
				else {
					$("#Interface").parent().hide();
				}
			}
		</script>
	</head>
	<body onload="onloadCheck()" class="container">
<header class="fixed-top"><nav id="top-nav" class="navbar navbar-expand-lg container"><a class="navbar-brand " href="/cgi-bin/home.asp"><div><img src="/img/logo_home.png" width="100" height="18" alt=""><div style="font-family: sans-serif; font-weight: bold;font-size: 12px;color: #000; margin-top: 0">OPTICAL NETWORK TERMINATION</div></div></a><button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"><em class="fas fa-align-justify"></em></span></button><div class="collapse navbar-collapse" id="navbarCollapse"><ul class="navbar-nav mr-auto sidenav" id="navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/home.asp"><%tcWebApi_get("String_Entry","NavigationHomeText","s")%><span class="sr-only"></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/deviceinfo.asp"><%tcWebApi_get("String_Entry","NavigationStatusDeviceText","s")%><span class="sr-only"></span></a></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#status-menu" aria-controls="status-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NavigationStatusStatisticsText","s")%></a><ul class="nav-second-level collapse" id="status-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/sta-statistics.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationTrafficText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/sta-wifiusers.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationStatusUsersText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/sta-users.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","ARPStatusText","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#network-menu" aria-controls="network-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NAVNetwork","s")%></a><ul class="nav-second-level collapse" id="network-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/net-wan.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationBasInternetText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/net-lan.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationBasLANText","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#wifi-menu" aria-controls="wifi-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NAVWifi","s")%></a><ul class="nav-second-level collapse" id="wifi-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/wifi.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationWiFiSettingsText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/wifi-11ac.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationWiFi11acSettingsText","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#firewall-menu" aria-controls="firewall-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NavigationAdvFirewallText","s")%></a><ul class="nav-second-level collapse" id="firewall-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-spi.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","ContentFirewallText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-urlfilter.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","FILTERTYPE_index2","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-macfilter.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVL2Filter","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-parentalcontrol.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","ParentalControlText","s")%></span></a></li></ul></li><li class="nav-item active"><a class="nav-link nav-link-collapse nav-link-show" href="#" id="hasSubItems" data-toggle="collapse" data-target="#apps-menu" aria-controls="apps-menu" aria-expanded="true"><%tcWebApi_get("String_Entry","NAVApplication","s")%></a><ul class="nav-second-level show" id="apps-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-dmz.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NatTopDMZText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-portforwarding.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NatVirsvrText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-sslim.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","SessionLimit","s")%></span></a></li><li class="nav-item active"><a class="nav-link" href="/cgi-bin/apps-route.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","StaticRouteText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-ddns.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","dyDNS1Text","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#tools-menu" aria-controls="tools-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NavigationMaintenanceText","s")%></a><ul class="nav-second-level collapse" id="tools-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-admin.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationMainAdminText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-time.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVSysTime","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-firmware.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationMainFirmwareText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-config.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVConfig","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-diagnostic.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationMainDiagnosticsText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-log.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVLogs","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-reboot.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","RebootText","s")%></span></a></li></ul></li></ul><div class="top-item-groups"><form name="LanguageForm" method="POST" action="/cgi-bin/apps-route.asp" class="nav-item dropdown"><input type="hidden" name="TokenString" value="<%tcWebApi_getToken()%>"><input type="hidden" name="Language_Flag" value="<% tcWebApi_get("LanguageSwitch_Entry","Type","s") %>"><a class="nav-link dropdown-toggle" href="#" id="LanguageDropdown" role="button" data-toggle="dropdown" aria-expanded="false"><% tcWebApi_get("String_Entry","LoginLanguage","s") %></a><ul class="dropdown-menu" aria-labelledby="LanguageDropdown"><li><a class="dropdown-item <% if tcWebApi_get("LanguageSwitch_Entry","Type","h") = "1" then asp_Write("active") end if %>" href="#" onclick="submitLanguageForm(1);"><% tcWebApi_get("String_Entry","LanguageVIELong","s") %></a></li><li><a class="dropdown-item <% if tcWebApi_get("LanguageSwitch_Entry","Type","h") = "2" then asp_Write("active") end if %>" href="#" onclick="submitLanguageForm(2);"><% tcWebApi_get("String_Entry","LanguageENGLong","s") %></a></li></ul></form><div id="signout" class="nav-item"><a class="nav-link" href="javascript:doLogout();"><em class="fa fa-sign-out-alt"></em><span class="nav-link-text"><% tcWebApi_get("String_Entry","LogoutText","s") %></span></a></div></div></div></header></nav><% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then
	if tcWebApi_get("Mesh_Common", "DeviceRole", "h") = "2" then %>
		<script language='javascript'>
		document.getElementById("wifi-menu").children[0].style="display: none";
		document.getElementById("wifi-menu").children[1].style="display: none";
		</script>
<% end if end if %>		<div id="content">
		<form class="form-inline" method="post" id="ConfigForm" name="ConfigForm" action="/cgi-bin/apps-route.asp" autocomplete="off">
			<input type="hidden" id="add_num" name="add_num" value="<% tcWebApi_get("Route","add_num","s") %>">
			<input type="hidden" id="user_def_num" name="user_def_num" value="<% tcWebApi_get("Route","User_def_num","s") %>">
			<input type="hidden" id="WanInterfaceFlag" name="WanInterfaceFlag" value="PVC0">
			<input type="hidden" id="metricFlag" name="metricFlag" value="0">
			<INPUT TYPE="HIDDEN" NAME="TokenString" VALUE="<%tcWebApi_getToken()%>">
			<input type="hidden" id="del_num" name="del_num">
			<input type="hidden" id="SaveFlag" name="SaveFlag" value="0">
			<input type="hidden" id="delFlag" name="delFlag" value="0">
			<div class="row row-w-100">
				<div class="widget col-xs-12 col-lg-12">
					<header><%tcWebApi_get("String_Entry","StaticRouteText","s")%></header>
					<div class="widget-body">
						<fieldset id="rule-table-div">
							<legend><%tcWebApi_get("String_Entry","StaticRouteText","s")%></legend>
							<div class="table-responsive col-xs-12 col-md-10" style="float: none; margin: 0 auto; text-align: center;">
								<table class="table-bordered-radius simple-table" id="filter_List" name="filter_List" cellpadding="0" cellspacing="0" style="width:100%">
									<thead>
										<tr class="thead-light" style="text-align: center;">
											<th><%tcWebApi_get("String_Entry","DestinationIPText","s")%></th>
											<th><%tcWebApi_get("String_Entry","GatewayText","s")%></th>
											<th><%tcWebApi_get("String_Entry","SubnetMaskText","s")%></th>
											<th><%tcWebApi_get("String_Entry","InterfaceText","s")%></th>
											<th><%tcWebApi_get("String_Entry","ButtonDeleteLower","s")%></th>
										</tr>
									</thead>
									<tbody id="route-table">
									</tbody>
								</table>
							</div>
						</fieldset>
						<fieldset id="new-rule-div" style="display: none">
							<legend><%tcWebApi_get("String_Entry","AddNewRuleText","s")%></legend>
							<div class="form-group">
								<label class="col-xs-12 col-sm-4 control-label"><%tcWebApi_get("String_Entry","DestinationIPAddressText","s")%></label>
								<INPUT class="form-control col-xs-12 col-sm-4" NAME="DestIPAddress" id="DestIPAddress" maxlength='15' type="text" VALUE="<%if TCWebApi_get("Route_Entry","DST_IP","h") <> "N/A" then TCWebApi_get("Route_Entry","DST_IP","s") else asp_Write("0.0.0.0") end if %>" >
							</div>
							<div class="form-group">
								<label class="col-xs-12 col-sm-4 control-label"><%tcWebApi_get("String_Entry","SubnetMaskText","s")%></label>
								<INPUT class="form-control col-xs-12 col-sm-4 "  NAME="DestSubnetMask" id="DestSubnetMask" maxlength='15' type="text" VALUE="<%if TCWebApi_get("Route_Entry","Sub_mask","h") <> "N/A" then TCWebApi_get("Route_Entry","Sub_mask","s") else asp_Write("0.0.0.0") end if %>" >
							</div>
							<div class="form-group">
								<label class="col-xs-12 col-sm-4 control-label"><%tcWebApi_get("String_Entry","UseGatewayText","s")%></label>
								<div class="custom-control custom-checkbox">
									<input class="custom-control-input" type="checkbox" name="gwflag" id="gwflag" value="1" onclick="ShowGateway()">
									<label class="custom-control-label" for="gwflag"></label>
								</div>
								<input class="form-control col-xs-11 col-sm-4 " style="display: none;" type='text' maxlength='15' id='GatewayIPAddress' name='GatewayIPAddress' value="<%if TCWebApi_get("Route_Entry","Gateway","h") <> "N/A" then TCWebApi_get("Route_Entry","Gateway","s") end if%>">
							</div>
							<div class="form-group">
								<label class="col-xs-12 col-sm-4 control-label"><%tcWebApi_get("String_Entry","UseInterfaceText","s")%></label>
								<div class="custom-control custom-checkbox">
									<input class="custom-control-input" type="checkbox" name="ifflag" id="ifflag" value="1" onclick="ShowDevice()">
									<label class="custom-control-label" for="ifflag"></label>
								</div>
								<div class="col-xs-11 col-sm-4 custom-select" style="display: none;">
									<select  name=Interface id='Interface' onchange="" >
									</select>
									<script language=JavaScript type=text/javascript>
										WriteWanNameSelected();
									</script>
								</div>
							</div>
						</fieldset>
						<div class="d-flex justify-content-end mt-3">
							<button id="btnADD" type="button" class="page-button small-button" onclick="doAdd();" title="<%tcWebApi_get("String_Entry","AddNewRuleText","s")%>"><%tcWebApi_get("String_Entry","ButtonAddText","s")%></button>
							<button id="btnDELETE" type="button" class="page-button small-button" onclick="doDelete();" title="<%tcWebApi_get("String_Entry","DeleteSelectedRuleText","s")%>"><%tcWebApi_get("String_Entry","ButtonDeleteText","s")%></button>
							<button id="btnAPPLY" type="button" class="page-button small-button" style="display: none;" onclick="doApply();" title="<%tcWebApi_get("String_Entry","AddNewRuleText","s")%>"><%tcWebApi_get("String_Entry","ButtonApplyText","s")%></button>
							<button id="btnCANCEL" type="button" class="action-button small-button" style="display: none;" onclick="doCancel();" title="<%tcWebApi_get("String_Entry","DeleteSelectedRuleText","s")%>"><%tcWebApi_get("String_Entry","ButtonCancelText","s")%></button>
						</div>
					</div>
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
