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
	if Request_form("Enable") = "1" then
		tcWebApi_constSet("ParentalCtrl_Common","UrlStatus","Enable")
        tcWebApi_constSet("ParentalCtrl_Template_Entry10","Enable","Yes")
		if tcWebApi_validate("template_mode=options|Black|White") = "1" then
            tcWebApi_constSet("ParentalCtrl_Template_Entry10","FilterMode","Black")
		else
			tcWebApi_constSet("ParentalCtrl_Template_Entry10","FilterMode","Black")
		end if
        if Request_form("AddrType0") = "URL" then
            if tcWebApi_validate("Addr0=textlen|48") = "1" then
                TCWebAPI_set("ParentalCtrl_Template_Entry10","AddressType0","AddrType0")
                TCWebAPI_set("ParentalCtrl_Template_Entry10","Address0","Addr0")
            else
                tcWebApi_constSet("ParentalCtrl_Template_Entry10","Address0","")
            end if
        elseif Request_form("AddrType0") = "IP" then
            if tcWebApi_validate("Addr0=ipv4") = "1" then
                TCWebAPI_set("ParentalCtrl_Template_Entry10","AddressType0","AddrType0")
                TCWebAPI_set("ParentalCtrl_Template_Entry10","Address0","Addr0")
            else
                tcWebApi_constSet("ParentalCtrl_Template_Entry10","Address0","")
            end if
        else
            tcWebApi_constSet("ParentalCtrl_Template_Entry10","Address0","")
            tcWebApi_constSet("ParentalCtrl_Template_Entry10","AddressType0","")
        end if
        if Request_form("AddrType1") = "URL" then
            if tcWebApi_validate("Addr1=textlen|48") = "1" then
                TCWebAPI_set("ParentalCtrl_Template_Entry10","AddressType1","AddrType1")
                TCWebAPI_set("ParentalCtrl_Template_Entry10","Address1","Addr1")
            else
                tcWebApi_constSet("ParentalCtrl_Template_Entry10","Address1","")
            end if
        elseif Request_form("AddrType1") = "IP" then
            if tcWebApi_validate("Addr1=ipv4") = "1" then
                TCWebAPI_set("ParentalCtrl_Template_Entry10","AddressType1","AddrType1")
                TCWebAPI_set("ParentalCtrl_Template_Entry10","Address1","Addr1")
            else
                tcWebApi_constSet("ParentalCtrl_Template_Entry10","Address1","")
            end if
        else
            tcWebApi_constSet("ParentalCtrl_Template_Entry10","Address1","")
            tcWebApi_constSet("ParentalCtrl_Template_Entry10","AddressType1","")
        end if
        if Request_form("AddrType2") = "URL" then
            if tcWebApi_validate("Addr2=textlen|48") = "1" then
                TCWebAPI_set("ParentalCtrl_Template_Entry10","AddressType2","AddrType2")
                TCWebAPI_set("ParentalCtrl_Template_Entry10","Address2","Addr2")
            else
                tcWebApi_constSet("ParentalCtrl_Template_Entry10","Address2","")
            end if
        elseif Request_form("AddrType2") = "IP" then
            if tcWebApi_validate("Addr2=ipv4") = "1" then
                TCWebAPI_set("ParentalCtrl_Template_Entry10","AddressType2","AddrType2")
                TCWebAPI_set("ParentalCtrl_Template_Entry10","Address2","Addr2")
            else
                tcWebApi_constSet("ParentalCtrl_Template_Entry10","Address2","")
            end if
        else
            tcWebApi_constSet("ParentalCtrl_Template_Entry10","Address2","")
            tcWebApi_constSet("ParentalCtrl_Template_Entry10","AddressType2","")
        end if
        if Request_form("AddrType3") = "URL" then
            if tcWebApi_validate("Addr3=textlen|48") = "1" then
                TCWebAPI_set("ParentalCtrl_Template_Entry10","AddressType3","AddrType3")
                TCWebAPI_set("ParentalCtrl_Template_Entry10","Address3","Addr3")
            else
                tcWebApi_constSet("ParentalCtrl_Template_Entry10","Address3","")
            end if
        elseif Request_form("AddrType3") = "IP" then
            if tcWebApi_validate("Addr3=ipv4") = "1" then
                TCWebAPI_set("ParentalCtrl_Template_Entry10","AddressType3","AddrType3")
                TCWebAPI_set("ParentalCtrl_Template_Entry10","Address3","Addr3")
            else
                tcWebApi_constSet("ParentalCtrl_Template_Entry10","Address3","")
            end if
        else
            tcWebApi_constSet("ParentalCtrl_Template_Entry10","Address3","")
            tcWebApi_constSet("ParentalCtrl_Template_Entry10","AddressType3","")
        end if
        if Request_form("AddrType4") = "URL" then
            if tcWebApi_validate("Addr4=textlen|48") = "1" then
                TCWebAPI_set("ParentalCtrl_Template_Entry10","AddressType4","AddrType4")
                TCWebAPI_set("ParentalCtrl_Template_Entry10","Address4","Addr4")
            else
                tcWebApi_constSet("ParentalCtrl_Template_Entry10","Address4","")
            end if
        elseif Request_form("AddrType4") = "IP" then
            if tcWebApi_validate("Addr4=ipv4") = "1" then
                TCWebAPI_set("ParentalCtrl_Template_Entry10","AddressType4","AddrType4")
                TCWebAPI_set("ParentalCtrl_Template_Entry10","Address4","Addr4")
            else
                tcWebApi_constSet("ParentalCtrl_Template_Entry10","Address4","")
            end if
        else
            tcWebApi_constSet("ParentalCtrl_Template_Entry10","Address4","")
            tcWebApi_constSet("ParentalCtrl_Template_Entry10","AddressType4","")
        end if
        if Request_form("AddrType5") = "URL" then
            if tcWebApi_validate("Addr5=textlen|48") = "1" then
                TCWebAPI_set("ParentalCtrl_Template_Entry10","AddressType5","AddrType5")
                TCWebAPI_set("ParentalCtrl_Template_Entry10","Address5","Addr5")
            else
                tcWebApi_constSet("ParentalCtrl_Template_Entry10","Address5","")
            end if
        elseif Request_form("AddrType5") = "IP" then
            if tcWebApi_validate("Addr5=ipv4") = "1" then
                TCWebAPI_set("ParentalCtrl_Template_Entry10","AddressType5","AddrType5")
                TCWebAPI_set("ParentalCtrl_Template_Entry10","Address5","Addr5")
            else
                tcWebApi_constSet("ParentalCtrl_Template_Entry10","Address5","")
            end if
        else
            tcWebApi_constSet("ParentalCtrl_Template_Entry10","Address5","")
            tcWebApi_constSet("ParentalCtrl_Template_Entry10","AddressType5","")
        end if
        if Request_form("AddrType6") = "URL" then
            if tcWebApi_validate("Addr6=textlen|48") = "1" then
                TCWebAPI_set("ParentalCtrl_Template_Entry10","AddressType6","AddrType6")
                TCWebAPI_set("ParentalCtrl_Template_Entry10","Address6","Addr6")
            else
                tcWebApi_constSet("ParentalCtrl_Template_Entry10","Address6","")
            end if
        elseif Request_form("AddrType6") = "IP" then
            if tcWebApi_validate("Addr6=ipv4") = "1" then
                TCWebAPI_set("ParentalCtrl_Template_Entry10","AddressType6","AddrType6")
                TCWebAPI_set("ParentalCtrl_Template_Entry10","Address6","Addr6")
            else
                tcWebApi_constSet("ParentalCtrl_Template_Entry10","Address6","")
            end if
        else
            tcWebApi_constSet("ParentalCtrl_Template_Entry10","Address6","")
            tcWebApi_constSet("ParentalCtrl_Template_Entry10","AddressType6","")
        end if
        if Request_form("AddrType7") = "URL" then
            if tcWebApi_validate("Addr7=textlen|48") = "1" then
                TCWebAPI_set("ParentalCtrl_Template_Entry10","AddressType7","AddrType7")
                TCWebAPI_set("ParentalCtrl_Template_Entry10","Address7","Addr7")
            else
                tcWebApi_constSet("ParentalCtrl_Template_Entry10","Address7","")
            end if
        elseif Request_form("AddrType7") = "IP" then
            if tcWebApi_validate("Addr7=ipv4") = "1" then
                TCWebAPI_set("ParentalCtrl_Template_Entry10","AddressType7","AddrType7")
                TCWebAPI_set("ParentalCtrl_Template_Entry10","Address7","Addr7")
            else
                tcWebApi_constSet("ParentalCtrl_Template_Entry10","Address7","")
            end if
        else
            tcWebApi_constSet("ParentalCtrl_Template_Entry10","Address7","")
            tcWebApi_constSet("ParentalCtrl_Template_Entry10","AddressType7","")
        end if
        if Request_form("AddrType8") = "URL" then
            if tcWebApi_validate("Addr8=textlen|48") = "1" then
                TCWebAPI_set("ParentalCtrl_Template_Entry10","AddressType8","AddrType8")
                TCWebAPI_set("ParentalCtrl_Template_Entry10","Address8","Addr8")
            else
                tcWebApi_constSet("ParentalCtrl_Template_Entry10","Address8","")
            end if
        elseif Request_form("AddrType8") = "IP" then
            if tcWebApi_validate("Addr8=ipv4") = "1" then
                TCWebAPI_set("ParentalCtrl_Template_Entry10","AddressType8","AddrType8")
                TCWebAPI_set("ParentalCtrl_Template_Entry10","Address8","Addr8")
            else
                tcWebApi_constSet("ParentalCtrl_Template_Entry10","Address8","")
            end if
        else
            tcWebApi_constSet("ParentalCtrl_Template_Entry10","Address8","")
            tcWebApi_constSet("ParentalCtrl_Template_Entry10","AddressType8","")
        end if
        if Request_form("AddrType9") = "URL" then
            if tcWebApi_validate("Addr9=textlen|48") = "1" then
                TCWebAPI_set("ParentalCtrl_Template_Entry10","AddressType9","AddrType9")
                TCWebAPI_set("ParentalCtrl_Template_Entry10","Address9","Addr9")
            else
                tcWebApi_constSet("ParentalCtrl_Template_Entry10","Address9","")
            end if
        elseif Request_form("AddrType9") = "IP" then
            if tcWebApi_validate("Addr9=ipv4") = "1" then
                TCWebAPI_set("ParentalCtrl_Template_Entry10","AddressType9","AddrType9")
                TCWebAPI_set("ParentalCtrl_Template_Entry10","Address9","Addr9")
            else
                tcWebApi_constSet("ParentalCtrl_Template_Entry10","Address9","")
            end if
        else
            tcWebApi_constSet("ParentalCtrl_Template_Entry10","Address9","")
            tcWebApi_constSet("ParentalCtrl_Template_Entry10","AddressType9","")
        end if
	else
		tcWebApi_constSet("ParentalCtrl_Common","UrlStatus","Disable")
        tcWebApi_constSet("ParentalCtrl_Template_Entry10","Enable","No")
	end if
    TCWebApi_save();
end if
%>
<!doctype html>
<html>
	<head>
<title><%tcWebApi_get("String_Entry","BranchName","s")%> ONT - <%tcWebApi_get("String_Entry","FILTERTYPE_index2","s")%></title>		<meta charset="utf-8">
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
            var max_templates = 10;
            var max_rules = 10;
            var max_ipfilter_rules = 20;
            var max_urlfilter_rules = 8;
            var hasRule = new Array(max_rules);
            var arAddress = new Array(max_rules);
            var arActiveTemplate = new Array(max_rules);
            arAddress[0]    = "<%tcWebApi_Get_JSEscape("ParentalCtrl_Template_Entry10","Address0","s")%>";
            arAddress[1]    = "<%tcWebApi_Get_JSEscape("ParentalCtrl_Template_Entry10","Address1","s")%>";
            arAddress[2]    = "<%tcWebApi_Get_JSEscape("ParentalCtrl_Template_Entry10","Address2","s")%>";
            arAddress[3]    = "<%tcWebApi_Get_JSEscape("ParentalCtrl_Template_Entry10","Address3","s")%>";
            arAddress[4]    = "<%tcWebApi_Get_JSEscape("ParentalCtrl_Template_Entry10","Address4","s")%>";
            arAddress[5]    = "<%tcWebApi_Get_JSEscape("ParentalCtrl_Template_Entry10","Address5","s")%>";
            arAddress[6]    = "<%tcWebApi_Get_JSEscape("ParentalCtrl_Template_Entry10","Address6","s")%>";
            arAddress[7]    = "<%tcWebApi_Get_JSEscape("ParentalCtrl_Template_Entry10","Address7","s")%>";
            arAddress[8]    = "<%tcWebApi_Get_JSEscape("ParentalCtrl_Template_Entry10","Address8","s")%>";
            arAddress[9]    = "<%tcWebApi_Get_JSEscape("ParentalCtrl_Template_Entry10","Address9","s")%>";
            function FilterSwitch() {
                if(document.getElementById("Enable").checked == true)
                {
                    $('#filter-enable-div').show();
                }
                else
                {
                    $('#filter-enable-div').hide();
                }
            }
            function unValidURL(Address) {
                if (Address.length < 10) {
                    return true;
                }
                var urlRx = /((([A-Za-z]{3,9}:(?:\/\/)?)(?:[\-;:&=\+\$,\w]+@)?[A-Za-z0-9\.\-]+|(?:www\.|[\-;:&=\+\$,\w]+@)[A-Za-z0-9\.\-]+)((?:\/[\+~%\/\.\w\-_]*)?\??(?:[\-\+=&;%@\.\w_]*)#?(?:[\.\!\/\\\w]*))?)/;
                if (urlRx.test(Address)) {
                    return false;
                }
                else {
                    return true;
                }
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
            function get_first_empty_entry() {          
                var i;
                for (i=0; i < max_rules; i++) {
                    if (hasRule[i] != 1) {
                        return i;
                    }
                }
                return -1;
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
                                $("#Addr"+i).val($("#Addr"+j).val());
                                $("#AddrType"+i).val($("#AddrType"+j).val());
                                hasRule[i] = 1;
                                hasRule[j] = 0;
                                $('#rule'+i).show();
                                $('#rule'+j).hide();
                                $("#Addr"+j).val("");
                                $("#AddrType"+j).val("");
                                break;
                            }
                        }
                    }
                }
            }
            var curMacRuleType;
            function Load() {
                var i,week;
                curMacRuleType = document.urlfilter_form.template_mode.value;
                if (document.urlfilter_form.template_mode.value == "White") {
                    $("#whitelist_note").show();
                }
                for (i=0;i<max_rules;i++) {
                    if ((arAddress[i].length != 0) && (arAddress[i] != "N/A")) {
                        $("#Addr"+i).val(arAddress[i].replace(/&#x2F;/g,"/"));
                        hasRule[i] = 1;
                    }
                    else {
                        hasRule[i] = 0;
                    }
                }
                rearrange_rules();
                if (-1 == get_first_empty_entry()) {
                    $('#rule10').hide();
                }
                FilterSwitch();
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
                $('#Addr'+i).val($('#Addr10').val());
                $('#Addr10').val("");
                hasRule[i] = 1;
            }
            function doDeleteEntry(i) {
                $('#rule10').show();
                $('#rule'+i).hide();
                $('#Addr'+i).val("");
                hasRule[i] = 0;
                rearrange_rules();
            }
            function doSubmit() {
                var f = document.urlfilter_form;
                var i,str;
                if ( !f.Enable.checked )  {
                    submitAsync('urlfilter_form');
                    return;
                }
                for (i = 0; i <= max_rules; i++)
                {
                    if ($('#Addr'+i).val().length > 0)
                    {
                        str = $('#Addr'+ i).val().toLowerCase().trim();
                        if (str.charAt(str.length - 1) == "/") 
                        {
                            str = str.slice(0, -1);
					    }
                        if (str.includes(" ") || str.includes("@"))
                        {
                            alert("<%tcWebApi_get("String_Entry","ParentalJS3Text","s")%>");
						    $('#Addr'+ i).focus();
						    return false;
                        }
                        $('#Addr'+i).val(str);
                    }
                }
                for (i = 0; i< max_rules;i++) {
                    if ($('#Addr'+i).val().length == 0) {
                        continue;
                    }
                    for (var j=0;j<i;j++) {
                        if ($('#Addr'+ i).val().replace("http://", "").replace("https://", "") == $('#Addr'+ j).val().replace("http://", "").replace("https://", ""))
                        {
                            alert("<%tcWebApi_get("String_Entry","URLfilterDuplicateUrl","s")%>");
                            $('#Addr'+ i).focus();
                            return;
                        }
                    }
					str = $('#Addr'+ i).val().toLowerCase();
					// if (str.charAt(str.length - 1) == "/") {
					// 	str = str.slice(0, -1);
					// }
					if (str.search("://") < 0) {
						str = "http://" + str;
					}
                    <% if tcWebApi_get("String_Entry","BranchName","h") <> "Viettel" then %>		
                    if (isValidIpAddress(str) || isValidIpAddress(str.replace("http://", "")) || isValidIpAddress(str.replace("https://", "")))
                    {
                        $("#AddrType"+i).val("IP");
                    }
                    else
                    <% end if %>
					if (unValidURL(str)) {
						alert("<%tcWebApi_get("String_Entry","ParentalJS3Text","s")%>");
						$('#Addr'+ i).focus();
						return false;
					}
					else {
						 $("#AddrType"+i).val("URL");
						 $("#Addr"+ i).val($("#Addr"+ i).val().replace("&#x2F;","/"));
					}
                }
                rearrange_rules();
                if ($("#Addr10").val().trim().length != 0) {
                    for (var j=0;j<10;j++) {
                        if ($("#Addr10").val().replace("http://", "").replace("https://", "") == $('#Addr'+ j).val().replace("http://", "").replace("https://", ""))
                            {
                                alert("<%tcWebApi_get("String_Entry","URLfilterDuplicateUrl","s")%>");
                                $('#Addr10').focus();
                                return;
                            }
                        }
					str = $('#Addr10').val().toLowerCase();
					// if (str.charAt(str.length - 1) == "/") {
					// 	str = str.slice(0, -1);
					// }
					if (str.search("://") < 0) {
						str = "http://" + str;
					}
                    <% if tcWebApi_get("String_Entry","BranchName","h") <> "Viettel" then %>
                        if (isValidIpAddress(str) || isValidIpAddress(str.replace("http://", "")) || isValidIpAddress(str.replace("https://", "")))
                        {
                            $("#AddrType10").val("IP");
                        }
                        else
                    <% end if %>
					if (unValidURL(str)) {
						alert("<%tcWebApi_get("String_Entry","ParentalJS3Text","s")%>");
						$('#Addr10').focus();
						return false;
					}
					else {
						 $("#AddrType10").val("URL");
					}
                    i = get_first_empty_entry();
                    $("#Addr" + i).val($("#Addr10").val());
                    $("#AddrType" + i).val($("#AddrType10").val());
                }
                var confirmvl = confirm("<%tcWebApi_get("String_Entry","L3FilterNotificationText","s")%>");
                if (!confirmvl)
                {
                    return;
                }
                submitAsync('urlfilter_form');
            }
            var arAddr1  = new Array(11);
            var arhasrule1  = new Array(11);
            var arAddr2  = new Array(11);
            var arhasrule2  = new Array(11);
            function toggleListMode() {
                if (document.urlfilter_form.template_mode.value != curMacRuleType)
                {
                    var confirmvl = confirm("<% tcWebApi_get("String_Entry", "FilterChangeRuleText", "s")%>");
                    if (!confirmvl)
                    {
                        if (document.urlfilter_form.template_mode.value == "White") {
                            cs_chooseoption(document.urlfilter_form.template_mode, 0);
                        }
                        else {
                            cs_chooseoption(document.urlfilter_form.template_mode, 1);
                        }
                        return;
                    }
                    var i, r;           
                    if ( curMacRuleType == "Black" )
                    {
                        for (i=0; i<=max_rules;i++) {
                            arAddr1[i] = $('#Addr'+i).val();
                            arhasrule1[i] = $('#hasRule'+i).val();
                            arhasrule1[i] = hasRule[i];
                        }
                        for (i=0; i<=max_rules;i++) {
                            $('#Addr'+i).val(arAddr2[i]);
                            $('#hasRule'+i).val(arhasrule2[i]);
                            hasRule[i] = arhasrule2[i]
                        }
                    }
                    else
                    {
                        for (i=0; i<=max_rules;i++) {
                            arAddr2[i] = $('#Addr'+i).val();
                            arhasrule2[i] = $('#hasRule'+i).val();
                            arhasrule2[i] = hasRule[i];
                        }
                        for (i=0; i<=max_rules;i++) {
                            $('#Addr'+i).val(arAddr1[i]);
                            $('#hasRule'+i).val(arhasrule1[i]);
                            hasRule[i] = arhasrule1[i]
                        }
                    }
                    r = 0;
                    for (i=0; i< max_rules; i++) {
                        if ($('#Addr'+i).val().trim().length != 0)
                        {
                            $('#rule' + i).show();
                            r++;
                        }
                        else
                        {
                            $('#rule' + i).hide();
                        }
                    }
                    if (r == 10) {
                        $('#rule10').hide();
                    }
                    else {
                        $('#rule10').show();
                    }
                    curMacRuleType = document.urlfilter_form.template_mode.value;
                    if ( curMacRuleType == "White" ) {
                        $("#whitelist_note").show();
                    }
                    else {
                        $("#whitelist_note").hide();
                    }
                }
            }
        </script>
    </head>
    <body class="container" onload="Load();">
<header class="fixed-top"><nav id="top-nav" class="navbar navbar-expand-lg container"><a class="navbar-brand " href="/cgi-bin/home.asp"><div><img src="/img/logo_home.png" width="100" height="18" alt=""><div style="font-family: sans-serif; font-weight: bold;font-size: 12px;color: #000; margin-top: 0">OPTICAL NETWORK TERMINATION</div></div></a><button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"><em class="fas fa-align-justify"></em></span></button><div class="collapse navbar-collapse" id="navbarCollapse"><ul class="navbar-nav mr-auto sidenav" id="navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/home.asp"><%tcWebApi_get("String_Entry","NavigationHomeText","s")%><span class="sr-only"></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/deviceinfo.asp"><%tcWebApi_get("String_Entry","NavigationStatusDeviceText","s")%><span class="sr-only"></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/wifi-mesh-topology.asp"><%tcWebApi_get("String_Entry","EasyMeshStatus5Text","s")%><span class="sr-only"></span></a></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#status-menu" aria-controls="status-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NavigationStatusStatisticsText","s")%></a><ul class="nav-second-level collapse" id="status-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/sta-statistics.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationTrafficText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/sta-wifiusers.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationStatusUsersText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/sta-users.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","ARPStatusText","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#network-menu" aria-controls="network-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NAVNetwork","s")%></a><ul class="nav-second-level collapse" id="network-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/net-wan.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationBasInternetText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/net-lan.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationBasLANText","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#wifi-menu" aria-controls="wifi-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NAVWifi","s")%></a><ul class="nav-second-level collapse" id="wifi-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/wifi.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationWiFiSettingsText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/wifi-11ac.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationWiFi11acSettingsText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/wifi-mesh.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationMesh","s")%></span></a></li></ul></li><li class="nav-item active"><a class="nav-link nav-link-collapse nav-link-show" href="#" id="hasSubItems" data-toggle="collapse" data-target="#firewall-menu" aria-controls="firewall-menu" aria-expanded="true"><%tcWebApi_get("String_Entry","NavigationAdvFirewallText","s")%></a><ul class="nav-second-level show" id="firewall-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-spi.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","ContentFirewallText","s")%></span></a></li><li class="nav-item active"><a class="nav-link" href="/cgi-bin/fw-urlfilter.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","FILTERTYPE_index2","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-macfilter.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVL2Filter","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-parentalcontrol.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","ParentalControlText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/safehome.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","SafehomeText","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#apps-menu" aria-controls="apps-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NAVApplication","s")%></a><ul class="nav-second-level collapse" id="apps-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-dmz.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NatTopDMZText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-portforwarding.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NatVirsvrText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-sslim.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","SessionLimit","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-route.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","StaticRouteText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-ddns.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","dyDNS1Text","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-wifischeduling.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","WifiSchedulingText","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#tools-menu" aria-controls="tools-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NavigationMaintenanceText","s")%></a><ul class="nav-second-level collapse" id="tools-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-admin.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationMainAdminText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-time.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVSysTime","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-firmware.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationMainFirmwareText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-config.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVConfig","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-diagnostic.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationMainDiagnosticsText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-wan2lan.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","Wan2lanText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-log.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVLogs","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-reboot.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","RebootText","s")%></span></a></li></ul></li></ul><div class="top-item-groups"><form name="LanguageForm" method="POST" action="/cgi-bin/fw-urlfilter.asp" class="nav-item dropdown"><input type="hidden" name="TokenString" value="<%tcWebApi_getToken()%>"><input type="hidden" name="Language_Flag" value="<% tcWebApi_get("LanguageSwitch_Entry","Type","s") %>"><a class="nav-link dropdown-toggle" href="#" id="LanguageDropdown" role="button" data-toggle="dropdown" aria-expanded="false"><% tcWebApi_get("String_Entry","LoginLanguage","s") %></a><ul class="dropdown-menu" aria-labelledby="LanguageDropdown"><li><a class="dropdown-item <% if tcWebApi_get("LanguageSwitch_Entry","Type","h") = "1" then asp_Write("active") end if %>" href="#" onclick="submitLanguageForm(1);"><% tcWebApi_get("String_Entry","LanguageVIELong","s") %></a></li><li><a class="dropdown-item <% if tcWebApi_get("LanguageSwitch_Entry","Type","h") = "2" then asp_Write("active") end if %>" href="#" onclick="submitLanguageForm(2);"><% tcWebApi_get("String_Entry","LanguageENGLong","s") %></a></li></ul></form><div id="signout" class="nav-item"><a class="nav-link" href="javascript:doLogout();"><em class="fa fa-sign-out-alt"></em><span class="nav-link-text"><% tcWebApi_get("String_Entry","LogoutText","s") %></span></a></div></div></div></header></nav><% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then
	if tcWebApi_get("Mesh_Common", "DeviceRole", "h") = "2" then %>
		<script language='javascript'>
		document.getElementById("network-menu").children[0].style="display: none";
		document.getElementById("network-menu").children[1].style="display: none";
		document.getElementById("wifi-menu").children[0].style="display: none";
		document.getElementById("wifi-menu").children[1].style="display: none";
		</script>
<% end if end if %>		<div id="content">
			<form class="form-inline" name="urlfilter_form" id="urlfilter_form" action="/cgi-bin/fw-urlfilter.asp" method=post>
			<INPUT TYPE="HIDDEN" NAME="TokenString" VALUE="<%tcWebApi_getToken()%>">
			<input type="hidden" name="PostFlag" id="PostFlag" value="1" />
			<div class="row row-w-100">
				<div class="widget col-xs-12 col-lg-12">
					<header><%tcWebApi_get("String_Entry","FILTERTYPE_index2","s")%></header>
					<div class="widget-body">
					<fieldset>
						<legend><%tcWebApi_get("String_Entry","FILTERTYPE_index2","s")%></legend>
						<!-- <div class="form-group">
							<label class="col-xs-12 col-sm-4 control-label"><%tcWebApi_get("String_Entry","FILTERTYPE_index2","s")%></label>
							<label class="toggle-switch">
								<input type="checkbox" name="Enable" id="Enable" onChange="FilterSwitch();" value="1" <% If TCWebApi_get("ParentalCtrl_Common","UrlStatus","h") = "Enable" then asp_Write("checked") end if%>>
								<span class="slider"></span>
							</label>
						</div>			 -->
                        <div class="form-group col-lg-12" id="parentalcontrolnote_div">
                            <label class="input-description">
                                <p><a href="#"><i class="fa fa-exclamation-triangle"></i></a> <%tcWebApi_get("String_Entry","FILTERTYPE_index2","s")%> <%tcWebApi_get("String_Entry","ParentalControlNoteText","s")%>&nbsp;<a href="/cgi-bin/fw-parentalcontrol.asp"><%tcWebApi_get("String_Entry","ParentalControlText","s")%></a>.</p>
                            </label>
                        </div>
                        <div id="filter-enable-div" style="display: none;">	
						<div class="form-group d-none">
							<label class="col-xs-12 col-sm-4 control-label"><%tcWebApi_get("String_Entry","IPFilterRuleTypeText","s")%></label>
							<div class="col-xs-12 col-sm-4 custom-select">
								<SELECT name="template_mode" id="template_mode" onchange='toggleListMode()'>
									<OPTION VALUE="Black" selected><%tcWebApi_get("String_Entry","BlackListText","s")%></OPTION>
									<OPTION VALUE="White" ><%tcWebApi_get("String_Entry","WhiteListText","s")%></OPTION>
								</SELECT>
							</div>
						</div>
						<div class="form-group d-none" id="whitelist_note" style="display: none">
							<label class="col-xs-12 col-sm-4 control-label"></label>
							<div class="info-text col-xs-12 col-sm-7 pl-0" style="text-align: justify;"><%tcWebApi_get("String_Entry","ParentalWhitelistNoteText","s")%></div>
						</div>
						<div class="form-group">
							<label class="col-xs-12 col-sm-4 control-label"><%tcWebApi_get("String_Entry","ParentalAddressesText","s")%></label>
							<div class="table-responsive col-xs-12 col-sm-10" style="float: none; margin: 0 auto; text-align: center;">
								<table style="margin: auto auto 30px auto; width:100%" class="table-bordered-radius simple-table">
									<thead>
										<tr class="table-head" style="text-align: center;">
											<th><%tcWebApi_get("String_Entry","ParentalAddressText","s")%></th>
											<th><%tcWebApi_get("String_Entry","ButtonActionTextLower","s")%></th>
										</tr>   
									</thead>
									<tbody>
										<tr id="rule0" style="text-align: center; display: none;">
											<td>
												<INPUT type="text" maxLength=48 size=48 name="Addr0" id="Addr0">
												<INPUT type="hidden" name="AddrType0" id="AddrType0">
											</td>
											<td><i class='fas fa-times icon-btn-delete fa-lg' onmouseover='this.style.cursor="hand"' onclick='doDeleteEntry(0)'></i></td>
										</tr>
										<tr id="rule1" style="text-align: center; display: none;">
											<td>
												<INPUT type="text" maxLength=48 size=48 name="Addr1" id="Addr1">
												<INPUT type="hidden" name="AddrType1" id="AddrType1">
											</td>
											<td><i class='fas fa-times icon-btn-delete fa-lg' onmouseover='this.style.cursor="hand"' onclick='doDeleteEntry(1)'></i></td>
										</tr>
										<tr id="rule2" style="text-align: center; display: none;">
											<td>
												<INPUT type="text" maxLength=48 size=48 name="Addr2" id="Addr2">
												<INPUT type="hidden" name="AddrType2" id="AddrType2">
											</td>
											<td><i class='fas fa-times icon-btn-delete fa-lg' onmouseover='this.style.cursor="hand"' onclick='doDeleteEntry(2)'></i></td>
										</tr>
										<tr id="rule3" style="text-align: center; display: none;">
											<td>
												<INPUT type="text" maxLength=48 size=48 name="Addr3" id="Addr3">
												<INPUT type="hidden" name="AddrType3" id="AddrType3">
											</td>
											<td><i class='fas fa-times icon-btn-delete fa-lg' onmouseover='this.style.cursor="hand"' onclick='doDeleteEntry(3)'></i></td>
										</tr>
										<tr id="rule4" style="text-align: center; display: none;">
											<td>
												<INPUT type="text" maxLength=48 size=48 name="Addr4" id="Addr4">
												<INPUT type="hidden" name="AddrType4" id="AddrType4">
											</td>
											<td><i class='fas fa-times icon-btn-delete fa-lg' onmouseover='this.style.cursor="hand"' onclick='doDeleteEntry(4)'></i></td>
										</tr>
										<tr id="rule5" style="text-align: center; display: none;">
											<td>
												<INPUT type="text" maxLength=48 size=48 name="Addr5" id="Addr5">
												<INPUT type="hidden" name="AddrType5" id="AddrType5">
											</td>
											<td><i class='fas fa-times icon-btn-delete fa-lg' onmouseover='this.style.cursor="hand"' onclick='doDeleteEntry(5)'></i></td>
										</tr>
										<tr id="rule6" style="text-align: center; display: none;">
											<td>
												<INPUT type="text" maxLength=48 size=48 name="Addr6" id="Addr6">
												<INPUT type="hidden" name="AddrType6" id="AddrType6">
											</td>
											<td><i class='fas fa-times icon-btn-delete fa-lg' onmouseover='this.style.cursor="hand"' onclick='doDeleteEntry(6)'></i></td>
										</tr>
										<tr id="rule7" style="text-align: center; display: none;">
											<td>
												<INPUT type="text" maxLength=48 size=48 name="Addr7" id="Addr7">
												<INPUT type="hidden" name="AddrType7" id="AddrType7">
											</td>
											<td><i class='fas fa-times icon-btn-delete fa-lg' onmouseover='this.style.cursor="hand"' onclick='doDeleteEntry(7)'></i></td>
										</tr>
										<tr id="rule8" style="text-align: center; display: none;">
											<td>
												<INPUT type="text" maxLength=48 size=48 name="Addr8" id="Addr8">
												<INPUT type="hidden" name="AddrType8" id="AddrType8">
											</td>
											<td><i class='fas fa-times icon-btn-delete fa-lg' onmouseover='this.style.cursor="hand"' onclick='doDeleteEntry(8)'></i></td>
										</tr>
										<tr id="rule9" style="text-align: center; display: none;">
											<td>
												<INPUT type="text" maxLength=48 size=48 name="Addr9" id="Addr9">
												<INPUT type="hidden" name="AddrType9" id="AddrType9">
											</td>
											<td><i class='fas fa-times icon-btn-delete fa-lg' onmouseover='this.style.cursor="hand"' onclick='doDeleteEntry(9)'></i></td>
										</tr>
										<tr id="rule10" style="text-align: center">
											<td><INPUT type="hidden" name="AddrType10" id="AddrType10"><INPUT type="text" maxLength=48 size=48 name="Addr10" id="Addr10" value=""></td>
											<td><i class='fas fa-plus fa-lg icon-btn-renew' onmouseover='this.style.cursor="hand"' onclick='addNewEntry()'></i></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
                        </div>	
					</fieldset>
					</div>
				</div>
				<!-- <div class="col-lg-12 d-flex align-items-center justify-content-center">
					<button id="btnOK" type="button" class="page-button small-button" onclick="doSubmit();"><%tcWebApi_get("String_Entry","ButtonApplyText","s")%></button>
				</div> -->
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
		<script language='javascript' src='/JS/user.js'></script>    </body>
</html>