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
	if Request_form("PrtStatus") = "1" then
		TCWebAPI_constset("ParentalCtrl_Common","Status","Enable")
		if tcWebApi_validate("Mac0=mac&Template0=integer|1|10") = "1" then
			TCWebAPI_set("ParentalCtrl_Entry0","MAC","Mac0")
			TCWebAPI_set("ParentalCtrl_Entry0","DeviceName","DevName0")
			TCWebAPI_set("ParentalCtrl_Entry0","Template","Template0")
		else
			TCWebAPI_unset("ParentalCtrl_Entry0")
		end if
		if tcWebApi_validate("Mac1=mac&Template1=integer|1|10") = "1" then
			TCWebAPI_set("ParentalCtrl_Entry1","MAC","Mac1")
			TCWebAPI_set("ParentalCtrl_Entry1","DeviceName","DevName1")
			TCWebAPI_set("ParentalCtrl_Entry1","Template","Template1")
		else
			TCWebAPI_unset("ParentalCtrl_Entry1")
		end if
		if tcWebApi_validate("Mac2=mac&Template2=integer|1|10") = "1" then
			TCWebAPI_set("ParentalCtrl_Entry2","MAC","Mac2")
			TCWebAPI_set("ParentalCtrl_Entry2","DeviceName","DevName2")
			TCWebAPI_set("ParentalCtrl_Entry2","Template","Template2")
		else
			TCWebAPI_unset("ParentalCtrl_Entry2")
		end if
		if tcWebApi_validate("Mac3=mac&Template3=integer|1|10") = "1" then
			TCWebAPI_set("ParentalCtrl_Entry3","MAC","Mac3")
			TCWebAPI_set("ParentalCtrl_Entry3","DeviceName","DevName3")
			TCWebAPI_set("ParentalCtrl_Entry3","Template","Template3")
		else
			TCWebAPI_unset("ParentalCtrl_Entry3")
		end if
		if tcWebApi_validate("Mac4=mac&Template4=integer|1|10") = "1" then
			TCWebAPI_set("ParentalCtrl_Entry4","MAC","Mac4")
			TCWebAPI_set("ParentalCtrl_Entry4","DeviceName","DevName4")
			TCWebAPI_set("ParentalCtrl_Entry4","Template","Template4")
		else
			TCWebAPI_unset("ParentalCtrl_Entry4")
		end if
		if tcWebApi_validate("Mac5=mac&Template5=integer|1|10") = "1" then
			TCWebAPI_set("ParentalCtrl_Entry5","MAC","Mac5")
			TCWebAPI_set("ParentalCtrl_Entry5","DeviceName","DevName5")
			TCWebAPI_set("ParentalCtrl_Entry5","Template","Template5")
		else
			TCWebAPI_unset("ParentalCtrl_Entry5")
		end if
		if tcWebApi_validate("Mac6=mac&Template6=integer|1|10") = "1" then
			TCWebAPI_set("ParentalCtrl_Entry6","MAC","Mac6")
			TCWebAPI_set("ParentalCtrl_Entry6","DeviceName","DevName6")
			TCWebAPI_set("ParentalCtrl_Entry6","Template","Template6")
		else
			TCWebAPI_unset("ParentalCtrl_Entry6")
		end if
		if tcWebApi_validate("Mac7=mac&Template7=integer|1|10") = "1" then
			TCWebAPI_set("ParentalCtrl_Entry7","MAC","Mac7")
			TCWebAPI_set("ParentalCtrl_Entry7","DeviceName","DevName7")
			TCWebAPI_set("ParentalCtrl_Entry7","Template","Template7")
		else
			TCWebAPI_unset("ParentalCtrl_Entry7")
		end if
		if tcWebApi_validate("Mac8=mac&Template8=integer|1|10") = "1" then
			TCWebAPI_set("ParentalCtrl_Entry8","MAC","Mac8")
			TCWebAPI_set("ParentalCtrl_Entry8","DeviceName","DevName8")
			TCWebAPI_set("ParentalCtrl_Entry8","Template","Template8")
		else
			TCWebAPI_unset("ParentalCtrl_Entry8")
		end if
		if tcWebApi_validate("Mac9=mac&Template9=integer|1|10") = "1" then
			TCWebAPI_set("ParentalCtrl_Entry9","MAC","Mac9")
			TCWebAPI_set("ParentalCtrl_Entry9","DeviceName","DevName9")
			TCWebAPI_set("ParentalCtrl_Entry9","Template","Template9")
		else
			TCWebAPI_unset("ParentalCtrl_Entry9")
		end if
	else
		TCWebAPI_constset("ParentalCtrl_Common","Status","Disable")
	end if
    TCWebAPI_commit("ParentalCtrl")
    TCWebApi_save();
elseif Request_form("PostFlag") = "2" then
    TCWebAPI_set("WebCurSet_Entry","template_id","deletetmp")
    TCWebAPI_unset("ParentalCtrl_Template_Entry")
end if
%>
<!doctype html>
<html>
	<head>
<title>Viettel ONT - <%tcWebApi_get("String_Entry","ParentalControlText","s")%></title>		<meta charset="utf-8">
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
		</script>		<script>
            var max_macfilter_rules = 20;
            var max_ipfilter_rules = 20;
            var max_urlfilter_rules = 8;
            var max_templates = 10;
            var max_rules = 10;
            var arr_weekdays_str = ["<%tcWebApi_get("String_Entry","ParentalSunText","s")%>", 
                "<%tcWebApi_get("String_Entry","ParentalMonText","s")%>",
                "<%tcWebApi_get("String_Entry","ParentalTueText","s")%>",
                "<%tcWebApi_get("String_Entry","ParentalWedText","s")%>",
                "<%tcWebApi_get("String_Entry","ParentalThuText","s")%>", 
                "<%tcWebApi_get("String_Entry","ParentalFriText","s")%>", 
                "<%tcWebApi_get("String_Entry","ParentalSatText","s")%>"]; 
            var arDeviceName    = new Array(max_rules);
            var arMacAddr   = new Array(max_rules);
            var arTemplate      = new Array(max_rules);
            var hasRule     = new Array(max_rules);
            var templateIPlist  = [];
            var templateURLlist = [];
            var arConnectedName = new Array();
            var arConnectedMac = new Array();
            var arConnectedIP = new Array();
            arDeviceName[0] = "<%tcWebApi_get("ParentalCtrl_Entry0","DeviceName","s")%>";
            arMacAddr[0]      = "<%tcWebApi_get("ParentalCtrl_Entry0","MAC","s")%>";
            arTemplate[0]       = "<%tcWebApi_get("ParentalCtrl_Entry0","Template","s")%>";
            arDeviceName[1] = "<%tcWebApi_get("ParentalCtrl_Entry1","DeviceName","s")%>";
            arMacAddr[1]      = "<%tcWebApi_get("ParentalCtrl_Entry1","MAC","s")%>";
            arTemplate[1]       = "<%tcWebApi_get("ParentalCtrl_Entry1","Template","s")%>";
            arDeviceName[2] = "<%tcWebApi_get("ParentalCtrl_Entry2","DeviceName","s")%>";
            arMacAddr[2]      = "<%tcWebApi_get("ParentalCtrl_Entry2","MAC","s")%>";
            arTemplate[2]       = "<%tcWebApi_get("ParentalCtrl_Entry2","Template","s")%>";
            arDeviceName[3] = "<%tcWebApi_get("ParentalCtrl_Entry3","DeviceName","s")%>";
            arMacAddr[3]      = "<%tcWebApi_get("ParentalCtrl_Entry3","MAC","s")%>";
            arTemplate[3]       = "<%tcWebApi_get("ParentalCtrl_Entry3","Template","s")%>";
            arDeviceName[4] = "<%tcWebApi_get("ParentalCtrl_Entry4","DeviceName","s")%>";
            arMacAddr[4]      = "<%tcWebApi_get("ParentalCtrl_Entry4","MAC","s")%>";
            arTemplate[4]       = "<%tcWebApi_get("ParentalCtrl_Entry4","Template","s")%>";
            arDeviceName[5] = "<%tcWebApi_get("ParentalCtrl_Entry5","DeviceName","s")%>";
            arMacAddr[5]      = "<%tcWebApi_get("ParentalCtrl_Entry5","MAC","s")%>";
            arTemplate[5]       = "<%tcWebApi_get("ParentalCtrl_Entry5","Template","s")%>";
            arDeviceName[6] = "<%tcWebApi_get("ParentalCtrl_Entry6","DeviceName","s")%>";
            arMacAddr[6]      = "<%tcWebApi_get("ParentalCtrl_Entry6","MAC","s")%>";
            arTemplate[6]       = "<%tcWebApi_get("ParentalCtrl_Entry6","Template","s")%>";
            arDeviceName[7] = "<%tcWebApi_get("ParentalCtrl_Entry7","DeviceName","s")%>";
            arMacAddr[7]      = "<%tcWebApi_get("ParentalCtrl_Entry7","MAC","s")%>";
            arTemplate[7]       = "<%tcWebApi_get("ParentalCtrl_Entry7","Template","s")%>";
            arDeviceName[8] = "<%tcWebApi_get("ParentalCtrl_Entry8","DeviceName","s")%>";
            arMacAddr[8]      = "<%tcWebApi_get("ParentalCtrl_Entry8","MAC","s")%>";
            arTemplate[8]       = "<%tcWebApi_get("ParentalCtrl_Entry8","Template","s")%>";
            arDeviceName[9] = "<%tcWebApi_get("ParentalCtrl_Entry9","DeviceName","s")%>";
            arMacAddr[9]      = "<%tcWebApi_get("ParentalCtrl_Entry9","MAC","s")%>";
            arTemplate[9]       = "<%tcWebApi_get("ParentalCtrl_Entry9","Template","s")%>";
            var arTemplateRepeat = new Array(max_rules);
            <% if tcWebApi_get("MacFilter_Common","Active","h") = "Yes" then%>
                /*MAC filter for validating*/
                var arMACFilterAddr = new Array(max_macfilter_rules);
                var arMACFilterEn   = new Array(max_macfilter_rules);
                <%if tcWebApi_get("MacFilter_Entry0","Active","h") <> "N/A" then%>
                arMACFilterAddr[0]    = "<%tcWebApi_get("MacFilter_Entry0","MacAddr","s")%>";
                arMACFilterEn[0]     = "<%tcWebApi_get("MacFilter_Entry0","Active","s")%>";
                <%end if%>
                <%if tcWebApi_get("MacFilter_Entry1","Active","h") <> "N/A" then%>
                arMACFilterAddr[1]    = "<%tcWebApi_get("MacFilter_Entry1","MacAddr","s")%>";
                arMACFilterEn[1]     = "<%tcWebApi_get("MacFilter_Entry1","Active","s")%>";
                <%end if%>
                <%if tcWebApi_get("MacFilter_Entry2","Active","h") <> "N/A" then%>
                arMACFilterAddr[2]    = "<%tcWebApi_get("MacFilter_Entry2","MacAddr","s")%>";
                arMACFilterEn[2]     = "<%tcWebApi_get("MacFilter_Entry2","Active","s")%>";
                <%end if%>
                <%if tcWebApi_get("MacFilter_Entry3","Active","h") <> "N/A" then%>
                arMACFilterAddr[3]    = "<%tcWebApi_get("MacFilter_Entry3","MacAddr","s")%>";
                arMACFilterEn[3]     = "<%tcWebApi_get("MacFilter_Entry3","Active","s")%>";
                <%end if%>
                <%if tcWebApi_get("MacFilter_Entry4","Active","h") <> "N/A" then%>
                arMACFilterAddr[4]    = "<%tcWebApi_get("MacFilter_Entry4","MacAddr","s")%>";
                arMACFilterEn[4]     = "<%tcWebApi_get("MacFilter_Entry4","Active","s")%>";
                <%end if%>
                <%if tcWebApi_get("MacFilter_Entry5","Active","h") <> "N/A" then%>
                arMACFilterAddr[5]    = "<%tcWebApi_get("MacFilter_Entry5","MacAddr","s")%>";
                arMACFilterEn[5]     = "<%tcWebApi_get("MacFilter_Entry5","Active","s")%>";
                <%end if%>
                <%if tcWebApi_get("MacFilter_Entry6","Active","h") <> "N/A" then%>
                arMACFilterAddr[6]    = "<%tcWebApi_get("MacFilter_Entry6","MacAddr","s")%>";
                arMACFilterEn[6]     = "<%tcWebApi_get("MacFilter_Entry6","Active","s")%>";
                <%end if%>
                <%if tcWebApi_get("MacFilter_Entry7","Active","h") <> "N/A" then%>
                arMACFilterAddr[7]    = "<%tcWebApi_get("MacFilter_Entry7","MacAddr","s")%>";
                arMACFilterEn[7]     = "<%tcWebApi_get("MacFilter_Entry7","Active","s")%>";
                <%end if%>
                <%if tcWebApi_get("MacFilter_Entry8","Active","h") <> "N/A" then%>
                arMACFilterAddr[8]    = "<%tcWebApi_get("MacFilter_Entry8","MacAddr","s")%>";
                arMACFilterEn[8]     = "<%tcWebApi_get("MacFilter_Entry8","Active","s")%>";
                <%end if%>
                <%if tcWebApi_get("MacFilter_Entry9","Active","h") <> "N/A" then%>
                arMACFilterAddr[9]    = "<%tcWebApi_get("MacFilter_Entry9","MacAddr","s")%>";
                arMACFilterEn[9]     = "<%tcWebApi_get("MacFilter_Entry9","Active","s")%>";
                <%end if%>
                <%if tcWebApi_get("MacFilter_Entry10","Active","h") <> "N/A" then%>
                arMACFilterAddr[10]   = "<%tcWebApi_get("MacFilter_Entry10","MacAddr","s")%>";
                arMACFilterEn[10]        = "<%tcWebApi_get("MacFilter_Entry10","Active","s")%>";
                <%end if%>
                <%if tcWebApi_get("MacFilter_Entry11","Active","h") <> "N/A" then%>
                arMACFilterAddr[11]   = "<%tcWebApi_get("MacFilter_Entry11","MacAddr","s")%>";
                arMACFilterEn[11]        = "<%tcWebApi_get("MacFilter_Entry11","Active","s")%>";
                <%end if%>
                <%if tcWebApi_get("MacFilter_Entry12","Active","h") <> "N/A" then%>
                arMACFilterAddr[12]   = "<%tcWebApi_get("MacFilter_Entry12","MacAddr","s")%>";
                arMACFilterEn[12]        = "<%tcWebApi_get("MacFilter_Entry12","Active","s")%>";
                <%end if%>
                <%if tcWebApi_get("MacFilter_Entry13","Active","h") <> "N/A" then%>
                arMACFilterAddr[13]   = "<%tcWebApi_get("MacFilter_Entry13","MacAddr","s")%>";
                arMACFilterEn[13]        = "<%tcWebApi_get("MacFilter_Entry13","Active","s")%>";
                <%end if%>
                <%if tcWebApi_get("MacFilter_Entry14","Active","h") <> "N/A" then%>
                arMACFilterAddr[14]   = "<%tcWebApi_get("MacFilter_Entry14","MacAddr","s")%>";
                arMACFilterEn[14]        = "<%tcWebApi_get("MacFilter_Entry14","Active","s")%>";
                <%end if%>
                <%if tcWebApi_get("MacFilter_Entry15","Active","h") <> "N/A" then%>
                arMACFilterAddr[15]   = "<%tcWebApi_get("MacFilter_Entry15","MacAddr","s")%>";
                arMACFilterEn[15]        = "<%tcWebApi_get("MacFilter_Entry15","Active","s")%>";
                <%end if%>
                <%if tcWebApi_get("MacFilter_Entry16","Active","h") <> "N/A" then%>
                arMACFilterAddr[16]   = "<%tcWebApi_get("MacFilter_Entry16","MacAddr","s")%>";
                arMACFilterEn[16]        = "<%tcWebApi_get("MacFilter_Entry16","Active","s")%>";
                <%end if%>
                <%if tcWebApi_get("MacFilter_Entry17","Active","h") <> "N/A" then%>
                arMACFilterAddr[17]   = "<%tcWebApi_get("MacFilter_Entry17","MacAddr","s")%>";
                arMACFilterEn[17]        = "<%tcWebApi_get("MacFilter_Entry17","Active","s")%>";
                <%end if%>
                <%if tcWebApi_get("MacFilter_Entry18","Active","h") <> "N/A" then%>
                arMACFilterAddr[18]   = "<%tcWebApi_get("MacFilter_Entry18","MacAddr","s")%>";
                arMACFilterEn[18]        = "<%tcWebApi_get("MacFilter_Entry18","Active","s")%>";
                <%end if%>
                <%if tcWebApi_get("MacFilter_Entry19","Active","h") <> "N/A" then%>
                arMACFilterAddr[19]   = "<%tcWebApi_get("MacFilter_Entry19","MacAddr","s")%>";
                arMACFilterEn[19]        = "<%tcWebApi_get("MacFilter_Entry19","Active","s")%>";
                <%end if%>
                /* End MAC Filter */
            <% end if %>
            function isFilterActive() {
                return "";
            }
            function isRulesChanged() {
                for (var i= 0;i < max_rules;i++) {
                    if (arTemplate[i] != $("#Template"+i).val()) {
                        return 1;
                    }
                    if (arMacAddr[i] != $("#Mac"+i).val()) {
                        return 1;
                    }
                    if (arDeviceName[i] != $("#DevName"+i).val()) {
                        return 1;
                    }
                }
                if (($("#Template10").val().trim() != "1") || ($("#Mac10").val().trim() != "") || ($("#DevName10").val().trim() != "") ) {
                    return 1;
                }
                return 0;
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
            function ParentalSwitch() {
                if(document.ParentalCtrl_form.PrtStatus.checked)
                {
                    $('#parental-enable-div').show();
                    $('#add_button').show();
                    if (isFilterActive().length != 0){
                        $("#FilterWarning").parent().show();
                    }
                    $('#wid-id-1').show();                    
                }
                else
                {
                    $('#parental-enable-div').hide();
                    $('#add_button').hide();
                    $("#FilterWarning").parent().hide();
                    $('#wid-id-1').hide();                    
                }
            }
            function updateResult(item, val) {
                if( val == "no attribute information")
                {
                    document.getElementById(item).innerHTML = "N/A";
                }
                else
                {
                document.getElementById(item).innerHTML = val;
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
            function doMACcheck(obj) {
                var szAddr = obj.val().trim();
                var len = szAddr.length;
                if (len != 17) {
                    alert("<%tcWebApi_get("String_Entry","FilterJS5Text","s")%>");
                    obj.focus();
                    return false;
                } else if ( len == 17 ) {
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
            function GetTemplateInfo() {
            $.ajax({
                url: "/cgi-bin/get_prttemplate.cgi",
                method: 'GET', 
                complete: function(res){
                    try {
                            if (/iPad|iPhone|iPod/.test(navigator.userAgent) && !window.MSStream) {
                                Pace.stop();
                            }
                            var tbl = $("#tmp_list")[0];
                            var obj = JSON.parse(res.responseText);
                            var tmp, count, i;
                            var week;
                            var tid;
                            var row, cell;
                            for (tid = 0; tid < max_templates; tid++ ) {
                                if (obj["enable"+tid].trim() != "Yes") {
                                    continue;
                                }
                                row = tbl.insertRow(tbl.rows.length);
                                cell = row.insertCell(0);
                                cell.innerHTML = tid + 1;
                                cell = row.insertCell(1);
                                cell.innerHTML = obj["name"+tid].trim();
                                cell = row.insertCell(2);
                                if (obj["mode"+tid] == "Black") {
                                    cell.innerHTML = "<%tcWebApi_get("String_Entry","BlackListText","s")%>";
                                }
                                else if (obj["mode"+tid] == "White") {
                                    cell.innerHTML = "<%tcWebApi_get("String_Entry","WhiteListText","s")%>"
                                }
                                cell.id = "tmp_type" + tid;
                                cell = row.insertCell(3);
                                cell.innerHTML = obj["start"+tid].trim();
                                cell.id = "starttime" + tid;
                                cell = row.insertCell(4);
                                cell.innerHTML = obj["end"+tid].trim();
                                cell.id = "endtime" + tid;
                                cell = row.insertCell(5);
                                week = obj["repeat"+tid].split(",",7);
                                if (week.length == 7) {
                                    tmp = "<% tcwebApi_get("String_Entry", "SchedulingSettingEverydayText","s") %>";
                                }
                                else {
                                    tmp = "";
                                    for (i = 0; i < week.length; i++)
                                    {
                                        tmp += (arr_weekdays_str[parseInt(week[i])] + ", ")
                                    }
                                    tmp = tmp.slice(0,-2);
                                }
                                arTemplateRepeat[tid] = obj["repeat"+tid];
                                cell.innerHTML = tmp;
                                cell = row.insertCell(6);
                                tmp = "";
                                count = 0;
                                for (i = 0; i < max_templates;i++) {
                                    if ((obj["addr"+ tid +"_" + i].trim() != "") && (obj["addr"+ tid +"_" + i].trim() != "no node information")) {
                                        if (count <= 5) {
                                            tmp += (obj["addr"+ tid +"_" + i].trim() + ", ")
                                            count++;
                                        }
                                        if (count > 5) {
                                            count = 10;
                                        }                                       
                                    }
                                }
                                if (tmp.length == 0) {
                                    tmp = "N/A";
                                }
                                else {
                                    tmp = tmp.slice(0,-2);
                                    if (count == 10)
                                        tmp += " ...";
                                }
                                cell.innerHTML = tmp;
                                cell = row.insertCell(7);
                                cell.innerHTML += "<em data-toggle='tooltip' data-placement='top' title='<%tcWebApi_get("String_Entry","ButtonEditText","s")%>' class='fa fa-pencil-alt icon-btn icon-btn-edit' onclick='doEdit(" + tid + ")' /></em> ";
                                if (tid != 0) {
                                    cell.innerHTML += "<em data-toggle='tooltip' data-placement='top' title='<%tcWebApi_get("String_Entry","ButtonDeleteTextLower","s")%>' class='fa fa-times icon-btn icon-btn-delete' onclick='doDelete(" + tid + ")' /></em> ";
                                }
                            }
                        }
                    catch(err){ }
                    }
                }
            )
            }
            function get_first_empty_entry() {          
                var i;
                for (i=0; i < max_rules; i++) {
                    if (hasRule[i] != 1) {
                        return i;
                    }
                }
                return -1;
            }
            function change_color() {
                var i = get_first_empty_entry();
                $("#rule10").removeClass("odd_tr even_tr");
                if (i%2) {
                    $("#rule10").addClass("even_tr");
                }
                else {
                    $("#rule10").addClass("odd_tr");
                }
            }
            function rearrange_rules() {
                var i,j;
                for (i = 0; i < max_rules; i++) {
                    if (hasRule[i] == 1) {
                        $('#rule'+i).show();
                    }
                    else {
                        for (j = i+1; j<max_rules;j++) {
                            if (hasRule[j] == 1) {
                                $("#DevName"+i).val($("#DevName"+j).val());
                                $("#Mac"+i).val($("#Mac"+j).val());
                                $("#Template"+i).val($("#Template"+j).val());
                                hasRule[i] = 1;
                                hasRule[j] = 0;
                                $('#rule'+i).show();
                                $('#rule'+j).hide();
                                $("#DevName"+j).val("");
                                $("#Mac"+j).val("");
                                $("#Template"+j).val("0");
                                break;
                            }
                        }
                    }
                }
            }
            function doDeleteEntry(i) {
                $('#rule10').show();
                $('#rule'+i).hide();
                $('#DevName'+i).val("");
                $('#Mac'+i).val("");
                $('#Template'+i).val("0");
                hasRule[i] = 0;
                rearrange_rules();
                change_color();
            }
            function addNewEntry() {
                var i;
                i = get_first_empty_entry();
                if (i == (max_rules - 1)) {
                    $('#rule10').hide();
                }
                if (i < 0) {
                    alert("<%tcWebApi_get("String_Entry","FilterFull","s")%>");
                    return;
                }
                $('#rule'+i).show();
                $('#DevName'+i).val($('#DevName10').val());
                $('#Mac'+i).val($('#Mac10').val());
                $('#Template'+i).val($('#Template10').val());
                $('#DevName10').val("");
                $('#Mac10').val("");
                $('#Template10'+i).val("0");
                hasRule[i] = 1;
                change_color();
            }
            var a;
            function writeMac(obj) {
                obj.parentElement.previousElementSibling.value = obj.innerHTML.split(" ")[0];
            }
            function LoadParentalControl() {
                GetTemplateInfo();
                if (isFilterActive().length != 0) {
                    $("#FilterWarning").html(isFilterActive() + "<%tcWebApi_get("String_Entry","ParentalConflictAlertText0","s")%>"+ isFilterActive() + "<%tcWebApi_get("String_Entry","ParentalConflictAlertText1","s")%>");
                }
                var f = document.ParentalCtrl_form;
                var i;
                for (i=0;i<max_rules;i++) {
                    if ((arMacAddr[i].length != 0) && (arMacAddr[i] != "N/A")) {
                        $("#DevName"+i).val(arDeviceName[i]);
                        $("#Mac"+i).val(arMacAddr[i]);
                        $("#Template"+i).val(arTemplate[i]);
                        hasRule[i] = 1;
                    }
                    else {
                        arDeviceName[i] = "";
                        arMacAddr[i] = "";
                        arTemplate[i] = "1";
                        hasRule[i] = 0;
                    }
                }
                rearrange_rules();
                if (-1 == get_first_empty_entry()) {
                    $('#rule10').hide();
                }
                change_color();
                /* Get arp list */                                
                var index;
                var aryInfoTemp = "<% tcWebApi_get("Info_Ether","PortIP","s") %>";
                var PortIp = aryInfoTemp.split(',');
                var dhcpnum = PortIp.length - 1;
                aryInfoTemp = "<% tcWebApi_get("Info_Ether","PortMac","s") %>";
                aryInfoTemp += "<% tcWebApi_get("Info_Ether","PortMac2","s") %>";
                var PortMac = aryInfoTemp.split(',');
                aryInfoTemp = "<% tcWebApi_get("Info_Ether","HostName","s") %>";
                var PortHostName = aryInfoTemp.split(',');
                document.getElementById("MacList10").innerHTML = "";
                for(index = 0; index < dhcpnum; index++)
                {
                    if(PortIp[index] != "N/A" || PortMac[index] != "N/A")
                    {
                        if (!isValidIpAddress(PortIp[index])) {
                            continue; // skip Link local IP
                        }
                        document.getElementById("MacList10").innerHTML += ("<div>" + PortMac[index].toLowerCase() + " - " + PortHostName[index] + " - " + PortIp[index] + "</div>");
                    }		
                }
                if (document.getElementById("MacList10").innerHTML.length == 0)
                {
                    document.getElementById("MacList10").innerHTML += "<div></div>"
                }
                for (entry = 0; entry < 10; entry++) {
                    document.getElementById("MacList" + entry).innerHTML = document.getElementById("MacList10").innerHTML;
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
                //                         document.getElementById("MacList10").innerHTML = "";
                //                         index = 0;
                //                         for (index = 0; index < arConnectedIP.length; index ++) {
                //                         document.getElementById("MacList10").innerHTML += ("<div>" + arConnectedMac[index].toLowerCase() + " - " + arConnectedName[index] + " - " + arConnectedIP[index] + "</div>");
                //                         }
                //                         if (arConnectedIP.length == 0)
                //                         {
                //                             document.getElementById("MacList10").innerHTML += "<div></div>"
                //                         }
                //                         for (entry = 0; entry < 10; entry++) {
                //                             document.getElementById("MacList" + get2Digit(entry)).innerHTML = document.getElementById("MacList10").innerHTML;
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
            function hhmm_to_minute(hhmm) {
                var temp;
                temp = hhmm.split(":",2);
                return (parseInt(temp[0])*60 + parseInt(temp[1]));
            }
            function next_day(day) {
                if (day == 6)
                    return 0;
                else
                    return (day + 1);
            }
            function prev_day(day) {
                if (day == 0)
                    return 6;
                else
                    return (day - 1);
            }
            function isDuplicateTimeRange(this_id,that_id) {
                var thisIntRange = new Array(8);
                var thatIntRange = new Array(8);
                var week = new Array(7);
                var weekday;
                var startmm, endmm;
                var i,j;
                var point;
                var daycount = 0;
                /* Contruct thisIntRange */
                startmm = hhmm_to_minute($("#starttime" + this_id).html());
                endmm = hhmm_to_minute($("#endtime" + this_id).html());
                weekday = arTemplateRepeat[this_id].split(",",7);
                for (i = 0; i < 7; i++) {
                    week[i] = 0;
                }
                for (i = 0; i < weekday.length; i++) {
                    week[parseInt(weekday[i])] = 1;
                    daycount++;
                }
                point = 0;
                if (startmm < endmm) {
                    for (i = 0; i < 7; i++) {
                        if (week[i] == 1) {
                            thisIntRange[point] = [startmm + i*24*60, endmm + i*24*60];
                            point++;
                        }
                    }
                }
                if (startmm == endmm) {
                    if (daycount == 7) {
                        return true;
                    }
                    for (i = 0; i < 7; i++) {
                        if (week[i] == 1) {
                            /* Only start if rules are stopped */
                            if (0 == week[prev_day(i)]) {
                                thisIntRange[point] = new Array;
                                thisIntRange[point][0] = startmm + i*24*60;
                                point++;
                            }
                        }
                    }
                    point = 0;
                    for (i=0;i<7;i++){
                        if (week[i]) {
                            /* Stop if you don't wanna run the rules the next_day */
                            if (week[next_day(i)] == 0) {
                                thisIntRange[point][1] = endmm + (i+1)*24*60;
                                point++;
                            }
                        }
                    }
                }
                if (startmm > endmm) {
                    for (i = 0; i < 7; i++) {
                        if (week[i] == 1) {
                            thisIntRange[point] = new Array;
                            thisIntRange[point][0] = startmm + i*24*60;
                            point++;
                        }
                    }
                    point = 0;
                    for (i=0;i<7;i++){
                        if (week[i]) {
                            thisIntRange[point][1] = endmm + (i+1)*24*60;
                            point++;
                        }
                    }
                }
                if (thisIntRange[point-1][1] > 10080) {
                    thisIntRange[point] = [0, thisIntRange[point-1][1] - 10080];
                    thisIntRange[point-1][1] = 10080;
                }
                /* Contruct thatIntRange */
                startmm = hhmm_to_minute($("#starttime" + that_id).html());
                endmm = hhmm_to_minute($("#endtime" + that_id).html());
                weekday = arTemplateRepeat[that_id].split(",",7);
                for (i = 0; i < 7; i++) {
                    week[i] = 0;
                }
                daycount = 0;
                for (i = 0; i < weekday.length; i++) {
                    week[parseInt(weekday[i])] = 1;
                    daycount++;
                }
                point = 0;
                if (startmm < endmm) {
                    for (i = 0; i < 7; i++) {
                        if (week[i] == 1) {
                            thatIntRange[point] = [startmm + i*24*60, endmm + i*24*60];
                            point++;
                        }
                    }
                }
                if (startmm == endmm) {
                    if (daycount == 7) {
                        return true;
                    }
                    for (i = 0; i < 7; i++) {
                        if (week[i] == 1) {
                            /* Only start if rules are stopped */
                            if (0 == week[prev_day(i)]) {
                                thatIntRange[point] = new Array;
                                thatIntRange[point][0] = startmm + i*24*60;
                                point++;
                            }
                        }
                    }
                    point = 0;
                    for (i=0;i<7;i++){
                        if (week[i]) {
                            /* Stop if you don't wanna run the rules the next_day */
                            if (week[next_day(i)] == 0) {
                                thatIntRange[point][1] = endmm + (i+1)*24*60;
                                point++;
                            }
                        }
                    }
                }
                if (startmm > endmm) {
                    for (i = 0; i < 7; i++) {
                        if (week[i] == 1) {
                            thatIntRange[point] = new Array;
                            thatIntRange[point][0] = startmm + i*24*60;
                            point++;
                        }
                    }
                    point = 0;
                    for (i=0;i<7;i++){
                        if (week[i]) {
                            thatIntRange[point][1] = endmm + (i+1)*24*60;
                            point++;
                        }
                    }
                }
                if (thatIntRange[point-1][1] > 10080) {
                    thatIntRange[point] = [0, thatIntRange[point-1][1] - 10080];
                    thatIntRange[point-1][1] = 10080;
                }
                for (i = 0;i<8;i++) {
                    if (thisIntRange[i] == undefined) {
                        break;
                    }
                    for (j = 0;j<8;j++) {
                        if (thatIntRange[j] == undefined) {
                            break;
                        }
                        if ((thisIntRange[i][0] > thatIntRange[j][0]) && (thisIntRange[i][0] < thatIntRange[j][1])) {
                            return true;
                        }
                        if ((thisIntRange[i][1] > thatIntRange[j][0]) && (thisIntRange[i][1] < thatIntRange[j][1])) {
                            return true;
                        }
                        if ((thatIntRange[j][0] > thisIntRange[i][0]) && (thatIntRange[j][0] < thisIntRange[i][1])) {
                            return true;
                        }
                        if ((thatIntRange[j][1] > thisIntRange[i][0]) && (thatIntRange[j][1] < thisIntRange[i][1])) {
                            return true;
                        }
                    }
                }
                return false;
            } 
            function ip2int(ip) {
                return ip.split('.').reduce(function(ipInt, octet) { return (ipInt<<8) + parseInt(octet, 10)}, 0) >>> 0;
            }
            function isinsubnet(ip, net_ip, mask) {
                if ((ip2int(ip)&ip2int(mask)) == (ip2int(net_ip)&ip2int(mask))) {
                    return true;
                }
                else {
                    return false;
                }
            }
            function doSubmit() {
                var f = document.ParentalCtrl_form;
                var i;
                var is_blocked;
                if (!document.ParentalCtrl_form.PrtStatus.checked) {
                    submitAsync('ParentalCtrl_form');
                    return;
                } 
                for (i = 0;i< max_rules;i++) {
                    if (hasRule[i] == 1) {
                        if (($('#DevName'+ i).val().trim().length == 0) && ($('#Mac'+i).val().trim().length == 0)) {
                            hasRule[i] = 0;
                            continue;
                        }
                        if ($('#DevName'+ i).val().trim().length == 0) {
                            $('#DevName'+ i).focus();
                            alert("<%tcWebApi_get("String_Entry","ParentalJS4Text","s")%>");
                            return;
                        }
                        if (!allLetter($('#DevName'+ i).val())) {
                            $('#DevName'+ i).focus();
                            alert("<%tcWebApi_get("String_Entry","ParentalJS10Text","s")%>");
                            return;
                        }
                        if (!doMACcheck($('#Mac'+ i))) {
                            $('#Mac'+ i).focus();
                            return;
                        }
                        <% if tcWebApi_get("MacFilter_Common","L2Active","h") = "Yes" then%>
                        var mac = $('#Mac'+ i).val().trim().toLowerCase();
                        <% if tcWebApi_get("MacFilter_Common","MacRuleType","h") = "Black" then%>
                            for (var j = 0; j < max_macfilter_rules; j++) {
                                if (arMACFilterEn[j] == "Yes") {
                                    if (arMACFilterAddr[j].trim().toLowerCase() == mac) {
                                        alert("<%tcWebApi_get("String_Entry","ParentalJS13Text","s")%>");
                                        $('#Mac'+ i).focus();
                                        return;
                                    }
                                }
                            }
                        <%end if%>
                        <% if tcWebApi_get("MacFilter_Common","MacRuleType","h") = "White" then%>
                            is_blocked = 1;
                            for (var j = 0; j < max_macfilter_rules; j++) {
                                if (arMACFilterEn[j] == "Yes") {
                                    if (arMACFilterAddr[j].trim().toLowerCase() == mac) {
                                        is_blocked = 0;
                                        break;
                                    }
                                }
                            }
                            if (is_blocked) {
                                alert("<%tcWebApi_get("String_Entry","ParentalJS13Text","s")%>");
                                $('#Mac'+ i).focus();
                                return;
                            }
                        <%end if%>
                        <% end if %>                        
                        for (var j=0;j<i;j++) {
                            if ($("#Mac"+ i).val() == $("#Mac"+ j).val())
                            {
                                alert("<%tcWebApi_get("String_Entry","ParentalDuplicateRuleText","s")%>");
                                $('#Mac'+ i).focus();
                                return;
                            }
                            if ($('#DevName'+ i).val() == $('#DevName'+ j).val())
                            {
                                alert("<%tcWebApi_get("String_Entry","ParentalJS16Text","s")%>");
                                $('#Mac10').focus();
                                return
                            }
                        }
                    }
                } 
                rearrange_rules();
                if (($('#DevName10').val().trim().length != 0) || ($('#Mac10').val().trim().length != 0)) {
                    if (!doMACcheck($('#Mac10'))) {
                        $('#Mac10').focus();
                        return;
                    }
                    <% if tcWebApi_get("MacFilter_Common","L2Active","h") = "Yes" then%>
                        var mac = $('#Mac10').val().trim().toLowerCase();
                        <% if tcWebApi_get("MacFilter_Common","MacRuleType","h") = "Black" then%>
                            for (var j = 0; j < max_macfilter_rules; j++) {
                                if (arMACFilterEn[j] == "Yes") {
                                    if (arMACFilterAddr[j].trim().toLowerCase() == mac) {
                                        alert("<%tcWebApi_get("String_Entry","ParentalJS13Text","s")%>");
                                        $('#Mac10').focus();
                                        return;
                                    }
                                }
                            }
                        <% end if %>
                        <% if tcWebApi_get("MacFilter_Common","MacRuleType","h") = "White" then%>
                            is_blocked = 1;
                            for (var j = 0; j < max_macfilter_rules; j++) {
                                if (arMACFilterEn[j] == "Yes") {
                                    if (arMACFilterAddr[j].trim().toLowerCase() == mac) {
                                        is_blocked = 0;
                                        break;
                                    }
                                }
                            }
                            if (is_blocked) {
                                alert("<%tcWebApi_get("String_Entry","ParentalJS13Text","s")%>");
                                $('#Mac10').focus();
                                return;
                            }
                        <% end if %>
                    <% end if %> 
                    if ($('#DevName10').val().trim().length == 0) {
                        $('#DevName10').focus();
                        alert("<%tcWebApi_get("String_Entry","ParentalJS4Text","s")%>");
                        return;
                    }
                    if (!allLetter($('#DevName10').val())) {
                        $('#DevName10').focus();
                        alert("<%tcWebApi_get("String_Entry","ParentalJS10Text","s")%>");
                        return;
                    }
                    i = get_first_empty_entry();
                    for (var j=0;j<i;j++) {
                        if ($('#Mac10').val() == $('#Mac'+ j).val())
                        {
                            alert("<%tcWebApi_get("String_Entry","ParentalDuplicateRuleText","s")%>");
                            $('#Mac10').focus();
                            return
                        }
                        if ($('#DevName10').val() == $('#DevName'+ j).val())
                        {
                            alert("<%tcWebApi_get("String_Entry","ParentalJS16Text","s")%>");
                            $('#Mac10').focus();
                            return
                        }
                    }
                    $('#DevName'+ i).val($('#DevName10').val());
                    $('#Mac'+ i).val($('#Mac10').val());
                    $('#Template'+ i).val($('#Template10').val());
                }
                var hasrule = 0;
                for (var i=0; i < max_rules; i++) {
                    if ($("#Mac" + i).val().length != 0){
                        hasrule++;
                        break;
                    }
                }
                submitAsync('ParentalCtrl_form');
            }
            function doEdit(idx) {
                if (isRulesChanged()) {
                    alert('<%tcWebApi_get("String_Entry","ParentalJS7Text","s")%>');
                    return;
                }
                $.ajax({
                    url: '/cgi-bin/set_parentaltmp.cgi?a=' + idx,
                    method: 'GET',
                    complete: function(res){
                        {
                            if (/iPad|iPhone|iPod/.test(navigator.userAgent) && !window.MSStream) {
                                Pace.stop();
                            }
                            var obj = JSON.parse(res.responseText);
                            if (obj["success"] == "yes")
                                location.href = "fw-prttemplate.asp";
                        }
                    }
                }
                )
            }
            function doDelete(idx) {
                if (isRulesChanged()) {
                    alert('<%tcWebApi_get("String_Entry","ParentalJS7Text","s")%>');
                    return;
                }
                for (var i = 0; i < max_rules;i++) {
                    if ($("#Template" + i).val() == (idx + 1)) {
                        alert("<%tcWebApi_get("String_Entry","ParentalJS1Text","s")%>");
                        return;
                    }
                }
                document.ParentalCtrl_form.PostFlag.value = "2";
                document.ParentalCtrl_form.deletetmp.value = idx;
                submitAsync('ParentalCtrl_form');                
            }
            function doAddTempate() {
                if (isRulesChanged()) {
                    alert('<%tcWebApi_get("String_Entry","ParentalJS7Text","s")%>');
                    return;
                }
                if ($("#tmp_list")[0].children.length > 9) {
                    alert("<%tcWebApi_get("String_Entry","ParentalJS2Text","s")%>");
                    return;
                }
                $.ajax({
                    url: '/cgi-bin/set_parentaltmp.cgi?a=' + 99,
                    method: 'GET',
                    complete: function(res){
                        {
                            if (/iPad|iPhone|iPod/.test(navigator.userAgent) && !window.MSStream) {
                                Pace.stop();
                            }
                            var obj = JSON.parse(res.responseText);
                            if (obj["success"] == "yes")
                                location.href = "fw-prttemplate.asp";
                        }
                    }
                }
                )
            }
            function show_suggestion(id) {
                $("#MacList"+id).show();
                var child_list = $("#MacList" + id).children();
                var len = child_list.length;
                for (var i = 0; i < len; i ++) {
                    child_list[i].style.display = "block";
                }
            }
            function hide_suggestion(id) {
                $("#MacList" + id).hide();
            }
            function hide_all_suggestion(exception) {
                for (var i = 0; i <= 10; i++) {
                        if (i != exception)
                            $("#MacList" + i).hide();
                    }
            }
            function oninput_mac(id) {
                var string = $("#Mac" + id).val();
                var child_list = $("#MacList" + id).children();
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
    <body class="container" onload="LoadParentalControl();">
<header class="fixed-top"><nav id="top-nav" class="navbar navbar-expand-lg container"><a class="navbar-brand " href="/cgi-bin/home.asp"><div><img src="/img/logo_home.png" width="100" height="18" alt=""><div style="font-family: sans-serif; font-weight: bold;font-size: 12px;color: #000; margin-top: 0">OPTICAL NETWORK TERMINATION</div></div></a><button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"><em class="fas fa-align-justify"></em></span></button><div class="collapse navbar-collapse" id="navbarCollapse"><ul class="navbar-nav mr-auto sidenav" id="navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/home.asp"><%tcWebApi_get("String_Entry","NavigationHomeText","s")%><span class="sr-only"></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/deviceinfo.asp"><%tcWebApi_get("String_Entry","NavigationStatusDeviceText","s")%><span class="sr-only"></span></a></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#status-menu" aria-controls="status-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NavigationStatusStatisticsText","s")%></a><ul class="nav-second-level collapse" id="status-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/sta-statistics.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationTrafficText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/sta-wifiusers.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationStatusUsersText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/sta-users.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","ARPStatusText","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#network-menu" aria-controls="network-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NAVNetwork","s")%></a><ul class="nav-second-level collapse" id="network-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/net-wan.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationBasInternetText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/net-lan.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationBasLANText","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#wifi-menu" aria-controls="wifi-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NAVWifi","s")%></a><ul class="nav-second-level collapse" id="wifi-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/wifi.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationWiFiSettingsText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/wifi-11ac.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationWiFi11acSettingsText","s")%></span></a></li></ul></li><li class="nav-item active"><a class="nav-link nav-link-collapse nav-link-show" href="#" id="hasSubItems" data-toggle="collapse" data-target="#firewall-menu" aria-controls="firewall-menu" aria-expanded="true"><%tcWebApi_get("String_Entry","NavigationAdvFirewallText","s")%></a><ul class="nav-second-level show" id="firewall-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-spi.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","ContentFirewallText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-urlfilter.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","FILTERTYPE_index2","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-macfilter.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVL2Filter","s")%></span></a></li><li class="nav-item active"><a class="nav-link" href="/cgi-bin/fw-parentalcontrol.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","ParentalControlText","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#apps-menu" aria-controls="apps-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NAVApplication","s")%></a><ul class="nav-second-level collapse" id="apps-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-dmz.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NatTopDMZText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-portforwarding.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NatVirsvrText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-sslim.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","SessionLimit","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-route.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","StaticRouteText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-ddns.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","dyDNS1Text","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#tools-menu" aria-controls="tools-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NavigationMaintenanceText","s")%></a><ul class="nav-second-level collapse" id="tools-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-admin.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationMainAdminText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-time.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVSysTime","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-firmware.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationMainFirmwareText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-config.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVConfig","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-diagnostic.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationMainDiagnosticsText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-log.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVLogs","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-reboot.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","RebootText","s")%></span></a></li></ul></li></ul><div class="top-item-groups"><form name="LanguageForm" method="POST" action="/cgi-bin/fw-parentalcontrol.asp" class="nav-item dropdown"><input type="hidden" name="TokenString" value="<%tcWebApi_getToken()%>"><input type="hidden" name="Language_Flag" value="<% tcWebApi_get("LanguageSwitch_Entry","Type","s") %>"><a class="nav-link dropdown-toggle" href="#" id="LanguageDropdown" role="button" data-toggle="dropdown" aria-expanded="false"><% tcWebApi_get("String_Entry","LoginLanguage","s") %></a><ul class="dropdown-menu" aria-labelledby="LanguageDropdown"><li><a class="dropdown-item <% if tcWebApi_get("LanguageSwitch_Entry","Type","h") = "1" then asp_Write("active") end if %>" href="#" onclick="submitLanguageForm(1);"><% tcWebApi_get("String_Entry","LanguageVIELong","s") %></a></li><li><a class="dropdown-item <% if tcWebApi_get("LanguageSwitch_Entry","Type","h") = "2" then asp_Write("active") end if %>" href="#" onclick="submitLanguageForm(2);"><% tcWebApi_get("String_Entry","LanguageENGLong","s") %></a></li></ul></form><div id="signout" class="nav-item"><a class="nav-link" href="javascript:doLogout();"><em class="fa fa-sign-out-alt"></em><span class="nav-link-text"><% tcWebApi_get("String_Entry","LogoutText","s") %></span></a></div></div></div></header></nav><% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then
	if tcWebApi_get("Mesh_Common", "DeviceRole", "h") = "2" then %>
		<script language='javascript'>
		document.getElementById("wifi-menu").children[0].style="display: none";
		document.getElementById("wifi-menu").children[1].style="display: none";
		</script>
<% end if end if %>		<div id="content">
			<form class="form-inline" name="ParentalCtrl_form" id="ParentalCtrl_form" action="/cgi-bin/fw-parentalcontrol.asp" method=post>
			<INPUT TYPE="HIDDEN" NAME="TokenString" VALUE="<%tcWebApi_getToken()%>">
			<INPUT type=hidden name="c2Support" id="c2Support" VALUE="0">
			<input type="hidden" name="PostFlag" id="PostFlag" value="1" />
			<input type="hidden" name="deletetmp" id="deletetmp" value="1" />
			<div class="row row-w-100">
				<div class="widget col-xs-12 col-lg-12">
					<header><%tcWebApi_get("String_Entry","ParentalControlText","s")%></header>
					<div class="widget-body">
					<fieldset>
						<legend><%tcWebApi_get("String_Entry","ParentalEnableText","s")%></legend>
						<div class="form-group">
							<label class="col-xs-12 col-sm-4 control-label"><%tcWebApi_get("String_Entry","ParentalEnableText","s")%></label>
							<label class="toggle-switch">
								<input type="checkbox" name="PrtStatus" id="PrtStatus" onChange="ParentalSwitch();" value="1" <% If TCWebApi_get("ParentalCtrl_Common","Status","h") = "Enable" then asp_Write("checked") end if%>>
								<span class="slider"></span>
							</label>
						</div>
						<div class="form-group" style="display:none" >
							<div class="col-xs-12 col-sm-7 offset-sm-4 info-text" id="FilterWarning" <% If TCWebApi_get("ParentalCtrl_Common","Status","h") <> "Enable" then%> <%end if%>></div>
						</div>
					</fieldset>
					<div id ="parental-enable-div" <% If TCWebApi_get("ParentalCtrl_Common","Status","h") <> "Enable" then%> style="display:none" <%end if%>>
						<fieldset>
							<div class="form-group">
								<label class="col-xs-12 col-sm-4 control-label"><%tcWebApi_get("String_Entry","IPFilterRuleTypeSelectionText","s")%></label>
								<div class="table-responsive col-xs-12 col-sm-10" style="float: none; margin: 0 auto; text-align: center; padding-bottom: 30px;">
									<table id="rule_list" name="rule_list" cellpadding="0" cellspacing="0" class="table-bordered-radius simple-table" style="width:100%">
										<thead>
											<tr class="thead-light" style="text-align: center;">
												<th><%tcWebApi_get("String_Entry","ParentalDeviceNameText","s")%></th>
												<th><%tcWebApi_get("String_Entry","ParentalMACAddressText","s")%></th>
												<th><%tcWebApi_get("String_Entry","PrtTemplateText","s")%></th>
												<th><%tcWebApi_get("String_Entry","FilterCgiAction","s")%></th>
											</tr>
										</thead>
										<tbody>
											<tr id="rule0" style="display: none; text-align: center;">
												<td>
													<INPUT type="text" maxLength=20 size=20 name="DevName0" id="DevName0">
												</td>
												<td>
													<div style="margin: 0 auto; ">
														<INPUT type="text" maxLength=17 size=17 name="Mac0" id="Mac0" onfocusin="show_suggestion(0);" onfocusout="setTimeout(hide_suggestion,500,0);" oninput="oninput_mac(0);">
														<div id="MacList0" class="suggestion_popup"></div>
													</div>
												</td>
												<td>
													<SELECT NAME="Template0" id="Template0" >
														<% If tcWebApi_get("ParentalCtrl_Template_Entry0","Enable","h") = "Yes" then %>
														<OPTION value="1">1. <%tcWebApi_get("ParentalCtrl_Template_Entry0","TemplateName","s")%></OPTION>
														<% End If %>
														<% If tcWebApi_get("ParentalCtrl_Template_Entry1","Enable","h") = "Yes" then %>
														<OPTION value="2">2. <%tcWebApi_get("ParentalCtrl_Template_Entry1","TemplateName","s")%></OPTION>
														<% End If %>
														<% If tcWebApi_get("ParentalCtrl_Template_Entry2","Enable","h") = "Yes" then %>
														<OPTION value="3">3. <%tcWebApi_get("ParentalCtrl_Template_Entry2","TemplateName","s")%></OPTION>
														<% End If %>
														<% If tcWebApi_get("ParentalCtrl_Template_Entry3","Enable","h") = "Yes" then %>
														<OPTION value="4">4. <%tcWebApi_get("ParentalCtrl_Template_Entry3","TemplateName","s")%></OPTION>
														<% End If %>
														<% If tcWebApi_get("ParentalCtrl_Template_Entry4","Enable","h") = "Yes" then %>
														<OPTION value="5">5. <%tcWebApi_get("ParentalCtrl_Template_Entry4","TemplateName","s")%></OPTION>
														<% End If %>
														<% If tcWebApi_get("ParentalCtrl_Template_Entry5","Enable","h") = "Yes" then %>
														<OPTION value="6">6. <%tcWebApi_get("ParentalCtrl_Template_Entry5","TemplateName","s")%></OPTION>
														<% End If %>
														<% If tcWebApi_get("ParentalCtrl_Template_Entry6","Enable","h") = "Yes" then %>
														<OPTION value="7">7. <%tcWebApi_get("ParentalCtrl_Template_Entry6","TemplateName","s")%></OPTION>
														<% End If %>
														<% If tcWebApi_get("ParentalCtrl_Template_Entry7","Enable","h") = "Yes" then %>
														<OPTION value="8">8. <%tcWebApi_get("ParentalCtrl_Template_Entry7","TemplateName","s")%></OPTION>
														<% End If %>
														<% If tcWebApi_get("ParentalCtrl_Template_Entry8","Enable","h") = "Yes" then %>
														<OPTION value="9">9. <%tcWebApi_get("ParentalCtrl_Template_Entry8","TemplateName","s")%></OPTION>
														<% End If %>
														<% If tcWebApi_get("ParentalCtrl_Template_Entry9","Enable","h") = "Yes" then %>
														<OPTION value="10">10. <%tcWebApi_get("ParentalCtrl_Template_Entry9","TemplateName","s")%></OPTION>
														<% End If %>
													</SELECT>
												</td>
												<td>
													<i class='fas fa-times icon-btn-delete fa-lg' onmouseover='this.style.cursor="hand"' onclick='doDeleteEntry(0)'></i>
												</td>
											</tr>
											<tr id="rule1" style="display: none; text-align: center;">
												<td>
													<INPUT type="text" maxLength=20 size=20 name="DevName1" id="DevName1">
												</td>
												<td>
													<div style="margin: 0 auto; ">
														<INPUT type="text" maxLength=17 size=17 name="Mac1" id="Mac1" onfocusin="show_suggestion(1);" onfocusout="setTimeout(hide_suggestion,500,1);" oninput="oninput_mac(1);">
														<div id="MacList1" class="suggestion_popup"></div>
													</div>
												</td>
												<td>
													<SELECT NAME="Template1" id="Template1" >
														<% If tcWebApi_get("ParentalCtrl_Template_Entry0","Enable","h") = "Yes" then %>
														<OPTION value="1">1. <%tcWebApi_get("ParentalCtrl_Template_Entry0","TemplateName","s")%></OPTION>
														<% End If %>
														<% If tcWebApi_get("ParentalCtrl_Template_Entry1","Enable","h") = "Yes" then %>
														<OPTION value="2">2. <%tcWebApi_get("ParentalCtrl_Template_Entry1","TemplateName","s")%></OPTION>
														<% End If %>
														<% If tcWebApi_get("ParentalCtrl_Template_Entry2","Enable","h") = "Yes" then %>
														<OPTION value="3">3. <%tcWebApi_get("ParentalCtrl_Template_Entry2","TemplateName","s")%></OPTION>
														<% End If %>
														<% If tcWebApi_get("ParentalCtrl_Template_Entry3","Enable","h") = "Yes" then %>
														<OPTION value="4">4. <%tcWebApi_get("ParentalCtrl_Template_Entry3","TemplateName","s")%></OPTION>
														<% End If %>
														<% If tcWebApi_get("ParentalCtrl_Template_Entry4","Enable","h") = "Yes" then %>
														<OPTION value="5">5. <%tcWebApi_get("ParentalCtrl_Template_Entry4","TemplateName","s")%></OPTION>
														<% End If %>
														<% If tcWebApi_get("ParentalCtrl_Template_Entry5","Enable","h") = "Yes" then %>
														<OPTION value="6">6. <%tcWebApi_get("ParentalCtrl_Template_Entry5","TemplateName","s")%></OPTION>
														<% End If %>
														<% If tcWebApi_get("ParentalCtrl_Template_Entry6","Enable","h") = "Yes" then %>
														<OPTION value="7">7. <%tcWebApi_get("ParentalCtrl_Template_Entry6","TemplateName","s")%></OPTION>
														<% End If %>
														<% If tcWebApi_get("ParentalCtrl_Template_Entry7","Enable","h") = "Yes" then %>
														<OPTION value="8">8. <%tcWebApi_get("ParentalCtrl_Template_Entry7","TemplateName","s")%></OPTION>
														<% End If %>
														<% If tcWebApi_get("ParentalCtrl_Template_Entry8","Enable","h") = "Yes" then %>
														<OPTION value="9">9. <%tcWebApi_get("ParentalCtrl_Template_Entry8","TemplateName","s")%></OPTION>
														<% End If %>
														<% If tcWebApi_get("ParentalCtrl_Template_Entry9","Enable","h") = "Yes" then %>
														<OPTION value="10">10. <%tcWebApi_get("ParentalCtrl_Template_Entry9","TemplateName","s")%></OPTION>
														<% End If %>
													</SELECT>
												</td>
												<td>
													<i class='fas fa-times icon-btn-delete fa-lg' onmouseover='this.style.cursor="hand"' onclick='doDeleteEntry(1)'></i>
												</td>
											</tr>
											<tr id="rule2" style="display: none; text-align: center;">
												<td>
													<INPUT type="text" maxLength=20 size=20 name="DevName2" id="DevName2">
												</td>
												<td>
													<div style="margin: 0 auto; ">
														<INPUT type="text" maxLength=17 size=17 name="Mac2" id="Mac2" onfocusin="show_suggestion(2);" onfocusout="setTimeout(hide_suggestion,500,2);" oninput="oninput_mac(2);">
														<div id="MacList2" class="suggestion_popup"></div>
													</div>
												</td>
												<td>
													<SELECT NAME="Template2" id="Template2" >
														<% If tcWebApi_get("ParentalCtrl_Template_Entry0","Enable","h") = "Yes" then %>
														<OPTION value="1">1. <%tcWebApi_get("ParentalCtrl_Template_Entry0","TemplateName","s")%></OPTION>
														<% End If %>
														<% If tcWebApi_get("ParentalCtrl_Template_Entry1","Enable","h") = "Yes" then %>
														<OPTION value="2">2. <%tcWebApi_get("ParentalCtrl_Template_Entry1","TemplateName","s")%></OPTION>
														<% End If %>
														<% If tcWebApi_get("ParentalCtrl_Template_Entry2","Enable","h") = "Yes" then %>
														<OPTION value="3">3. <%tcWebApi_get("ParentalCtrl_Template_Entry2","TemplateName","s")%></OPTION>
														<% End If %>
														<% If tcWebApi_get("ParentalCtrl_Template_Entry3","Enable","h") = "Yes" then %>
														<OPTION value="4">4. <%tcWebApi_get("ParentalCtrl_Template_Entry3","TemplateName","s")%></OPTION>
														<% End If %>
														<% If tcWebApi_get("ParentalCtrl_Template_Entry4","Enable","h") = "Yes" then %>
														<OPTION value="5">5. <%tcWebApi_get("ParentalCtrl_Template_Entry4","TemplateName","s")%></OPTION>
														<% End If %>
														<% If tcWebApi_get("ParentalCtrl_Template_Entry5","Enable","h") = "Yes" then %>
														<OPTION value="6">6. <%tcWebApi_get("ParentalCtrl_Template_Entry5","TemplateName","s")%></OPTION>
														<% End If %>
														<% If tcWebApi_get("ParentalCtrl_Template_Entry6","Enable","h") = "Yes" then %>
														<OPTION value="7">7. <%tcWebApi_get("ParentalCtrl_Template_Entry6","TemplateName","s")%></OPTION>
														<% End If %>
														<% If tcWebApi_get("ParentalCtrl_Template_Entry7","Enable","h") = "Yes" then %>
														<OPTION value="8">8. <%tcWebApi_get("ParentalCtrl_Template_Entry7","TemplateName","s")%></OPTION>
														<% End If %>
														<% If tcWebApi_get("ParentalCtrl_Template_Entry8","Enable","h") = "Yes" then %>
														<OPTION value="9">9. <%tcWebApi_get("ParentalCtrl_Template_Entry8","TemplateName","s")%></OPTION>
														<% End If %>
														<% If tcWebApi_get("ParentalCtrl_Template_Entry9","Enable","h") = "Yes" then %>
														<OPTION value="10">10. <%tcWebApi_get("ParentalCtrl_Template_Entry9","TemplateName","s")%></OPTION>
														<% End If %>
													</SELECT>
												</td>
												<td>
													<i class='fas fa-times icon-btn-delete fa-lg' onmouseover='this.style.cursor="hand"' onclick='doDeleteEntry(2)'></i>
												</td>
											</tr>
											<tr id="rule3" style="display: none; text-align: center;">
												<td>
													<INPUT type="text" maxLength=20 size=20 name="DevName3" id="DevName3">
												</td>
												<td>
													<div style="margin: 0 auto; ">
														<INPUT type="text" maxLength=17 size=17 name="Mac3" id="Mac3" onfocusin="show_suggestion(3);" onfocusout="setTimeout(hide_suggestion,500,3);" oninput="oninput_mac(3);">
														<div id="MacList3" class="suggestion_popup"></div>
													</div>
												</td>
												<td>
													<SELECT NAME="Template3" id="Template3" >
														<% If tcWebApi_get("ParentalCtrl_Template_Entry0","Enable","h") = "Yes" then %>
														<OPTION value="1">1. <%tcWebApi_get("ParentalCtrl_Template_Entry0","TemplateName","s")%></OPTION>
														<% End If %>
														<% If tcWebApi_get("ParentalCtrl_Template_Entry1","Enable","h") = "Yes" then %>
														<OPTION value="2">2. <%tcWebApi_get("ParentalCtrl_Template_Entry1","TemplateName","s")%></OPTION>
														<% End If %>
														<% If tcWebApi_get("ParentalCtrl_Template_Entry2","Enable","h") = "Yes" then %>
														<OPTION value="3">3. <%tcWebApi_get("ParentalCtrl_Template_Entry2","TemplateName","s")%></OPTION>
														<% End If %>
														<% If tcWebApi_get("ParentalCtrl_Template_Entry3","Enable","h") = "Yes" then %>
														<OPTION value="4">4. <%tcWebApi_get("ParentalCtrl_Template_Entry3","TemplateName","s")%></OPTION>
														<% End If %>
														<% If tcWebApi_get("ParentalCtrl_Template_Entry4","Enable","h") = "Yes" then %>
														<OPTION value="5">5. <%tcWebApi_get("ParentalCtrl_Template_Entry4","TemplateName","s")%></OPTION>
														<% End If %>
														<% If tcWebApi_get("ParentalCtrl_Template_Entry5","Enable","h") = "Yes" then %>
														<OPTION value="6">6. <%tcWebApi_get("ParentalCtrl_Template_Entry5","TemplateName","s")%></OPTION>
														<% End If %>
														<% If tcWebApi_get("ParentalCtrl_Template_Entry6","Enable","h") = "Yes" then %>
														<OPTION value="7">7. <%tcWebApi_get("ParentalCtrl_Template_Entry6","TemplateName","s")%></OPTION>
														<% End If %>
														<% If tcWebApi_get("ParentalCtrl_Template_Entry7","Enable","h") = "Yes" then %>
														<OPTION value="8">8. <%tcWebApi_get("ParentalCtrl_Template_Entry7","TemplateName","s")%></OPTION>
														<% End If %>
														<% If tcWebApi_get("ParentalCtrl_Template_Entry8","Enable","h") = "Yes" then %>
														<OPTION value="9">9. <%tcWebApi_get("ParentalCtrl_Template_Entry8","TemplateName","s")%></OPTION>
														<% End If %>
														<% If tcWebApi_get("ParentalCtrl_Template_Entry9","Enable","h") = "Yes" then %>
														<OPTION value="10">10. <%tcWebApi_get("ParentalCtrl_Template_Entry9","TemplateName","s")%></OPTION>
														<% End If %>
													</SELECT>
												</td>
												<td>
													<i class='fas fa-times icon-btn-delete fa-lg' onmouseover='this.style.cursor="hand"' onclick='doDeleteEntry(3)'></i>
												</td>
											</tr>
											<tr id="rule4" style="display: none; text-align: center;">
												<td>
													<INPUT type="text" maxLength=20 size=20 name="DevName4" id="DevName4">
												</td>
												<td>
													<div style="margin: 0 auto; ">
														<INPUT type="text" maxLength=17 size=17 name="Mac4" id="Mac4" onfocusin="show_suggestion(4);" onfocusout="setTimeout(hide_suggestion,500,4);" oninput="oninput_mac(4);">
														<div id="MacList4" class="suggestion_popup"></div>
													</div>
												</td>
												<td>
													<SELECT NAME="Template4" id="Template4" >
														<% If tcWebApi_get("ParentalCtrl_Template_Entry0","Enable","h") = "Yes" then %>
														<OPTION value="1">1. <%tcWebApi_get("ParentalCtrl_Template_Entry0","TemplateName","s")%></OPTION>
														<% End If %>
														<% If tcWebApi_get("ParentalCtrl_Template_Entry1","Enable","h") = "Yes" then %>
														<OPTION value="2">2. <%tcWebApi_get("ParentalCtrl_Template_Entry1","TemplateName","s")%></OPTION>
														<% End If %>
														<% If tcWebApi_get("ParentalCtrl_Template_Entry2","Enable","h") = "Yes" then %>
														<OPTION value="3">3. <%tcWebApi_get("ParentalCtrl_Template_Entry2","TemplateName","s")%></OPTION>
														<% End If %>
														<% If tcWebApi_get("ParentalCtrl_Template_Entry3","Enable","h") = "Yes" then %>
														<OPTION value="4">4. <%tcWebApi_get("ParentalCtrl_Template_Entry3","TemplateName","s")%></OPTION>
														<% End If %>
														<% If tcWebApi_get("ParentalCtrl_Template_Entry4","Enable","h") = "Yes" then %>
														<OPTION value="5">5. <%tcWebApi_get("ParentalCtrl_Template_Entry4","TemplateName","s")%></OPTION>
														<% End If %>
														<% If tcWebApi_get("ParentalCtrl_Template_Entry5","Enable","h") = "Yes" then %>
														<OPTION value="6">6. <%tcWebApi_get("ParentalCtrl_Template_Entry5","TemplateName","s")%></OPTION>
														<% End If %>
														<% If tcWebApi_get("ParentalCtrl_Template_Entry6","Enable","h") = "Yes" then %>
														<OPTION value="7">7. <%tcWebApi_get("ParentalCtrl_Template_Entry6","TemplateName","s")%></OPTION>
														<% End If %>
														<% If tcWebApi_get("ParentalCtrl_Template_Entry7","Enable","h") = "Yes" then %>
														<OPTION value="8">8. <%tcWebApi_get("ParentalCtrl_Template_Entry7","TemplateName","s")%></OPTION>
														<% End If %>
														<% If tcWebApi_get("ParentalCtrl_Template_Entry8","Enable","h") = "Yes" then %>
														<OPTION value="9">9. <%tcWebApi_get("ParentalCtrl_Template_Entry8","TemplateName","s")%></OPTION>
														<% End If %>
														<% If tcWebApi_get("ParentalCtrl_Template_Entry9","Enable","h") = "Yes" then %>
														<OPTION value="10">10. <%tcWebApi_get("ParentalCtrl_Template_Entry9","TemplateName","s")%></OPTION>
														<% End If %>
													</SELECT>
												</td>
												<td>
													<i class='fas fa-times icon-btn-delete fa-lg' onmouseover='this.style.cursor="hand"' onclick='doDeleteEntry(4)'></i>
												</td>
											</tr>
											<tr id="rule5" style="display: none; text-align: center;">
												<td>
													<INPUT type="text" maxLength=20 size=20 name="DevName5" id="DevName5">
												</td>
												<td>
													<div style="margin: 0 auto; ">
														<INPUT type="text" maxLength=17 size=17 name="Mac5" id="Mac5" onfocusin="show_suggestion(5);" onfocusout="setTimeout(hide_suggestion,500,5);" oninput="oninput_mac(5);">
														<div id="MacList5" class="suggestion_popup"></div>
													</div>
												</td>
												<td>
													<SELECT NAME="Template5" id="Template5" >
														<% If tcWebApi_get("ParentalCtrl_Template_Entry0","Enable","h") = "Yes" then %>
														<OPTION value="1">1. <%tcWebApi_get("ParentalCtrl_Template_Entry0","TemplateName","s")%></OPTION>
														<% End If %>
														<% If tcWebApi_get("ParentalCtrl_Template_Entry1","Enable","h") = "Yes" then %>
														<OPTION value="2">2. <%tcWebApi_get("ParentalCtrl_Template_Entry1","TemplateName","s")%></OPTION>
														<% End If %>
														<% If tcWebApi_get("ParentalCtrl_Template_Entry2","Enable","h") = "Yes" then %>
														<OPTION value="3">3. <%tcWebApi_get("ParentalCtrl_Template_Entry2","TemplateName","s")%></OPTION>
														<% End If %>
														<% If tcWebApi_get("ParentalCtrl_Template_Entry3","Enable","h") = "Yes" then %>
														<OPTION value="4">4. <%tcWebApi_get("ParentalCtrl_Template_Entry3","TemplateName","s")%></OPTION>
														<% End If %>
														<% If tcWebApi_get("ParentalCtrl_Template_Entry4","Enable","h") = "Yes" then %>
														<OPTION value="5">5. <%tcWebApi_get("ParentalCtrl_Template_Entry4","TemplateName","s")%></OPTION>
														<% End If %>
														<% If tcWebApi_get("ParentalCtrl_Template_Entry5","Enable","h") = "Yes" then %>
														<OPTION value="6">6. <%tcWebApi_get("ParentalCtrl_Template_Entry5","TemplateName","s")%></OPTION>
														<% End If %>
														<% If tcWebApi_get("ParentalCtrl_Template_Entry6","Enable","h") = "Yes" then %>
														<OPTION value="7">7. <%tcWebApi_get("ParentalCtrl_Template_Entry6","TemplateName","s")%></OPTION>
														<% End If %>
														<% If tcWebApi_get("ParentalCtrl_Template_Entry7","Enable","h") = "Yes" then %>
														<OPTION value="8">8. <%tcWebApi_get("ParentalCtrl_Template_Entry7","TemplateName","s")%></OPTION>
														<% End If %>
														<% If tcWebApi_get("ParentalCtrl_Template_Entry8","Enable","h") = "Yes" then %>
														<OPTION value="9">9. <%tcWebApi_get("ParentalCtrl_Template_Entry8","TemplateName","s")%></OPTION>
														<% End If %>
														<% If tcWebApi_get("ParentalCtrl_Template_Entry9","Enable","h") = "Yes" then %>
														<OPTION value="10">10. <%tcWebApi_get("ParentalCtrl_Template_Entry9","TemplateName","s")%></OPTION>
														<% End If %>
													</SELECT>
												</td>
												<td>
													<i class='fas fa-times icon-btn-delete fa-lg' onmouseover='this.style.cursor="hand"' onclick='doDeleteEntry(5)'></i>
												</td>
											</tr>
											<tr id="rule6" style="display: none; text-align: center;">
												<td>
													<INPUT type="text" maxLength=20 size=20 name="DevName6" id="DevName6">
												</td>
												<td>
													<div style="margin: 0 auto; ">
														<INPUT type="text" maxLength=17 size=17 name="Mac6" id="Mac6" onfocusin="show_suggestion(6);" onfocusout="setTimeout(hide_suggestion,500,6);" oninput="oninput_mac(6);">
														<div id="MacList6" class="suggestion_popup"></div>
													</div>
												</td>
												<td>
													<SELECT NAME="Template6" id="Template6" >
														<% If tcWebApi_get("ParentalCtrl_Template_Entry0","Enable","h") = "Yes" then %>
														<OPTION value="1">1. <%tcWebApi_get("ParentalCtrl_Template_Entry0","TemplateName","s")%></OPTION>
														<% End If %>
														<% If tcWebApi_get("ParentalCtrl_Template_Entry1","Enable","h") = "Yes" then %>
														<OPTION value="2">2. <%tcWebApi_get("ParentalCtrl_Template_Entry1","TemplateName","s")%></OPTION>
														<% End If %>
														<% If tcWebApi_get("ParentalCtrl_Template_Entry2","Enable","h") = "Yes" then %>
														<OPTION value="3">3. <%tcWebApi_get("ParentalCtrl_Template_Entry2","TemplateName","s")%></OPTION>
														<% End If %>
														<% If tcWebApi_get("ParentalCtrl_Template_Entry3","Enable","h") = "Yes" then %>
														<OPTION value="4">4. <%tcWebApi_get("ParentalCtrl_Template_Entry3","TemplateName","s")%></OPTION>
														<% End If %>
														<% If tcWebApi_get("ParentalCtrl_Template_Entry4","Enable","h") = "Yes" then %>
														<OPTION value="5">5. <%tcWebApi_get("ParentalCtrl_Template_Entry4","TemplateName","s")%></OPTION>
														<% End If %>
														<% If tcWebApi_get("ParentalCtrl_Template_Entry5","Enable","h") = "Yes" then %>
														<OPTION value="6">6. <%tcWebApi_get("ParentalCtrl_Template_Entry5","TemplateName","s")%></OPTION>
														<% End If %>
														<% If tcWebApi_get("ParentalCtrl_Template_Entry6","Enable","h") = "Yes" then %>
														<OPTION value="7">7. <%tcWebApi_get("ParentalCtrl_Template_Entry6","TemplateName","s")%></OPTION>
														<% End If %>
														<% If tcWebApi_get("ParentalCtrl_Template_Entry7","Enable","h") = "Yes" then %>
														<OPTION value="8">8. <%tcWebApi_get("ParentalCtrl_Template_Entry7","TemplateName","s")%></OPTION>
														<% End If %>
														<% If tcWebApi_get("ParentalCtrl_Template_Entry8","Enable","h") = "Yes" then %>
														<OPTION value="9">9. <%tcWebApi_get("ParentalCtrl_Template_Entry8","TemplateName","s")%></OPTION>
														<% End If %>
														<% If tcWebApi_get("ParentalCtrl_Template_Entry9","Enable","h") = "Yes" then %>
														<OPTION value="10">10. <%tcWebApi_get("ParentalCtrl_Template_Entry9","TemplateName","s")%></OPTION>
														<% End If %>
													</SELECT>
												</td>
												<td>
													<i class='fas fa-times icon-btn-delete fa-lg' onmouseover='this.style.cursor="hand"' onclick='doDeleteEntry(6)'></i>
												</td>
											</tr>
											<tr id="rule7" style="display: none; text-align: center;">
												<td>
													<INPUT type="text" maxLength=20 size=20 name="DevName7" id="DevName7">
												</td>
												<td>
													<div style="margin: 0 auto; ">
														<INPUT type="text" maxLength=17 size=17 name="Mac7" id="Mac7" onfocusin="show_suggestion(7);" onfocusout="setTimeout(hide_suggestion,500,7);" oninput="oninput_mac(7);">
														<div id="MacList7" class="suggestion_popup"></div>
													</div>
												</td>
												<td>
													<SELECT NAME="Template7" id="Template7" >
														<% If tcWebApi_get("ParentalCtrl_Template_Entry0","Enable","h") = "Yes" then %>
														<OPTION value="1">1. <%tcWebApi_get("ParentalCtrl_Template_Entry0","TemplateName","s")%></OPTION>
														<% End If %>
														<% If tcWebApi_get("ParentalCtrl_Template_Entry1","Enable","h") = "Yes" then %>
														<OPTION value="2">2. <%tcWebApi_get("ParentalCtrl_Template_Entry1","TemplateName","s")%></OPTION>
														<% End If %>
														<% If tcWebApi_get("ParentalCtrl_Template_Entry2","Enable","h") = "Yes" then %>
														<OPTION value="3">3. <%tcWebApi_get("ParentalCtrl_Template_Entry2","TemplateName","s")%></OPTION>
														<% End If %>
														<% If tcWebApi_get("ParentalCtrl_Template_Entry3","Enable","h") = "Yes" then %>
														<OPTION value="4">4. <%tcWebApi_get("ParentalCtrl_Template_Entry3","TemplateName","s")%></OPTION>
														<% End If %>
														<% If tcWebApi_get("ParentalCtrl_Template_Entry4","Enable","h") = "Yes" then %>
														<OPTION value="5">5. <%tcWebApi_get("ParentalCtrl_Template_Entry4","TemplateName","s")%></OPTION>
														<% End If %>
														<% If tcWebApi_get("ParentalCtrl_Template_Entry5","Enable","h") = "Yes" then %>
														<OPTION value="6">6. <%tcWebApi_get("ParentalCtrl_Template_Entry5","TemplateName","s")%></OPTION>
														<% End If %>
														<% If tcWebApi_get("ParentalCtrl_Template_Entry6","Enable","h") = "Yes" then %>
														<OPTION value="7">7. <%tcWebApi_get("ParentalCtrl_Template_Entry6","TemplateName","s")%></OPTION>
														<% End If %>
														<% If tcWebApi_get("ParentalCtrl_Template_Entry7","Enable","h") = "Yes" then %>
														<OPTION value="8">8. <%tcWebApi_get("ParentalCtrl_Template_Entry7","TemplateName","s")%></OPTION>
														<% End If %>
														<% If tcWebApi_get("ParentalCtrl_Template_Entry8","Enable","h") = "Yes" then %>
														<OPTION value="9">9. <%tcWebApi_get("ParentalCtrl_Template_Entry8","TemplateName","s")%></OPTION>
														<% End If %>
														<% If tcWebApi_get("ParentalCtrl_Template_Entry9","Enable","h") = "Yes" then %>
														<OPTION value="10">10. <%tcWebApi_get("ParentalCtrl_Template_Entry9","TemplateName","s")%></OPTION>
														<% End If %>
													</SELECT>
												</td>
												<td>
													<i class='fas fa-times icon-btn-delete fa-lg' onmouseover='this.style.cursor="hand"' onclick='doDeleteEntry(7)'></i>
												</td>
											</tr>
											<tr id="rule8" style="display: none; text-align: center;">
												<td>
													<INPUT type="text" maxLength=20 size=20 name="DevName8" id="DevName8">
												</td>
												<td>
													<div style="margin: 0 auto; ">
														<INPUT type="text" maxLength=17 size=17 name="Mac8" id="Mac8" onfocusin="show_suggestion(8);" onfocusout="setTimeout(hide_suggestion,500,8);" oninput="oninput_mac(8);">
														<div id="MacList8" class="suggestion_popup"></div>
													</div>
												</td>
												<td>
													<SELECT NAME="Template8" id="Template8" >
														<% If tcWebApi_get("ParentalCtrl_Template_Entry0","Enable","h") = "Yes" then %>
														<OPTION value="1">1. <%tcWebApi_get("ParentalCtrl_Template_Entry0","TemplateName","s")%></OPTION>
														<% End If %>
														<% If tcWebApi_get("ParentalCtrl_Template_Entry1","Enable","h") = "Yes" then %>
														<OPTION value="2">2. <%tcWebApi_get("ParentalCtrl_Template_Entry1","TemplateName","s")%></OPTION>
														<% End If %>
														<% If tcWebApi_get("ParentalCtrl_Template_Entry2","Enable","h") = "Yes" then %>
														<OPTION value="3">3. <%tcWebApi_get("ParentalCtrl_Template_Entry2","TemplateName","s")%></OPTION>
														<% End If %>
														<% If tcWebApi_get("ParentalCtrl_Template_Entry3","Enable","h") = "Yes" then %>
														<OPTION value="4">4. <%tcWebApi_get("ParentalCtrl_Template_Entry3","TemplateName","s")%></OPTION>
														<% End If %>
														<% If tcWebApi_get("ParentalCtrl_Template_Entry4","Enable","h") = "Yes" then %>
														<OPTION value="5">5. <%tcWebApi_get("ParentalCtrl_Template_Entry4","TemplateName","s")%></OPTION>
														<% End If %>
														<% If tcWebApi_get("ParentalCtrl_Template_Entry5","Enable","h") = "Yes" then %>
														<OPTION value="6">6. <%tcWebApi_get("ParentalCtrl_Template_Entry5","TemplateName","s")%></OPTION>
														<% End If %>
														<% If tcWebApi_get("ParentalCtrl_Template_Entry6","Enable","h") = "Yes" then %>
														<OPTION value="7">7. <%tcWebApi_get("ParentalCtrl_Template_Entry6","TemplateName","s")%></OPTION>
														<% End If %>
														<% If tcWebApi_get("ParentalCtrl_Template_Entry7","Enable","h") = "Yes" then %>
														<OPTION value="8">8. <%tcWebApi_get("ParentalCtrl_Template_Entry7","TemplateName","s")%></OPTION>
														<% End If %>
														<% If tcWebApi_get("ParentalCtrl_Template_Entry8","Enable","h") = "Yes" then %>
														<OPTION value="9">9. <%tcWebApi_get("ParentalCtrl_Template_Entry8","TemplateName","s")%></OPTION>
														<% End If %>
														<% If tcWebApi_get("ParentalCtrl_Template_Entry9","Enable","h") = "Yes" then %>
														<OPTION value="10">10. <%tcWebApi_get("ParentalCtrl_Template_Entry9","TemplateName","s")%></OPTION>
														<% End If %>
													</SELECT>
												</td>
												<td>
													<i class='fas fa-times icon-btn-delete fa-lg' onmouseover='this.style.cursor="hand"' onclick='doDeleteEntry(8)'></i>
												</td>
											</tr>
											<tr id="rule9" style="display: none; text-align: center;">
												<td>
													<INPUT type="text" maxLength=20 size=20 name="DevName9" id="DevName9">
												</td>
												<td>
													<div style="margin: 0 auto; ">
														<INPUT type="text" maxLength=17 size=17 name="Mac9" id="Mac9" onfocusin="show_suggestion(9);" onfocusout="setTimeout(hide_suggestion,500,9);" oninput="oninput_mac(9);">
														<div id="MacList9" class="suggestion_popup"></div>
													</div>
												</td>
												<td>
													<SELECT NAME="Template9" id="Template9" >
														<% If tcWebApi_get("ParentalCtrl_Template_Entry0","Enable","h") = "Yes" then %>
														<OPTION value="1">1. <%tcWebApi_get("ParentalCtrl_Template_Entry0","TemplateName","s")%></OPTION>
														<% End If %>
														<% If tcWebApi_get("ParentalCtrl_Template_Entry1","Enable","h") = "Yes" then %>
														<OPTION value="2">2. <%tcWebApi_get("ParentalCtrl_Template_Entry1","TemplateName","s")%></OPTION>
														<% End If %>
														<% If tcWebApi_get("ParentalCtrl_Template_Entry2","Enable","h") = "Yes" then %>
														<OPTION value="3">3. <%tcWebApi_get("ParentalCtrl_Template_Entry2","TemplateName","s")%></OPTION>
														<% End If %>
														<% If tcWebApi_get("ParentalCtrl_Template_Entry3","Enable","h") = "Yes" then %>
														<OPTION value="4">4. <%tcWebApi_get("ParentalCtrl_Template_Entry3","TemplateName","s")%></OPTION>
														<% End If %>
														<% If tcWebApi_get("ParentalCtrl_Template_Entry4","Enable","h") = "Yes" then %>
														<OPTION value="5">5. <%tcWebApi_get("ParentalCtrl_Template_Entry4","TemplateName","s")%></OPTION>
														<% End If %>
														<% If tcWebApi_get("ParentalCtrl_Template_Entry5","Enable","h") = "Yes" then %>
														<OPTION value="6">6. <%tcWebApi_get("ParentalCtrl_Template_Entry5","TemplateName","s")%></OPTION>
														<% End If %>
														<% If tcWebApi_get("ParentalCtrl_Template_Entry6","Enable","h") = "Yes" then %>
														<OPTION value="7">7. <%tcWebApi_get("ParentalCtrl_Template_Entry6","TemplateName","s")%></OPTION>
														<% End If %>
														<% If tcWebApi_get("ParentalCtrl_Template_Entry7","Enable","h") = "Yes" then %>
														<OPTION value="8">8. <%tcWebApi_get("ParentalCtrl_Template_Entry7","TemplateName","s")%></OPTION>
														<% End If %>
														<% If tcWebApi_get("ParentalCtrl_Template_Entry8","Enable","h") = "Yes" then %>
														<OPTION value="9">9. <%tcWebApi_get("ParentalCtrl_Template_Entry8","TemplateName","s")%></OPTION>
														<% End If %>
														<% If tcWebApi_get("ParentalCtrl_Template_Entry9","Enable","h") = "Yes" then %>
														<OPTION value="10">10. <%tcWebApi_get("ParentalCtrl_Template_Entry9","TemplateName","s")%></OPTION>
														<% End If %>
													</SELECT>
												</td>
												<td>
													<i class='fas fa-times icon-btn-delete fa-lg' onmouseover='this.style.cursor="hand"' onclick='doDeleteEntry(9)'></i>
												</td>
											</tr>
											<tr id="rule10" style="text-align: center;">
												<td>
													<INPUT type="text" maxLength=20 size=20 name="DevName10" id="DevName10">
												</td>
												<td>
													<div style="margin: 0 auto; ">
														<INPUT type="text" maxLength=17 size=17 name="Mac10" id="Mac10" onfocusin="show_suggestion(10);" onfocusout="setTimeout(hide_suggestion,500,10);" oninput="oninput_mac(10);">
														<div id="MacList10" class="suggestion_popup"></div>
													</div>
												</td>
												<td>
													<SELECT NAME="Template10" id="Template10" >
														<% If tcWebApi_get("ParentalCtrl_Template_Entry0","Enable","h") = "Yes" then %>
														<OPTION value="1">1. <%tcWebApi_get("ParentalCtrl_Template_Entry0","TemplateName","s")%></OPTION>
														<% End If %>
														<% If tcWebApi_get("ParentalCtrl_Template_Entry1","Enable","h") = "Yes" then %>
														<OPTION value="2">2. <%tcWebApi_get("ParentalCtrl_Template_Entry1","TemplateName","s")%></OPTION>
														<% End If %>
														<% If tcWebApi_get("ParentalCtrl_Template_Entry2","Enable","h") = "Yes" then %>
														<OPTION value="3">3. <%tcWebApi_get("ParentalCtrl_Template_Entry2","TemplateName","s")%></OPTION>
														<% End If %>
														<% If tcWebApi_get("ParentalCtrl_Template_Entry3","Enable","h") = "Yes" then %>
														<OPTION value="4">4. <%tcWebApi_get("ParentalCtrl_Template_Entry3","TemplateName","s")%></OPTION>
														<% End If %>
														<% If tcWebApi_get("ParentalCtrl_Template_Entry4","Enable","h") = "Yes" then %>
														<OPTION value="5">5. <%tcWebApi_get("ParentalCtrl_Template_Entry4","TemplateName","s")%></OPTION>
														<% End If %>
														<% If tcWebApi_get("ParentalCtrl_Template_Entry5","Enable","h") = "Yes" then %>
														<OPTION value="6">6. <%tcWebApi_get("ParentalCtrl_Template_Entry5","TemplateName","s")%></OPTION>
														<% End If %>
														<% If tcWebApi_get("ParentalCtrl_Template_Entry6","Enable","h") = "Yes" then %>
														<OPTION value="7">7. <%tcWebApi_get("ParentalCtrl_Template_Entry6","TemplateName","s")%></OPTION>
														<% End If %>
														<% If tcWebApi_get("ParentalCtrl_Template_Entry7","Enable","h") = "Yes" then %>
														<OPTION value="8">8. <%tcWebApi_get("ParentalCtrl_Template_Entry7","TemplateName","s")%></OPTION>
														<% End If %>
														<% If tcWebApi_get("ParentalCtrl_Template_Entry8","Enable","h") = "Yes" then %>
														<OPTION value="9">9. <%tcWebApi_get("ParentalCtrl_Template_Entry8","TemplateName","s")%></OPTION>
														<% End If %>
														<% If tcWebApi_get("ParentalCtrl_Template_Entry9","Enable","h") = "Yes" then %>
														<OPTION value="10">10. <%tcWebApi_get("ParentalCtrl_Template_Entry9","TemplateName","s")%></OPTION>
														<% End If %>                                                                
													</SELECT>
												</td>
												<td>
													<i class='fas fa-plus fa-lg icon-btn-renew' onmouseover='this.style.cursor="hand"' onclick='addNewEntry()'></i>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</fieldset>
					</div>
				</div>
				<div class="col-lg-12 d-flex align-items-center justify-content-center">
					<button id="btnOK" type="button" class="page-button small-button" onclick="doSubmit();"><%tcWebApi_get("String_Entry","ButtonApplyText","s")%></button>
				</div>
				</div>
				<div id="wid-id-1" class="widget col-xs-12 col-lg-12" <% If TCWebApi_get("ParentalCtrl_Common","Status","h") <> "Enable" then%> style="display:none" <%end if%>>
					<header><%tcWebApi_get("String_Entry","PrtTemplateText","s")%></header>
					<div class="widget-body">
					<fieldset>
						<legend><%tcWebApi_get("String_Entry","PrtTemplateText","s")%></legend>
						<div class="form-group">
							<div class="table-responsive col-xs-12" style="float: none; margin: 0 auto; text-align: center;">
								<table class="table-bordered-radius simple-table" style="width:100%">
									<thead>
										<tr class="table-head" style="text-align: center;">
											<th><%tcWebApi_get("String_Entry","WifiUserIndexText","s")%></th>
											<th><%tcWebApi_get("String_Entry","PrtTemplateName","s")%></th>
											<th><%tcWebApi_get("String_Entry","IPFilterRuleTypeText","s")%></th>
											<th><%tcWebApi_get("String_Entry","ParentalStartTimeText","s")%></th>
											<th><%tcWebApi_get("String_Entry","ParentalEndTimeText","s")%></th>
											<th><%tcWebApi_get("String_Entry","ParentalRepeatText","s")%></th>
											<th><%tcWebApi_get("String_Entry","ParentalAddressesText","s")%></th>
											<th><%tcWebApi_get("String_Entry","ButtonActionTextLower","s")%></th>
										</tr>
									</thead>
									<tbody id="tmp_list" name="tmp_list" >
									</tbody>
								</table>
							</div>
						</div>
					</fieldset>
					<div class="col-lg-12 d-flex align-items-end justify-content-end">
						<button id="btnADD" type="button" class="action-button small-button" onclick="doAddTempate();"><%tcWebApi_get("String_Entry","ButtonAddText","s")%></button>
					</div>
					</div>
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
            $(document).on('click', function(evt) {
                if($(evt.target).parent().hasClass("suggestion_popup")) {
                    $(evt.target).parent().hide();
                    $(evt.target).parent().prev().val($(evt.target).html().split(" ")[0]);
                    return;
                }
                if ($(evt.target).attr("id") == undefined) {
                    hide_all_suggestion(-1);
                }
                else if (! ($(evt.target).attr("id").match(/Mac\d+/g))) {
                    hide_all_suggestion();
                }
            });
        </script>
    </body>
</html>