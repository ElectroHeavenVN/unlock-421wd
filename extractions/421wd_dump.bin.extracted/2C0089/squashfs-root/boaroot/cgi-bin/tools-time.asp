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
If Request_Form("SaveFlag") = "1" then
	TCWebApi_set("Timezone_Entry","TZ","cboTimeZone")
	TCWebApi_set("Timezone_Entry","TYPE","autotimeFlag")
	TCWebApi_set("Timezone_Entry","SERVER","ntpServerOther1Flag")
	TCWebApi_set("Timezone_Entry","SERVER2","ntpServerOther2Flag")
	if Request_Form("isNtpServerTypeSupported") = "1" then
		TCWebApi_set("Timezone_Entry","NTPServerType","AddRouteTimeZone")
	else
		TCWebApi_set("Timezone_Entry","AddRoute","AddRouteTimeZone")
	end if
	TCWebApi_commit("Timezone_Entry")
	TCWebApi_save()
End if
%>
<!doctype html>
<html>
	<head>
<title>Viettel ONT - <%tcWebApi_get("String_Entry","NAVSysTime","s")%></title>		<meta charset="utf-8">
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
		function stSntp(domain,Enable,ntp1,ntp2,ZoneName)
		{
			this.domain = domain;
			this.Enable = Enable;
			this.ntp1 = ntp1;
			this.ntp2 = ntp2;
			this.ZoneName = ZoneName;
		}
		var SntpEntry = new Array(new stSntp("InternetGatewayDevice.Time","0","clock.fmt.he.net","clock.nyc.he.net","Beijing"),null);
		var Sntp = SntpEntry[0];
		var localtimename = '';
		var ntpServers = new Array();
		ntpServers[0] = 'clock.fmt.he.net';
		ntpServers[1] = 'clock.nyc.he.net';
		ntpServers[2] = 'clock.sjc.he.net';
		ntpServers[3] = 'clock.via.net';
		ntpServers[4] = 'ntp1.tummy.com';
		ntpServers[5] = 'time.cachenetworks.com';
		ntpServers[6] = 'time.nist.gov';
		var timeZonesEng = new Array();
		timeZonesEng[0] = '(GMT-12:00) International Date Line West';
		timeZonesEng[1] = '(GMT-11:00) Midway Island, Samoa';
		timeZonesEng[2] = '(GMT-10:00) Hawaii';
		timeZonesEng[3] = '(GMT-09:00) Alaska';
		timeZonesEng[4] = '(GMT-08:00) Pacific Time, Tijuana';
		timeZonesEng[5] = '(GMT-07:00) Arizona, Mazatlan';
		timeZonesEng[6] = '(GMT-07:00-1) Chihuahua, La Paz';
		timeZonesEng[7] = '(GMT-07:00-2) Mountain Time';
		timeZonesEng[8] = '(GMT-06:00) Central America';
		timeZonesEng[9] = '(GMT-06:00-1) Central Time';
		timeZonesEng[10] = '(GMT-06:00-2) Guadalajara, Mexico City, Monterrey';
		timeZonesEng[11] = '(GMT-06:00-3) Saskatchewan';
		timeZonesEng[12] = '(GMT-05:00) Bogota, Lima, Quito';
		timeZonesEng[13] = '(GMT-05:00-1) Eastern Time';
		timeZonesEng[14] = '(GMT-05:00-2) Indiana';
		timeZonesEng[15] = '(GMT-04:00) Atlantic Time';
		timeZonesEng[16] = '(GMT-04:00-1) Caracas, La Paz';
		timeZonesEng[17] = '(GMT-04:00-2) Santiago';
		timeZonesEng[18] = '(GMT-03:30) Newfoundland';
		timeZonesEng[19] = '(GMT-03:00) Brasilia';
		timeZonesEng[20] = '(GMT-03:00-1) Buenos Aires, Georgetown';
		timeZonesEng[21] = '(GMT-03:00-2) Greenland';
		timeZonesEng[22] = '(GMT-02:00) Mid-Atlantic';
		timeZonesEng[23] = '(GMT-01:00) Azores';
		timeZonesEng[24] = '(GMT-01:00-1) Cape Verde Is.';
		timeZonesEng[25] = '(GMT) Casablanca, Monrovia';
		timeZonesEng[26] = '(GMT-1) Greenwich Mean Time: Dublin, Edinburgh, Lisbon, London';
		timeZonesEng[27] = '(GMT+01:00) Amsterdam, Berlin, Bern, Rome, Stockholm, Vienna';
		timeZonesEng[28] = '(GMT+01:00-1) Belgrade, Bratislava, Budapest, Ljubljana, Prague';
		timeZonesEng[29] = '(GMT+01:00-2) Brussels, Copenhagen, Madrid, Paris';
		timeZonesEng[30] = '(GMT+01:00-3) Sarajevo, Skopje, Warsaw, Zagreb';
		timeZonesEng[31] = '(GMT+01:00-4) West Central Africa';
		timeZonesEng[32] = '(GMT+02:00) Athens, Istanbul, Minsk';
		timeZonesEng[33] = '(GMT+02:00-1) Bucharest';
		timeZonesEng[34] = '(GMT+02:00-2) Cairo';
		timeZonesEng[35] = '(GMT+02:00-3) Harare, Pretoria';
		timeZonesEng[36] = '(GMT+02:00-4) Helsinki, Kyiv, Riga, Sofia, Tallinn, Vilnius';
		timeZonesEng[37] = '(GMT+02:00-5) Jerusalem';
		timeZonesEng[38] = '(GMT+03:00) Baghdad';
		timeZonesEng[39] = '(GMT+03:00-1) Kuwait, Riyadh';
		timeZonesEng[40] = '(GMT+03:00-2) Moscow, St. Petersburg, Volgograd';
		timeZonesEng[41] = '(GMT+03:00-3) Nairobi';
		timeZonesEng[42] = '(GMT+03:30) Tehran';
		timeZonesEng[43] = '(GMT+04:00) Abu Dhabi, Muscat';
		timeZonesEng[44] = '(GMT+04:00-1) Baku, Tbilisi, Yerevan';
		timeZonesEng[45] = '(GMT+04:30) Kabul';
		timeZonesEng[46] = '(GMT+05:00) Ekaterinburg';
		timeZonesEng[47] = '(GMT+05:00-1) Islamabad, Karachi, Tashkent';
		timeZonesEng[48] = '(GMT+05:30) Chennai, Kolkata, Mumbai, New Delhi';
		timeZonesEng[49] = '(GMT+05:45) Kathmandu';
		timeZonesEng[50] = '(GMT+06:00) Almaty, Novosibirsk';
		timeZonesEng[51] = '(GMT+06:00-1) Astana, Dhaka';
		timeZonesEng[52] = '(GMT+06:00-2) Sri Jayawardenepura';
		timeZonesEng[53] = '(GMT+06:30) Rangoon';
		timeZonesEng[54] = '(GMT+07:00) Bangkok, Hanoi, Jakarta';
		timeZonesEng[55] = '(GMT+07:00-1) Krasnoyarsk';
		timeZonesEng[56] = '(GMT+08:00) Beijing, Chongquing, Hong Kong, Urumqi';
		timeZonesEng[57] = '(GMT+08:00-1) Irkutsk, Ulaan Bataar';
		timeZonesEng[58] = '(GMT+08:00-2) Kuala Lumpur, Singapore';
		timeZonesEng[59] = '(GMT+08:00-3) Perth';
		timeZonesEng[60] = '(GMT+08:00-4) Taipei';
		timeZonesEng[61] = '(GMT+09:00) Osaka, Sapporo, Tokyo';
		timeZonesEng[62] = '(GMT+09:00-1) Seoul';
		timeZonesEng[63] = '(GMT+09:00-2) Yakutsk';
		timeZonesEng[64] = '(GMT+09:30) Adelaide';
		timeZonesEng[65] = '(GMT+09:30-1) Darwin';
		timeZonesEng[66] = '(GMT+10:00) Brisbane';
		timeZonesEng[67] = '(GMT+10:00-1) Canberra, Melbourne, Sydney';
		timeZonesEng[68] = '(GMT+10:00-2) Guam, Port Moresby';
		timeZonesEng[69] = '(GMT+10:00-3) Hobart';
		timeZonesEng[70] = '(GMT+10:00-4) Vladivostok';
		timeZonesEng[71] = '(GMT+11:00) Magadan';
		timeZonesEng[72] = '(GMT+11:00-1) Solomon Is., New Caledonia';
		timeZonesEng[73] = '(GMT+12:00) Auckland, Wellington';
		timeZonesEng[74] = '(GMT+12:00-1) Fiji, Kamchatka, Marshall Is.';
		function getTimeZoneIndex(timeZoneName)
		{
			var i = 0, ret = 4;  
			for ( var i = 0; i < timeZonesEng.length; i++ )
			{
				if ( timeZonesEng[i].search(timeZoneName) != -1 )
					break;
				if(timeZonesEng[i] == timeZoneName)
					break;
			}
			if ( i < timeZonesEng.length )
				ret = i;
			return ret;
		}
		function genlocaltimename()
		{
			var obj = getElement('cboTimeZone');
			var index = obj.selectedIndex;
			var val = obj.options[index].value;
			localtimename += "GMT";
			localtimename += val;
			if (val == '')
			{
				localtimename += '00:00:00';
			}
		}
		function getTimeZoneName(idx) {
			var str = timeZonesEng[idx];
			return str;
		}
		function getTimeZoneOffset(idx) {
			var str = timeZonesEng[idx];
			var ret = '';
			var nLength = str.indexOf(")");
			ret = str.substr(1, nLength-1);
			return ret;
		}
		function writeTimeZoneList()
		{
			var  vValue;
			var	bExit = 0;
			for( var i = 0; i < timeZonesEng.length; i++ )
			{
				vValue = getTimeZoneOffset(i);
				document.writeln("<option value=" + vValue + ">" + timeZonesEng[i] + "</option>");
				if(document.ConfigForm.CountryName.value == vValue)
				{
					document.ConfigForm.cboTimeZone.selectedIndex= i;
					bExit = 1;
				}
				else
				{
					if((timeZonesEng[i].match("GMT+08:00") != null) && (0 == bExit))
					{
						document.ConfigForm.cboTimeZone.selectedIndex= i;
					}
				}	
			}
		}
		function ntpChange(optionlist,textbox)
		{
		if(document.ConfigForm.ntpEnabled.checked)
		{
			if( optionlist[optionlist.selectedIndex].value == "Other" )
			{
				textbox.disabled = false;
				textbox.style.display = '';
			}
			else
			{
				textbox.value = "";
				textbox.disabled = true;
				textbox.style.display = 'none';
			}
		}
		}
		function hideNtpConfig(hide)
		{
			var status = '';
			if(hide)
				status = 'none';
			if( document.getElementById )
				document.getElementById('ntpConfig').style.display = status;
			else
				if(!document.layers)
					document.all.ntpConfig.style.display = status;
		}
		function ntpEnblChange()
		{
			if( document.ConfigForm.ntpEnabled.checked )
			{
				hideNtpConfig(0);
				document.ConfigForm.autotimeFlag.value = "0";//0 is auto time
			}
			else
			{
				hideNtpConfig(1);
				document.ConfigForm.autotimeFlag.value = "2";//2 is manual 
			}
		}
		function writeNtpList(needed)
		{
			var  vFlag = "0";
			if(!needed)
			{
				document.writeln("<option value=None><% tcwebapi_get("String_Entry","NoneText","s")%></option>");
			}
			for( var i = 0; i < ntpServers.length; i++ )
			{
				document.writeln("<option value=" + ntpServers[i] + ">" + ntpServers[i] + "</option>");
				if(needed)
				{
					if(document.ConfigForm.ntpServerOther1Flag.value == ntpServers[i])
					{
						document.ConfigForm.ntpServer1.selectedIndex = i;
						vFlag = "1";
					}
				}
				else
				{
					if(document.ConfigForm.ntpServerOther2Flag.value == ntpServers[i])
					{
						document.ConfigForm.ntpServer2.selectedIndex = i+1;
						vFlag = "1";
					}
				}
			}
			document.writeln("<option value=Other><% tcwebapi_get("String_Entry","OtherText","s")%></option>");
			if(vFlag == "0")
			{
				if(needed) document.ConfigForm.ntpServer1.selectedIndex =  ntpServers.length;
				else {
					if(document.ConfigForm.ntpServerOther2Flag.value == "None")
						document.ConfigForm.ntpServer2.selectedIndex =  0;
					else
						document.ConfigForm.ntpServer2.selectedIndex =  ntpServers.length+1;
				}
			}
		}
		function LoadFrame()
		{
			var i = 0;
			var ntp1 = Sntp.ntp1 ;
			var ntp2 = Sntp.ntp2;
			var ntp_enabled = Sntp.Enable;
			var tz_name = Sntp.ZoneName;
			with (document.ConfigForm)
			{
				ntpEnblChange();
				ntpChange(ntpServer1,ntpServerOther1);
				ntpChange(ntpServer2,ntpServerOther2);
			}
			write_time();
		}
		function isIpFormat(str)
		{
			var addrParts = str.split('.');
			if (addrParts.length != 4 )
				return false;
			if (isNaN(addrParts[0] || addrparts[i] == ""))
				return false;
			if (isPlusInteger(addrParts[0]) == false)
				return false;
			return true;
		}
		function isTValidName(name) {
			var i = 0;
			var unsafeString = "\"<>%\\^[]`\+\$\,='#&:;*/{} \t";
			for ( i = 0; i < name.length; i++ ) {
				for( j = 0; j < unsafeString.length; j++)
					if ( (name.charAt(i)) == unsafeString.charAt(j) )
						return false;
			}
			return true;
		}
		function checkntpServrState()
		{
			var  vForm = document.ConfigForm;
			if(vForm.ntpEnabled.checked) {
				if(vForm.ntpServer1.value == "Other")
					vForm.ntpServerOther1Flag.value = vForm.ntpServerOther1.value;
				else vForm.ntpServerOther1Flag.value = vForm.ntpServer1.value;
				if(vForm.ntpServer2.value == "Other")
					vForm.ntpServerOther2Flag.value = vForm.ntpServerOther2.value;
				else vForm.ntpServerOther2Flag.value = vForm.ntpServer2.value;
			}
		}			
		function SubmitForm()
		{
			with( document.ConfigForm )
			{
				if( ntpEnabled.checked )
				{
					if( ntpServer1.selectedIndex == ntpServers.length )
					{
						if( ntpServerOther1.value.length == 0 )
						{ 
							alert('<%tcWebApi_get("String_Entry","SelectOtherText","s")%>');
							document.ConfigForm.SaveFlag.value = 0;
							return;
						}
						if(isIpv6Address(ntpServerOther1.value))
						{
							if(isUnicastIpv6Address(ntpServerOther1.value) == false)
							{
									alert('<%tcWebApi_get("String_Entry","MasterServerText","s")%>');
									document.ConfigForm.SaveFlag.value = 0;
									return;
							}
						}
						else if (isIpFormat(ntpServerOther1.value))
						{
							if ( '0.0.0.0' != ntpServerOther1.value && isValidIpAddress(ntpServerOther1.value) == false)
							{
								alert('<%tcWebApi_get("String_Entry","MasterServerText","s")%>');
								document.ConfigForm.SaveFlag.value = 0;
								return;
							}
						}
						else
						{
								if(isTValidName(ntpServerOther1.value) == false)
								{
										alert('<%tcWebApi_get("String_Entry","MasterServerText","s")%>');
										document.ConfigForm.SaveFlag.value = 0;
										return;
								}
						}
					}
					if( ntpServer2.selectedIndex == ntpServers.length+1 )
					{
						if( ntpServerOther2.value.length == 0 )
						{ 
							alert('<%tcWebApi_get("String_Entry","SelectOtherText","s")%>');
							document.ConfigForm.SaveFlag.value = 0;
							return;
						}
						if(isIpv6Address(ntpServerOther2.value))
						{
								if(isUnicastIpv6Address(ntpServerOther2.value) == false)
								{
									alert('<%tcWebApi_get("String_Entry","SlaveServerText","s")%>');
									document.ConfigForm.SaveFlag.value = 0;
									return;
								}
							}
						else if (isIpFormat(ntpServerOther2.value))
						{
							if ('0.0.0.0' != ntpServerOther2.value && isValidIpAddress(ntpServerOther2.value) == false)
							{
								alert('<%tcWebApi_get("String_Entry","SlaveServerText","s")%>');
								document.ConfigForm.SaveFlag.value = 0;
								return;
							}
						}
						else
						{
							if(isTValidName(ntpServerOther2.value) == false)
							{
								alert('<%tcWebApi_get("String_Entry","SlaveServerText","s")%>');
								document.ConfigForm.SaveFlag.value = 0;
								return;
							}
						}
					}
				}
			}
			checkntpServrState();
			document.ConfigForm.SaveFlag.value = "1";
			submitAsync('ConfigForm');
		}										
<% if tcWebApi_get("WebCustom_Entry","isNtpServerTypeSupported","h") = "Yes" then %>
		function listCreate(l_flag)
		{
				var slNtpServerType = "<% tcWebApi_get("Timezone_Entry","NTPServerType","s") %>";
				var vEntryName = new Array();	
				vEntryName[0]="INTERNET";
				vEntryName[1]="VOICE";
				vEntryName[2]="TR069";
				vEntryName[3]="OTHER";
				for (i = 0; i < 4; i++)
				{
		<% if tcwebApi_get("WebCustom_Entry","isCTPONNOVOIP","h") = "Yes" then %>
						if ( 1 == i )
							continue;
		<% end if %>
						if(slNtpServerType == i)
						{
							document.write('<option value=' + i + ' selected>'	+ vEntryName[i] + '</option>');
						}
						else
						{
							document.write('<option value=' + i + '>'	+ vEntryName[i] + '</option>');
						}
				}
		}
<% else %>
		var nEntryNum = <% tcWebApi_get("WanInfo_Common","CycleNum","s") %>;
		var vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
		var vEntryName = vArrayStr.split(',');
		vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
		var vEntryValue = vArrayStr.split(',');
		//sort
		vEntryName = SortUtil.UpdateWanIFName( vEntryName, nEntryNum );
		vEntryValue = SortUtil.SortMyArray( vEntryValue );		
		var slIFNnme = "<% tcWebApi_get("Timezone_Entry","AddRoute","s") %>";			
		function listCreate(l_flag)
		{
				for (i = 0; i < nEntryNum; i++)
				{
					if(vEntryName[i].indexOf('_R_') > 0){
						if(slIFNnme == vEntryValue[i])
						{
							document.write('<option value=' + vEntryValue[i] + ' selected>'	+ vEntryName[i] + '</option>');
						}
						else
						{
							document.write('<option value=' + vEntryValue[i] + '>'	+ vEntryName[i] + '</option>');
						}
					}
				}
		}
<%end if%>
		function write_time() {
			var time, string, min, hour, day, month, year;
			time = '<%tcWebApi_get("DeviceInfo","cur_time2","s")%>';
			var curTimelist = time.split('/');
			if ( 5 == curTimelist.length )
			{
				month = curTimelist[0];
				day = curTimelist[1];
				year = curTimelist[2];
				hour = curTimelist[3];
				min = curTimelist[4];
				string = hour + ":" + min + "   ";
				<% if tcWebApi_get("LanguageSwitch_Entry", "Type", "h") = "1" then %>
					string += day + "/" + month + "/" + year + " (ngày/tháng/năm)";
				<%else %>
					string += month + "/" + day + "/" + year + " (Month/Day/Year)";
				<% end if %> 	
				$("#system_time").html(string);
			}
			else {
				$("#system_time").html("N/A");
			}
		}
		</script>
	</head>
	<body onload="LoadFrame()" class="container">
<header class="fixed-top"><nav id="top-nav" class="navbar navbar-expand-lg container"><a class="navbar-brand " href="/cgi-bin/home.asp"><div><img src="/img/logo_home.png" width="100" height="18" alt=""><div style="font-family: sans-serif; font-weight: bold;font-size: 12px;color: #000; margin-top: 0">OPTICAL NETWORK TERMINATION</div></div></a><button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"><em class="fas fa-align-justify"></em></span></button><div class="collapse navbar-collapse" id="navbarCollapse"><ul class="navbar-nav mr-auto sidenav" id="navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/home.asp"><%tcWebApi_get("String_Entry","NavigationHomeText","s")%><span class="sr-only"></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/deviceinfo.asp"><%tcWebApi_get("String_Entry","NavigationStatusDeviceText","s")%><span class="sr-only"></span></a></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#status-menu" aria-controls="status-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NavigationStatusStatisticsText","s")%></a><ul class="nav-second-level collapse" id="status-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/sta-statistics.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationTrafficText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/sta-wifiusers.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationStatusUsersText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/sta-users.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","ARPStatusText","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#network-menu" aria-controls="network-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NAVNetwork","s")%></a><ul class="nav-second-level collapse" id="network-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/net-wan.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationBasInternetText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/net-lan.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationBasLANText","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#wifi-menu" aria-controls="wifi-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NAVWifi","s")%></a><ul class="nav-second-level collapse" id="wifi-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/wifi.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationWiFiSettingsText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/wifi-11ac.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationWiFi11acSettingsText","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#firewall-menu" aria-controls="firewall-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NavigationAdvFirewallText","s")%></a><ul class="nav-second-level collapse" id="firewall-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-spi.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","ContentFirewallText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-urlfilter.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","FILTERTYPE_index2","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-macfilter.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVL2Filter","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-parentalcontrol.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","ParentalControlText","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#apps-menu" aria-controls="apps-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NAVApplication","s")%></a><ul class="nav-second-level collapse" id="apps-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-dmz.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NatTopDMZText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-portforwarding.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NatVirsvrText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-sslim.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","SessionLimit","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-route.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","StaticRouteText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-ddns.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","dyDNS1Text","s")%></span></a></li></ul></li><li class="nav-item active"><a class="nav-link nav-link-collapse nav-link-show" href="#" id="hasSubItems" data-toggle="collapse" data-target="#tools-menu" aria-controls="tools-menu" aria-expanded="true"><%tcWebApi_get("String_Entry","NavigationMaintenanceText","s")%></a><ul class="nav-second-level show" id="tools-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-admin.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationMainAdminText","s")%></span></a></li><li class="nav-item active"><a class="nav-link" href="/cgi-bin/tools-time.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVSysTime","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-firmware.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationMainFirmwareText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-config.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVConfig","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-diagnostic.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationMainDiagnosticsText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-log.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVLogs","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-reboot.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","RebootText","s")%></span></a></li></ul></li></ul><div class="top-item-groups"><form name="LanguageForm" method="POST" action="/cgi-bin/tools-time.asp" class="nav-item dropdown"><input type="hidden" name="TokenString" value="<%tcWebApi_getToken()%>"><input type="hidden" name="Language_Flag" value="<% tcWebApi_get("LanguageSwitch_Entry","Type","s") %>"><a class="nav-link dropdown-toggle" href="#" id="LanguageDropdown" role="button" data-toggle="dropdown" aria-expanded="false"><% tcWebApi_get("String_Entry","LoginLanguage","s") %></a><ul class="dropdown-menu" aria-labelledby="LanguageDropdown"><li><a class="dropdown-item <% if tcWebApi_get("LanguageSwitch_Entry","Type","h") = "1" then asp_Write("active") end if %>" href="#" onclick="submitLanguageForm(1);"><% tcWebApi_get("String_Entry","LanguageVIELong","s") %></a></li><li><a class="dropdown-item <% if tcWebApi_get("LanguageSwitch_Entry","Type","h") = "2" then asp_Write("active") end if %>" href="#" onclick="submitLanguageForm(2);"><% tcWebApi_get("String_Entry","LanguageENGLong","s") %></a></li></ul></form><div id="signout" class="nav-item"><a class="nav-link" href="javascript:doLogout();"><em class="fa fa-sign-out-alt"></em><span class="nav-link-text"><% tcWebApi_get("String_Entry","LogoutText","s") %></span></a></div></div></div></header></nav><% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then
	if tcWebApi_get("Mesh_Common", "DeviceRole", "h") = "2" then %>
		<script language='javascript'>
		document.getElementById("wifi-menu").children[0].style="display: none";
		document.getElementById("wifi-menu").children[1].style="display: none";
		</script>
<% end if end if %>		<div id="content">
		<form class="form-inline" method="post" name="ConfigForm" action="/cgi-bin/tools-time.asp" autocomplete="off">
		<INPUT TYPE="HIDDEN" NAME="adminFlag" VALUE="0"></td>
		<INPUT TYPE="HIDDEN" NAME="TokenString" VALUE="<%tcWebApi_getToken()%>">                            
		<input type="hidden" id="autotimeFlag" name="autotimeFlag" value="0">
		<input type="hidden" id="CountryName" name="CountryName" value="<% tcWebApi_get("Timezone_Entry","TZ", "s") %>">
		<input type="hidden" id="ntpServerOther1Flag" name="ntpServerOther1Flag" value="<% tcWebApi_get("Timezone_Entry","SERVER", "s") %>">
		<input type="hidden" id="ntpServerOther2Flag" name="ntpServerOther2Flag" value="<% tcWebApi_get("Timezone_Entry","SERVER2", "s") %>">
		<INPUT TYPE="HIDDEN" id="isNtpServerTypeSupported" NAME="isNtpServerTypeSupported" value="<% if tcWebApi_get("WebCustom_Entry","isNtpServerTypeSupported","h") = "Yes" then asp_write("1") else asp_write("0") end if %>">
		<input type="hidden" id="SaveFlag" name="SaveFlag" value="0">
		<div class="row row-w-100">
			<div class="widget col-xs-12 col-lg-12">
				<header><%tcWebApi_get("String_Entry","NAVSysTime","s")%></header>
				<div class="widget-body">
					<fieldset>
						<div class="form-group">
							<label class="col-xs-6 col-lg-4 control-label"><%tcWebApi_get("String_Entry","NAVSysTime","s")%></label>
							<label class="col-xs-5 col-lg-6 text-label inline-text" id="system_time"></label>
						</div>
						<div class="form-group">
							<div class="col-xs-12 offset-lg-1 custom-control custom-checkbox">
								<input class="custom-control-input" type="checkbox" id="ntpEnabled" name="ntpEnabled" onchange="ntpEnblChange()" <%if TCWebApi_get("Timezone_Entry","TYPE", "h") = "0" then asp_Write("checked") end if%>>
								<label class="custom-control-label" for="ntpEnabled"><%tcWebApi_get("String_Entry","AutoTimeServerText","s")%></label>
							</div>
						</div>
						<div class="form-group d-none">
							<label class="col-xs-12 col-lg-4 control-label"><%tcWebApi_get("String_Entry","SelectInterfaceText","s")%></label>
							<div class="col-xs-12 col-lg-8 custom-select">
								<SELECT id="AddRouteTimeZone"  size="1" name="AddRouteTimeZone" >  
									<SCRIPT language=javascript>
										listCreate(0);
									</SCRIPT>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-xs-12 col-lg-4 control-label"><%tcWebApi_get("String_Entry","NTPMasterServerText","s")%></label>
							<div class="col-xs-12 col-lg-4 custom-select">
								<select onChange=ntpChange(this.form.ntpServer1,this.form.ntpServerOther1)  size=1 name=ntpServer1>
									<script language=javascript>
										writeNtpList(true);
									</script>
								</select>
							</div>
							&nbsp;
							<input class="form-control col-xs-12 col-lg-3" maxlength=63 id=ntpServerOther1 name=ntpServerOther1 value="<%if tcWebApi_get("Timezone_Entry","SERVER","h") <> "N/A" then tcWebApi_get("Timezone_Entry","SERVER","s") end if%>">
						</div>
						<div class="form-group">
							<label class="col-xs-12 col-lg-4 control-label"><%tcWebApi_get("String_Entry","NTPSlaveServerText","s")%></label>
							<div class="col-xs-12 col-lg-4 custom-select">
								<select onChange=ntpChange(this.form.ntpServer2,this.form.ntpServerOther2) size=1 id=ntpServer2 name=ntpServer2>
									<script language=javascript>
										writeNtpList(false);
									</script>
								</select>
							</div>
							&nbsp;
							<input class="form-control col-xs-12 col-lg-3" maxlength=63 id=ntpServerOther2 name=ntpServerOther2 value="<%if tcWebApi_get("Timezone_Entry","SERVER2","h") <> "N/A" then tcWebApi_get("Timezone_Entry","SERVER2","s") end if%>">
						</div>
						<div class="form-group" id=ntpConfig>
							<label class="col-xs-12 col-lg-4 control-label"><%tcWebApi_get("String_Entry","TimeZoneText","s")%></label>
							<div class="col-xs-12 col-lg-8 custom-select">
								<SELECT size=1 id="cboTimeZone" name="cboTimeZone"> 
									<SCRIPT language=javascript>
										writeTimeZoneList();
									</SCRIPT>
								</select>
							</div>
						</div>
					</fieldset>
				</div>
				<div class="col-lg-12 d-flex align-items-center justify-content-center">
					<button id="btnOK" type="button" class="page-button small-button" onclick="SubmitForm();"><%tcWebApi_get("String_Entry","ButtonApplyText","s")%></button>
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
