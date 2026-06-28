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
if Request_form("PostFlag") = "1" then
	if tcWebApi_validate("Global_Max=integer|7999|16385") = "1" then
   		TCWebAPI_set("natsslim_Common","global_max","Global_Max")
   	end if
	if Request_form("PerHost_Enable") = "1" then
		tcWebApi_constSet ("natsslim_Common","perhost_enable","Enable")
		if tcWebApi_validate("PerHost_Default=integer|0|16385") = "1" then
			TCWebAPI_set("natsslim_Common","perhost_default","PerHost_Default")
		end if
		if tcWebApi_validate("Active0=options|Enable|Disable") = "1"  then
			if Request_form("Active0") = "Enable" then
				if tcWebApi_validate("IPAddr0=ipv4&Max0=integer|0|16385") = "1" then
					TCWebAPI_set("natsslim_Entry0","ip","IPAddr0")
					TCWebAPI_set("natsslim_Entry0","max","Max0")
					TCWebAPI_set("natsslim_Entry0","Enable","Active0")
				else
					tcWebApi_constSet ("natsslim_Entry0","Enable","Disable")
				end if
			else
				TCWebAPI_unset("natsslim_Entry0")
				TCWebAPI_set("natsslim_Entry0","Enable","Active0")
			end if
		end if
		if tcWebApi_validate("Active1=options|Enable|Disable") = "1"  then
			if Request_form("Active1") = "Enable" then
				if tcWebApi_validate("IPAddr1=ipv4&Max1=integer|0|16385") = "1" then
					TCWebAPI_set("natsslim_Entry1","ip","IPAddr1")
					TCWebAPI_set("natsslim_Entry1","max","Max1")
					TCWebAPI_set("natsslim_Entry1","Enable","Active1")
				else
					tcWebApi_constSet ("natsslim_Entry1","Enable","Disable")
				end if
			else
				TCWebAPI_unset("natsslim_Entry1")
				TCWebAPI_set("natsslim_Entry1","Enable","Active1")
			end if
		end if
		if tcWebApi_validate("Active2=options|Enable|Disable") = "1"  then
			if Request_form("Active2") = "Enable" then
				if tcWebApi_validate("IPAddr2=ipv4&Max2=integer|0|16385") = "1" then
					TCWebAPI_set("natsslim_Entry2","ip","IPAddr2")
					TCWebAPI_set("natsslim_Entry2","max","Max2")
					TCWebAPI_set("natsslim_Entry2","Enable","Active2")
				else
					tcWebApi_constSet ("natsslim_Entry2","Enable","Disable")
				end if
			else
				TCWebAPI_unset("natsslim_Entry2")
				TCWebAPI_set("natsslim_Entry2","Enable","Active2")
			end if
		end if
		if tcWebApi_validate("Active3=options|Enable|Disable") = "1"  then
			if Request_form("Active3") = "Enable" then
				if tcWebApi_validate("IPAddr3=ipv4&Max3=integer|0|16385") = "1" then
					TCWebAPI_set("natsslim_Entry3","ip","IPAddr3")
					TCWebAPI_set("natsslim_Entry3","max","Max3")
					TCWebAPI_set("natsslim_Entry3","Enable","Active3")
				else
					tcWebApi_constSet ("natsslim_Entry3","Enable","Disable")
				end if
			else
				TCWebAPI_unset("natsslim_Entry3")
				TCWebAPI_set("natsslim_Entry3","Enable","Active3")
			end if
		end if
		if tcWebApi_validate("Active4=options|Enable|Disable") = "1"  then
			if Request_form("Active4") = "Enable" then
				if tcWebApi_validate("IPAddr4=ipv4&Max4=integer|0|16385") = "1" then
					TCWebAPI_set("natsslim_Entry4","ip","IPAddr4")
					TCWebAPI_set("natsslim_Entry4","max","Max4")
					TCWebAPI_set("natsslim_Entry4","Enable","Active4")
				else
					tcWebApi_constSet ("natsslim_Entry4","Enable","Disable")
				end if
			else
				TCWebAPI_unset("natsslim_Entry4")
				TCWebAPI_set("natsslim_Entry4","Enable","Active4")
			end if
		end if
		if tcWebApi_validate("Active5=options|Enable|Disable") = "1"  then
			if Request_form("Active5") = "Enable" then
				if tcWebApi_validate("IPAddr5=ipv4&Max5=integer|0|16385") = "1" then
					TCWebAPI_set("natsslim_Entry5","ip","IPAddr5")
					TCWebAPI_set("natsslim_Entry5","max","Max5")
					TCWebAPI_set("natsslim_Entry5","Enable","Active5")
				else
					tcWebApi_constSet ("natsslim_Entry5","Enable","Disable")
				end if
			else
				TCWebAPI_unset("natsslim_Entry5")
				TCWebAPI_set("natsslim_Entry5","Enable","Active5")
			end if
		end if
		if tcWebApi_validate("Active6=options|Enable|Disable") = "1"  then
			if Request_form("Active6") = "Enable" then
				if tcWebApi_validate("IPAddr6=ipv4&Max6=integer|0|16385") = "1" then
					TCWebAPI_set("natsslim_Entry6","ip","IPAddr6")
					TCWebAPI_set("natsslim_Entry6","max","Max6")
					TCWebAPI_set("natsslim_Entry6","Enable","Active6")
				else
					tcWebApi_constSet ("natsslim_Entry6","Enable","Disable")
				end if
			else
				TCWebAPI_unset("natsslim_Entry6")
				TCWebAPI_set("natsslim_Entry6","Enable","Active6")
			end if
		end if
		if tcWebApi_validate("Active7=options|Enable|Disable") = "1"  then
			if Request_form("Active7") = "Enable" then
				if tcWebApi_validate("IPAddr7=ipv4&Max7=integer|0|16385") = "1" then
					TCWebAPI_set("natsslim_Entry7","ip","IPAddr7")
					TCWebAPI_set("natsslim_Entry7","max","Max7")
					TCWebAPI_set("natsslim_Entry7","Enable","Active7")
				else
					tcWebApi_constSet ("natsslim_Entry7","Enable","Disable")
				end if
			else
				TCWebAPI_unset("natsslim_Entry7")
				TCWebAPI_set("natsslim_Entry7","Enable","Active7")
			end if
		end if
		if tcWebApi_validate("Active8=options|Enable|Disable") = "1"  then
			if Request_form("Active8") = "Enable" then
				if tcWebApi_validate("IPAddr8=ipv4&Max8=integer|0|16385") = "1" then
					TCWebAPI_set("natsslim_Entry8","ip","IPAddr8")
					TCWebAPI_set("natsslim_Entry8","max","Max8")
					TCWebAPI_set("natsslim_Entry8","Enable","Active8")
				else
					tcWebApi_constSet ("natsslim_Entry8","Enable","Disable")
				end if
			else
				TCWebAPI_unset("natsslim_Entry8")
				TCWebAPI_set("natsslim_Entry8","Enable","Active8")
			end if
		end if
		if tcWebApi_validate("Active9=options|Enable|Disable") = "1"  then
			if Request_form("Active9") = "Enable" then
				if tcWebApi_validate("IPAddr9=ipv4&Max9=integer|0|16385") = "1" then
					TCWebAPI_set("natsslim_Entry9","ip","IPAddr9")
					TCWebAPI_set("natsslim_Entry9","max","Max9")
					TCWebAPI_set("natsslim_Entry9","Enable","Active9")
				else
					tcWebApi_constSet ("natsslim_Entry9","Enable","Disable")
				end if
			else
				TCWebAPI_unset("natsslim_Entry9")
				TCWebAPI_set("natsslim_Entry9","Enable","Active9")
			end if
		end if
	else
		tcWebApi_constSet ("natsslim_Common","perhost_enable","Disable")
	end if
   TCWebAPI_commit("natsslim")
   TCWebApi_save();
end if
%>
<!doctype html>
<html>
	<head>
<title><%tcWebApi_get("String_Entry","BranchName","s")%> ONT - <%tcWebApi_get("String_Entry","SessionLimit","s")%></title>		<meta charset="utf-8">
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
		 var hostcount		= 10;
		 var arIP	= new Array(10);
		 var arMax	= new Array(10);
		 var arActive = new Array(10);
		 var LanIP = "<%tcWebApi_get("Lan_Entry0","IP","s")%>";
		 var LanMask = "<%tcWebApi_get("Lan_Entry0","netmask","s")%>"
		 <%if tcWebApi_get("natsslim_Entry0","Enable","h") <> "N/A" then%>
		 arIP[0]	= "<%tcWebApi_get("natsslim_Entry0","ip","s")%>";
		 arMax[0]	= "<%tcWebApi_get("natsslim_Entry0","max","s")%>";
		 arActive[0] = "<%tcWebApi_get("natsslim_Entry0","Enable","s")%>";
		 <%end if%>
		<%if tcWebApi_get("natsslim_Entry1","Enable","h") <> "N/A" then%>
		 arIP[1]	= "<%tcWebApi_get("natsslim_Entry1","ip","s")%>";
		 arMax[1]	= "<%tcWebApi_get("natsslim_Entry1","max","s")%>";
		 arActive[1] = "<%tcWebApi_get("natsslim_Entry1","Enable","s")%>";
		 <%end if%>
		<%if tcWebApi_get("natsslim_Entry2","Enable","h") <> "N/A" then%>
		 arIP[2]	= "<%tcWebApi_get("natsslim_Entry2","ip","s")%>";
		 arMax[2]	= "<%tcWebApi_get("natsslim_Entry2","max","s")%>";
		 arActive[2] = "<%tcWebApi_get("natsslim_Entry2","Enable","s")%>";
		 <%end if%>
		<%if tcWebApi_get("natsslim_Entry3","Enable","h") <> "N/A" then%>
		 arIP[3]	= "<%tcWebApi_get("natsslim_Entry3","ip","s")%>";
		 arMax[3]	= "<%tcWebApi_get("natsslim_Entry3","max","s")%>";
		 arActive[3] = "<%tcWebApi_get("natsslim_Entry3","Enable","s")%>";
		 <%end if%>
		<%if tcWebApi_get("natsslim_Entry4","Enable","h") <> "N/A" then%>
		 arIP[4]	= "<%tcWebApi_get("natsslim_Entry4","ip","s")%>";
		 arMax[4]	= "<%tcWebApi_get("natsslim_Entry4","max","s")%>";
		 arActive[4] = "<%tcWebApi_get("natsslim_Entry4","Enable","s")%>";
		 <%end if%>
		<%if tcWebApi_get("natsslim_Entry5","Enable","h") <> "N/A" then%>
		 arIP[5]	= "<%tcWebApi_get("natsslim_Entry5","ip","s")%>";
		 arMax[5]	= "<%tcWebApi_get("natsslim_Entry5","max","s")%>";
		 arActive[5] = "<%tcWebApi_get("natsslim_Entry5","Enable","s")%>";
		 <%end if%>
		<%if tcWebApi_get("natsslim_Entry6","Enable","h") <> "N/A" then%>
		 arIP[6]	= "<%tcWebApi_get("natsslim_Entry6","ip","s")%>";
		 arMax[6]	= "<%tcWebApi_get("natsslim_Entry6","max","s")%>";
		 arActive[6] = "<%tcWebApi_get("natsslim_Entry6","Enable","s")%>";
		 <%end if%>
		<%if tcWebApi_get("natsslim_Entry7","Enable","h") <> "N/A" then%>
		 arIP[7]	= "<%tcWebApi_get("natsslim_Entry7","ip","s")%>";
		 arMax[7]	= "<%tcWebApi_get("natsslim_Entry7","max","s")%>";
		 arActive[7] = "<%tcWebApi_get("natsslim_Entry7","Enable","s")%>";
		 <%end if%>
		<%if tcWebApi_get("natsslim_Entry8","Enable","h") <> "N/A" then%>
		 arIP[8]	= "<%tcWebApi_get("natsslim_Entry8","ip","s")%>";
		 arMax[8]	= "<%tcWebApi_get("natsslim_Entry8","max","s")%>";
		 arActive[8] = "<%tcWebApi_get("natsslim_Entry8","Enable","s")%>";
		 <%end if%>
		 <%if tcWebApi_get("natsslim_Entry9","Enable","h") <> "N/A" then%>
		 arIP[9]	= "<%tcWebApi_get("natsslim_Entry9","ip","s")%>";
		 arMax[9]	= "<%tcWebApi_get("natsslim_Entry9","max","s")%>";
		 arActive[9] = "<%tcWebApi_get("natsslim_Entry9","Enable","s")%>";
		 <%end if%>
		var current_pvc;
		function displayInterface() {
			var nEntryNum = "<% tcWebApi_get("WanInfo_Common","CycleNum","s") %>";
			//get all value
			// num 0
			var vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
			var Wan_WanName = vArrayStr.split(',');
			// num 1
			<% tcWebApi_get("WanInfo_Common","CycleValue","h") %>
			<% tcWebApi_get("WanInfo_Common","CycleValue","h") %>
			// num 3
			vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
			Wan_Actives = vArrayStr.split(',');
			// num 4		
			vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
			var WANEnNAT = vArrayStr.split(',');
			var interface = 0;
			for (var i = 0; i < nEntryNum; i++) {
				if ((Wan_WanName[i].indexOf("INTERNET") >= 0) && (Wan_Actives[i] == "Yes") && (WANEnNAT[i] == "Enable")) {
					interface = Wan_WanName[i];
					break;
				}
			}
			if (interface) {
				$("#interface_text").html(interface);
				$("#interface_text").show();
				$("#nat_enable_div").show();
				$("#apply_button").show();
				return 1;
			}
			else {
				/* No suitable interface for Nat Session Limit */
				$("#interface_text").html("<%tcWebApi_get("String_Entry","NatDMZNoInterfaceText","s")%>");
				$("#interface_text").show();
				return 0;
			}
		}
		function ip_poolcheck(ip,rouip,Mvalue){
			var digits1 = ip.split(".");
			var stIP = parseInt(digits1[0]<<24|digits1[1]<<16|digits1[2]<<8|digits1[3]);
			var digits2 = Mvalue.split(".");
			var maskvalue = parseInt(digits2[0]<<24|digits2[1]<<16|digits2[2]<<8|digits2[3]);
			var digits3 = rouip.split(".");
			var lanipvalue = parseInt(digits3[0]<<24|digits3[1]<<16|digits3[2]<<8|digits3[3]);
			if ((lanipvalue&maskvalue) == (stIP&maskvalue))
			{
				return true;
			}else
			{
				return false;
			}
		}
			function unValidIP(Address)
			{
				var address = Address.match("^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$");
				var digits;
				var i;
				var test=0;
				var point=-1;
				while(test!=-1)
				{
					point++;
					test=Address.indexOf(".",test+1);
				}
				if(point<3)
				{
					alert("<%tcWebApi_get("String_Entry","FilterJS0Text","s")%>");
					return true;
				}
				if(address == null)
				{
					alert("<%tcWebApi_get("String_Entry","FilterJS0Text","s")%>");
					return true;
				}
				else
				{
					digits = address[0].split(".");
					for(i=0; i < 4; i++)
					{
						if((Number(digits[i]) > 255 ) || (Number(digits[i]) < 0 ) || (Number(digits[0]) > 223))
						{
							alert("<%tcWebApi_get("String_Entry","FilterJS1Text","s")%>" + Address);
							return true;
						}
					}
					return false;
				}
			}
		 function perhost_switch() {
			if(document.getElementById("PerHost_Enable").checked)
			{
				$('#perhost-div').show();
				$('#PerHost_Default_div').show();
				$('#PerHost_Default_hint').show();
			}
			else
			{
				$('#perhost-div').hide();
				$('#PerHost_Default_div').hide();
				$('#PerHost_Default_hint').hide();
			}
		 }
		 function get_first_empty_entry() {			
			var i;
			for (i=0; i < hostcount; i++) {
				if ($('#Active'+i).val() != "Enable") {
					return i;
				}
			}
			return -1;
		 }
		 function rearrange_rules() {			
			var i,j;
			for  (i=0; i < hostcount; i++)
			{
				if ( $('#Active' + i ).val() != "Enable" )
				{
					for (j = i + 1; j < hostcount; j++)
					{
						if ( $('#Active' + j ).val() == "Enable" )
						{
							$('#IPAddr' + i).val($('#IPAddr' + j).val());
							$('#Max' + i).val($('#Max' + j).val());
							$('#Active' + i).val("Enable");
							$('#IPAddr' + j).val("");
							$('#Max' + j).val("");
							$('#Active' + j).val("Disable");
							$('#sslim_entry' + i).show();
							$('#sslim_entry' + j).hide();
							break;
						}
					}
				}
			}
		 }
		 function change_color() {
			var i = get_first_empty_entry();
			$("#sslim_entry10").removeClass("odd_tr even_tr");
			if (i%2) {
				$("#sslim_entry10").addClass("even_tr");
			}
			else {
				$("#sslim_entry10").addClass("odd_tr");
			}
		 }
		 function doDeleteEntry(i) {
			$('#sslim_entry10').show();
			$('#sslim_entry'+i).hide();
			$('#IPAddr'+i).val("");
			$('#Max'+i).val("");
			$('#Active'+i).val("Disable");
			rearrange_rules();
			change_color();
		 }
		 function addNewEntry() {
			var i;
			i = get_first_empty_entry();
			if (i == 9) {
				$('#sslim_entry10').hide();
			}
			if (i < 0) {
				alert("<%tcWebApi_get("String_Entry","FilterFull","s")%>");
				return;
			}
			$('#sslim_entry'+i).show();
			$('#IPAddr'+i).val($('#IPAddr10').val());
			$('#Max'+i).val($('#Max10').val());
			$('#IPAddr10').val("");
			$('#Max10').val("");
			$('#Active'+i).val("Enable");
			change_color();
		 }
		  function onloadCheck() {
			if (!displayInterface())
			{
			//	return;
			}
			var f = document.sslim_form;
			var i;
			for (i=0; i < hostcount; i++) {
				$('#Active'+ i).val(arActive[i]);
				if (arActive[i] == "Enable")
				{
					$('#sslim_entry'+ i).show();
					$('#Active'+ i).val(arActive[i]);
					$('#IPAddr'+ i).val(arIP[i]);
					$('#Max'+ i).val(arMax[i]);
				}
			}
			rearrange_rules();
			if (-1 == get_first_empty_entry()) {
				$('#sslim_entry10').hide();
			}
			change_color();
			if (document.getElementById("PerHost_Enable").checked == false)			
			{
				$('#perhost-div').hide();
				$('#PerHost_Default_div').hide();
				$('#PerHost_Default_hint').hide();
			}
		 }
		 function doSubmit() {
			var f = document.sslim_form;
			var i;
			if (isNaN(parseInt($('#Global_Max').val())) || (parseInt($('#Global_Max').val()) < 8000) || (parseInt($('#Global_Max').val()) > 16384)) {
				alert("<%tcWebApi_get("String_Entry","NatJSInvalidGlobalLimit","s")%>");
				$('#Global_Max').focus();
				return;				
			}
			if (!f.PerHost_Enable.checked) {
				submitAsync('sslim_form');
				return;
			}
			if (isNaN(parseInt($('#PerHost_Default').val())) ||(parseInt($('#PerHost_Default').val()) < 1) || (parseInt($('#PerHost_Default').val()) > 16384) || (parseInt($('#PerHost_Default').val()) > parseInt($('#Global_Max').val()))) {
				alert("<%tcWebApi_get("String_Entry","NatJSInvalidPerhostLimit","s")%>");
				$('#PerHost_Default').focus();
				return;				
			}
			for (i=0; i < hostcount; i++) {
				if ($('#Active'+ i).val() == "Enable")
				{
					if (($('#IPAddr'+ i).val().trim().length == 0) && ($('#Max'+i).val().trim().length == 0)) {
						$('#Active'+ i).val("Disable");
						continue;
					}
					if (unValidIP($('#IPAddr'+ i).val())) {
						$('#IPAddr'+ i).focus();
						return;
					}
					if (!ip_poolcheck($('#IPAddr'+ i).val(),LanIP,LanMask)) {
						alert("<%tcWebApi_get("String_Entry","NatSessionsLANSubnetText","s")%>");
						$('#IPAddr'+ i).focus();
						return;
					}
					for (var j=0;j<i;j++) {
						if ($('#IPAddr'+ i).val() == $('#IPAddr'+ j).val()) {
							alert("<%tcWebApi_get("String_Entry","NatJSDuplicateIP","s")%>");
							$('#IPAddr'+ j).focus();
							return;
						}
					}
					if (isNaN(parseInt($('#Max'+i).val())) ||(parseInt($('#Max'+i).val()) < 1) || (parseInt($('#Max'+i).val()) > 16384)|| (parseInt($('#Max'+i).val()) > parseInt($('#Global_Max').val()))) {
						alert("<%tcWebApi_get("String_Entry","NatJSInvalidPerhostTableLimit","s")%>");
						$('#Max'+i).focus();
						return;
					}
				}
			}
			rearrange_rules();
			if (($('#IPAddr10').val().trim().length != 0) || ($('#Max10').val().trim().length != 0)) {
				if (unValidIP($('#IPAddr10').val())) {
					$('#IPAddr10').focus();
					return;
				}
				if (!ip_poolcheck($('#IPAddr10').val(),LanIP,LanMask)) {
						alert("<%tcWebApi_get("String_Entry","NatSessionsLANSubnetText","s")%>");
						$('#IPAddr10').focus();
						return;
					}
				if ( isNaN(parseInt($('#Max10').val())) || (parseInt($('#Max10').val()) < 1) || (parseInt(($('#Max10').val()) > 16384)|| (parseInt($('#Max10').val()) > parseInt($('#Global_Max').val())))) {
					alert("<%tcWebApi_get("String_Entry","NatJSInvalidPerhostTableLimit","s")%>");
					$('#Max10').focus();
					return;
				}
				i = get_first_empty_entry();
				for (var j=0;j<i;j++) {
					if ($('#IPAddr10').val() == $('#IPAddr'+ j).val()) {
						alert("<%tcWebApi_get("String_Entry","NatJSDuplicateIP","s")%>");
						$('#IPAddr10').focus();
						return;
					}
				}
				$('#IPAddr'+ i).val($('#IPAddr10').val());
				$('#Max'+ i).val($('#Max10').val());
				$('#Active'+ i).val("Enable");
			}
			submitAsync('sslim_form');
		 }
		</script>
	</head>
	<body onload="onloadCheck()" class="container">
<header class="fixed-top"><nav id="top-nav" class="navbar navbar-expand-lg container"><a class="navbar-brand " href="/cgi-bin/home.asp"><div><img src="/img/logo_home.png" width="100" height="18" alt=""><div style="font-family: sans-serif; font-weight: bold;font-size: 12px;color: #000; margin-top: 0">OPTICAL NETWORK TERMINATION</div></div></a><button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"><em class="fas fa-align-justify"></em></span></button><div class="collapse navbar-collapse" id="navbarCollapse"><ul class="navbar-nav mr-auto sidenav" id="navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/home.asp"><%tcWebApi_get("String_Entry","NavigationHomeText","s")%><span class="sr-only"></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/deviceinfo.asp"><%tcWebApi_get("String_Entry","NavigationStatusDeviceText","s")%><span class="sr-only"></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/wifi-mesh-topology.asp"><%tcWebApi_get("String_Entry","EasyMeshStatus5Text","s")%><span class="sr-only"></span></a></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#status-menu" aria-controls="status-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NavigationStatusStatisticsText","s")%></a><ul class="nav-second-level collapse" id="status-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/sta-statistics.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationTrafficText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/sta-wifiusers.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationStatusUsersText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/sta-users.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","ARPStatusText","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#network-menu" aria-controls="network-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NAVNetwork","s")%></a><ul class="nav-second-level collapse" id="network-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/net-wan.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationBasInternetText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/net-lan.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationBasLANText","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#wifi-menu" aria-controls="wifi-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NAVWifi","s")%></a><ul class="nav-second-level collapse" id="wifi-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/wifi.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationWiFiSettingsText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/wifi-11ac.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationWiFi11acSettingsText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/wifi-mesh.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationMesh","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#firewall-menu" aria-controls="firewall-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NavigationAdvFirewallText","s")%></a><ul class="nav-second-level collapse" id="firewall-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-spi.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","ContentFirewallText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-urlfilter.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","FILTERTYPE_index2","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-macfilter.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVL2Filter","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-parentalcontrol.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","ParentalControlText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/safehome.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","SafehomeText","s")%></span></a></li></ul></li><li class="nav-item active"><a class="nav-link nav-link-collapse nav-link-show" href="#" id="hasSubItems" data-toggle="collapse" data-target="#apps-menu" aria-controls="apps-menu" aria-expanded="true"><%tcWebApi_get("String_Entry","NAVApplication","s")%></a><ul class="nav-second-level show" id="apps-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-dmz.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NatTopDMZText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-portforwarding.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NatVirsvrText","s")%></span></a></li><li class="nav-item active"><a class="nav-link" href="/cgi-bin/apps-sslim.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","SessionLimit","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-route.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","StaticRouteText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-ddns.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","dyDNS1Text","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-wifischeduling.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","WifiSchedulingText","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#tools-menu" aria-controls="tools-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NavigationMaintenanceText","s")%></a><ul class="nav-second-level collapse" id="tools-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-admin.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationMainAdminText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-time.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVSysTime","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-firmware.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationMainFirmwareText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-config.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVConfig","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-diagnostic.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationMainDiagnosticsText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-wan2lan.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","Wan2lanText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-log.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVLogs","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-reboot.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","RebootText","s")%></span></a></li></ul></li></ul><div class="top-item-groups"><form name="LanguageForm" method="POST" action="/cgi-bin/apps-sslim.asp" class="nav-item dropdown"><input type="hidden" name="TokenString" value="<%tcWebApi_getToken()%>"><input type="hidden" name="Language_Flag" value="<% tcWebApi_get("LanguageSwitch_Entry","Type","s") %>"><a class="nav-link dropdown-toggle" href="#" id="LanguageDropdown" role="button" data-toggle="dropdown" aria-expanded="false"><% tcWebApi_get("String_Entry","LoginLanguage","s") %></a><ul class="dropdown-menu" aria-labelledby="LanguageDropdown"><li><a class="dropdown-item <% if tcWebApi_get("LanguageSwitch_Entry","Type","h") = "1" then asp_Write("active") end if %>" href="#" onclick="submitLanguageForm(1);"><% tcWebApi_get("String_Entry","LanguageVIELong","s") %></a></li><li><a class="dropdown-item <% if tcWebApi_get("LanguageSwitch_Entry","Type","h") = "2" then asp_Write("active") end if %>" href="#" onclick="submitLanguageForm(2);"><% tcWebApi_get("String_Entry","LanguageENGLong","s") %></a></li></ul></form><div id="signout" class="nav-item"><a class="nav-link" href="javascript:doLogout();"><em class="fa fa-sign-out-alt"></em><span class="nav-link-text"><% tcWebApi_get("String_Entry","LogoutText","s") %></span></a></div></div></div></header></nav><% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then
	if tcWebApi_get("Mesh_Common", "DeviceRole", "h") = "2" then %>
		<script language='javascript'>
		document.getElementById("network-menu").children[0].style="display: none";
		document.getElementById("network-menu").children[1].style="display: none";
		document.getElementById("wifi-menu").children[0].style="display: none";
		document.getElementById("wifi-menu").children[1].style="display: none";
		</script>
<% end if end if %>		<div id="content">
		<form class="form-inline" method="post" id="sslim_form" name="sslim_form" action="/cgi-bin/apps-sslim.asp" autocomplete="off">
		<input type="hidden" name="PostFlag" id="PostFlag" value="1" />
		<INPUT TYPE="HIDDEN" NAME="TokenString" VALUE="<%tcWebApi_getToken()%>">
		<div class="row row-w-100">
			<div class="widget col-xs-12 col-lg-12">
				<header><%tcWebApi_get("String_Entry","SessionLimit","s")%></header>
				<div class="widget-body">
					<fieldset>
						<div class="form-group">
							<label class="col-xs-12 col-sm-4 control-label"><%if tcWebApi_get("WebCustom_Entry","noWanModeDefined","h") <> "Yes" then
							   tcWebApi_get("String_Entry","NavigationInterfaceText","s")
							   else
							   tcWebApi_get("String_Entry","NatTopCircuitText","s")
							   end if%></label>
							<input type="hidden" NAME="NAT_VCIndex" value="">
							<label class="col-xs-12 col-sm-4 text-label inline-text" id="interface_text"></label>
						</div>
						<div id="nat_enable_div"  style="display: none">
							<legend><%tcWebApi_get("String_Entry","NatGlobalSessionText","s")%></legend>
							<div class="form-group">
								<label class="col-xs-12 col-sm-4 control-label"><%tcWebApi_get("String_Entry","NatGlobalSessionFieldText","s")%></label>
								<INPUT class="form-control col-xs-12 col-sm-4 col-lg-3" NAME="Global_Max" id="Global_Max" type="text" VALUE="<%TCWebApi_get("natsslim_Common","global_max","s")%>" >
								<div class="col-xs-7 col-sm-4 text-label inline-text">(8000-16384)</div>	
							</div>
							<legend><%tcWebApi_get("String_Entry","NatPerHostSessionText","s")%></legend>
							<div class="form-group">
								<label class="col-xs-12 col-sm-4 control-label"><%tcWebApi_get("String_Entry","NatPerHostLimitText","s")%></label>
								<label class="toggle-switch">
									<input type="checkbox" name="PerHost_Enable" id="PerHost_Enable" onChange="perhost_switch();" value="1" <% If TCWebApi_get("natsslim_Common","perhost_enable","h") = "Enable" then asp_Write("checked") end if%>>
									<span class="slider"></span>
								</label>
							</div>
							<div class="form-group" id="PerHost_Default_div" <% If TCWebApi_get("natsslim_Common","perhost_enable","h") = "0" then%> style="display:none" <%end if%>>
								<label class="col-xs-12 col-sm-4 control-label"><%tcWebApi_get("String_Entry","NatPerHostDefaultLimitText","s")%></label>
								<INPUT class="form-control col-xs-12 col-sm-4 col-lg-3" NAME="PerHost_Default" id="PerHost_Default" type="text" VALUE="<%TCWebApi_get("natsslim_Common","perhost_default","s")%>" >
							</div>
							<div class="form-group" id="PerHost_Default_hint" <% If TCWebApi_get("natsslim_Common","perhost_enable","h") = "0" then%> style="display:none" <%end if%>>
								<label class="hidden-xs col-xs-12 col-sm-4 control-label"></label>
								<div class="info-text col-xs-12 col-sm-7"><%tcWebApi_get("String_Entry","NatJSInvalidPerhostLimit","s")%></div>
							</div>
							<div id ="perhost-div" <% If TCWebApi_get("natsslim_Common","perhost_enable","h") = "0" then%> style="display:none" <%end if%>>
								<legend><%tcWebApi_get("String_Entry","NatRuleTableText","s")%></legend>
								<fieldset>
									<div class="table-responsive col-xs-12 col-sm-10" style="float: none; margin: 0 auto; text-align: center;">
										<table class="table-bordered-radius simple-table" id="filter_List" name="filter_List" cellpadding="0" cellspacing="0" style="width:100%">
											<thead>
											<tr class="thead-light" style="text-align: center;">
												<th><%tcWebApi_get("String_Entry","DeviceIPAddressText","s")%></th>
												<th><%tcWebApi_get("String_Entry","NatLimitForHostText","s")%></th>
												<th><%tcWebApi_get("String_Entry","FilterCgiAction","s")%></th>
											</tr>
											</thead>
											<tbody>
											<tr id="sslim_entry0" style="display: none; text-align: center;">
											<td><INPUT type="text" maxLength=17 size=17 name="IPAddr0" id="IPAddr0"></td>
											<td><INPUT type="text" maxLength=17 size=17 name="Max0" id="Max0"></td>
											<td>
												<INPUT type="hidden"  NAME="Active0" id="Active0">
												<i class='fas fa-times icon-btn-delete fa-lg' onmouseover='this.style.cursor="hand"' onClick='doDeleteEntry(0);'></i>
											</td>
											</tr>
											<tr id="sslim_entry1" style="display: none; text-align: center;">
											<td><INPUT type="text" maxLength=17 size=17 name="IPAddr1" id="IPAddr1"></td>
											<td><INPUT type="text" maxLength=17 size=17 name="Max1" id="Max1"></td>
											<td>
												<INPUT type="hidden"  NAME="Active1" id="Active1">
												<i class='fas fa-times icon-btn-delete fa-lg' onmouseover='this.style.cursor="hand"' onClick='doDeleteEntry(1);'></i>
											</td>
											</tr>
											<tr id="sslim_entry2" style="display: none; text-align: center;">
											<td><INPUT type="text" maxLength=17 size=17 name="IPAddr2" id="IPAddr2"></td>
											<td><INPUT type="text" maxLength=17 size=17 name="Max2" id="Max2"></td>
											<td>
												<INPUT type="hidden"  NAME="Active2" id="Active2">
												<i class='fas fa-times icon-btn-delete fa-lg' onmouseover='this.style.cursor="hand"' onClick='doDeleteEntry(2);'></i>
											</td>
											</tr>
											<tr id="sslim_entry3" style="display: none; text-align: center;">
											<td><INPUT type="text" maxLength=17 size=17 name="IPAddr3" id="IPAddr3"></td>
											<td><INPUT type="text" maxLength=17 size=17 name="Max3" id="Max3"></td>
											<td>
												<INPUT type="hidden"  NAME="Active3" id="Active3">
												<i class='fas fa-times icon-btn-delete fa-lg' onmouseover='this.style.cursor="hand"' onClick='doDeleteEntry(3);'></i>
											</td>
											</tr>
											<tr id="sslim_entry4" style="display: none; text-align: center;">
											<td><INPUT type="text" maxLength=17 size=17 name="IPAddr4" id="IPAddr4"></td>
											<td><INPUT type="text" maxLength=17 size=17 name="Max4" id="Max4"></td>
											<td>
												<INPUT type="hidden"  NAME="Active4" id="Active4">
												<i class='fas fa-times icon-btn-delete fa-lg' onmouseover='this.style.cursor="hand"' onClick='doDeleteEntry(4);'></i>
											</td>
											</tr>
											<tr id="sslim_entry5" style="display: none; text-align: center;">
											<td><INPUT type="text" maxLength=17 size=17 name="IPAddr5" id="IPAddr5"></td>
											<td><INPUT type="text" maxLength=17 size=17 name="Max5" id="Max5"></td>
											<td>
												<INPUT type="hidden"  NAME="Active5" id="Active5">
												<i class='fas fa-times icon-btn-delete fa-lg' onmouseover='this.style.cursor="hand"' onClick='doDeleteEntry(5);'></i>
											</td>
											</tr>
											<tr id="sslim_entry6" style="display: none; text-align: center;">
											<td><INPUT type="text" maxLength=17 size=17 name="IPAddr6" id="IPAddr6"></td>
											<td><INPUT type="text" maxLength=17 size=17 name="Max6" id="Max6"></td>
											<td>
												<INPUT type="hidden"  NAME="Active6" id="Active6">
												<i class='fas fa-times icon-btn-delete fa-lg' onmouseover='this.style.cursor="hand"' onClick='doDeleteEntry(6);'></i>
											</td>
											</tr>
											<tr id="sslim_entry7" style="display: none; text-align: center;">
											<td><INPUT type="text" maxLength=17 size=17 name="IPAddr7" id="IPAddr7"></td>
											<td><INPUT type="text" maxLength=17 size=17 name="Max7" id="Max7"></td>
											<td>
												<INPUT type="hidden"  NAME="Active7" id="Active7">
												<i class='fas fa-times icon-btn-delete fa-lg' onmouseover='this.style.cursor="hand"' onClick='doDeleteEntry(7);'></i>
											</td>
											</tr>
											<tr id="sslim_entry8" style="display: none; text-align: center;">
											<td><INPUT type="text" maxLength=17 size=17 name="IPAddr8" id="IPAddr8"></td>
											<td><INPUT type="text" maxLength=17 size=17 name="Max8" id="Max8"></td>
											<td>
												<INPUT type="hidden"  NAME="Active8" id="Active8">
												<i class='fas fa-times icon-btn-delete fa-lg' onmouseover='this.style.cursor="hand"' onClick='doDeleteEntry(8);'></i>
											</td>
											</tr>
											<tr id="sslim_entry9" style="display: none; text-align: center;">
											<td><INPUT type="text" maxLength=17 size=17 name="IPAddr9" id="IPAddr9"></td>
											<td><INPUT type="text" maxLength=17 size=17 name="Max9" id="Max9"></td>
											<td>
												<INPUT type="hidden"  NAME="Active9" id="Active9">
												<i class='fas fa-times icon-btn-delete fa-lg' onmouseover='this.style.cursor="hand"' onClick='doDeleteEntry(9);'></i>
											</td>
											</tr>
											<tr id="sslim_entry10">
											<td><INPUT type="text" maxLength=17 size=17 name="IPAddr10" id="IPAddr10"></td>
											<td><INPUT type="text" maxLength=17 size=17 name="Max10" id="Max10"></td>
											<td>
												<INPUT type="hidden"  NAME="Active10" id="Active10">
													<i   id="add_btn" class='fas fa-plus fa-lg icon-btn-renew' onmouseover='this.style.cursor="hand"' onclick='addNewEntry()'></i>
											</td>
											</tr>
											</tbody>
										</table>
									</div>
								</fieldset>
							 </div>
						</div>
					</fieldset>
				</div>
			</div>
			<div class="col-lg-12 d-flex align-items-center justify-content-center">
				<button id="btnOK" type="button" class="page-button small-button" onclick="doSubmit();"><%tcWebApi_get("String_Entry","ButtonApplyText","s")%></button>
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
