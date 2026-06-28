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
<title><%tcWebApi_get("String_Entry","BranchName","s")%> ONT - <%tcWebApi_get("String_Entry","WifiSchedulingText","s")%></title>		<meta charset="utf-8">
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
            var currentNode;
            const scheduleNum = 4;
            var dayOfWeek = new Array();
            dayOfWeek[0] = "<%tcWebApi_get("String_Entry","ParentalSunText","s")%>";
            dayOfWeek[1] = "<%tcWebApi_get("String_Entry","ParentalMonText","s")%>";
            dayOfWeek[2] = "<%tcWebApi_get("String_Entry","ParentalTueText","s")%>";
            dayOfWeek[3] = "<%tcWebApi_get("String_Entry","ParentalWedText","s")%>";
            dayOfWeek[4] = "<%tcWebApi_get("String_Entry","ParentalThuText","s")%>";
            dayOfWeek[5] = "<%tcWebApi_get("String_Entry","ParentalFriText","s")%>";
            dayOfWeek[6] = "<%tcWebApi_get("String_Entry","ParentalSatText","s")%>";
            var everydayText = "<%tcWebApi_get("String_Entry","SchedulingSettingEverydayText","s")%>"
            var scheduleStatus = new Array();
            scheduleStatus[0] = 0;
            scheduleStatus[1] = 0;
            scheduleStatus[2] = 0;
            scheduleStatus[3] = 0;
            function writeRepeat(entryIndex)
            {
                var repeat = document.getElementById("nodeRepeat" + entryIndex).value;
                var repeatArray = repeat.split(",");
                var repeatString = "";
                if (repeatArray.length == 7)
                {
                    document.writeln(everydayText);   
                    return; 
                }
                for (var i = 0; i < repeatArray.length; i++)
                {
                    repeatString = repeatString + "," + dayOfWeek[repeatArray[i]];
                }
                repeatString = repeatString.slice(1);
                document.writeln(repeatString);
            }
            function getRepeatCheckbox()
            {
                var repeat = "";
                for (var i = 0; i < 7; i++)
                {
                    if (getCheckVal("cb" + i) == "1")
                    {
                        repeat = repeat + "," + i;
                    }
                }
                repeat = repeat.slice(1);
                return repeat;
            }
            function allLetter(inputtxt) 
            { 
                var letters = /^[A-Za-z0-9]+$/;
                if(inputtxt.match(letters)) 
                { 
                    return true; 
                } 
                else 
                {
                    return false; 
                } 
            }
            function getScheduleList() {
                var schedule, name, start, end, repeat;
                var scheduleList = {};
                for (var i = 1; i <= scheduleNum; i++) {
                    schedule = "sd" + i;
                    name = document.getElementById(schedule + "_name").innerHTML;
                    start = document.getElementById(schedule + "_start").innerHTML;
                    end = document.getElementById(schedule + "_end").innerHTML;
                    repeat = document.getElementById("nodeRepeat" + (i - 1)).value;
                    enable = document.getElementById("sw" + (i - 1)).value;
                    scheduleList[schedule] = {
                        'name': name,
                        'start': start,
                        'end': end,
                        'repeat': repeat,
                        'enable': enable
                    }
                }
                return scheduleList;
            }
            function validateTime(time, start, end) {
                if (time >= start && time <= end) {
                    return false;
                }
                return true;
            }
            function haveCommonRepeat(repeat1, repeat2) {
                for (var i = 0; i < repeat1.length; i++) {
                    if (repeat2.includes(repeat1[i]) && repeat1[i] >= '0' && repeat1[i] <= '6') {
                        return true;
                    }
                }
                return false;
            }
            function doApply() {
                var currentSchedule;
                var enable = document.getElementById("sw_edit").checked;
                var name = document.getElementById("inputName").value;
                var startTime = document.getElementById("startTimeInput").value;
                var endTime = document.getElementById("endTimeInput").value;
                var repeat = getRepeatCheckbox();
                var scheduleList = getScheduleList();
                var enableSet = enable ? "Yes" : "No";
                var now = new Date();
                var currentTime = now.getHours() + ":" + now.getMinutes();
                var curDay = now.getDay();
                if (startTime >= endTime) {
                    $('#startTimeInput').focus();
                    alert("<%tcWebApi_get("String_Entry","WSTimeWarningText","s")%>");
                    return;
                }
                if (enableSet == "Yes" && repeat.includes(curDay) && !validateTime(currentTime, startTime, endTime)) {
                    if (!confirm("<%tcWebApi_get("String_Entry","WSAvtivateConfirm","s")%>"))
                        return;
                }
                if (!allLetter(name)) {
                    $('#inputName').focus();
                    alert("<%tcWebApi_get("String_Entry","WSNameInvalidAlert","s")%>");
                    return;
                }
                if (enable) {
                    for (var schedule in scheduleList) {
                        currentSchedule = "sd" + (currentNode + 1);
                        if (schedule == currentSchedule) {
                            continue;
                        }
                        if (scheduleList[schedule]['enable'] == 0) {
                            continue;
                        }
                        if (name == scheduleList[schedule]['name']) {
                            alert("<%tcWebApi_get("String_Entry","WSDuplicateNameAlertText","s")%>");
                            return false;
                        }
                        if (!validateTime(startTime, scheduleList[schedule]['start'], scheduleList[schedule]['end']) && haveCommonRepeat(repeat, scheduleList[schedule]['repeat'])) {
                            alert("<%tcWebApi_get("String_Entry","WSTimeConflicAlertText","s")%>");
                            return false;
                        }
                        if (!validateTime(endTime, scheduleList[schedule]['start'], scheduleList[schedule]['end']) && haveCommonRepeat(repeat, scheduleList[schedule]['repeat'])) {
                            alert("<%tcWebApi_get("String_Entry","WSTimeConflicAlertText","s")%>");
                            return false;
                        }
                        if (!validateTime(scheduleList[schedule]['start'], startTime, endTime) && haveCommonRepeat(repeat, scheduleList[schedule]['repeat'])) {
                            alert("<%tcWebApi_get("String_Entry","WSTimeConflicAlertText","s")%>");
                            return false;
                        }
                        if (!validateTime(scheduleList[schedule]['end'], startTime, endTime) && haveCommonRepeat(repeat, scheduleList[schedule]['repeat'])) {
                            alert("<%tcWebApi_get("String_Entry","WSTimeConflicAlertText","s")%>");
                            return false;
                        }
                    }
                }
                requestType = "apply";
                $.ajax({url: "/cgi-bin/wifischeduling.cgi?requestType=" + requestType  + "&currentNode=" + currentNode + "&enable=" + enableSet + "&name=" + name + "&startTime=" + startTime + "&endTime=" + endTime + "&repeat=" + repeat, method: 'GET', complete: function(res){
                    location.reload();
                }});         
            }
            function cancelEdit() {
                document.getElementById("addScheduleForm").style.display = "none";
            }
            function doEditEntry(node)
            {
                var time, repeatArray, obj, startTime, endTime, repeat, enable;
                currentNode = node;
                var now = new Date();
                var currentTime = now.getHours() + ":" + now.getMinutes();
                var curDay = now.getDay();
                var startID = "sd" + (node + 1) + "_start";
                var endID = "sd" + (node + 1) + "_end";
                var thisStart = document.getElementById(startID).innerHTML;
                var thisEnd = document.getElementById(endID).innerHTML;
                var thisRepeat = document.getElementById("nodeRepeat" + node).value;
                var thisEnable = document.getElementById("sw" + node).value;
                requestType = "edit";
                $.ajax({url: "/cgi-bin/wifischeduling.cgi?requestType=" + requestType + "&currentNode=" + currentNode, method: 'GET', complete: function(res){
                    obj = JSON.parse(res.responseText);
                    document.ConfigForm.inputName.value = obj["name"].trim(); 
                    startTime = obj["starttime"].trim();
                    endTime = obj["endtime"].trim();
                    repeat = obj["repeat"].trim();
                    enable = obj["enable"].trim();
                    if (enable == "Yes") {
                        document.getElementById("sw_edit").checked = true;    
                    }
                    else {
                        document.getElementById("sw_edit").checked = false; 
                    }
                    document.getElementById("startTimeInput").value = obj["starttime"].trim();
                    document.getElementById("endTimeInput").value = obj["endtime"].trim();
                    repeatArray = repeat.split(",");
                    for (var i = 0; i < 7; i++)
                    {
                        document.getElementById("cb" + i).checked = false
                    }
                    for (var i = 0; i < repeatArray.length; i++)
                    {
                        document.getElementById("cb" + repeatArray[i]).checked = true;
                    }
                }});
                document.getElementById("addScheduleForm").style.display = "block";
            }
		</script>
        <style>
            input[type=time]::-webkit-datetime-edit-fields-wrapper {
                display: flex;
                border-radius: 6px;
                font-size: 16px;
                letter-spacing: 1px;
            }
            input[type=time]::-webkit-datetime-edit-text {
                padding: 2px 2px;
            }
            /* Hour */
            input[type=time]::-webkit-datetime-edit-hour-field {
                border-radius: 15%;
                width: 50px;
                text-align: center;
            }
            /* Minute */
            input[type=time]::-webkit-datetime-edit-minute-field {
                border-radius: 15%;
                width: 50px;
                text-align: center;
            }
            /* AM/PM */
            input[type=time]::-webkit-datetime-edit-ampm-field {
                border-radius: 15%;
                width: 50px;
                text-align: center;
            }
        </style>
	</head>
	<body onload="" class="container">
<header class="fixed-top"><nav id="top-nav" class="navbar navbar-expand-lg container"><a class="navbar-brand " href="/cgi-bin/home.asp"><div><img src="/img/logo_home.png" width="100" height="18" alt=""><div style="font-family: sans-serif; font-weight: bold;font-size: 12px;color: #000; margin-top: 0">OPTICAL NETWORK TERMINATION</div></div></a><button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"><em class="fas fa-align-justify"></em></span></button><div class="collapse navbar-collapse" id="navbarCollapse"><ul class="navbar-nav mr-auto sidenav" id="navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/home.asp"><%tcWebApi_get("String_Entry","NavigationHomeText","s")%><span class="sr-only"></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/deviceinfo.asp"><%tcWebApi_get("String_Entry","NavigationStatusDeviceText","s")%><span class="sr-only"></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/wifi-mesh-topology.asp"><%tcWebApi_get("String_Entry","EasyMeshStatus5Text","s")%><span class="sr-only"></span></a></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#status-menu" aria-controls="status-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NavigationStatusStatisticsText","s")%></a><ul class="nav-second-level collapse" id="status-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/sta-statistics.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationTrafficText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/sta-wifiusers.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationStatusUsersText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/sta-users.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","ARPStatusText","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#network-menu" aria-controls="network-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NAVNetwork","s")%></a><ul class="nav-second-level collapse" id="network-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/net-wan.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationBasInternetText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/net-lan.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationBasLANText","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#wifi-menu" aria-controls="wifi-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NAVWifi","s")%></a><ul class="nav-second-level collapse" id="wifi-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/wifi.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationWiFiSettingsText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/wifi-11ac.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationWiFi11acSettingsText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/wifi-mesh.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationMesh","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#firewall-menu" aria-controls="firewall-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NavigationAdvFirewallText","s")%></a><ul class="nav-second-level collapse" id="firewall-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-spi.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","ContentFirewallText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-urlfilter.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","FILTERTYPE_index2","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-macfilter.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVL2Filter","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-parentalcontrol.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","ParentalControlText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/safehome.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","SafehomeText","s")%></span></a></li></ul></li><li class="nav-item active"><a class="nav-link nav-link-collapse nav-link-show" href="#" id="hasSubItems" data-toggle="collapse" data-target="#apps-menu" aria-controls="apps-menu" aria-expanded="true"><%tcWebApi_get("String_Entry","NAVApplication","s")%></a><ul class="nav-second-level show" id="apps-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-dmz.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NatTopDMZText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-portforwarding.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NatVirsvrText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-sslim.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","SessionLimit","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-route.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","StaticRouteText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-ddns.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","dyDNS1Text","s")%></span></a></li><li class="nav-item active"><a class="nav-link" href="/cgi-bin/apps-wifischeduling.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","WifiSchedulingText","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#tools-menu" aria-controls="tools-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NavigationMaintenanceText","s")%></a><ul class="nav-second-level collapse" id="tools-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-admin.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationMainAdminText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-time.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVSysTime","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-firmware.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationMainFirmwareText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-config.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVConfig","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-diagnostic.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationMainDiagnosticsText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-wan2lan.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","Wan2lanText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-log.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVLogs","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-reboot.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","RebootText","s")%></span></a></li></ul></li></ul><div class="top-item-groups"><form name="LanguageForm" method="POST" action="/cgi-bin/apps-wifischeduling.asp" class="nav-item dropdown"><input type="hidden" name="TokenString" value="<%tcWebApi_getToken()%>"><input type="hidden" name="Language_Flag" value="<% tcWebApi_get("LanguageSwitch_Entry","Type","s") %>"><a class="nav-link dropdown-toggle" href="#" id="LanguageDropdown" role="button" data-toggle="dropdown" aria-expanded="false"><% tcWebApi_get("String_Entry","LoginLanguage","s") %></a><ul class="dropdown-menu" aria-labelledby="LanguageDropdown"><li><a class="dropdown-item <% if tcWebApi_get("LanguageSwitch_Entry","Type","h") = "1" then asp_Write("active") end if %>" href="#" onclick="submitLanguageForm(1);"><% tcWebApi_get("String_Entry","LanguageVIELong","s") %></a></li><li><a class="dropdown-item <% if tcWebApi_get("LanguageSwitch_Entry","Type","h") = "2" then asp_Write("active") end if %>" href="#" onclick="submitLanguageForm(2);"><% tcWebApi_get("String_Entry","LanguageENGLong","s") %></a></li></ul></form><div id="signout" class="nav-item"><a class="nav-link" href="javascript:doLogout();"><em class="fa fa-sign-out-alt"></em><span class="nav-link-text"><% tcWebApi_get("String_Entry","LogoutText","s") %></span></a></div></div></div></header></nav><% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then
	if tcWebApi_get("Mesh_Common", "DeviceRole", "h") = "2" then %>
		<script language='javascript'>
		document.getElementById("network-menu").children[0].style="display: none";
		document.getElementById("network-menu").children[1].style="display: none";
		document.getElementById("wifi-menu").children[0].style="display: none";
		document.getElementById("wifi-menu").children[1].style="display: none";
		</script>
<% end if end if %>		<div id="content">
            <form class="form-inline" method="post" name="ConfigForm" action="/cgi-bin/apps-wifischeduling.asp" autocomplete="off">
                <input type="hidden" id="nodeRepeat0" name="nodeRepeat0" value=<%tcWebApi_get("WifiScheduling_Entry0","Repeat","s")%>>
                <input type="hidden" id="nodeRepeat1" name="nodeRepeat1" value=<%tcWebApi_get("WifiScheduling_Entry1","Repeat","s")%>>
                <input type="hidden" id="nodeRepeat2" name="nodeRepeat2" value=<%tcWebApi_get("WifiScheduling_Entry2","Repeat","s")%>>
                <input type="hidden" id="nodeRepeat3" name="nodeRepeat3" value=<%tcWebApi_get("WifiScheduling_Entry3","Repeat","s")%>>
                <div class="widget col-xs-12 col-lg-12">
                    <header><%tcWebApi_get("String_Entry","WifiSchedulingText","s")%></header>
                    <div class="widget-body" >
                        <fieldset id="scheduleForm" name="scheduleForm" value="1" style="display: block;">
                            <legend><%tcWebApi_get("String_Entry","WSScheduleListText","s")%></legend>
                            <label><%tcWebApi_get("String_Entry","WSScheduleNoteText","s")%>. <%tcWebApi_get("String_Entry","WSScheduleNote2Text","s")%></label>
                            <br>
                            <div class="form-group">
                                <div class="table-responsive col-xs-12" style="float: none; margin: 0 auto; text-align: center;">
                                    <table class="table-bordered-radius simple-table" style="width:100%">
                                        <thead>
                                            <tr class="table-head" style="text-align: center;" >
                                                <th><%tcWebApi_get("String_Entry","ParentalDeviceNameText","s")%></th>
                                                <th><%tcWebApi_get("String_Entry","ParentalStartTimeText","s")%></th>
                                                <th><%tcWebApi_get("String_Entry","ParentalEndTimeText","s")%></th>
                                                <th><%tcWebApi_get("String_Entry","ParentalRepeatText","s")%></th>
                                                <th><%tcWebApi_get("String_Entry","UpdateStatusText","s")%></th>
                                                <th><%tcWebApi_get("String_Entry","ButtonActionTextLower","s")%></th>
                                            </tr>
                                            <tr class="table-head" id="tr1" style="text-align: center;" >
                                                <td id="sd1_name"><%tcWebApi_get("WifiScheduling_Entry0","Name","s")%></td>
                                                <td id="sd1_start"><%tcWebApi_get("WifiScheduling_Entry0","StartTime","s")%></td>
                                                <td id="sd1_end"><%tcWebApi_get("WifiScheduling_Entry0","EndTime","s")%></td>
                                                <td>
                                                    <script language=javascript>
                                                        writeRepeat(0);
                                                    </script>
                                                </td>
                                                <td>
                                                    <label class="toggle-switch" style="margin: auto;">
                                                        <input type="checkbox" disabled id="sw0" <% If TCWebApi_get("WifiScheduling_Entry0","Enable","h") = "Yes" then asp_Write("checked") end if%>>
                                                        <span class="slider"></span>
                                                    </label>
                                                </td>
                                                <td>
                                                    <i class='fa fa-pencil-alt icon-btn icon-btn-edit fa-lg' style="cursor: pointer;" onclick='doEditEntry(0)'></i>
                                                </td>
                                            </tr>
                                            <tr class="table-head" id="tr2" style="text-align: center; " >
                                                <td id="sd2_name"><%tcWebApi_get("WifiScheduling_Entry1","Name","s")%></td>
                                                <td id="sd2_start"><%tcWebApi_get("WifiScheduling_Entry1","StartTime","s")%></td>
                                                <td id="sd2_end"><%tcWebApi_get("WifiScheduling_Entry1","EndTime","s")%></td>
                                                <td>
                                                    <script language=javascript>
                                                        writeRepeat(1);
                                                    </script>
                                                </td>
                                                <td>
                                                    <label class="toggle-switch" style="margin: auto;" >
                                                        <input type="checkbox" disabled id="sw1" <% If TCWebApi_get("WifiScheduling_Entry1","Enable","h") = "Yes" then asp_Write("checked") end if%>>
                                                        <span class="slider"></span>
                                                    </label>
                                                </td>
                                                <td>
                                                    <i class='fa fa-pencil-alt icon-btn icon-btn-edit fa-lg' style="cursor: pointer;" onclick='doEditEntry(1)'></i>
                                                </td>
                                            </tr>
                                            <tr class="table-head" id="tr3" style="text-align: center;" >
                                                <td id="sd3_name"><%tcWebApi_get("WifiScheduling_Entry2","Name","s")%></td>
                                                <td id="sd3_start"><%tcWebApi_get("WifiScheduling_Entry2","StartTime","s")%></td>
                                                <td id="sd3_end"><%tcWebApi_get("WifiScheduling_Entry2","EndTime","s")%></td>
                                                <td>
                                                    <script language=javascript>
                                                        writeRepeat(2);
                                                    </script>
                                                </td>
                                                <td>
                                                    <label class="toggle-switch" style="margin: auto;" >
                                                        <input type="checkbox" disabled id="sw2" <% If TCWebApi_get("WifiScheduling_Entry2","Enable","h") = "Yes" then asp_Write("checked") end if%>>
                                                        <span class="slider"></span>
                                                    </label>
                                                </td>
                                                <td>
                                                    <i class='fa fa-pencil-alt icon-btn icon-btn-edit fa-lg' style="cursor: pointer;" onclick='doEditEntry(2)'></i>
                                                </td>
                                            </tr>
                                            <tr class="table-head" id="tr4" style="text-align: center;" >
                                                <td id="sd4_name"><%tcWebApi_get("WifiScheduling_Entry3","Name","s")%></td>
                                                <td id="sd4_start"><%tcWebApi_get("WifiScheduling_Entry3","StartTime","s")%></td>
                                                <td id="sd4_end"><%tcWebApi_get("WifiScheduling_Entry3","EndTime","s")%></td>
                                                <td>
                                                    <script language=javascript>
                                                        writeRepeat(3);
                                                    </script>
                                                </td>
                                                <td>
                                                    <label class="toggle-switch" style="margin: auto;" >
                                                        <input type="checkbox" disabled id="sw3" <% If TCWebApi_get("WifiScheduling_Entry3","Enable","h") = "Yes" then asp_Write("checked") end if%>>
                                                        <span class="slider"></span>
                                                    </label>
                                                </td>
                                                <td>
                                                    <i class='fa fa-pencil-alt icon-btn icon-btn-edit fa-lg' style="cursor: pointer;" onclick='doEditEntry(3)'></i>
                                                </td>
                                            </tr>
                                        </thead>
                                        <tbody id="tmp_list" name="tmp_list" >
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </fieldset>
                    </div>
                    <div class="widget-body" id="addScheduleForm" name="addScheduleForm" style="display: none;">
                        <fieldset>
                            <legend><%tcWebApi_get("String_Entry","WSEditScheduleText","s")%></legend>
                            <div class="form-group">
                                <label class="col-xs-12 col-sm-4 control-label"><%tcWebApi_get("String_Entry","EnableText","s")%></label>
                                <label class="toggle-switch" >
                                    <input type="checkbox" id="sw_edit">
                                    <span class="slider"></span>
                                </label>
                            </div>
                            <div class="form-group">
                                <label class="col-xs-12 col-sm-4 control-label"><%tcWebApi_get("String_Entry","ParentalDeviceNameText","s")%></label>
                                <input class="form-control col-xs-12 col-sm-4" type="text" NAME="inputName" id="inputName" SIZE="20" MAXLENGTH="20" >
                            </div>
                            <div class="form-group">
                                <label class="col-xs-12 col-sm-4 control-label"><%tcWebApi_get("String_Entry","ParentalStartTimeText","s")%></label>
                                <input type="time" class="form-control col-sm-4" id="startTimeInput">
                            </div>
                            <div class="form-group">
                                <label class="col-xs-12 col-sm-4 control-label"><%tcWebApi_get("String_Entry","ParentalEndTimeText","s")%></label>
                                <input type="time" class="form-control col-xs-12 col-sm-4" id="endTimeInput">
                            </div>
                            <div class="form-group">
                                <label class="col-xs-12 col-sm-4 control-label"><%tcWebApi_get("String_Entry","ParentalRepeatText","s")%></label>
                                <div>
                                    <table class="simple-table table-bordered-radius">
                                        <thead>
                                        <tr class="table-head">
                                            <th><%tcWebApi_get("String_Entry","ParentalSunText","s")%></th>
                                            <th><%tcWebApi_get("String_Entry","ParentalMonText","s")%></th>
                                            <th><%tcWebApi_get("String_Entry","ParentalTueText","s")%></th>
                                            <th><%tcWebApi_get("String_Entry","ParentalWedText","s")%></th>
                                            <th><%tcWebApi_get("String_Entry","ParentalThuText","s")%></th>
                                            <th><%tcWebApi_get("String_Entry","ParentalFriText","s")%></th>
                                            <th><%tcWebApi_get("String_Entry","ParentalSatText","s")%></th>
                                        </tr>
                                        </thead>
                                        <tr>
                                            <td><input type="checkbox" id="cb0" name="cb0" <%asp_Write("checked")%>></td>
                                            <td><input type="checkbox" id="cb1" name="cb1" <%asp_Write("checked")%>></td>
                                            <td><input type="checkbox" id="cb2" name="cb2" <%asp_Write("checked")%>></td>
                                            <td><input type="checkbox" id="cb3" name="cb3" <%asp_Write("checked")%>></td>
                                            <td><input type="checkbox" id="cb4" name="cb4" <%asp_Write("checked")%>></td>
                                            <td><input type="checkbox" id="cb5" name="cb5" <%asp_Write("checked")%>></td>
                                            <td><input type="checkbox" id="cb6" name="cb6" <%asp_Write("checked")%>></td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </fieldset>
                        <div class="col-lg-12 d-flex align-items-center justify-content-center">
                            <button id="btnSave" name="btnSave" type="button" class="page-button small-button" onclick="doApply();"><%tcWebApi_get("String_Entry","ButtonApplyText","s")%></button>
                            <button id="btnCANCEL" type="button" class="action-button small-button" onclick="cancelEdit();"><%tcWebApi_get("String_Entry","ButtonCancelText","s")%></button>
                        </div>
                    </div>
                    <!-- <div class="col-lg-12 d-flex align-items-center justify-content-center">
                        <button id="btnApply" type="button" class="page-button small-button" onclick="doApply();"><%tcWebApi_get("String_Entry","ButtonApplyText","s")%></button>
                    </div> -->
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
