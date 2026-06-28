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
	if Request_form("Enable_L2Active") = "1" then
		TCWebAPI_Constset("MACFilter_Common","Active","Yes")
	else
		TCWebAPI_Constset("MACFilter_Common","Active","No")
	end if
	if Request_form("Enable_L2Active") = "1" then
		if tcWebApi_validate("RuleType=options|Black|White") = "1" then
			TCWebAPI_set("MACFilter_Common","RuleType","RuleType")
		end if
		if Request_form("hasValue01") = "1" then
			if tcWebApi_validate("MacAddr01=mac") = "1" then
				if tcWebApi_validate("macfilter_user01=options|0&Active01=options|Yes|No") = "1" then
					TCWebAPI_set("WebCurSet_Entry","macfilter_user","macfilter_user01")       
					TCWebAPI_set("MACFilter_Entry","Mac","MacAddr01")
					TCWebAPI_set("MACFilter_Entry","Active","Active01")
				end if
		   end if
		elseif tcWebApi_get("MACFilter_Entry0","Active","h") <> "N/A" then
			if tcWebApi_validate("macfilter_user01=options|0") = "1" then
				TCWebAPI_set("WebCurSet_Entry","macfilter_user","macfilter_user01")
				TCWebAPI_unset("MACFilter_Entry")
			end if
		end if 
		if Request_form("hasValue02") = "1" then
			if tcWebApi_validate("MacAddr02=mac") = "1" then
				if tcWebApi_validate("macfilter_user02=options|1&Active02=options|Yes|No") = "1" then
					TCWebAPI_set("WebCurSet_Entry","macfilter_user","macfilter_user02")       
					TCWebAPI_set("MACFilter_Entry","Mac","MacAddr02")
					TCWebAPI_set("MACFilter_Entry","Active","Active02")
				end if
			end if
		elseif tcWebApi_get("MACFilter_Entry1","Active","h") <> "N/A" then
			if tcWebApi_validate("macfilter_user02=options|1") = "1" then
				TCWebAPI_set("WebCurSet_Entry","macfilter_user","macfilter_user02")
				TCWebAPI_unset("MACFilter_Entry")
			end if
		end if 
		if Request_form("hasValue03") = "1" then
			if  tcWebApi_validate("MacAddr03=mac") = "1" then
				if tcWebApi_validate("macfilter_user03=options|2&Active03=options|Yes|No") = "1" then
					TCWebAPI_set("WebCurSet_Entry","macfilter_user","macfilter_user03")       
					TCWebAPI_set("MACFilter_Entry","Mac","MacAddr03")
					TCWebAPI_set("MACFilter_Entry","Active","Active03")
				end if              
			end if
		elseif tcWebApi_get("MACFilter_Entry2","Active","h") <> "N/A" then
			if tcWebApi_validate("macfilter_user03=options|2") = "1" then
				TCWebAPI_set("WebCurSet_Entry","macfilter_user","macfilter_user03")
				TCWebAPI_unset("MACFilter_Entry")
			end if
		end if 
		if Request_form("hasValue04") = "1" then
			if  tcWebApi_validate("MacAddr04=mac") = "1" then
				if tcWebApi_validate("macfilter_user04=options|3&Active04=options|Yes|No") = "1" then
					TCWebAPI_set("WebCurSet_Entry","macfilter_user","macfilter_user04")       
					TCWebAPI_set("MACFilter_Entry","Mac","MacAddr04")
					TCWebAPI_set("MACFilter_Entry","Active","Active04")
				end if
			end if
		elseif tcWebApi_get("MACFilter_Entry3","Active","h") <> "N/A" then
			if tcWebApi_validate("macfilter_user04=options|3") = "1" then
				TCWebAPI_set("WebCurSet_Entry","macfilter_user","macfilter_user04")
				TCWebAPI_unset("MACFilter_Entry")
			end if
		end if 
		if Request_form("hasValue05") = "1" then
			if  tcWebApi_validate("MacAddr05=mac") = "1" then
				if tcWebApi_validate("macfilter_user05=options|4&Active05=options|Yes|No") = "1" then
					TCWebAPI_set("WebCurSet_Entry","macfilter_user","macfilter_user05")       
					TCWebAPI_set("MACFilter_Entry","Mac","MacAddr05")
					TCWebAPI_set("MACFilter_Entry","Active","Active05")
				end if              
			end if
		elseif tcWebApi_get("MACFilter_Entry4","Active","h") <> "N/A" then
			if tcWebApi_validate("macfilter_user05=options|4") = "1" then
				TCWebAPI_set("WebCurSet_Entry","macfilter_user","macfilter_user05")
				TCWebAPI_unset("MACFilter_Entry")
			end if
		end if 
		if Request_form("hasValue06") = "1" then
			if  tcWebApi_validate("MacAddr06=mac") = "1" then
			if tcWebApi_validate("macfilter_user06=options|5&Active06=options|Yes|No") = "1" then
				TCWebAPI_set("WebCurSet_Entry","macfilter_user","macfilter_user06")       
				TCWebAPI_set("MACFilter_Entry","Mac","MacAddr06")
				TCWebAPI_set("MACFilter_Entry","Active","Active06")
			end if              
		end if
		elseif tcWebApi_get("MACFilter_Entry5","Active","h") <> "N/A" then
		if tcWebApi_validate("macfilter_user06=options|5") = "1" then
			TCWebAPI_set("WebCurSet_Entry","macfilter_user","macfilter_user06")
			TCWebAPI_unset("MACFilter_Entry")
		end if
		end if 
		if Request_form("hasValue07") = "1" then
			if  tcWebApi_validate("MacAddr07=mac") = "1" then
			if tcWebApi_validate("macfilter_user07=options|6&Active07=options|Yes|No") = "1" then
				TCWebAPI_set("WebCurSet_Entry","macfilter_user","macfilter_user07")       
				TCWebAPI_set("MACFilter_Entry","Mac","MacAddr07")
				TCWebAPI_set("MACFilter_Entry","Active","Active07")
			end if  
		end if
		elseif tcWebApi_get("MACFilter_Entry6","Active","h") <> "N/A" then
		if tcWebApi_validate("macfilter_user07=options|6") = "1" then
			TCWebAPI_set("WebCurSet_Entry","macfilter_user","macfilter_user07")
			TCWebAPI_unset("MACFilter_Entry")
		end if
		end if 
		if Request_form("hasValue08") = "1" then
			if  tcWebApi_validate("MacAddr08=mac") = "1" then
			if tcWebApi_validate("macfilter_user08=options|7&Active08=options|Yes|No") = "1" then
				TCWebAPI_set("WebCurSet_Entry","macfilter_user","macfilter_user08")       
				TCWebAPI_set("MACFilter_Entry","Mac","MacAddr08")
				TCWebAPI_set("MACFilter_Entry","Active","Active08")
			end if  
		end if
		elseif tcWebApi_get("MACFilter_Entry7","Active","h") <> "N/A" then
		if tcWebApi_validate("macfilter_user08=options|7") = "1" then
			TCWebAPI_set("WebCurSet_Entry","macfilter_user","macfilter_user08")
			TCWebAPI_unset("MACFilter_Entry")
		end if
		end if 
		if Request_form("hasValue09") = "1" then
			if  tcWebApi_validate("MacAddr09=mac") = "1" then
			if tcWebApi_validate("macfilter_user09=options|8&Active09=options|Yes|No") = "1" then
				TCWebAPI_set("WebCurSet_Entry","macfilter_user","macfilter_user09")       
				TCWebAPI_set("MACFilter_Entry","Mac","MacAddr09")
				TCWebAPI_set("MACFilter_Entry","Active","Active09")
			end if  
		end if
		elseif tcWebApi_get("MACFilter_Entry8","Active","h") <> "N/A" then
		if tcWebApi_validate("macfilter_user09=options|8") = "1" then
			TCWebAPI_set("WebCurSet_Entry","macfilter_user","macfilter_user09")
			TCWebAPI_unset("MACFilter_Entry")
		end if
		end if 
		if Request_form("hasValue10") = "1" then
			if  tcWebApi_validate("MacAddr10=mac") = "1" then
			if tcWebApi_validate("macfilter_user10=options|9&Active10=options|Yes|No") = "1" then
				TCWebAPI_set("WebCurSet_Entry","macfilter_user","macfilter_user10")       
				TCWebAPI_set("MACFilter_Entry","Mac","MacAddr10")
				TCWebAPI_set("MACFilter_Entry","Active","Active10")
			end if  
		end if
		elseif tcWebApi_get("MACFilter_Entry9","Active","h") <> "N/A" then
		if tcWebApi_validate("macfilter_user10=options|9") = "1" then
			TCWebAPI_set("WebCurSet_Entry","macfilter_user","macfilter_user10")
			TCWebAPI_unset("MACFilter_Entry")
		end if
		end if 
		if Request_form("hasValue11") = "1" then
			if  tcWebApi_validate("MacAddr11=mac") = "1" then
			if tcWebApi_validate("macfilter_user11=options|10&Active11=options|Yes|No") = "1" then
				TCWebAPI_set("WebCurSet_Entry","macfilter_user","macfilter_user11")       
				TCWebAPI_set("MACFilter_Entry","Mac","MacAddr11")
				TCWebAPI_set("MACFilter_Entry","Active","Active11")
			end if  
		end if
		elseif tcWebApi_get("MACFilter_Entry10","Active","h") <> "N/A" then
		if tcWebApi_validate("macfilter_user11=options|10") = "1" then
			TCWebAPI_set("WebCurSet_Entry","macfilter_user","macfilter_user11")
			TCWebAPI_unset("MACFilter_Entry")
		end if
		end if 
		if Request_form("hasValue12") = "1" then
			if  tcWebApi_validate("MacAddr12=mac") = "1" then
			if tcWebApi_validate("macfilter_user12=options|11&Active12=options|Yes|No") = "1" then
				TCWebAPI_set("WebCurSet_Entry","macfilter_user","macfilter_user12")       
				TCWebAPI_set("MACFilter_Entry","Mac","MacAddr12")
				TCWebAPI_set("MACFilter_Entry","Active","Active12")
			end if  
		end if
		elseif tcWebApi_get("MACFilter_Entry11","Active","h") <> "N/A" then
		if tcWebApi_validate("macfilter_user12=options|11") = "1" then
			TCWebAPI_set("WebCurSet_Entry","macfilter_user","macfilter_user12")
			TCWebAPI_unset("MACFilter_Entry")
		end if
		end if 
		if Request_form("hasValue13") = "1" then
			if  tcWebApi_validate("MacAddr13=mac") = "1" then
			if tcWebApi_validate("macfilter_user13=options|12&Active13=options|Yes|No") = "1" then
				TCWebAPI_set("WebCurSet_Entry","macfilter_user","macfilter_user13")       
				TCWebAPI_set("MACFilter_Entry","Mac","MacAddr13")
				TCWebAPI_set("MACFilter_Entry","Active","Active13")
			end if  
		end if
		elseif tcWebApi_get("MACFilter_Entry12","Active","h") <> "N/A" then
		if tcWebApi_validate("macfilter_user13=options|12") = "1" then
			TCWebAPI_set("WebCurSet_Entry","macfilter_user","macfilter_user13")
			TCWebAPI_unset("MACFilter_Entry")
		end if
		end if 
		if Request_form("hasValue14") = "1" then
			if  tcWebApi_validate("MacAddr14=mac") = "1" then
			if tcWebApi_validate("macfilter_user14=options|13&Active14=options|Yes|No") = "1" then
				TCWebAPI_set("WebCurSet_Entry","macfilter_user","macfilter_user14")       
				TCWebAPI_set("MACFilter_Entry","Mac","MacAddr14")
				TCWebAPI_set("MACFilter_Entry","Active","Active14")
			end if
		end if
		elseif tcWebApi_get("MACFilter_Entry13","Active","h") <> "N/A" then
		if tcWebApi_validate("macfilter_user14=options|13") = "1" then
			TCWebAPI_set("WebCurSet_Entry","macfilter_user","macfilter_user14")
			TCWebAPI_unset("MACFilter_Entry")
		end if
		end if 
		if Request_form("hasValue15") = "1" then
			if  tcWebApi_validate("MacAddr15=mac") = "1" then
			if tcWebApi_validate("macfilter_user15=options|14&Active15=options|Yes|No") = "1" then
				TCWebAPI_set("WebCurSet_Entry","macfilter_user","macfilter_user15")       
				TCWebAPI_set("MACFilter_Entry","Mac","MacAddr15")
				TCWebAPI_set("MACFilter_Entry","Active","Active15")
			end if  
		end if
		elseif tcWebApi_get("MACFilter_Entry14","Active","h") <> "N/A" then
		if tcWebApi_validate("macfilter_user15=options|14") = "1" then
			TCWebAPI_set("WebCurSet_Entry","macfilter_user","macfilter_user15")
			TCWebAPI_unset("MACFilter_Entry")
		end if
		end if 
		if Request_form("hasValue16") = "1" then
			if  tcWebApi_validate("MacAddr16=mac") = "1" then
			if tcWebApi_validate("macfilter_user16=options|15&Active16=options|Yes|No") = "1" then
				TCWebAPI_set("WebCurSet_Entry","macfilter_user","macfilter_user16")       
				TCWebAPI_set("MACFilter_Entry","Mac","MacAddr16")
				TCWebAPI_set("MACFilter_Entry","Active","Active16")
			end if  
		end if
		elseif tcWebApi_get("MACFilter_Entry15","Active","h") <> "N/A" then
		if tcWebApi_validate("macfilter_user16=options|15") = "1" then
			TCWebAPI_set("WebCurSet_Entry","macfilter_user","macfilter_user16")
			TCWebAPI_unset("MACFilter_Entry")
		end if
		end if 
		if Request_form("hasValue17") = "1" then
			if  tcWebApi_validate("MacAddr17=mac") = "1" then
			if tcWebApi_validate("macfilter_user17=options|16&Active17=options|Yes|No") = "1" then
				TCWebAPI_set("WebCurSet_Entry","macfilter_user","macfilter_user17")       
				TCWebAPI_set("MACFilter_Entry","Mac","MacAddr17")
				TCWebAPI_set("MACFilter_Entry","Active","Active17")
			end if  
		end if
		elseif tcWebApi_get("MACFilter_Entry16","Active","h") <> "N/A" then
		if tcWebApi_validate("macfilter_user17=options|16") = "1" then
			TCWebAPI_set("WebCurSet_Entry","macfilter_user","macfilter_user17")
			TCWebAPI_unset("MACFilter_Entry")
		end if
		end if 
		if Request_form("hasValue18") = "1" then
			if  tcWebApi_validate("MacAddr18=mac") = "1" then
			if tcWebApi_validate("macfilter_user18=options|17&Active18=options|Yes|No") = "1" then
				TCWebAPI_set("WebCurSet_Entry","macfilter_user","macfilter_user18")       
				TCWebAPI_set("MACFilter_Entry","Mac","MacAddr18")
				TCWebAPI_set("MACFilter_Entry","Active","Active18")
			end if  
		end if
		elseif tcWebApi_get("MACFilter_Entry17","Active","h") <> "N/A" then
		if tcWebApi_validate("macfilter_user18=options|17") = "1" then
			TCWebAPI_set("WebCurSet_Entry","macfilter_user","macfilter_user18")
			TCWebAPI_unset("MACFilter_Entry")             
		end if
		end if 
		if Request_form("hasValue19") = "1" then
			if  tcWebApi_validate("MacAddr19=mac") = "1" then
			if tcWebApi_validate("macfilter_user19=options|18&Active19=options|Yes|No") = "1" then
				TCWebAPI_set("WebCurSet_Entry","macfilter_user","macfilter_user19")       
				TCWebAPI_set("MACFilter_Entry","Mac","MacAddr19")
				TCWebAPI_set("MACFilter_Entry","Active","Active19")
			end if  
		end if
		elseif tcWebApi_get("MACFilter_Entry18","Active","h") <> "N/A" then
		if tcWebApi_validate("macfilter_user19=options|18") = "1" then
			TCWebAPI_set("WebCurSet_Entry","macfilter_user","macfilter_user19")
			TCWebAPI_unset("MACFilter_Entry") 
		end if
		end if 
		if Request_form("hasValue20") = "1" then
			if  tcWebApi_validate("MacAddr20=mac") = "1" then
			if tcWebApi_validate("macfilter_user20=options|19&Active20=options|Yes|No") = "1" then
				TCWebAPI_set("WebCurSet_Entry","macfilter_user","macfilter_user20")       
				TCWebAPI_set("MACFilter_Entry","Mac","MacAddr20")
				TCWebAPI_set("MACFilter_Entry","Active","Active20")
			end if
		end if
		elseif tcWebApi_get("MACFilter_Entry19","Active","h") <> "N/A" then
		if tcWebApi_validate("macfilter_user20=options|19") = "1" then
			TCWebAPI_set("WebCurSet_Entry","macfilter_user","macfilter_user20")
			TCWebAPI_unset("MACFilter_Entry")
		end if
		end if 
	end if
	TCWebAPI_commit("MACFilter")
	TCWebApi_save();
end if
%>
<!doctype html>
<html>
	<head>
<title>Viettel ONT - <%tcWebApi_get("String_Entry","NAVL2Filter","s")%></title>		<meta charset="utf-8">
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
		</script>        <script language="JavaScript" type="text/JavaScript">
            var filtercount     = 20;
            var max_prtcontrol_rule = 10;
            var arMacAddr   = new Array(20);
            var arActive        = new Array(20);
            var arPrtControlMAC = new Array(max_prtcontrol_rule);
            var arConnectedName = new Array();
            var arConnectedMac = new Array();
            var arConnectedIP = new Array();
            var RuleType     = "<%tcWebApi_get("MACFilter_Common","RuleType","s")%>";
            <%if tcWebApi_get("MACFilter_Entry0","Active","h") <> "N/A" then%>
            arMacAddr[0]    = "<%tcWebApi_get("MACFilter_Entry0","Mac","s")%>";
            arActive[0]     = "<%tcWebApi_get("MACFilter_Entry0","Active","s")%>";
            <%end if%>
            <%if tcWebApi_get("MACFilter_Entry1","Active","h") <> "N/A" then%>
            arMacAddr[1]    = "<%tcWebApi_get("MACFilter_Entry1","Mac","s")%>";
            arActive[1]     = "<%tcWebApi_get("MACFilter_Entry1","Active","s")%>";
            <%end if%>
            <%if tcWebApi_get("MACFilter_Entry2","Active","h") <> "N/A" then%>
            arMacAddr[2]    = "<%tcWebApi_get("MACFilter_Entry2","Mac","s")%>";
            arActive[2]     = "<%tcWebApi_get("MACFilter_Entry2","Active","s")%>";
            <%end if%>
            <%if tcWebApi_get("MACFilter_Entry3","Active","h") <> "N/A" then%>
            arMacAddr[3]    = "<%tcWebApi_get("MACFilter_Entry3","Mac","s")%>";
            arActive[3]     = "<%tcWebApi_get("MACFilter_Entry3","Active","s")%>";
            <%end if%>
            <%if tcWebApi_get("MACFilter_Entry4","Active","h") <> "N/A" then%>
            arMacAddr[4]    = "<%tcWebApi_get("MACFilter_Entry4","Mac","s")%>";
            arActive[4]     = "<%tcWebApi_get("MACFilter_Entry4","Active","s")%>";
            <%end if%>
            <%if tcWebApi_get("MACFilter_Entry5","Active","h") <> "N/A" then%>
            arMacAddr[5]    = "<%tcWebApi_get("MACFilter_Entry5","Mac","s")%>";
            arActive[5]     = "<%tcWebApi_get("MACFilter_Entry5","Active","s")%>";
            <%end if%>
            <%if tcWebApi_get("MACFilter_Entry6","Active","h") <> "N/A" then%>
            arMacAddr[6]    = "<%tcWebApi_get("MACFilter_Entry6","Mac","s")%>";
            arActive[6]     = "<%tcWebApi_get("MACFilter_Entry6","Active","s")%>";
            <%end if%>
            <%if tcWebApi_get("MACFilter_Entry7","Active","h") <> "N/A" then%>
            arMacAddr[7]    = "<%tcWebApi_get("MACFilter_Entry7","Mac","s")%>";
            arActive[7]     = "<%tcWebApi_get("MACFilter_Entry7","Active","s")%>";
            <%end if%>
            <%if tcWebApi_get("MACFilter_Entry8","Active","h") <> "N/A" then%>
            arMacAddr[8]    = "<%tcWebApi_get("MACFilter_Entry8","Mac","s")%>";
            arActive[8]     = "<%tcWebApi_get("MACFilter_Entry8","Active","s")%>";
            <%end if%>
            <%if tcWebApi_get("MACFilter_Entry9","Active","h") <> "N/A" then%>
            arMacAddr[9]    = "<%tcWebApi_get("MACFilter_Entry9","Mac","s")%>";
            arActive[9]     = "<%tcWebApi_get("MACFilter_Entry9","Active","s")%>";
            <%end if%>
            <%if tcWebApi_get("MACFilter_Entry10","Active","h") <> "N/A" then%>
            arMacAddr[10]   = "<%tcWebApi_get("MACFilter_Entry10","Mac","s")%>";
            arActive[10]        = "<%tcWebApi_get("MACFilter_Entry10","Active","s")%>";
            <%end if%>
            <%if tcWebApi_get("MACFilter_Entry11","Active","h") <> "N/A" then%>
            arMacAddr[11]   = "<%tcWebApi_get("MACFilter_Entry11","Mac","s")%>";
            arActive[11]        = "<%tcWebApi_get("MACFilter_Entry11","Active","s")%>";
            <%end if%>
            <%if tcWebApi_get("MACFilter_Entry12","Active","h") <> "N/A" then%>
            arMacAddr[12]   = "<%tcWebApi_get("MACFilter_Entry12","Mac","s")%>";
            arActive[12]        = "<%tcWebApi_get("MACFilter_Entry12","Active","s")%>";
            <%end if%>
            <%if tcWebApi_get("MACFilter_Entry13","Active","h") <> "N/A" then%>
            arMacAddr[13]   = "<%tcWebApi_get("MACFilter_Entry13","Mac","s")%>";
            arActive[13]        = "<%tcWebApi_get("MACFilter_Entry13","Active","s")%>";
            <%end if%>
            <%if tcWebApi_get("MACFilter_Entry14","Active","h") <> "N/A" then%>
            arMacAddr[14]   = "<%tcWebApi_get("MACFilter_Entry14","Mac","s")%>";
            arActive[14]        = "<%tcWebApi_get("MACFilter_Entry14","Active","s")%>";
            <%end if%>
            <%if tcWebApi_get("MACFilter_Entry15","Active","h") <> "N/A" then%>
            arMacAddr[15]   = "<%tcWebApi_get("MACFilter_Entry15","Mac","s")%>";
            arActive[15]        = "<%tcWebApi_get("MACFilter_Entry15","Active","s")%>";
            <%end if%>
            <%if tcWebApi_get("MACFilter_Entry16","Active","h") <> "N/A" then%>
            arMacAddr[16]   = "<%tcWebApi_get("MACFilter_Entry16","Mac","s")%>";
            arActive[16]        = "<%tcWebApi_get("MACFilter_Entry16","Active","s")%>";
            <%end if%>
            <%if tcWebApi_get("MACFilter_Entry17","Active","h") <> "N/A" then%>
            arMacAddr[17]   = "<%tcWebApi_get("MACFilter_Entry17","Mac","s")%>";
            arActive[17]        = "<%tcWebApi_get("MACFilter_Entry17","Active","s")%>";
            <%end if%>
            <%if tcWebApi_get("MACFilter_Entry18","Active","h") <> "N/A" then%>
            arMacAddr[18]   = "<%tcWebApi_get("MACFilter_Entry18","Mac","s")%>";
            arActive[18]        = "<%tcWebApi_get("MACFilter_Entry18","Active","s")%>";
            <%end if%>
            <%if tcWebApi_get("MACFilter_Entry19","Active","h") <> "N/A" then%>
            arMacAddr[19]   = "<%tcWebApi_get("MACFilter_Entry19","Mac","s")%>";
            arActive[19]        = "<%tcWebApi_get("MACFilter_Entry19","Active","s")%>";
            <%end if%>
            arPrtControlMAC[0]      = "<%tcWebApi_get("ParentalControl_Entry0","MAC","s")%>";
            arPrtControlMAC[1]      = "<%tcWebApi_get("ParentalControl_Entry1","MAC","s")%>";
            arPrtControlMAC[2]      = "<%tcWebApi_get("ParentalControl_Entry2","MAC","s")%>";
            arPrtControlMAC[3]      = "<%tcWebApi_get("ParentalControl_Entry3","MAC","s")%>";
            arPrtControlMAC[4]      = "<%tcWebApi_get("ParentalControl_Entry4","MAC","s")%>";
            arPrtControlMAC[5]      = "<%tcWebApi_get("ParentalControl_Entry5","MAC","s")%>";
            arPrtControlMAC[6]      = "<%tcWebApi_get("ParentalControl_Entry6","MAC","s")%>";
            arPrtControlMAC[7]      = "<%tcWebApi_get("ParentalControl_Entry7","MAC","s")%>";
            arPrtControlMAC[8]      = "<%tcWebApi_get("ParentalControl_Entry8","MAC","s")%>";
            arPrtControlMAC[9]      = "<%tcWebApi_get("ParentalControl_Entry9","MAC","s")%>";
			function get2Digit(i) {
				if (i < 10) {
					return ('0' + i);
				}
				else {
					return i;
				}
			}
            function copy_value(id_name, i, j)
            {
                $('#' + id_name + i).val($('#' + id_name +j).val());
            }
            function reorder_rules()
            {
                var i,j, idi, idj;
                for  (i=1; i <= filtercount; i++)
                {
                    idi = get2Digit(i);
                    if ( $('#Active' + idi ).val() != "Yes" )
                    {
                        for (j = i + 1; j <= filtercount; j++)
                        {
                            idj = get2Digit(j);
                            if ( $('#Active' + idj ).val() == "Yes" )
                            {
                                copy_value('MacAddr', idi, idj);
                                copy_value('Active', idi, idj);
                                $('#MacAddr' + idj).val("");
                                $('#Active' + idj).val("No");
                                $('#l2filter_entry' + idi).show();
                                $('#l2filter_entry' + idj).hide();
                                break;
                            }
                        }
                    }
                }
            }
            function onloadCheck() {
                var f = document.l2filter_form;
                var id;
                setSelect('RuleType', RuleType);
                var r;
                for (var i=1; i <= filtercount; i++) {
                    r = i - 1;
                    id = get2Digit(i);
                    if (arActive[r] == undefined) {
                        $('#Active' + id).val("No");
                        continue;
                    }
                    if (arMacAddr[r] != "N/A") $('#MacAddr' + id).val(arMacAddr[r]);
                     $('#Active' + id).val(arActive[r]);
                }
                r = 0;
                for (var i=1; i<=filtercount; i++) {
                    id = get2Digit(i);
                    if ($('#Active'+id).val() == "Yes")
                    {
                        $('#l2filter_entry' + id).show();
                        r++;
                    }
                }
                if (r >= filtercount) {
                    $('#l2filter_entry21').hide();
                }
                L2FilterSwitch();
                reorder_rules();
            }
            function valid_error()
            {
                $('#l2filter_entry21').show();
                return false;
            }
            function doSubmit() {
                if($('#MacAddr21').val().trim()!='')
                    addNewFilterEntry(true);
                var f = document.l2filter_form;
                if ( f.Enable_L2Active.checked ) {
                    var id;
                    var srcMac;
                    var countrule = 0;
                    for (var i=1; i <= filtercount; i++) {
                        id = get2Digit(i);
                        srcMac = $('#MacAddr' + id);
                        activeMac = $('#Active' + id);     /*ONT-406*/
                        if (srcMac.val().trim().length < 1 && activeMac.val() =="Yes") {
                        alert('<%TCWebApi_get("String_Entry","FilterJS4Text","s")%>');
                        srcMac.focus();
                        return;
                        }
                        if (srcMac.val().trim().length < 1) {
                            $('#hasValue' + id).val(0);
                            continue;
                        }
                        if ($('#Active' + id).val() != "Yes") {
                            $('#hasValue' + id).val(0);
                            continue;
                        }
                        $('#hasValue' + id).val(1);
                        if (srcMac.val().trim().length > 0)
                            if (!doMACcheck(srcMac)) return valid_error();
                            /*Replace all "-" with ":" in MAC before applying */   /*ONT-459*/
                        $('#MacAddr' + id).val($('#MacAddr' + id).val().trim().replace(/-/g, ":"));
                    }
                    for (var i=1; i <= filtercount; i++) {
                        id = get2Digit(i);
                        if ($("#Active" + id).val() == "Yes") {
                            countrule += 1;
                        }
                    }
                    if (($("#RuleType").val() == "White") && (countrule == 0)) {
                        alert("<%tcwebApi_get("String_Entry","WhitelistEmptyText","s")%>");
                        return;
                    }
                    <%if tcwebApi_get("ParentalControl_Common","Status","h") = "Enable" then %>
                        if ($("#RuleType").val() == "Black") {
                            for (var i = 1; i < filtercount;i++) {
                                var id = get2Digit(i);
                                if ($("#hasValue"+ id).val() != "1") {
                                    continue;
                                }
                                for (var j = 0; j < max_prtcontrol_rule;j++) {
                                    if ($("#MacAddr"+ id).val().trim().toLowerCase() == arPrtControlMAC[j].trim().toLowerCase()) {
                                        alert("<%tcwebApi_get("String_Entry","FilterConflictBlacklist","s")%>");
                                        return valid_error();
                                    }
                                }
                            }
                        }
                        else {
                            for (var i = 0; i < max_prtcontrol_rule;i++) {
                                if (arPrtControlMAC[i] == "N/A") {
                                    continue;
                                }
                                var is_blocked = 1;
                                for (var j = 1; j < filtercount;j++) {
                                    var id = get2Digit(j);
                                    if ($("#hasValue"+ id).val() != "1") {
                                        continue;
                                    }
                                    if ($("#MacAddr"+ id).val().trim().toLowerCase() == arPrtControlMAC[i].trim().toLowerCase()) {
                                        is_blocked = 0;
                                        break;
                                    }
                                }
                                if (is_blocked == 1) {
                                    alert("<%tcwebApi_get("String_Entry","FilterConflictWhitelist","s")%>");
                                    return valid_error();
                                }
                            }
                        }
                    <%end if%>
                    if ((countrule != 0) && (("<%tcWebApi_get("MACFilter_Common","L3Active","s")%>" == "Yes") || ("<%tcWebApi_get("Ipv6Filter_Common","FilterActive","s")%>" == "Yes")) ) {
                        confirmvl = confirm("<%tcWebApi_get("String_Entry","L3FilterNotificationText","s")%>");
                        if (!confirmvl)
                        {
                            return valid_error();
                        }
                    }
                    <%if tcwebApi_get("WebCustom_Entry","isC2TrueSupported","h") = "Yes" then %>
                    $('#c2Support').val(1);
                    <%end if%>
                }
                submitAsync('l2filter_form');
            }
            function doMACcheck(obj) {
                var szAddr = obj.val().trim();
                var len = szAddr.length;
                if (len != 17) {
                    //if (alert_show)        /*ONT-406*/
                        alert("<%tcWebApi_get("String_Entry","FilterJS5Text","s")%>");
                    obj.focus();
                    return false;
                }/* else if(len==12) {
                    var newAddr = "";
                    var i = 0;
                    for(i=0; i<len; i++) {
                        var c = szAddr.charAt(i);
                        if(doHexCheck(c) < 0) {
                            alert("<%tcWebApi_get("String_Entry","FilterJS5Text","s")%>");
                            obj.focus();
                            return false;
                        }
                        if((i == 2)||(i == 4)||(i == 6)||(i == 8)||(i == 10)) {
                            newAddr = newAddr + ":";
                        }
                        newAddr = newAddr + c;
                    }
                    obj.val(newAddr);
                    return true;
                } */ else if ( len == 17 ) {
                    var i = 2;
                    var c0 = szAddr.charAt(0);
                    var c1 = szAddr.charAt(1);
                    if ((doHexCheck(c0) < 0)||(doHexCheck(c1) < 0)) {
                        alert("<%tcWebApi_get("String_Entry","FilterJS5Text","s")%>");
                        obj.focus();
                        return false;
                    }
                    i = 2;
                    while (i<len) {
                        var c0 = szAddr.charAt(i);
                        var c1 = szAddr.charAt(i+1);
                        var c2 = szAddr.charAt(i+2);
                        if (((c0 != ":")&&(c0 != "-"))||(doHexCheck(c1)<0)||(doHexCheck(c2)<0)) {
                            alert("<%tcWebApi_get("String_Entry","FilterJS5Text","s")%>");
                            obj.focus();
                            return false;
                        }
                        i = i + 3;
                    }               
                    /* Check if a MAC has both ":" and "-" */
                    if(szAddr.charAt(2) ==":"){
                        if((szAddr.charAt(5) !=":")||(szAddr.charAt(8) !=":")||(szAddr.charAt(11) !=":")||(szAddr.charAt(14) !=":")){
                            alert("<%tcWebApi_get("String_Entry","FilterJS5Text","s")%>");
                            obj.focus();                        
                            return false;
                        }
                    }
                    if(szAddr.charAt(2) =="-"){
                        if((szAddr.charAt(5) !="-")||(szAddr.charAt(8) !="-")||(szAddr.charAt(11) !="-")||(szAddr.charAt(14) !="-")){
                            alert("<%tcWebApi_get("String_Entry","FilterJS5Text","s")%>");
                            obj.focus();                        
                            return false;
                        }
                    }           
                    if((szAddr == "00:00:00:00:00:00") || (szAddr.toUpperCase() == "FF:FF:FF:FF:FF:FF")||
                        (szAddr == "00-00-00-00-00-00") || (szAddr.toUpperCase() == "FF-FF-FF-FF-FF-FF")) {
                        alert("<%tcWebApi_get("String_Entry","FilterJS5Text","s")%>");
                        obj.focus();
                        return false;
                    }
                    return true;
                }
            }
            function doHexCheck(c) {
                if ( (c >= "0") && (c <= "9") )
                    return 1;
                else if ( (c >= "A") && (c <= "F") )
                    return 1;
                else if ( (c >= "a") && (c <= "f") )
                    return 1;
                return -1;
            }
            function setEnableEntry(id) {
                var isEnable = $("[name=Active" + id + "]").val() == "Yes" ? true : false;
                $("[name=MacAddr" + id + "]").attr('readonly', !isEnable);
            }
            function L2FilterSwitch() {
                if(document.getElementById("Enable_L2Active").checked == true)
                {
                    $('#filter-enable-div').show();
                    $('#add_button').show();
                }
                else
                {
                    $('#filter-enable-div').hide();
                    $('#add_button').hide();
                }
            }
            function addNewFilterEntry (hide_new_row) {
                var f = document.l2filter_form;
                var cur_value, next_value;
                var id;
                var srcMac;
                var is_called_from_do_submit_func = hide_new_row;
                // check route table full
                var count = 0;
                for (var i=1; i<=filtercount; i++) {
                    id = get2Digit(i);
                    if ($('#Active'+id).val() == "Yes")
                    {
                        count++;
                        /* ONT-418 */
                        srcMac = $('#MacAddr' + id);
                        if (srcMac.val().trim().length < 1) {
                            if (is_called_from_do_submit_func) continue;
                            return;
                        }
                        if (srcMac.val().trim().length > 0)
                            if (!doMACcheck(srcMac)) return valid_error();
                    }
                }
                if (count >= filtercount)
                {
                    alert("<%tcWebApi_get("String_Entry","FilterFull","s")%>");
                    return false;
                }
                for (var i=1; i<=filtercount; i++) {
                    id = get2Digit(i);
                    if ($('#Active'+id).val() == "No")
                    {
                        break;
                    }
                }
                $('#MacAddr' + id).val($('#MacAddr21').val());
                $('#Active'+id).val("Yes");
                $('#l2filter_entry' + id).show();
                if(count%2==0)
                {
                    $('#l2filter_entry21').removeClass("odd_tr");
                    $('#l2filter_entry21').addClass("even_tr");
                }
                else
                {
                    $('#l2filter_entry21').removeClass("even_tr");
                    $('#l2filter_entry21').addClass("odd_tr");
                }
                $('#MacAddr21').val("");
                $('#MacAddr21').val("");
                $('#Active21').val("Yes");
                if (hide_new_row||++count==filtercount)
                    $('#l2filter_entry21').hide();
                $('#l2filter_noentry').hide();
                data_needs_saving = 1;
            }
            function doDeleteEntry(obj) {
                objid = obj.parentElement.parentElement.id;
                id = objid.substr( objid.length - 2 );
                $('#Active'+id).val("No");
                $('#l2filter_entry' + id).hide();
                var count = 0;
                for (var i=1; i<=filtercount; i++) {
                    id = get2Digit(i);
                    if ($('#Active'+id).val() == "Yes")
                    {
                        count++;
                    }
                }
                if(count%2==0)
                {
                    $('#l2filter_entry21').removeClass("even_tr");
                    $('#l2filter_entry21').addClass("odd_tr");
                }
                else
                {
                    $('#l2filter_entry21').removeClass("odd_tr");
                    $('#l2filter_entry21').addClass("even_tr");
                }
                reorder_rules();
                data_needs_saving = 1;
                $('#l2filter_entry21').show();
            }
            var arMacAddr1  = new Array(20);
            var arActive1       = new Array(20);
            var arMacAddr2  = new Array(20);
            var arActive2       = new Array(20);
            var arMacAddr_entry21_White_temp,arMacAddr_entry21_Black_temp;
            for (var i = 0; i < 20; i++) arActive1[i] = "No";
            for (var i = 0; i < 20; i++) arActive2[i] = "No";
            var curRuleType      = "<%tcWebApi_get("MACFilter_Common","RuleType","s")%>";
            function ToggleFilterType () {
            if (document.l2filter_form.RuleType.value != curRuleType)
            {
                var confirmvl = confirm("<% tcWebApi_get("String_Entry", "FilterChangeRuleText", "s")%>");
                if (!confirmvl)
                {
                    if (document.l2filter_form.RuleType.value == "White") {
                        cs_selectindex("RuleType", 0);
                    }
                    else {
                        cs_selectindex("RuleType", 1);
                    }
                    return;
                }
                var i, r;           
                if ( curRuleType == "Black" )
                {
                    for (i=1; i<=filtercount;i++) {
                        id = get2Digit(i);
                        arMacAddr1[i] = $('#MacAddr'+id).val();
                        arActive1[i] = $('#Active'+id).val();
                    }
                    for (i=1; i<=filtercount;i++) {
                        id = get2Digit(i);
                        $('#MacAddr'+id).val(arMacAddr2[i]);
                        $('#Active'+id).val(arActive2[i]);
                    }
                    arMacAddr_entry21_White_temp = $('#MacAddr21').val();     /*ONT-450*/
                    $('#MacAddr21').val(arMacAddr_entry21_Black_temp);              
                }
                else
                {
                    for (i=1; i<=filtercount;i++) {
                        id = get2Digit(i);
                        arMacAddr2[i] = $('#MacAddr'+id).val();
                        arActive2[i] = $('#Active'+id).val();
                    }
                    for (i=1; i<=filtercount;i++) {
                        id = get2Digit(i);
                        $('#MacAddr'+id).val(arMacAddr1[i]);
                        $('#Active'+id).val(arActive1[i]);
                    }
                    arMacAddr_entry21_Black_temp = $('#MacAddr21').val();     /* ONT-450*/
                    $('#MacAddr21').val(arMacAddr_entry21_White_temp);              
                }
                r = 0;
                for (i=1; i<=filtercount; i++) {
                    id = get2Digit(i);
                    if ($('#Active'+id).val() == "Yes")
                    {
                        $('#l2filter_entry' + id).show();
                        r++;
                    }
                    else
                    {
                        $('#l2filter_entry' + id).hide();
                    }
                }
                curRuleType = document.l2filter_form.RuleType.value;
                if (r < filtercount) {
                    $('#l2filter_entry21').show();
                }
                else {
                    $('#l2filter_entry21').hide();
                }
            }
            }
            function LoadMacfilter() {          
                var index;
                var aryInfoTemp = "<% tcWebApi_get("Info_Ether","PortIP","s") %>";
                var PortIp = aryInfoTemp.split(',');
                var dhcpnum = PortIp.length - 1;
                aryInfoTemp = "<% tcWebApi_get("Info_Ether","PortMac","s") %>";
                aryInfoTemp += "<% tcWebApi_get("Info_Ether","PortMac2","s") %>";
                var PortMac = aryInfoTemp.split(',');
                aryInfoTemp = "<% tcWebApi_get("Info_Ether","HostName","s") %>";
                var PortHostName = aryInfoTemp.split(',');
                document.getElementById("MacList21").innerHTML = "";
                for(index = 0; index < dhcpnum; index++)
                {
                    if(PortIp[index] != "N/A" || PortMac[index] != "N/A")
                    {
                        if (!isValidIpAddress(PortIp[index])) {
                            continue; // skip Link local IP
                        }
                        document.getElementById("MacList21").innerHTML += ("<div>" + PortMac[index].toLowerCase() + " - " + PortHostName[index] + " - " + PortIp[index] + "</div>");
                    }		
                }
                if (document.getElementById("MacList21").innerHTML.length == 0)
                {
                    document.getElementById("MacList21").innerHTML += "<div></div>"
                }
                for (entry = 1; entry < 21; entry++) {
                    document.getElementById("MacList" + get2Digit(entry)).innerHTML = document.getElementById("MacList21").innerHTML;
                }	
                // $.ajax({
                // url: "/cgi-bin/get_status_dhcp.cgi?opt=1",
                // method: 'GET', 
                // complete: function(res){
                //     try {
                //             if (/iPad|iPhone|iPod/.test(navigator.userAgent) && !window.MSStream) {
                //                 Pace.stop();
                //             }
                //             var obj = JSON.parse(res.responseText);
                //             var entry=0;
                //             while (!( typeof obj["ip" + entry] === "undefined")) {
                //                 arConnectedIP[entry] = obj["ip" + entry];
                //                 arConnectedMac[entry] = obj["mac" + entry];
                //                 arConnectedName[entry] = obj["host" + entry];
                //                 entry++;
                //             }
                //             index = entry;
                //             $.ajax({
                //             url: "/cgi-bin/arp_table.cgi",
                //             method: 'GET', 
                //             complete: function(res){
                //                 try {
                //                         if (/iPad|iPhone|iPod/.test(navigator.userAgent) && !window.MSStream) {
                //                             Pace.stop();
                //                         }
                //                         var obj = JSON.parse(res.responseText);
                //                         var entry=1;
                //                         var cont;
                //                         while (!( typeof obj["ip" + entry] === "undefined")) {
                //                             cont = 0;
                //                             for (var i = 0; i < index; i++) {
                //                                 if (arConnectedIP[i] == obj["ip" + entry]) {
                //                                     entry++;
                //                                     cont = 1;
                //                                     break;
                //                                 }
                //                             }
                //                             if (cont == 1) {
                //                                 continue;
                //                             }
                //                             arConnectedIP[index] = obj["ip" + entry];
                //                             arConnectedMac[index] = obj["mac" + entry];
                //                             arConnectedName[index] = "unknown";
                //                             index++;
                //                             entry++;
                //                         }
                //                         document.getElementById("MacList21").innerHTML = "";
                //                         index = 0;
                //                         for (index = 0; index < arConnectedIP.length; index ++) {
                //                         document.getElementById("MacList21").innerHTML += ("<div>" + arConnectedMac[index].toLowerCase() + " - " + arConnectedName[index] + " - " + arConnectedIP[index] + "</div>");
                //                         }
                //                         if (arConnectedIP.length == 0)
                //                         {
                //                             document.getElementById("MacList21").innerHTML += "<div></div>"
                //                         }
                //                         for (entry = 1; entry <= 21; entry++) {
                //                             document.getElementById("MacList" + get2Digit(entry)).innerHTML = document.getElementById("MacList21").innerHTML;
                //                         }
                //                     }
                //                 catch(err){ }
                //                 }
                //             })
                //         }
                //     catch(err){ }
                //     }
                // })
            }
            function show_suggestion(id) {
                $("#MacList"+get2Digit(id)).show();
                var child_list = $("#MacList" + get2Digit(id)).children();
                var len = child_list.length;
                for (var i = 0; i < len; i ++) {
                    child_list[i].style.display = "block";
                }
            }
            function hide_suggestion(id) {
                $("#MacList" + get2Digit(id)).hide();
            }
            function hide_all_suggestion() {
                for (var i = 0; i <= 21; i++) {
                        $("#MacList" + get2Digit(i)).hide();
                    }
            }
            function oninput_mac(id) {
                var string = $("#MacAddr" + get2Digit(id)).val();
                var child_list = $("#MacList" + get2Digit(id)).children();
                var len = child_list.length;
                for (var i = 0; i < len; i ++) {
                    if (0 == child_list[i].innerHTML.search(string)) {
                        child_list[i].style.display = "block";
                    }
                    else {
                        child_list[i].style.display = "none";
                    }
                }
            }
        </script>
        <style>
            .suggestion_popup {
                position:absolute;
                display:none;
                background-color: white;
                border: 1px solid #c0c0c0;
                margin-top: 5px;
                z-index: 1000;
            }
            .suggestion_popup>div {
                text-align: left;
                padding: 3px;
            }
            .suggestion_popup>div:hover {
                background-color: rgba(0,145,140,0.2);
            }
            @media screen and (max-width: 767px) {
                .table-responsive {
                    overflow-y: auto;
                }
            }
        </style>
    </head>
    <body class="container" onload="LoadMacfilter();">
<header class="fixed-top"><nav id="top-nav" class="navbar navbar-expand-lg container"><a class="navbar-brand " href="/cgi-bin/home.asp"><div><img src="/img/logo_home.png" width="100" height="18" alt=""><div style="font-family: sans-serif; font-weight: bold;font-size: 12px;color: #000; margin-top: 0">OPTICAL NETWORK TERMINATION</div></div></a><button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"><em class="fas fa-align-justify"></em></span></button><div class="collapse navbar-collapse" id="navbarCollapse"><ul class="navbar-nav mr-auto sidenav" id="navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/home.asp"><%tcWebApi_get("String_Entry","NavigationHomeText","s")%><span class="sr-only"></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/deviceinfo.asp"><%tcWebApi_get("String_Entry","NavigationStatusDeviceText","s")%><span class="sr-only"></span></a></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#status-menu" aria-controls="status-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NavigationStatusStatisticsText","s")%></a><ul class="nav-second-level collapse" id="status-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/sta-statistics.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationTrafficText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/sta-wifiusers.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationStatusUsersText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/sta-users.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","ARPStatusText","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#network-menu" aria-controls="network-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NAVNetwork","s")%></a><ul class="nav-second-level collapse" id="network-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/net-wan.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationBasInternetText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/net-lan.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationBasLANText","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#wifi-menu" aria-controls="wifi-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NAVWifi","s")%></a><ul class="nav-second-level collapse" id="wifi-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/wifi.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationWiFiSettingsText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/wifi-11ac.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationWiFi11acSettingsText","s")%></span></a></li></ul></li><li class="nav-item active"><a class="nav-link nav-link-collapse nav-link-show" href="#" id="hasSubItems" data-toggle="collapse" data-target="#firewall-menu" aria-controls="firewall-menu" aria-expanded="true"><%tcWebApi_get("String_Entry","NavigationAdvFirewallText","s")%></a><ul class="nav-second-level show" id="firewall-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-spi.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","ContentFirewallText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-urlfilter.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","FILTERTYPE_index2","s")%></span></a></li><li class="nav-item active"><a class="nav-link" href="/cgi-bin/fw-macfilter.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVL2Filter","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-parentalcontrol.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","ParentalControlText","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#apps-menu" aria-controls="apps-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NAVApplication","s")%></a><ul class="nav-second-level collapse" id="apps-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-dmz.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NatTopDMZText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-portforwarding.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NatVirsvrText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-sslim.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","SessionLimit","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-route.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","StaticRouteText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-ddns.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","dyDNS1Text","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#tools-menu" aria-controls="tools-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NavigationMaintenanceText","s")%></a><ul class="nav-second-level collapse" id="tools-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-admin.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationMainAdminText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-time.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVSysTime","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-firmware.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationMainFirmwareText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-config.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVConfig","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-diagnostic.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationMainDiagnosticsText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-log.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVLogs","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-reboot.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","RebootText","s")%></span></a></li></ul></li></ul><div class="top-item-groups"><form name="LanguageForm" method="POST" action="/cgi-bin/fw-macfilter.asp" class="nav-item dropdown"><input type="hidden" name="TokenString" value="<%tcWebApi_getToken()%>"><input type="hidden" name="Language_Flag" value="<% tcWebApi_get("LanguageSwitch_Entry","Type","s") %>"><a class="nav-link dropdown-toggle" href="#" id="LanguageDropdown" role="button" data-toggle="dropdown" aria-expanded="false"><% tcWebApi_get("String_Entry","LoginLanguage","s") %></a><ul class="dropdown-menu" aria-labelledby="LanguageDropdown"><li><a class="dropdown-item <% if tcWebApi_get("LanguageSwitch_Entry","Type","h") = "1" then asp_Write("active") end if %>" href="#" onclick="submitLanguageForm(1);"><% tcWebApi_get("String_Entry","LanguageVIELong","s") %></a></li><li><a class="dropdown-item <% if tcWebApi_get("LanguageSwitch_Entry","Type","h") = "2" then asp_Write("active") end if %>" href="#" onclick="submitLanguageForm(2);"><% tcWebApi_get("String_Entry","LanguageENGLong","s") %></a></li></ul></form><div id="signout" class="nav-item"><a class="nav-link" href="javascript:doLogout();"><em class="fa fa-sign-out-alt"></em><span class="nav-link-text"><% tcWebApi_get("String_Entry","LogoutText","s") %></span></a></div></div></div></header></nav><% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then
	if tcWebApi_get("Mesh_Common", "DeviceRole", "h") = "2" then %>
		<script language='javascript'>
		document.getElementById("wifi-menu").children[0].style="display: none";
		document.getElementById("wifi-menu").children[1].style="display: none";
		</script>
<% end if end if %>		<div id="content">
			<form class="form-inline" name="l2filter_form" action="/cgi-bin/fw-macfilter.asp" method=post>
			<INPUT TYPE="HIDDEN" NAME="TokenString" VALUE="<%tcWebApi_getToken()%>">
			<INPUT type=hidden name="c2Support" id="c2Support" VALUE="0">
			<input type="hidden" name="PostFlag" id="PostFlag" value="1" />
			<div class="row row-w-100">
				<div class="widget col-xs-12 col-lg-12">
					<header><%tcWebApi_get("String_Entry","NAVL2Filter","s")%></header>
					<div class="widget-body">
					<fieldset>
						<legend><%tcWebApi_get("String_Entry","NAVL2Filter","s")%></legend>
						<div class="form-group">
							<label class="col-xs-12 col-sm-4 control-label"><%tcWebApi_get("String_Entry","MACFilterActiveText","s")%></label>
							<label class="toggle-switch">
								<input type="checkbox" name="Enable_L2Active" id="Enable_L2Active" onChange="L2FilterSwitch();" value="1" <% If TCWebApi_get("MACFilter_Common","Active","h") = "Yes" then asp_Write("checked") end if%>>
								<span class="slider"></span>
							</label>
						</div>
					</fieldset>
					<div id ="filter-enable-div" <% If TCWebApi_get("MACFilter_Common","Active","h") <> "Yes" then%> style="display:none" <%end if%>>
						<fieldset>
							<legend><%tcWebApi_get("String_Entry","IPFilterRuleTypeText","s")%></legend>
							<div class="form-group">
								<label class="col-xs-12 col-sm-4 control-label"><%tcWebApi_get("String_Entry","IPFilterRuleTypeSelectionText","s")%></label>
								<div class="col-xs-12 col-sm-3 custom-select">
									<SELECT name="RuleType" id="RuleType" onchange="ToggleFilterType();">
										<OPTION VALUE="Black"><%tcWebApi_get("String_Entry","BlackListText","s")%></OPTION>
										<OPTION VALUE="White"><%tcWebApi_get("String_Entry","WhiteListText","s")%></OPTION>
									</SELECT>
								</div>
							</div>
						</fieldset>
						<fieldset>
							<legend><%tcWebApi_get("String_Entry","MACFilterText","s")%></legend>
							<div class="table-responsive col-xs-12 col-sm-10" style="float: none; margin: 0 auto; text-align: center; padding-bottom: 30px">
								<table class="table-bordered-radius simple-table" id="filter_List" name="filter_List" cellpadding="0" cellspacing="0" style="width:100%">
									<thead>
										<tr class="thead-light" style="text-align: center;">
											<th><%tcWebApi_get("String_Entry","IPFilterMACAddressText","s")%></th>
											<th><%tcWebApi_get("String_Entry","FilterCgiAction","s")%></th>
										</tr>
									</thead>
									<tbody>
										<tr id="l2filter_entry01" style="display: none; text-align: center;">
											<td>
												<div style="margin: 0 auto; width: 123px;">
												<INPUT type="hidden" name="macfilter_user01" value="0">
												<INPUT type="hidden" name="hasValue01" id="hasValue01" value="0">
												<INPUT type="text" maxLength=17 size=17 name="MacAddr01" id="MacAddr01" onfocusin="show_suggestion(1);" onfocusout="setTimeout(hide_suggestion,500,1);" oninput="oninput_mac(1);">
												<div id="MacList01" class="suggestion_popup"></div>
												</div>
											</td>
											<td>
												<INPUT type="hidden" name="Active01" id="Active01" value="No">
												<i class='fas fa-times fa-lg icon-btn-delete' onmouseover='this.style.cursor="hand"' onclick='doDeleteEntry(this)'></i>
											</td>
										</tr>
										<tr id="l2filter_entry02" style="display: none; text-align: center;">
											<td>
												<div style="margin: 0 auto; width: 123px;">
												<INPUT type="hidden" name="macfilter_user02" value="1">
												<INPUT type="hidden" name="hasValue02" id="hasValue02" value="0">
												<INPUT type="text" maxLength=17 size=17 name="MacAddr02" id="MacAddr02" onfocusin="show_suggestion(2);" onfocusout="setTimeout(hide_suggestion,500,2);" oninput="oninput_mac(2);">
												<div id="MacList02" class="suggestion_popup"></div>
												</div>
											</td>
											<td><INPUT type="hidden" name="Active02" id="Active02" value="No"><i class='fas fa-times fa-lg icon-btn-delete' onmouseover='this.style.cursor="hand"' onclick='doDeleteEntry(this)'></i></td>
										</tr>
										<tr id="l2filter_entry03" style="display: none; text-align: center;">
											<td>
												<div style="margin: 0 auto; width: 123px;">
												<INPUT type="hidden" name="macfilter_user03" value="2">
												<INPUT type="hidden" name="hasValue03" id="hasValue03" value="0">
												<INPUT type="text" maxLength=17 size=17 name="MacAddr03" id="MacAddr03" onfocusin="show_suggestion(3);" onfocusout="setTimeout(hide_suggestion,500,3);" oninput="oninput_mac(3);">
												<div id="MacList03" class="suggestion_popup"></div>
												</div>
											</td>
											<td><INPUT type="hidden" name="Active03" id="Active03" value="No"><i class='fas fa-times fa-lg icon-btn-delete' onmouseover='this.style.cursor="hand"' onclick='doDeleteEntry(this)'></i></td>
										</tr>
										<tr id="l2filter_entry04" style="display: none; text-align: center;">
											<td>
												<div style="margin: 0 auto; width: 123px;">
												<INPUT type="hidden" name="macfilter_user04" value="3">
												<INPUT type="hidden" name="hasValue04" id="hasValue04" value="0">
												<INPUT type="text" maxLength=17 size=17 name="MacAddr04" id="MacAddr04" onfocusin="show_suggestion(4);" onfocusout="setTimeout(hide_suggestion,500,4);" oninput="oninput_mac(4);">
												<div id="MacList04" class="suggestion_popup"></div>
												</div>
											</td>
											<td><INPUT type="hidden" name="Active04" id="Active04" value="No"><i class='fas fa-times fa-lg icon-btn-delete' onmouseover='this.style.cursor="hand"' onclick='doDeleteEntry(this)'></i></td>
										</tr>
										<tr id="l2filter_entry05" style="display: none; text-align: center;">
											<td>
												<div style="margin: 0 auto; width: 123px;">
												<INPUT type="hidden" name="macfilter_user05" value="4">
												<INPUT type="hidden" name="hasValue05" id="hasValue05" value="0">
												<INPUT type="text" maxLength=17 size=17 name="MacAddr05" id="MacAddr05" onfocusin="show_suggestion(5);" onfocusout="setTimeout(hide_suggestion,500,5);" oninput="oninput_mac(5);">
												<div id="MacList05" class="suggestion_popup"></div>
												</div>
											</td>
											<td><INPUT type="hidden" name="Active05" id="Active05" value="No"><i class='fas fa-times fa-lg icon-btn-delete' onmouseover='this.style.cursor="hand"' onclick='doDeleteEntry(this)'></i></td>
										</tr>
										<tr id="l2filter_entry06" style="display: none; text-align: center;">
											<td>
												<div style="margin: 0 auto; width: 123px;">
												<INPUT type="hidden" name="macfilter_user06" value="5">
												<INPUT type="hidden" name="hasValue06" id="hasValue06" value="0">
												<INPUT type="text" maxLength=17 size=17 name="MacAddr06" id="MacAddr06" onfocusin="show_suggestion(6);" onfocusout="setTimeout(hide_suggestion,500,6);" oninput="oninput_mac(6);">
												<div id="MacList06" class="suggestion_popup"></div>
												</div>
											</td>
											<td><INPUT type="hidden" name="Active06" id="Active06" value="No"><i class='fas fa-times fa-lg icon-btn-delete' onmouseover='this.style.cursor="hand"' onclick='doDeleteEntry(this)'></i></td>
										</tr>
										<tr id="l2filter_entry07" style="display: none; text-align: center;">
											<td>
												<div style="margin: 0 auto; width: 123px;">
												<INPUT type="hidden" name="macfilter_user07" value="6">
												<INPUT type="hidden" name="hasValue07" id="hasValue07" value="0">
												<INPUT type="text" maxLength=17 size=17 name="MacAddr07" id="MacAddr07" onfocusin="show_suggestion(7);" onfocusout="setTimeout(hide_suggestion,500,7);" oninput="oninput_mac(7);">
												<div id="MacList07" class="suggestion_popup"></div>
												</div>
											</td>
											<td><INPUT type="hidden" name="Active07" id="Active07" value="No"><i class='fas fa-times fa-lg icon-btn-delete' onmouseover='this.style.cursor="hand"' onclick='doDeleteEntry(this)'></i></td>
										</tr>
										<tr id="l2filter_entry08" style="display: none; text-align: center;">
											<td>
												<div style="margin: 0 auto; width: 123px;">
												<INPUT type="hidden" name="macfilter_user08" value="7">
												<INPUT type="hidden" name="hasValue08" id="hasValue08" value="0">
												<INPUT type="text" maxLength=17 size=17 name="MacAddr08" id="MacAddr08" onfocusin="show_suggestion(8);" onfocusout="setTimeout(hide_suggestion,500,8);" oninput="oninput_mac(8);">
												<div id="MacList08" class="suggestion_popup"></div>
												</div>
											</td>
											<td><INPUT type="hidden" name="Active08" id="Active08" value="No"><i class='fas fa-times fa-lg icon-btn-delete' onmouseover='this.style.cursor="hand"' onclick='doDeleteEntry(this)'></i></td>
										</tr>
										<tr id="l2filter_entry09" style="display: none; text-align: center;">
											<td>
												<div style="margin: 0 auto; width: 123px;">
												<INPUT type="hidden" name="macfilter_user09" value="8">
												<INPUT type="hidden" name="hasValue09" id="hasValue09" value="0">
												<INPUT type="text" maxLength=17 size=17 name="MacAddr09" id="MacAddr09" onfocusin="show_suggestion(9);" onfocusout="setTimeout(hide_suggestion,500,9);" oninput="oninput_mac(9);">
												<div id="MacList09" class="suggestion_popup"></div>
												</div>
											</td>
											<td><INPUT type="hidden" name="Active09" id="Active09" value="No"><i class='fas fa-times fa-lg icon-btn-delete' onmouseover='this.style.cursor="hand"' onclick='doDeleteEntry(this)'></i></td>
										</tr>
										<tr id="l2filter_entry10" style="display: none; text-align: center;">
											<td>
												<div style="margin: 0 auto; width: 123px;">
												<INPUT type="hidden" name="macfilter_user10" value="9">
												<INPUT type="hidden" name="hasValue10" id="hasValue10" value="0">
												<INPUT type="text" maxLength=17 size=17 name="MacAddr10" id="MacAddr10" onfocusin="show_suggestion(10);" onfocusout="setTimeout(hide_suggestion,500,10);" oninput="oninput_mac(10);">
												<div id="MacList10" class="suggestion_popup"></div>
												</div>
											</td>
											<td><INPUT type="hidden" name="Active10" id="Active10" value="No"><i class='fas fa-times fa-lg icon-btn-delete' onmouseover='this.style.cursor="hand"' onclick='doDeleteEntry(this)'></i></td>
										</tr>
										<tr id="l2filter_entry11" style="display: none; text-align: center;">
											<td>
												<div style="margin: 0 auto; width: 123px;">
												<INPUT type="hidden" name="macfilter_user11" value="10">
												<INPUT type="hidden" name="hasValue11" id="hasValue11" value="0">
												<INPUT type="text" maxLength=17 size=17 name="MacAddr11" id="MacAddr11" onfocusin="show_suggestion(11);" onfocusout="setTimeout(hide_suggestion,500,11);" oninput="oninput_mac(11);">
												<div id="MacList11" class="suggestion_popup"></div>
												</div>
											</td>
											<td><INPUT type="hidden" name="Active11" id="Active11" value="No"><i class='fas fa-times fa-lg icon-btn-delete' onmouseover='this.style.cursor="hand"' onclick='doDeleteEntry(this)'></i></td>
										</tr>
										<tr id="l2filter_entry12" style="display: none; text-align: center;">
											<td>
												<div style="margin: 0 auto; width: 123px;">
												<INPUT type="hidden" name="macfilter_user12" value="11">
												<INPUT type="hidden" name="hasValue12" id="hasValue12" value="0">
												<INPUT type="text" maxLength=17 size=17 name="MacAddr12" id="MacAddr12" onfocusin="show_suggestion(12);" onfocusout="setTimeout(hide_suggestion,500,12);" oninput="oninput_mac(12);">
												<div id="MacList12" class="suggestion_popup"></div>
												</div>
											</td>
											<td><INPUT type="hidden" name="Active12" id="Active12" value="No"><i class='fas fa-times fa-lg icon-btn-delete' onmouseover='this.style.cursor="hand"' onclick='doDeleteEntry(this)'></i></td>
										</tr>
										<tr id="l2filter_entry13" style="display: none; text-align: center;">
											<td>
												<div style="margin: 0 auto; width: 123px;">
												<INPUT type="hidden" name="macfilter_user13" value="12">
												<INPUT type="hidden" name="hasValue13" id="hasValue13" value="0">
												<INPUT type="text" maxLength=17 size=17 name="MacAddr13" id="MacAddr13" onfocusin="show_suggestion(13);" onfocusout="setTimeout(hide_suggestion,500,13);" oninput="oninput_mac(13);">
												<div id="MacList13" class="suggestion_popup"></div>
												</div>
											</td>
											<td><INPUT type="hidden" name="Active13" id="Active13" value="No"><i class='fas fa-times fa-lg icon-btn-delete' onmouseover='this.style.cursor="hand"' onclick='doDeleteEntry(this)'></i></td>
										</tr>
										<tr id="l2filter_entry14" style="display: none; text-align: center;">
											<td>
												<div style="margin: 0 auto; width: 123px;">
												<INPUT type="hidden" name="macfilter_user14" value="13">
												<INPUT type="hidden" name="hasValue14" id="hasValue14" value="0">
												<INPUT type="text" maxLength=17 size=17 name="MacAddr14" id="MacAddr14" onfocusin="show_suggestion(14);" onfocusout="setTimeout(hide_suggestion,500,14);" oninput="oninput_mac(14);">
												<div id="MacList14" class="suggestion_popup"></div>
												</div>
											</td>
											<td><INPUT type="hidden" name="Active14" id="Active14" value="No"><i class='fas fa-times fa-lg icon-btn-delete' onmouseover='this.style.cursor="hand"' onclick='doDeleteEntry(this)'></i></td>
										</tr>
										<tr id="l2filter_entry15" style="display: none; text-align: center;">
											<td>
												<div style="margin: 0 auto; width: 123px;">
												<INPUT type="hidden" name="macfilter_user15" value="14">
												<INPUT type="hidden" name="hasValue15" id="hasValue15" value="0">
												<INPUT type="text" maxLength=17 size=17 name="MacAddr15" id="MacAddr15" onfocusin="show_suggestion(15);" onfocusout="setTimeout(hide_suggestion,500,15);" oninput="oninput_mac(15);">
												<div id="MacList15" class="suggestion_popup"></div>
												</div>
											</td>
											<td><INPUT type="hidden" name="Active15" id="Active15" value="No"><i class='fas fa-times fa-lg icon-btn-delete' onmouseover='this.style.cursor="hand"' onclick='doDeleteEntry(this)'></i></td>
										</tr>
										<tr id="l2filter_entry16" style="display: none; text-align: center;">
											<td>
												<div style="margin: 0 auto; width: 123px;">
												<INPUT type="hidden" name="macfilter_user16" value="15">
												<INPUT type="hidden" name="hasValue16" id="hasValue16" value="0">
												<INPUT type="text" maxLength=17 size=17 name="MacAddr16" id="MacAddr16" onfocusin="show_suggestion(16);" onfocusout="setTimeout(hide_suggestion,500,16);" oninput="oninput_mac(16);">
												<div id="MacList16" class="suggestion_popup"></div>
												</div>
											</td>
											<td><INPUT type="hidden" name="Active16" id="Active16" value="No"><i class='fas fa-times fa-lg icon-btn-delete' onmouseover='this.style.cursor="hand"' onclick='doDeleteEntry(this)'></i></td>
										</tr>
										<tr id="l2filter_entry17"  style="display: none; text-align: center;">
											<td>
												<div style="margin: 0 auto; width: 123px;">
												<INPUT type="hidden" name="macfilter_user17" value="16">
												<INPUT type="hidden" name="hasValue17" id="hasValue17" value="0">
												<INPUT type="text" maxLength=17 size=17 name="MacAddr17" id="MacAddr17" onfocusin="show_suggestion(17);" onfocusout="setTimeout(hide_suggestion,500,17);" oninput="oninput_mac(17);">
												<div id="MacList17" class="suggestion_popup"></div>
												</div>
											</td>
											<td><INPUT type="hidden" name="Active17" id="Active17" value="No"><i class='fas fa-times fa-lg icon-btn-delete' onmouseover='this.style.cursor="hand"' onclick='doDeleteEntry(this)'></i></td>
										</tr>
										<tr id="l2filter_entry18" style="display: none; text-align: center;">
											<td>
												<div style="margin: 0 auto; width: 123px;">
												<INPUT type="hidden" name="macfilter_user18" value="17">
												<INPUT type="hidden" name="hasValue18" id="hasValue18" value="0">
												<INPUT type="text" maxLength=17 size=17 name="MacAddr18" id="MacAddr18" onfocusin="show_suggestion(18);" onfocusout="setTimeout(hide_suggestion,500,18);" oninput="oninput_mac(18);">
												<div id="MacList18" class="suggestion_popup"></div>
												</div>
											</td>
											<td><INPUT type="hidden" name="Active18" id="Active18" value="No"><i class='fas fa-times fa-lg icon-btn-delete' onmouseover='this.style.cursor="hand"' onclick='doDeleteEntry(this)'></i></td>
										</tr>
										<tr id="l2filter_entry19" style="display: none; text-align: center;">
											<td>
												<div style="margin: 0 auto; width: 123px;">
												<INPUT type="hidden" name="macfilter_user19" value="18">
												<INPUT type="hidden" name="hasValue19" id="hasValue19" value="0">
												<INPUT type="text" maxLength=17 size=17 name="MacAddr19" id="MacAddr19" onfocusin="show_suggestion(19);" onfocusout="setTimeout(hide_suggestion,500,19);" oninput="oninput_mac(19);">
												<div id="MacList19" class="suggestion_popup"></div>
												</div>
											</td>
											<td><INPUT type="hidden" name="Active19" id="Active19" value="No"><i class='fas fa-times fa-lg icon-btn-delete' onmouseover='this.style.cursor="hand"' onclick='doDeleteEntry(this)'></i></td>
										</tr>
										<tr id="l2filter_entry20" style="display: none; text-align: center;">
											<td>
												<div style="margin: 0 auto; width: 123px;">
												<INPUT type="hidden" name="macfilter_user20" value="19">
												<INPUT type="hidden" name="hasValue20" id="hasValue20" value="0">
												<INPUT type="text" maxLength=17 size=17 name="MacAddr20" id="MacAddr20" onfocusin="show_suggestion(20);" onfocusout="setTimeout(hide_suggestion,500,20);" oninput="oninput_mac(20);">
												<div id="MacList20" class="suggestion_popup"></div>
												</div>
											</td>
											<td><INPUT type="hidden" name="Active20" id="Active20" value="No"><i class='fas fa-times fa-lg icon-btn-delete' onmouseover='this.style.cursor="hand"' onclick='doDeleteEntry(this)'></i></td>
										</tr>
										<tr id="l2filter_entry21" style="text-align: center;">
											<td>
												<div style="margin: 0 auto; width: 123px;">
												<INPUT type="hidden" name="macfilter_user21" value="19">
												<INPUT type="hidden" name="hasValue21" id="hasValue21" value="0">
												<INPUT type="text" maxLength=17 size=17 name="MacAddr21" id="MacAddr21" onfocusin="show_suggestion(21);" onfocusout="setTimeout(hide_suggestion,500,21);" oninput="oninput_mac(21);">
												<div id="MacList21" class="suggestion_popup"></div>
												</div>
											</td>
											<td><INPUT type="hidden" name="Active21" id="Active21" value="No"><i class='fas fa-plus fa-lg icon-btn-renew' onmouseover='this.style.cursor="hand"' onclick='addNewFilterEntry(false)'></i></td>
										</tr>
									</tbody>
								</table>
							</div>
						</fieldset>
					</div>
				</div>	
				</div>
				<div class="col-lg-12 d-flex align-items-center justify-content-center">
					<button id="btnOK" type="button" class="page-button small-button" onclick="doSubmit();"><%tcWebApi_get("String_Entry","ButtonApplyText","s")%></button>
				</div>
			</div>
			</form>
		</div>
        <!-- END #MAIN PANEL -->
		<footer>
			<p><%tcWebApi_get("String_Entry","SaleConsultantText","s")%>: <a href="tel:18008168">18008168</a></p>
			<p><%tcWebApi_get("String_Entry","ReportProblemText","s")%>: <a href="tel:18008119">18008119</a></p>
			<p>&copy; 2021 by VHT. All rights reserved.</p>
		</footer>
		<script language='javascript' src='/JS/user.js'></script>        <script>
            onloadCheck();
            $(document).on('click', function(evt) {
                if($(evt.target).parent().hasClass("suggestion_popup")) {
                    $(evt.target).parent().hide();
                    $(evt.target).parent().prev().val($(evt.target).html().split(" ")[0]);
                    return;
                }
                if ($(evt.target).attr("id") == undefined) {
                    hide_all_suggestion();
                }
                else if (! ($(evt.target).attr("id").match(/MacAddr\d+/g))) {
                    hide_all_suggestion();
                }
            });
        </script>
    </body>
</html>