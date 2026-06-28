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
if Request_Form("LanFlag") = "1" then
	if tcwebApi_get("Lan_Entry0","IP","h") <> Request_Form("ethIpAddress") then
		TCWebApi_constSet("Account_Entry0","Logged","0")
		TCWebApi_constSet("Account_Entry0","Logoff","1")
		TCWebApi_constSet("Account_Entry1","Logged","0")
		TCWebApi_constSet("Account_Entry1","Logoff","1")
		TCWebApi_constSet("Account_Entry2","Logged","0")
		TCWebApi_constSet("Account_Entry2","Logoff","1")
		TCWebApi_set("Lan_Entry0","IP","ethIpAddress")
	end if
	TCWebApi_set("Lan_Entry0","netmask","ethSubnetMask")
	TCWebApi_set("Lan_Dhcp","type","lanDhcpType")
	TCWebApi_commit("Lan")
	if Request_Form("lanDhcpType") = "0" then
		TCWebApi_unset("DhcpRelay_Entry")
        TCWebApi_commit("Dhcpd_Common")
	end if
	if Request_Form("lanDhcpType") = "1" then
		TCWebApi_set("Dhcpd_Common","lease","dhcpLeasedTimesecond")
		TCWebApi_set("Dhcpd_Common","start","dhcpEthStart")
		TCWebApi_set("Dhcpd_Common","pool_count","dhcpEthPool")
		TCWebApi_Constset("Dhcpd_Option60","Active","No")
		if Request_Form("dns_mode") = "100" then
			TCWebApi_Constset("Dproxy_Entry","Active","Yes")
			TCWebApi_Constset("Dproxy_Entry","type","0")
			TCWebApi_Constset("Dhcpd","DNSWANConnection","0")
		elseif Request_Form("dns_mode") = "101" then
			if TcWebapi_validate("pri_dns4=ipv4&sec_dns4=ipv4") = "1" then
				TCWebApi_Constset("Dproxy_Entry","Active","Yes")
				TCWebApi_Constset("Dproxy_Entry","type","1")
				TCWebApi_set("Dproxy_Entry","Primary_DNS","pri_dns4")
				TCWebApi_set("Dproxy_Entry","Secondary_DNS","sec_dns4")
				TCWebApi_Constset("Dhcpd","DNSWANConnection","0")
			end if
		else
			TCWebApi_Constset("Dproxy_Entry","Active","No")
			TCWebApi_set("Dhcpd","DNSWANConnection","dns_mode")
		end if
		TCWebApi_commit("Dproxy_Entry")
		if TcWebapi_validate("ip0=ipv4&mac0=mac") = "1" then
			TCWebApi_set("Dhcpd_Entry0","IP","ip0")
			TCWebApi_set("Dhcpd_Entry0","MAC","mac0")
		else
			TCWebApi_unset("Dhcpd_Entry0")
		end if
		if TcWebapi_validate("ip1=ipv4&mac1=mac") = "1" then
			TCWebApi_set("Dhcpd_Entry1","IP","ip1")
			TCWebApi_set("Dhcpd_Entry1","MAC","mac1")
		else
			TCWebApi_unset("Dhcpd_Entry1")
		end if
		if TcWebapi_validate("ip2=ipv4&mac2=mac") = "1" then
			TCWebApi_set("Dhcpd_Entry2","IP","ip2")
			TCWebApi_set("Dhcpd_Entry2","MAC","mac2")
		else
			TCWebApi_unset("Dhcpd_Entry2")
		end if
		if TcWebapi_validate("ip3=ipv4&mac3=mac") = "1" then
			TCWebApi_set("Dhcpd_Entry3","IP","ip3")
			TCWebApi_set("Dhcpd_Entry3","MAC","mac3")
		else
			TCWebApi_unset("Dhcpd_Entry3")
		end if
		if TcWebapi_validate("ip4=ipv4&mac4=mac") = "1" then
			TCWebApi_set("Dhcpd_Entry4","IP","ip4")
			TCWebApi_set("Dhcpd_Entry4","MAC","mac4")
		else
			TCWebApi_unset("Dhcpd_Entry4")
		end if
		if TcWebapi_validate("ip5=ipv4&mac5=mac") = "1" then
			TCWebApi_set("Dhcpd_Entry5","IP","ip5")
			TCWebApi_set("Dhcpd_Entry5","MAC","mac5")
		else
			TCWebApi_unset("Dhcpd_Entry5")
		end if
		if TcWebapi_validate("ip6=ipv4&mac6=mac") = "1" then
			TCWebApi_set("Dhcpd_Entry6","IP","ip6")
			TCWebApi_set("Dhcpd_Entry6","MAC","mac6")
		else
			TCWebApi_unset("Dhcpd_Entry6")
		end if
		if TcWebapi_validate("ip7=ipv4&mac7=mac") = "1" then
			TCWebApi_set("Dhcpd_Entry7","IP","ip7")
			TCWebApi_set("Dhcpd_Entry7","MAC","mac7")
		else
			TCWebApi_unset("Dhcpd_Entry7")
		end if
		TCWebApi_commit("Dhcpd_Common")
		TCWebApi_commit("Dhcpd_Option60")
	end if
	TCWebApi_set("Radvd_Entry","Enable","RAEnable_Flag")
	TCWebApi_set("Radvd_Entry","Mode","RAMode")
	if Request_Form("RAMode") = "1" then
		TCWebApi_set("Radvd_Entry","PrefixIPv6","radvdPrefix")
		TCWebApi_set("Radvd_Entry","Prefixv6Len","RAPrefixLen")
		TCWebApi_set("Radvd_Entry","PreferredLifetime","PreferredLifetime")
		TCWebApi_set("Radvd_Entry","ValidLifetime","ValidLifetime")
		TCWebApi_set("Radvd_Entry","ManagedEnable","RAManagedEn_Flag")
		TCWebApi_set("Radvd_Entry","OtherEnable","RAOtherEn_Flag")
		TCWebApi_set("Radvd_Entry","MinRAInterval","RACycMin")
		TCWebApi_set("Radvd_Entry","MaxRAInterval","RACycMax")
		TCWebApi_constSet("Radvd_Entry","AutoPrefix","1")
	else
		TCWebApi_constSet("Radvd_Entry","AutoPrefix","0")
		TCWebApi_set("Radvd_Entry","ManagedEnable","RAManagedEn_Flag")
		TCWebApi_set("Radvd_Entry","OtherEnable","RAOtherEn_Flag")
		TCWebApi_set("Radvd_Entry","DelegatedWanConnection","rapdsource")
	end if
	TCWebApi_commit("Radvd_Entry")
	TCWebApi_set("Dhcp6s_Entry","Enable","EnDHCPServerFlag")
	if Request_Form("EnDHCPServerFlag") = "1" then
		TCWebApi_set("Dhcp6s_Entry","Mode","DHCPSetTypeFlag")
		if Request_Form("DHCPSetTypeFlag") = "1" then
			TCWebApi_set("Dhcp6s_Entry","AddrFormat","AddrFormat")
			TCWebApi_set("Dhcp6s_Entry","PrefixIPv6","dhcpPrefix")
			TCWebApi_set("Dhcp6s_Entry","Prefixv6Len","PrefixLen")
			TCWebApi_set("Dhcp6s_Entry","PreferredLifetime","t1")
			TCWebApi_set("Dhcp6s_Entry","ValidLifetime","t2")
			TCWebApi_set("Dhcp6s_Entry","DNSserver","DnsSrvOne")
			TCWebApi_set("Dhcp6s_Entry","SecDNSserver","DnsSrvTwo")
			TCWebApi_constSet("Dhcp6s_Entry","DNSType","1")
		else
			if Request_Form("dnssource") = "999" then
				TCWebApi_constSet("Dhcp6s_Entry","DNSType","2")
			elseif Request_Form("dnssource") = "998" then
				TCWebApi_constSet("Dhcp6s_Entry","DNSType","1")
				TCWebApi_set("Dhcp6s_Entry","DNSserver","DnsSrvOne_Source")
				TCWebApi_set("Dhcp6s_Entry","SecDNSserver","DnsSrvTwo_Source")
			else
				TCWebApi_constSet("Dhcp6s_Entry","DNSType","0")
				TCWebApi_set("Dhcp6s_Entry","DNSWANConnection","dnssource")
			end if
		end if
	end if
	TCWebApi_commit("Dhcp6s_Entry")
	TCWebApi_save()
end if
%>
<!doctype html>
<html>
	<head>
<title><%tcWebApi_get("String_Entry","BranchName","s")%> ONT - <%tcWebApi_get("String_Entry","NavigationBasLANText","s")%></title>		<meta charset="utf-8">
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
var oldAddrPrimary = "<% tcwebapi_get("Lan_Entry0","IP","s") %>";
var oldMaskPrimary = "<% tcwebapi_get("Lan_Entry0","netmask","s") %>";
var nEntryNum = "<% tcWebApi_get("WanInfo_Common","CycleNum","s") %>";
// num 0
var vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
var vEntryName = vArrayStr.split(','); 
vArrayStr = "<% tcWebApi_get("WanInfo_Common","ValidIFIndex","s") %>";
var vEntryIndex = vArrayStr.split(',');
<% tcWebApi_constSet("WanInfo_Common", "CycleJump", "5") %>
// num 6
vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
var vIPVersion = vArrayStr.split(',');
function Show_DNS_mode() {
	if ($("#dns_mode").val() == "101") {
		$("#pri_dns4_div").show();
		$("#sec_dns4_div").show();
	}
	else {
		$("#pri_dns4_div").hide();
		$("#sec_dns4_div").hide();
	}
}
var SD_IP = new Array(8);
var SD_MAC = new Array(8);
var sd_has_rule= new Array(8);
SD_IP[0] = "<% tcWebApi_get("Dhcpd_Entry0","IP","s") %>";
SD_IP[1] = "<% tcWebApi_get("Dhcpd_Entry1","IP","s") %>";
SD_IP[2] = "<% tcWebApi_get("Dhcpd_Entry2","IP","s") %>";
SD_IP[3] = "<% tcWebApi_get("Dhcpd_Entry3","IP","s") %>";
SD_IP[4] = "<% tcWebApi_get("Dhcpd_Entry4","IP","s") %>";
SD_IP[5] = "<% tcWebApi_get("Dhcpd_Entry5","IP","s") %>";
SD_IP[6] = "<% tcWebApi_get("Dhcpd_Entry6","IP","s") %>";
SD_IP[7] = "<% tcWebApi_get("Dhcpd_Entry7","IP","s") %>";
SD_MAC[0] = "<% tcWebApi_get("Dhcpd_Entry0","MAC","s") %>";
SD_MAC[1] = "<% tcWebApi_get("Dhcpd_Entry1","MAC","s") %>";
SD_MAC[2] = "<% tcWebApi_get("Dhcpd_Entry2","MAC","s") %>";
SD_MAC[3] = "<% tcWebApi_get("Dhcpd_Entry3","MAC","s") %>";
SD_MAC[4] = "<% tcWebApi_get("Dhcpd_Entry4","MAC","s") %>";
SD_MAC[5] = "<% tcWebApi_get("Dhcpd_Entry5","MAC","s") %>";
SD_MAC[6] = "<% tcWebApi_get("Dhcpd_Entry6","MAC","s") %>";
SD_MAC[7] = "<% tcWebApi_get("Dhcpd_Entry7","MAC","s") %>";
var max_sd_entries = 8;
function sd_rearrange_rules() {			
	var i,j;
	for  (i=0; i < max_sd_entries; i++)
	{
		if ( sd_has_rule[i] != "1" )
		{
			for (j = i + 1; j < max_sd_entries; j++)
			{
				if ( sd_has_rule[j] == "1" )
				{
					$('#ip' + i).val($('#ip' + j).val());
					$('#mac' + i).val($('#mac' + j).val());
					sd_has_rule[i] = sd_has_rule[j];
					$('#ip' + j).val("");
					$('#mac' + j).val("");
					sd_has_rule[j] = "0";
					$('#sd_entry' + i).show();
					$('#sd_entry' + j).hide();
					break;
				}
			}
		}
	}
}
function get_first_empty_entry() {			
	var i;
	for (i=0; i < max_sd_entries; i++) {
		if (sd_has_rule[i] != "1") {
			return i;
		}
	}
	return -1;
}
function DeleteSDEntry(i) {
	sd_has_rule[i] = "0";
	$('#ip' + i).val("");
	$('#mac' + i).val("");
	$("#sd_entry" + i).hide()
	sd_rearrange_rules();
	i = get_first_empty_entry();
	if (i == 0) {
		sd_has_rule[0] = "1";
		$("#sd_entry0").show();
		$("#sd_entry" + i ).addClass("tr-bordered-bottom");
	}
	else {
		$("#static_dhcp_table tbody tr").removeClass("tr-bordered-bottom");
		$("#sd_entry" + (i -1) ).addClass("tr-bordered-bottom");
	}
}
function addNewSDEntry() {
	var i;
	sd_rearrange_rules();
	i = get_first_empty_entry();
	if (i >= 0) {
		sd_has_rule[i] = "1";
		$("#sd_entry" + i).show();
	} else {
		alert("<%tcwebApi_get("String_Entry", "TableMaximumEntriesReachText", "s") %>");
	}
	$("#static_dhcp_table tbody tr").removeClass("tr-bordered-bottom");
	$("#sd_entry" + i ).addClass("tr-bordered-bottom");
}
function ShowStaticDHCP() {
	var i = 0;
	for (i = 0; i < 8; i++) {
		if ((SD_IP[i] != "N/A") && (SD_IP[i] != "")) {
			if (SD_MAC[i] != "00:00:00:00:00:00")
				$('#sd_entry' + i).show();
			sd_has_rule[i] = "1";
			$('#ip' + i).val(SD_IP[i]);
			$('#mac' + i).val(SD_MAC[i]);
		}
		else {
			sd_has_rule[i] = "0";
		}
	}
	sd_rearrange_rules();
	i = get_first_empty_entry();
	if (i == 0) {
		sd_has_rule[0] = "1";
		$("#sd_entry0").show();
		$("#sd_entry" + i ).addClass("tr-bordered-bottom");
	}
	else {
		$("#sd_entry" + (i -1) ).addClass("tr-bordered-bottom");
	}
}
function setDhcpAddresses(lanIp)
{
/*	with (document.lan_form)
	{
		if (isValidIpAddress(lanIp) == false)
		{
			alert('<%tcWebApi_get("String_Entry","LANJS0Text","s")%> "' + lanIp + '" <%tcWebApi_get("String_Entry","LANJS3Text","s")%>');
			return;
		}
		var lanMask = ethSubnetMask.value;
		var Start = dhcpEthStart.value;
		var End = dhcpEthEnd.value;
		addrParts = lanIp.split('.');
		maskParts = lanMask.split('.');
		if ( addrParts.length != 4 )
			return false;
		if ( maskParts.length != 4 )
			return false;
		if (isValidSubnetMask(lanMask) == false || parseInt(maskParts[3]) >= 254)
		{
			alert('<%tcWebApi_get("String_Entry","LANJS2Text","s")%> "' + lanMask + '"<%tcWebApi_get("String_Entry","LANJS1Text","s")%>');
			return false;
		}
		var e1 = parseInt(addrParts[3]) + 1;
		var e2 = 254 - parseInt(maskParts[3]);
		if (255 <= e2)
		{
			e2 = 254;
		}
		if (dhcpEthStart.value != '' && e1 >= 255)
		{
			alert("<%tcWebApi_get("String_Entry","LANJS34Text","s")%>");
			return false;
		}
		dhcpEthStart.value = dhcpEthEnd.value = "";
		for (i = 0; i < 3; i++)
		{
			dhcpEthStart.value = dhcpEthStart.value + addrParts[i] + ".";
			dhcpEthEnd.value = dhcpEthEnd.value + addrParts[i] + ".";
		}
		dhcpEthStart.value = dhcpEthStart.value + e1;
		dhcpEthEnd.value = dhcpEthEnd.value + e2;
		if ( dhcpSrvType.checked == true
		&& ((oldAddrPrimary != ethIpAddress.value)||(oldMaskPrimary != ethSubnetMask.value)))
		{
			alert('<%tcWebApi_get("String_Entry","LANJS32Text","s")%>');
			changeAddrFlag = true;
			RouteIPChangeFlag.value="1";
		}
	} */
}
function enableDhcpSrv()
{
	with (document.lan_form)
	{
		dhcpEthStart.disabled = 0;
		dhcpEthEnd.disabled = 0;
		dhcpEthStart.value = dhcpStart;
		dhcpEthEnd.value = dhcpEnd;
		setDisable('dhcpLeasedTimeFrag', 0);
		setDisable('enableRelay',0);
		setDisplay("DhcprelayIP", 0);
		setDisplay("dhcpstartaddr",1);
		setDisplay("dhcpendaddr",1);
		setDisplay("dhcplease",1);
	}
}
function enableDhcpSrv()
{
	with (document.lan_form)
	{
		dhcpEthStart.disabled = 0;
		dhcpEthEnd.disabled = 0;
		dhcpLeasedTime.disabled = 0;
		$("#dhcp_div_1").show();
		$("#static_div_1").show();
	}
}
function disableDhcpSrv()
{
	with (document.lan_form)
	{
		dhcpEthStart.disabled = 1;
		dhcpEthEnd.disabled = 1;
		dhcpLeasedTime.disabled = 1;
		$("#dhcp_div_1").hide();
		$("#static_div_1").hide();
	}
}
function typeClick()
{
	with (document.lan_form)
	{
		if ( dhcpSrvType.checked == true )
		{
			enableDhcpSrv();
			lanDhcpType.value = 1; // duongnt62
		}
		else if (dhcpSrvType.checked == false)
		{
			disableDhcpSrv();
			lanDhcpType.value = 0; //duongnt62
		}
	}
}
function enableRASrv()
{
	with (document.lan_form)
	{
		setDisplay('RAAssConnection', 1);
		if ("Normal" == RAUseWan.value)
		{
			setDisplay('RadvdPrefixCfg', 1);
		}
	}
}
function disableRASrv()
{
	with (document.lan_form)
	{
		setDisplay('RAAssConnection', 0);
		setDisplay('RadvdPrefixCfg', 0);
	}
}
function RAUseWanChange()
{
	with (document.lan_form)
	{
		if ("Normal" == RAUseWan.value && 1 == getCheckVal('radvdSrvType'))
		{
			setDisplay('RadvdPrefixCfg', 1);
			RAMode.value = "1";
		}
		else
		{
			setDisplay('RadvdPrefixCfg', 0);
			RAMode.value = "0";
		}
		setDisplay('rapdsourcepart', ('Normal' == RAUseWan.value) ? 0 : 1);
		setDisplay('ramoflagdisp', ('Normal' == RAUseWan.value) ? 0 : 1);
	}
}
function RATypeClick() {
	with (document.lan_form)
	{
		if (getCheckVal('radvdSrvType') == 0)
		{
			disableRASrv();
			RAEnable_Flag.value = "0";
		}
		else
		{
			enableRASrv();
			RAEnable_Flag.value = "1";
			RAUseWanChange();
		}
	}
}
function initRaPDSourceList()
{
	var RaPdSourceIdx = '<% tcWebApi_get("Radvd_Entry","DelegatedWanConnection","s") %>';
	var RaPdType = '<% tcWebApi_get("Radvd_Entry","AutoPrefix","s") %>';
	var RaPdTmpUseIdx = '<% tcWebApi_get("WanInfo_Common","PDRUNIFIdx","s") %>';
	var i = 0;
	var isSel = -1;
	var bakSel = -1;
	var itemCnt = 0;
	with (getElById('rapdsource'))
	{
		for( i=0; i< parseInt(nEntryNum); i++)
		{
			var opt;
			var CONName = vEntryName[i];
			if ( ( CONName.indexOf('_INTERNET_R_') < 0 && CONName.indexOf('_OTHER_R_') < 0 )
				|| 'IPv4' == vIPVersion[i] )
				continue;
			opt = new Option(CONName, vEntryIndex[i]);
			if ( 'N/A' == RaPdType || 0 == RaPdSourceIdx.length )
			{
				if (  'N/A' != RaPdTmpUseIdx && RaPdTmpUseIdx == vEntryIndex[i] )
				{
					opt.selected = true;
					isSel = itemCnt;
				}
			}
			else
			{
				if (  'N/A' != RaPdSourceIdx && RaPdSourceIdx == vEntryIndex[i] )
				{
					opt.selected = true;
					isSel = itemCnt;
				}
				else
				{
					if (  'N/A' != RaPdTmpUseIdx && RaPdTmpUseIdx == vEntryIndex[i] )
					{
						bakSel = itemCnt;
					}
				}
			}
			itemCnt ++;
			options.add ( opt );
		}
		if ( isSel >= 0 )
			options[isSel].setAttribute('selected', 'true');
		else if ( bakSel >= 0 )
		{
				options[bakSel].selected = true;
				options[bakSel].setAttribute('selected', 'true');
		}
	}
}
function dnsSourceListChg()
{
	var dnsSourceType = getSelectVal('dnssource');
	if ( '998' == dnsSourceType )
	{
		setDisplay('dnssourcepart_2', 1);
		setDisplay('dnssourcepart_3', 1);
	}
	else
	{
		setDisplay('dnssourcepart_2', 0);
		setDisplay('dnssourcepart_3', 0);
	}
}
function dnsSourceHide()
{
	setDisplay('dnssourcepart', 0);
	setDisplay('dnssourcepart_2', 0);
	setDisplay('dnssourcepart_3', 0);
}
function dnsSourceDisp()
{
	with (document.lan_form)
	{
		if (1 == getCheckVal('dhcp6SrvType'))
		{
			if ( 'Normal' == UseWan.value )
			{
				dnsSourceHide();
			}
			else
			{
				setDisplay('dnssourcepart', 1);
				dnsSourceListChg();
			}
		}
		else
		{
				dnsSourceHide();
		}
	}
}
function disableDhcp6Srv()
{
	with ( document.lan_form )
	{
		setCheck("dhcp6SrvType" ,0);
		setDisplay('AssConnection',0);
		setDisplay('DHCP6SPrefixCfg',0);
		setDisable('dhcpPrefix',1);
		setDisable('PrefixLen' ,1);
		setDisable('t1',1);
		setDisable('t2',1);
		setDisable('DnsSrvOne',1);
		setDisable('DnsSrvTwo',1);
	}
}
function enableDhcp6Srv(formLoad)
{
	with ( document.lan_form )
	{
		setCheck("dhcp6SrvType",1);
		setDisplay('AssConnection',1);
		if ( "Normal" == UseWan.value )
		{
			setDisplay('DHCP6SPrefixCfg', 1);
		}
		setDisable('dhcpPrefix',0);
		setDisable('PrefixLen' ,0);
		setDisable('t1',0);
		setDisable('t2',0);
		setDisable('DnsSrvOne',0);
		setDisable('DnsSrvTwo',0);
	}
}
function typev6Click()
{
	with ( document.lan_form)
	{
		if (getCheckVal('dhcp6SrvType') == 0)//unchecked
		{
		disableDhcp6Srv();
		EnDHCPServerFlag.value = "0";
		}
		else
		{
		enableDhcp6Srv(1);
		EnDHCPServerFlag.value = "1";
		}
		dnsSourceDisp();
	}
}
/* ONTS-268 */
function initDnsV4SourceList()
{
	var DnsSourceIdx = '<% tcWebApi_get("Dhcpd","DNSWANConnection","s") %>';
	var DproxyType = '<% tcWebApi_get("Dproxy_Entry0","type","s") %>';
	var DproxyActive = '<% tcWebApi_get("Dproxy_Entry0","Active","s") %>';
	var i = 0;
	var isSelect = -1;
	var itemCnt = 0;
	with (getElById('dns_mode'))
	{
		for( i=0; i< parseInt(nEntryNum) + 2; i++)
		{
			var opt;
			if ( 0 == i )
				opt = new Option('Proxy', '100');
			else if ( 1 == i )
				opt = new Option('Static', '101');
			else
			{
				var WAN_Entry = i - 2;
				var CONName = vEntryName[WAN_Entry];
				if (CONName.indexOf('_INTERNET_R_') < 0 || 'IPv6' == vIPVersion[WAN_Entry])
					continue;
				opt = new Option(CONName, i-1);
			}
			if('Yes' == DproxyActive)
			{
				if (0 == i && '0' == DproxyType)
				{
					opt.selected = true;
					isSel = 0;
				}
				else if (1 == i && '1' == DproxyType)
				{
					opt.selected = true;
					isSel = 1;
				}
			}
			else if('No' == DproxyActive && i > 1 && DnsSourceIdx == (i-1)) /* wan1 to wan8 */
			{
				opt.selected = true;
				isSel = itemCnt;
			}
			itemCnt ++;
			options.add(opt);
		}
		if (isSel >= 0)
			options[isSel].setAttribute('selected', 'true');
	}
}
/* end ONTS-268 */
function initDnsSourceList()
{
	var DnsSourceIdx = '<% tcWebApi_get("Dhcp6s_Entry","DNSWANConnection","s") %>';
	var DnsType = '<% tcWebApi_get("Dhcp6s_Entry","DNSType","s") %>';
	var i = 0;
	var isSel = -1;
	var itemCnt = 0;
	with (getElById('dnssource'))
	{
		for( i=0; i< parseInt(nEntryNum) + 2; i++)
		{
			var opt;
			if ( 0 == i )
				opt = new Option('Proxy', '999');
			else if ( 1 == i )
				opt = new Option('Static', '998');
			else
			{
				var WAN_Entry = i - 2;
				var CONName = vEntryName[WAN_Entry];
				if ( ( CONName.indexOf('_INTERNET_R_') < 0 && CONName.indexOf('_OTHER_R_') < 0 )
					|| 'IPv4' == vIPVersion[WAN_Entry] )
					continue;
				opt = new Option(CONName, vEntryIndex[WAN_Entry]);
			}
			if ( 0 == i && '2' == DnsType )
			{
				opt.selected = true;
				isSel = 0;
			}
			else if ( 1 == i && '1' == DnsType )
			{
				opt.selected = true;
				isSel = 1;
			}
			else if ( i > 1 &&  '0' == DnsType && DnsSourceIdx == vEntryIndex[i - 2] )
			{
				opt.selected = true;
				isSel = itemCnt;
			}
			itemCnt ++;
			options.add ( opt );
		}
		if ( isSel >= 0 )
			options[isSel].setAttribute('selected', 'true');
	}
}
function UseWanChange()
{
	with (document.lan_form)
	{
		if ( ("Normal" == UseWan.value) && (1 == getCheckVal('dhcp6SrvType')) )
		{
			setDisplay('DHCP6SPrefixCfg', 1);
			DHCPSetTypeFlag.value = "1";
		}
		else
		{
			if( "UseAllocatedSubnet" == UseWan.value)
				DHCPSetTypeFlag.value = "0";
			else if( "UseAllocatedOther" == UseWan.value)
				DHCPSetTypeFlag.value = "2";
			setDisplay('DHCP6SPrefixCfg', 0);
		}
		dnsSourceDisp();
	}
}
function showEndIP() {
	var Start = $("#dhcpEthStart").val();
	var Count = parseInt($("#dhcpEthPool").val());
	var End = "";
	addrParts = Start.split('.');
	for (i = 0; i < 3; i++)
	{
		End = End + addrParts[i] + ".";
	}
	End += (parseInt(addrParts[3]) + Count - 1);
	$("#dhcpEthEnd").val(End);
}
function showLeaseTime() {
	$("#dhcpLeasedTime").val(parseInt($("#dhcpLeasedTimesecond").val())/60);
}
function setLeaseTime() {
	$("#dhcpLeasedTimesecond").val(parseInt($("#dhcpLeasedTime").val())*60);
}
function checkSafehome() {
	// var EnableSafehome = '<% tcWebApi_get("vSafes_Common","Enable","s") %>';
	// if ('Yes' == EnableSafehome) {
	//     $("#dns_mode").parent().addClass("select-disable");
    // 	$("#dns_mode").prop("disabled", true);
	// 	$("#radvdSrvType").prop("disabled", true);
	// 	$("#dhcp6SrvType").prop("disabled", true);
	// }
	return;
}
function showUI() {
	showEndIP();
	showLeaseTime();
	Show_DNS_mode();
	ShowStaticDHCP();
	typeClick();
	RAUseWanChange();
	RATypeClick();
	typev6Click();
	UseWanChange();
/*ONTS-963*/
	//checkSafehome();
}
function isEndGTEStart(EndIp, StartIp)
{
	addrEnd = EndIp.split('.');
	addrStart = StartIp.split('.');
	E = parseInt(addrEnd[3]) + 1;
	S = parseInt(addrStart[3]) + 1;
	if (E < S)
	return false;
	return true;
}
function GetEndSubStartCount(EndIp, StartIp)
{
	var vret;
	addrEnd = EndIp.split('.');
	addrStart = StartIp.split('.');
	E = parseInt(addrEnd[3]) + 1;
	S = parseInt(addrStart[3]);
	vret = E - S;
	return vret;
}
function CheckFormLAN() {
	with (document.lan_form)
	{
	if (isValidIpAddress(ethIpAddress.value) == false)
	{
		alert('<%tcWebApi_get("String_Entry","LANJS0Text","s")%> "' + ethIpAddress.value + '" <%tcWebApi_get("String_Entry","LANJS1Text","s")%> ');
		return false;
	}
	if (isValidSubnetMask(ethSubnetMask.value) == false)
	{
		alert('<%tcWebApi_get("String_Entry","LANJS2Text","s")%> "' + ethSubnetMask.value + '" <%tcWebApi_get("String_Entry","LANJS1Text","s")%>');
		return false;
	}
	if (isBroadcastIp(ethIpAddress.value, ethSubnetMask.value) == true)
	{
		alert('<%tcWebApi_get("String_Entry","LANJS0Text","s")%> "' + ethIpAddress.value + '"<%tcWebApi_get("String_Entry","LANJS1Text","s")%> ');
		return false;
	}
	if (isValidLeaseTime(dhcpLeasedTime.value) == false)
	{
		alert('<%tcWebApi_get("String_Entry","LANJS37Text","s")%> ');
		return false;
	}
	if (dhcpSrvType.checked == true)
	{
		if (dhcpEthStart.value == '0.0.0.0')
		{
			alert('<%tcWebApi_get("String_Entry","LANIPAddressStartText","s")%> "' + dhcpEthStart.value + '" <%tcWebApi_get("String_Entry","LANJS3Text","s")%>');
			return false;
		}
		if (dhcpEthEnd.value == '0.0.0.0')
		{
			alert('<%tcWebApi_get("String_Entry","LANIPAddressEndText","s")%> "' + dhcpEthEnd.value + '" <%tcWebApi_get("String_Entry","LANJS3Text","s")%>');
			return false;
		}
		if ((dhcpEthStart.value != '0.0.0.0')&&(dhcpEthEnd.value != '0.0.0.0'))
		{
			if (isValidIpAddress(dhcpEthStart.value) == false ||
			!(isSameSubNet(ethIpAddress.value, ethSubnetMask.value, dhcpEthStart.value, ethSubnetMask.value)))
			{
				alert('<%tcWebApi_get("String_Entry","LANIPAddressStartText","s")%>"' + dhcpEthStart.value + '" <%tcWebApi_get("String_Entry","LANJS3Text","s")%>');
				return false;
			}
			if (isBroadcastIp(dhcpEthStart.value, ethSubnetMask.value) == true)
			{
				alert('<%tcWebApi_get("String_Entry","LANJS15Text","s")%>  "' + dhcpEthStart.value + '"<%tcWebApi_get("String_Entry","LANJS1Text","s")%>');
				return false;
			}
			if (isValidIpAddress(dhcpEthEnd.value) == false ||
			!(isSameSubNet(ethIpAddress.value, ethSubnetMask.value, dhcpEthEnd.value, ethSubnetMask.value)))
			{
				alert('<%tcWebApi_get("String_Entry","LANIPAddressEndText","s")%> "' + dhcpEthEnd.value + '" <%tcWebApi_get("String_Entry","LANJS3Text","s")%>');
				return false;
			}
			if (isBroadcastIp(dhcpEthEnd.value, ethSubnetMask.value) == true)
			{
				alert('<%tcWebApi_get("String_Entry","LANJS16Text","s")%> "' + dhcpEthEnd.value + '" <%tcWebApi_get("String_Entry","LANJS1Text","s")%>');
				return false;
			}
			if (!(isEndGTEStart(dhcpEthEnd.value, dhcpEthStart.value)))
			{
				alert("<%tcWebApi_get("String_Entry","LANJS17Text","s")%>");
				return false;
			}
			if (dhcpEthStart.value == ethIpAddress.value)
			{
				alert("<%tcWebApi_get("String_Entry","LANJS19Text","s")%>");
				return false;
			}
			if (dhcpEthEnd.value == ethIpAddress.value)
			{
				alert("<%tcWebApi_get("String_Entry","LANJS20Text","s")%>");
				return false;
			}
			if(parseInt(ethIpAddress.value.split('.')[3]) > parseInt(dhcpEthStart.value.split('.')[3]) && parseInt(ethIpAddress.value.split('.')[3]) < parseInt(dhcpEthEnd.value.split('.')[3]))
			{
				alert("<%tcWebApi_get("String_Entry","LANJS36Text","s")%>");
				return false;
			}
		}
		if ($("#dns_mode").val() == "101") {
			if (isValidIpAddress(pri_dns4.value) == false) {
				alert("<%tcWebApi_get("String_Entry","DNSInvalid1Text","s")%>");
				pri_dns4.focus();
				return false;
			}
			if (isValidIpAddress(sec_dns4.value) == false) {
				alert("<%tcWebApi_get("String_Entry","DNSInvalid2Text","s")%>");
				sec_dns4.focus();
				return false;
			}
		}
		for (var i=0; i < max_sd_entries; i++) {
			if (($('#ip'+ i).val().trim().length == 0) && ($('#mac'+i).val().trim().length == 0)) {
				continue;
			}
			if (isValidIpAddress($('#ip'+ i).val()) == false ||
			!(isSameSubNet(ethIpAddress.value, ethSubnetMask.value, $('#ip'+ i).val(), ethSubnetMask.value)))
			{
				alert('<%tcWebApi_get("String_Entry","LANStaticDHCPIPInvalidText","s")%>');
				$('#ip'+ i).focus();
				return false;
			}
			if (!(isEndGTEStart($('#ip'+ i).val(), dhcpEthStart.value)))
			{
				alert("<%tcWebApi_get("String_Entry","LANStaticDHCPIPInvalidText","s")%>");
				$('#ip'+ i).focus();
				return false;
			}
			if (!(isEndGTEStart(dhcpEthEnd.value, $('#ip'+ i).val())))
			{
				alert("<%tcWebApi_get("String_Entry","LANStaticDHCPIPInvalidText","s")%>");
				$('#ip'+ i).focus();
				return false;
			}
			if (!isValidMacAddress($('#mac'+ i).val())) {
				alert("<%tcWebApi_get("String_Entry","LANMACInvalidText","s")%>");
				$('#mac'+ i).focus();
				return false;
			}
			for (var j=0;j<i;j++) {
				if ($('#ip'+ i).val() == $('#ip'+ j).val()) {
					alert("<%tcWebApi_get("String_Entry","LANDuplicateIPText","s")%>");
					$('#ip'+ j).focus();
					return false;
				}
			}
			for (var j=0;j<i;j++) {
				if ($('#mac'+ i).val() == $('#mac'+ j).val()) {
					alert("<%tcWebApi_get("String_Entry","LANDuplicateMACText","s")%>");
					$('#mac'+ j).focus();
					return false;
				}
			}
		}
		sd_rearrange_rules();
	}
	if ( dhcpSrvType.checked == true
	&& ((oldAddrPrimary != ethIpAddress.value)||(oldMaskPrimary != ethSubnetMask.value)))
	{
		RouteIPChangeFlag.value="1";
	}
	oldAddrPrimary = ethIpAddress.value;
	oldMaskPrimary = ethSubnetMask.value;
	}
}
function CheckRAPrefix(Prefix, type)
{
	var IpAddress1 = Prefix.split(':');
	var IpAddress3 = Prefix;
	if (1 == type && '' == IpAddress3)
	{
		return true;
	}
	if (true != isGlobalIpv6Address(IpAddress3))
	{
		return false;
	}
	return true;
}
function CheckLength(Length)
{
	var TemLen = parseInt(Length);
	if ( true == isNaN(TemLen) || TemLen > 64 || TemLen < 16)
	{
		return false;
	}
	return true;
}
function CheckRATime(Time1,Time2)
{
	var TemTime1 = Time1;
	var TemTime2 = Time2;
	if (TemTime1.length > 10 || '' == TemTime1)
	{
		return 1;
	}
	if (TemTime2.length > 10 || '' == TemTime2)
	{
		return 2;
	}
	if (true != isPlusInteger(TemTime1))
	{
		return 1;
	}
	if (true != isPlusInteger(TemTime2))
	{
		return 2;
	}
	TemTime1 = parseInt(Time1);
	TemTime2 = parseInt(Time2);
	if (TemTime1 > 4294967295 || TemTime1 < 600)
	{
		return 1;
	}
	if (TemTime2 > 4294967295 || TemTime2 < 600)
	{
		return 2;
	}
	if (TemTime2 <= TemTime1)
	{
		return 3;
	}
	return true;
}
function RAIntervalValue(vMin, vMax)
{
	var MinInterval = vMin;
	var MaxInterval = vMax;
	if ('' == MinInterval)
	{
		return 1;
	}
	if ('' == MaxInterval)
	{
		return 2;
	}
	MinInterval = parseFloat(vMin);
	MaxInterval = parseFloat(vMax);
	if ( (MinInterval < 3) || (MinInterval > 1350) || !isFloat(vMin))
		return 1;
	if ( (MaxInterval > 1800) || (MaxInterval < 4) || !isFloat(vMax))
		return 2;
	if ( MaxInterval < MinInterval )
		return 3;
	if ( MinInterval > (MaxInterval*0.75) )
		return 4;
	return true;
}
function RACheckForm(type)
{
	with (document.lan_form)
	{
		if (1 != getCheckVal('radvdSrvType') || "Normal" != RAUseWan.value)
		{
			if ( 1 == getCheckVal('radvdSrvType') )
			{
					RAManagedEn_Flag.value = ( 1 == getCheckVal('ramflag') ) ? '1' : '0';
					RAOtherEn_Flag.value = ( 1 == getCheckVal('raoflag') ) ? '1' : '0';
			}
			return true;
		}
		if (true != CheckRAPrefix(radvdPrefix.value,0))
		{
			alert("<%tcWebApi_get("String_Entry","RadvdPrefixText","s")%> \"" + radvdPrefix.value + "\" <%tcWebApi_get("String_Entry","LANJS6Text","s")%>");
			return false;
		}
		if (true != CheckLength(RAPrefixLen.value))
		{
			alert("<%tcWebApi_get("String_Entry","LANJS7Text","s")%> \"" + RAPrefixLen.value + "\" <%tcWebApi_get("String_Entry","LANJS5Text","s")%>");
			return false;
		}
		switch (CheckRATime(PreferredLifetime.value,ValidLifetime.value))
		{
			case 1 :
			{
				alert("<%tcWebApi_get("String_Entry","TimeText","s")%> \"" + PreferredLifetime.value + "\" <%tcWebApi_get("String_Entry","LANJS5Text","s")%>");
				return false;
			}
			case 2 :
			{
				alert("<%tcWebApi_get("String_Entry","TimeText","s")%> \"" + ValidLifetime.value + "\" <%tcWebApi_get("String_Entry","LANJS5Text","s")%>");
				return false;
			}
			case 3 :
			{
				alert("<%tcWebApi_get("String_Entry","DHCP6ValidLifetimeText","s")%> " + ValidLifetime.value + " <%tcWebApi_get("String_Entry","LANJS10Text","s")%> " + PreferredLifetime.value);
				return false;
			}
			default:
			break;
		}
		switch (RAIntervalValue(RACycMin.value, RACycMax.value)){
			case 1 :
			{
				alert("<%tcWebApi_get("String_Entry","LANJS11Text","s")%> \"" + RACycMin.value + "\" <%tcWebApi_get("String_Entry","LANJS5Text","s")%>");
				return false;
			}
			case 2 :
			{
				alert("<%tcWebApi_get("String_Entry","LANJS12Text","s")%> \"" + RACycMax.value + "\" <%tcWebApi_get("String_Entry","LANJS5Text","s")%>");
				return false;
			}
			case 3 :
			{
				alert("<%tcWebApi_get("String_Entry","LANJS12Text","s")%> " + RACycMax.value + " <%tcWebApi_get("String_Entry","LANJS13Text","s")%> " + RACycMin.value);
				return false;
			}
			case 4 :
			{
				var temp = parseFloat(RACycMax.value) * 0.75;
				alert("<%tcWebApi_get("String_Entry","LANJS11Text","s")%> " + RACycMin.value + " <%tcWebApi_get("String_Entry","LANJS14Text","s")%> " + temp.toString());
				return false;
			}
			default:
				break;
		}
	}
	return true;
}
function CheckLength(Length)
{
	var TemLen = parseInt(Length);
	if ( true == isNaN(TemLen) || TemLen > 64 || TemLen < 16)
	{
		return false;
	}
	return true;
}
function CheckFormIP6(type)
{
	with (document.lan_form)
	{
		switch (type)
		{
			case 3:
			{
				if (1 != getCheckVal('dhcp6SrvType') || "Normal" != UseWan.value)
				{
					return true;
				}
				if ("" != dhcpPrefix.value)
				{
					if (true != CheckPrefix(dhcpPrefix.value,0))
					{
						alert('<%tcWebApi_get("String_Entry","LANJS4Text","s")%>"' + dhcpPrefix.value +'" <%tcWebApi_get("String_Entry","LANJS6Text","s")%>');
						return false;
					}
				}
				if ("" != dhcpPrefix.value || ("" != PrefixLen.value && 0 != PrefixLen.value))
				{
					if (true != CheckLength(PrefixLen.value))
					{
						alert('<%tcWebApi_get("String_Entry","LANJS7Text","s")%>"' + PrefixLen.value + '" <%tcWebApi_get("String_Entry","LANJS5Text","s")%>');
						return false;
					}
				}
				if ("" != dhcpPrefix.value || ("" != t1.value && 0 != t1.value) || ("" != t2.value && 0 != t2.value))
				{
					switch (CheckTime(t1.value,t2.value))
					{
					case 1 :
					{
					alert('<%tcWebApi_get("String_Entry","TimeText","s")%> "' + t1.value + '" <%tcWebApi_get("String_Entry","LANJS5Text","s")%>');
					return false;
					}
					case 2 :
					{
					alert('<%tcWebApi_get("String_Entry","TimeText","s")%>"' + t2.value + '" <%tcWebApi_get("String_Entry","LANJS5Text","s")%>');
					return false;
					}
					case 3 :
					{
					alert('<%tcWebApi_get("String_Entry","DHCP6ValidLifetimeText","s")%>' + t2.value + '<%tcWebApi_get("String_Entry","LANJS33Text","s")%>' + '<%tcWebApi_get("String_Entry","LANJS29Text","s")%> ' + t1.value);
					return false;
					}
					default:
					break;
					}
				}
				if ("" == DnsSrvOne.value && "" != DnsSrvTwo.value)
				{
				alert('<%tcWebApi_get("String_Entry","LANJS4Text","s")%> "' + DnsSrvOne.value + '" <%tcWebApi_get("String_Entry","LANJS6Text","s")%>');
				return false;
				}
				if (true != CheckPrefix(DnsSrvOne.value,1))
				{
				alert('<%tcWebApi_get("String_Entry","LANJS4Text","s")%>"' + DnsSrvOne.value + '" <%tcWebApi_get("String_Entry","LANJS6Text","s")%>');
				return false;
				}
				if (true != CheckPrefix(DnsSrvTwo.value,1))
				{
				alert('<%tcWebApi_get("String_Entry","LANJS4Text","s")%> "' + DnsSrvTwo.value + '" <%tcWebApi_get("String_Entry","LANJS6Text","s")%>');
				return false;
				}
				break;
			}
			case 1:
			{
			}
			break;
			case 2:
			{
			}
			break;
			default:
			break;
		}
	}
	return true;
}
function doSubmit()
{
	if(CheckFormLAN() == false)
		return false;
	var	vForm = document.lan_form;
	vForm.dhcpEthPool.value = GetEndSubStartCount(vForm.dhcpEthEnd.value, vForm.dhcpEthStart.value);
	setLeaseTime();
	if (RACheckForm() == false)
	{
		return false;
	}
	if (CheckFormIP6() == false)
	{
		return false;
	}
	submitAsync("lan_form");
}
</script>
	</head>
	<body onload="showUI();" class="container" >
<header class="fixed-top"><nav id="top-nav" class="navbar navbar-expand-lg container"><a class="navbar-brand " href="/cgi-bin/home.asp"><div><img src="/img/logo_home.png" width="100" height="18" alt=""><div style="font-family: sans-serif; font-weight: bold;font-size: 12px;color: #000; margin-top: 0">OPTICAL NETWORK TERMINATION</div></div></a><button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"><em class="fas fa-align-justify"></em></span></button><div class="collapse navbar-collapse" id="navbarCollapse"><ul class="navbar-nav mr-auto sidenav" id="navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/home.asp"><%tcWebApi_get("String_Entry","NavigationHomeText","s")%><span class="sr-only"></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/deviceinfo.asp"><%tcWebApi_get("String_Entry","NavigationStatusDeviceText","s")%><span class="sr-only"></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/wifi-mesh-topology.asp"><%tcWebApi_get("String_Entry","EasyMeshStatus5Text","s")%><span class="sr-only"></span></a></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#status-menu" aria-controls="status-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NavigationStatusStatisticsText","s")%></a><ul class="nav-second-level collapse" id="status-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/sta-statistics.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationTrafficText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/sta-wifiusers.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationStatusUsersText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/sta-users.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","ARPStatusText","s")%></span></a></li></ul></li><li class="nav-item active"><a class="nav-link nav-link-collapse nav-link-show" href="#" id="hasSubItems" data-toggle="collapse" data-target="#network-menu" aria-controls="network-menu" aria-expanded="true"><%tcWebApi_get("String_Entry","NAVNetwork","s")%></a><ul class="nav-second-level show" id="network-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/net-wan.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationBasInternetText","s")%></span></a></li><li class="nav-item active"><a class="nav-link" href="/cgi-bin/net-lan.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationBasLANText","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#wifi-menu" aria-controls="wifi-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NAVWifi","s")%></a><ul class="nav-second-level collapse" id="wifi-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/wifi.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationWiFiSettingsText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/wifi-11ac.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationWiFi11acSettingsText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/wifi-mesh.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationMesh","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#firewall-menu" aria-controls="firewall-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NavigationAdvFirewallText","s")%></a><ul class="nav-second-level collapse" id="firewall-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-spi.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","ContentFirewallText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-urlfilter.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","FILTERTYPE_index2","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-macfilter.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVL2Filter","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-parentalcontrol.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","ParentalControlText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/safehome.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","SafehomeText","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#apps-menu" aria-controls="apps-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NAVApplication","s")%></a><ul class="nav-second-level collapse" id="apps-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-dmz.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NatTopDMZText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-portforwarding.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NatVirsvrText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-sslim.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","SessionLimit","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-route.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","StaticRouteText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-ddns.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","dyDNS1Text","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-wifischeduling.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","WifiSchedulingText","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#tools-menu" aria-controls="tools-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NavigationMaintenanceText","s")%></a><ul class="nav-second-level collapse" id="tools-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-admin.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationMainAdminText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-time.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVSysTime","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-firmware.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationMainFirmwareText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-config.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVConfig","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-diagnostic.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationMainDiagnosticsText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-wan2lan.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","Wan2lanText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-log.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVLogs","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-reboot.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","RebootText","s")%></span></a></li></ul></li></ul><div class="top-item-groups"><form name="LanguageForm" method="POST" action="/cgi-bin/net-lan.asp" class="nav-item dropdown"><input type="hidden" name="TokenString" value="<%tcWebApi_getToken()%>"><input type="hidden" name="Language_Flag" value="<% tcWebApi_get("LanguageSwitch_Entry","Type","s") %>"><a class="nav-link dropdown-toggle" href="#" id="LanguageDropdown" role="button" data-toggle="dropdown" aria-expanded="false"><% tcWebApi_get("String_Entry","LoginLanguage","s") %></a><ul class="dropdown-menu" aria-labelledby="LanguageDropdown"><li><a class="dropdown-item <% if tcWebApi_get("LanguageSwitch_Entry","Type","h") = "1" then asp_Write("active") end if %>" href="#" onclick="submitLanguageForm(1);"><% tcWebApi_get("String_Entry","LanguageVIELong","s") %></a></li><li><a class="dropdown-item <% if tcWebApi_get("LanguageSwitch_Entry","Type","h") = "2" then asp_Write("active") end if %>" href="#" onclick="submitLanguageForm(2);"><% tcWebApi_get("String_Entry","LanguageENGLong","s") %></a></li></ul></form><div id="signout" class="nav-item"><a class="nav-link" href="javascript:doLogout();"><em class="fa fa-sign-out-alt"></em><span class="nav-link-text"><% tcWebApi_get("String_Entry","LogoutText","s") %></span></a></div></div></div></header></nav><% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then
	if tcWebApi_get("Mesh_Common", "DeviceRole", "h") = "2" then %>
		<script language='javascript'>
		document.getElementById("network-menu").children[0].style="display: none";
		document.getElementById("network-menu").children[1].style="display: none";
		document.getElementById("wifi-menu").children[0].style="display: none";
		document.getElementById("wifi-menu").children[1].style="display: none";
		</script>
<% end if end if %>		<div id="content">
			<form class="form-inline" METHOD="POST" ACTION="/cgi-bin/net-lan.asp" name="lan_form" >
			<input type="hidden" name="TokenString" value="<%tcWebApi_getToken()%>">
			<input type=hidden name=RouteIPChangeFlag id=RouteIPChangeFlag value=0>
			<input type="hidden" id="RAEnable_Flag" name="RAEnable_Flag" value="<% tcWebApi_get("Radvd_Entry","Enable","s") %>">
            <input type="hidden" id="RAMode" name="RAMode" value="<% tcWebApi_get("Radvd_Entry","Mode","s") %>">
			<input type=hidden name=EnDHCPServerFlag id=EnDHCPServerFlag value="<% tcWebApi_get("Dhcp6s_Entry","Enable","s") %>">
			<input type=hidden name=DHCPSetTypeFlag id=DHCPSetTypeFlag value="<% tcWebApi_get("Dhcp6s_Entry","Mode","s") %>">
			<input type="hidden" id="RAManagedEn_Flag" name="RAManagedEn_Flag" value="<% tcWebApi_get("Radvd_Entry","ManagedEnable","s") %>">
			<input type="hidden" id="RAOtherEn_Flag" name="RAOtherEn_Flag" value="<% tcWebApi_get("Radvd_Entry","OtherEnable","s") %>">
			<input type=hidden name=LanFlag id=LanFlag value=1>
			<input type=hidden name=lanDhcpType id=lanDhcpType value="<% tcWebApi_get("Lan_Dhcp","type","s") %>">
			<div class="row row-w-100">
				<div class="widget col-xs-12 col-lg-12">
					<header class="with-info"><%tcWebApi_get("String_Entry","LANLocalIPText","s")%> </header>
					<div id="note">
						<script>
						function toggle_help_text() {
							if ($(".info-popup").css("display") == "none") {
								$(".info-popup").show();
							}
							else {
							$(".info-popup").hide();
							}
						}
						</script>
						<div id="top-info" class="top-info" >
							<a href="#" onclick="toggle_help_text()"><i class="fa fa-question-circle"></i></a>
							<div class="info-popup" style="display:none">
								<div class="arraw">
									<iframe src ="<% if tcwebApi_get("LanguageSwitch_Entry", "Type", "h") = "1" then %>/help/help_lan_vn.html<% else %>/help/help_lan_en.html<%end if %>" class="help-frame"></iframe>
									<a id="see-mor-instruction" href="#" onclick="toggle_help_text();"><%tcWebApi_get("String_Entry","DDNSHide","s")%></a>
								</div>
							</div>
						</div>
					</div>
					<div class="widget-body">
						<fieldset>
							<legend class=""><%tcWebApi_get("String_Entry","LANLocalIPText","s")%></legend>
							<div class="form-group">
								<label class="col-lg-5" for="ethIpAddress"><%tcWebApi_get("String_Entry","LANIPAddressText","s")%></label>
								<input type="text" class="form-control col-lg-6" name="ethIpAddress" size="15" maxlength="15" id="ethIpAddress" value="<% if tcWebApi_get("Lan_Entry0","IP","h" ) <> "N/A" then tcWebApi_get("Lan_Entry0","IP","s" ) end if %>" onchange=setDhcpAddresses(this.value)>
							</div>
							<div class="form-group">
								<label class="col-lg-5" for="ethSubnetMask"><%tcWebApi_get("String_Entry","LANMaskText","s")%></label>
								<input type="text" class="form-control col-lg-6" name="ethSubnetMask" size="32" maxlength="15" id="ethSubnetMask" value="<% if tcWebApi_get("Lan_Entry0","netmask","h" ) <> "N/A" then tcWebApi_get("Lan_Entry0","netmask","s" ) end if %>">
							</div>
						</fieldset>
						<fieldset>
							<legend class=""><%tcWebApi_get("String_Entry","LANDHCPText","s")%></legend>
							<div class="form-group">
								<label class="col-lg-5" for="ethIpAddress"><%tcWebApi_get("String_Entry","LANDHCPText","s")%> Server</label>
								<label class="toggle-switch">
									<input type="checkbox" name="dhcpSrvType" id="dhcpSrvType" <%if tcWebApi_get("Lan_Dhcp","type","h") = "1" then asp_Write("checked") end if %> onChange="typeClick();">
									<span class="slider"></span>
								</label>
							</div>
							<div id=dhcp_div_1>
								<div class="form-group">
									<label class="col-lg-5" for="dhcpEthStart"><%tcWebApi_get("String_Entry","LANDHCPMAINPOOL1","s")%></label>
									<input type="text" class="form-control col-lg-3" name="dhcpEthStart" size="32" maxlength="15" id="dhcpEthStart" value="<%if tcWebApi_get("Dhcpd_Common","start","h" ) <> "N/A" then tcWebApi_get("Dhcpd_Common","start","s") end if %>">
									&nbsp; - &nbsp; 
									<input type="text" class="form-control col-lg-3" name="dhcpEthEnd" size="32" maxlength="15" id="dhcpEthEnd" value="<%if tcWebApi_get("Dhcpd_Common","pool_count","h" ) <> "N/A" then tcWebApi_get("Dhcpd_Common","pool_count","s") end if %>">
									<input type="hidden" id="dhcpEthPool" name="dhcpEthPool" value="<%if tcWebApi_get("Dhcpd_Common","pool_count","h" ) <> "N/A" then tcWebApi_get("Dhcpd_Common","pool_count","s") end if %>">
								</div>
								<div class="form-group">
									<label class="col-lg-5" for="dhcpLeasedTime"><%tcWebApi_get("String_Entry","LANLeaseTimeText","s")%> Server</label>
									<input type="text" class="form-control col-lg-3" name="dhcpLeasedTime" size="32" maxlength="15" id="dhcpLeasedTime" value="">
									<input type="hidden" name="dhcpLeasedTimesecond" id="dhcpLeasedTimesecond" value="<%if tcWebApi_get("Dhcpd_Common","lease","h" ) <> "N/A" then tcWebApi_get("Dhcpd_Common","lease","s") end if %>">
									<label>&nbsp;[1 - 3600 min]</label>
								</div>
								<div class="form-group">
									<label class="col-lg-5" for="dns_mode"><%tcWebApi_get("String_Entry","LANDNSModeText","s")%></label>
									<div class="col-lg-6 custom-select">
										<select id="dns_mode" name="dns_mode" onchange='Show_DNS_mode()'></select>
									</div>
									<script language=JavaScript type=text/javascript>
										initDnsV4SourceList();
									</script>
								</div>
								<div class="form-group" id="pri_dns4_div">
									<label class="col-lg-5" for=""><%tcWebApi_get("String_Entry","LANPrimaryDNSText","s")%></label>
									<input type="text" class="form-control col-lg-3" name="pri_dns4" size="32" maxlength="15" id="pri_dns4" value="<%if tcWebApi_get("Dproxy_Entry","Primary_DNS","h" ) <> "N/A" then tcWebApi_get("Dproxy_Entry","Primary_DNS","s") end if %>">
								</div>
								<div class="form-group" id="sec_dns4_div">
									<label class="col-lg-5" for=""><%tcWebApi_get("String_Entry","LANSecondaryDNSText","s")%></label>
									<input type="text" class="form-control col-lg-3" name="sec_dns4" size="32" maxlength="15" id="sec_dns4" value="<%if tcWebApi_get("Dproxy_Entry","Secondary_DNS","h" ) <> "N/A" then tcWebApi_get("Dproxy_Entry","Secondary_DNS","s") end if %>">
								</div>
							</div>
						</fieldset>
						<fieldset>
							<div id=static_div_1>
								<legend class=""><% tcWebApi_get("String_Entry","StaticDHCPText", "s")%></legend>
								<div class="form-group" id="">
									<label class="col-lg-5" for=""><% tcWebApi_get("String_Entry","StaticDHCPEntryText", "s")%></label>
								</div>
								<div class="table-responsive mb-2">
									<table class="table-bordered-radius simple-table w-100" id="static_dhcp_table">
										<thead class="thead-light">
										<tr >
											<th scope="col">IP</th>
											<th scope="col">MAC</th>
											<th scope="col"><% tcWebApi_get("String_Entry","ButtonActionTextLower", "s")%></th>
										</tr>
										</thead>
										<tbody>
										<tr  id="sd_entry0" style="display: none;">
											<td ><input type=text name=ip0 id=ip0></td>
											<td ><input type=text name=mac0 id=mac0></td>
											<td ><em class="fas fa-times color-theme-red pointer" onclick='DeleteSDEntry("0")'></em></td>
										</tr>
										<tr  id="sd_entry1" style="display: none;">
											<td ><input type=text name=ip1 id=ip1></td>
											<td ><input type=text name=mac1 id=mac1></td>
											<td ><em class="fas fa-times color-theme-red pointer" onclick='DeleteSDEntry("1")'></em></td>
										</tr>
										<tr  id="sd_entry2" style="display: none;">
											<td ><input type=text name=ip2 id=ip2></td>
											<td ><input type=text name=mac2 id=mac2></td>
											<td ><em class="fas fa-times color-theme-red pointer" onclick='DeleteSDEntry("2")'></em></td>
										</tr>
										<tr  id="sd_entry3" style="display: none;">
											<td ><input type=text name=ip3 id=ip3></td>
											<td ><input type=text name=mac3 id=mac3></td>
											<td ><em class="fas fa-times color-theme-red pointer" onclick='DeleteSDEntry("3")'></em></td>
										</tr>
										<tr  id="sd_entry4" style="display: none;">
											<td ><input type=text name=ip4 id=ip4></td>
											<td ><input type=text name=mac4 id=mac4></td>
											<td ><em class="fas fa-times color-theme-red pointer" onclick='DeleteSDEntry("4")'></em></td>
										</tr>
										<tr  id="sd_entry5" style="display: none;">
											<td ><input type=text name=ip5 id=ip5></td>
											<td ><input type=text name=mac5 id=mac5></td>
											<td ><em class="fas fa-times color-theme-red pointer" onclick='DeleteSDEntry("5")'></em></td>
										</tr>
										<tr  id="sd_entry6" style="display: none;">
											<td ><input type=text name=ip6 id=ip6></td>
											<td ><input type=text name=mac6 id=mac6></td>
											<td ><em class="fas fa-times color-theme-red pointer" onclick='DeleteSDEntry("6")'></em></td>
										</tr>
										<tr  id="sd_entry7" style="display: none;">
											<td><input type=text name=ip7 id=ip7></td>
											<td><input type=text name=mac7 id=mac7></td>
											<td>
												<em class="fas fa-times color-theme-red pointer" onclick='DeleteSDEntry("7")'></em>
											</td>
										</tr>
										</tbody>
									</table>
								</div>
								<div class="d-flex justify-content-end">
									<button type="button" class="action-button small-button" onclick="addNewSDEntry();" name="ButtonAdd" id="ButtonAdd"><%tcWebApi_get("String_Entry","ButtonAddText","s")%></button>
								</div>
							</div>
						</fieldset>
					</div>
				</div>
				<div class="widget col-xs-12 col-lg-12">
					<header><%tcWebApi_get("String_Entry","LANIPv6Text","s")%></header>
					<div class="widget-body">
						<fieldset>
							<legend class=""><%tcWebApi_get("String_Entry","RASettingText","s")%></legend>
							<div class="form-group">
								<label class="col-lg-5" for="radvdSrvType">SLAAC</label>
								<label class="toggle-switch">
									<input type="checkbox" name="radvdSrvType" id="radvdSrvType" <%if tcWebApi_get("Radvd_Entry","Enable","h") = "1" then asp_Write("checked") end if%> onChange="RATypeClick();">
									<span class="slider"></span>
								</label>
							</div>
							<div id="RAAssConnection" style="display: none">
								<div class="form-group">
									<label class="col-lg-5" for="RAUseWan"><%tcWebApi_get("String_Entry","RASettingModeText","s")%></label>
									<div class="col-lg-6 custom-select">
										<select id="RAUseWan" name="RAUseWan" onchange="RAUseWanChange()">
											<option value="Normal" <%if tcWebApi_get("Radvd_Entry","Mode","h") = "1" then asp_Write("selected") end if%>><%tcWebApi_get("String_Entry","LANRadvdMode1Text","s")%></option>
											<option value="UseAllocatedSubnet" <%if tcWebApi_get("Radvd_Entry","Mode","h") = "0" then asp_Write("selected") end if%>><%tcWebApi_get("String_Entry","LANRadvdMode0Text","s")%></option>
										</select>
									</div>
								</div>
								<div class="form-group" id="rapdsourcepart">
									<label class="col-lg-5" for="rapdsource"><%tcWebApi_get("String_Entry","RAPrefixText","s")%></label>
									<div class="col-lg-3 custom-select">
										<select id=rapdsource name="rapdsource"></select>
									</div>
									<script language=JavaScript type=text/javascript>
										initRaPDSourceList();
									</script>
								</div>
								<div class="form-group" id="ramoflagdisp">
									<div class="custom-control custom-checkbox col-xs-12 offset-lg-1 col-lg-4">
										<input type="checkbox" class="custom-control-input" id="ramflag" name="ramflag" <%if tcWebApi_get("Radvd_Entry","ManagedEnable","h") = "1" then asp_Write("checked") end if%>>
										<label class="custom-control-label" for="ramflag"><%tcWebApi_get("String_Entry","RAManagedEnableText","s")%></label>
									</div>
									<div class="custom-control custom-checkbox col-xs-12 col-lg-4">
										<input type="checkbox" class="custom-control-input" id="raoflag" name="raoflag" <%if tcWebApi_get("Radvd_Entry","OtherEnable","h") = "1" then asp_Write("checked") end if%>>
										<label class="custom-control-label" for="raoflag"><%tcWebApi_get("String_Entry","RAOtherEnableText","s")%></label>
									</div>
								</div>
							</div>
							<div id=RadvdPrefixCfg style="display: none">
								<div class="form-group" id='NamePrefix'>
									<label class="col-lg-5" for="radvdPrefix"><%tcWebApi_get("String_Entry","RadvdPrefixText","s")%></label>
									<input type="text" class="form-control col-lg-4" name="radvdPrefix" size="39" maxlength="39" id="radvdPrefix" value="<%if tcWebApi_get("Radvd_Entry","PrefixIPv6","h") <> "N/A" then tcWebApi_get("Radvd_Entry","PrefixIPv6","s") end if%>">
									<em class="mandatory-sign"></em>
								</div>
								<div class="form-group" id='NamePrefixLen'>
									<label class="col-lg-5" for="RAPrefixLen"><%tcWebApi_get("String_Entry","RadvdNamePrefixLenText","s")%></label>
									<input type="text" class="form-control col-lg-4" name="RAPrefixLen" size="2" maxlength="2" id="RAPrefixLen" value="<%if tcWebApi_get("Radvd_Entry","Prefixv6Len","h") <> "N/A" then tcWebApi_get("Radvd_Entry","Prefixv6Len","s") end if%>">
									<em class="mandatory-sign"></em>
									<label>[16 - 64]</label>
								</div>
								<div class="form-group" id=''>
									<label class="col-lg-5" for="PreferredLifetime"><%tcWebApi_get("String_Entry","DHCP6PreferredLifetimeText","s")%></label>
									<input type="text" class="form-control col-lg-4" name="PreferredLifetime" size="10" maxlength="10" id="PreferredLifetime" value="<%if tcWebApi_get("Radvd_Entry","PreferredLifetime","h") <> "N/A" then tcWebApi_get("Radvd_Entry","PreferredLifetime","s") end if%>">
									<em class="mandatory-sign"></em>
									<label>[600 - 4294967295]</label>
								</div>
								<div class="form-group" id=''>
									<label class="col-lg-5" for="ValidLifetime"><%tcWebApi_get("String_Entry","DHCP6ValidLifetimeText","s")%></label>
									<input type="text" class="form-control col-lg-4" name="ValidLifetime" size="10" maxlength="10" id="ValidLifetime" value="<%if tcWebApi_get("Radvd_Entry","ValidLifetime","h") <> "N/A" then tcWebApi_get("Radvd_Entry","ValidLifetime","s") end if%>">
									<em class="mandatory-sign"></em>
									<label>[600 - 4294967295]</label>
								</div>
								<div class="form-group">
									<div class="custom-control custom-checkbox col-xs-12 offset-lg-1 col-lg-4">
										<input type="checkbox" class="custom-control-input" id="radvdmanageden" name="radvdmanageden" <%if tcWebApi_get("Radvd_Entry","ManagedEnable","h") = "1" then asp_Write("checked") end if%> onClick="RAMOClick(0);">
										<label class="custom-control-label" for="radvdmanageden"><%tcWebApi_get("String_Entry","RAManagedEnableText","s")%></label>
									</div>
									<div class="custom-control custom-checkbox col-xs-12 col-lg-4">
										<input type="checkbox" class="custom-control-input" id="radvdotheren" name="radvdotheren" <%if tcWebApi_get("Radvd_Entry","OtherEnable","h") = "1" then asp_Write("checked") end if%> onClick="RAMOClick(1);">
										<label class="custom-control-label" for="radvdotheren"><%tcWebApi_get("String_Entry","RAOtherEnableText","s")%></label>
									</div>
								</div>
								<div class="form-group" id=''>
									<label class="col-lg-5" for="RACycMin"><%tcWebApi_get("String_Entry","LANJS11Text","s")%></label>
									<input type="text" class="form-control col-lg-4" name="RACycMin" size="10" maxlength="10" id="RACycMin" value="<%if tcWebApi_get("Radvd_Entry","MinRAInterval","h") <> "N/A" then tcWebApi_get("Radvd_Entry","MinRAInterval","s") end if%>">
									<em class="mandatory-sign"></em>
									<label>[3 - 1350 S]</label>
								</div>
								<div class="form-group" id=''>
									<label class="col-lg-5" for="RACycMax"><%tcWebApi_get("String_Entry","LANJS12Text","s")%></label>
									<input type="text" class="form-control col-lg-4" name="RACycMax" size="10" maxlength="10" id="RACycMax" value="<%if tcWebApi_get("Radvd_Entry","MaxRAInterval","h") <> "N/A" then tcWebApi_get("Radvd_Entry","MaxRAInterval","s") end if%>">
									<em class="mandatory-sign"></em>
									<label>[4 - 1800 S]</label>
								</div>
							</div>
						</fieldset>
						<fieldset>
							<legend class="">LAN</legend>
							<div class="form-group">
								<label class="col-lg-5" for="dhcp6SrvType"><%tcWebApi_get("String_Entry","Dhcp6SrvTypeText","s")%></label>
								<label class="toggle-switch">
									<input type="checkbox" name="dhcp6SrvType" id="dhcp6SrvType" onclick="typev6Click()" <%if tcWebApi_get("Dhcp6s_Entry","Enable","h") = "1" then asp_Write("checked") end if%>>
									<span class="slider"></span>
								</label>
							</div>
							<div id="AssConnection"  style="display: none">
								<div class="form-group">
									<label class="col-lg-5" for="UseWan"><%tcWebApi_get("String_Entry","Dhcp6SrvTypeModeText","s")%></label>
									<div class="col-lg-6 custom-select">
										<SELECT id="UseWan" onchange="UseWanChange()" name="UseWan"> 
											<OPTION value="Normal" <%if tcWebApi_get("Dhcp6s_Entry","Mode","h") = "1" then asp_Write("selected") end if%>><%tcWebApi_get("String_Entry","Dhcp6SrvNormalModeText","s")%></OPTION> 
											<OPTION value="UseAllocatedSubnet" <%if tcWebApi_get("Dhcp6s_Entry","Mode","h") = "0" then asp_Write("selected") end if%>><%tcWebApi_get("String_Entry","Dhcp6SrvUseAllocatedSubnetText","s")%></OPTION> 
											<OPTION value="UseAllocatedOther" <%if tcWebApi_get("Dhcp6s_Entry","Mode","h") = "2" then asp_Write("selected") end if%>><%tcWebApi_get("String_Entry","Dhcp6SrvUseAllocatedOtherText","s")%></OPTION>
										</SELECT>
									</div>
								</div>
								<div id='dnssourcepart' class="form-group" style="display: none">
									<label class="col-lg-5" for="dnssource"><%tcWebApi_get("String_Entry","Dhcp6dnssourcepartText","s")%></label>
									<div class="col-lg-6 custom-select">
										<select id=dnssource name="dnssource" onchange='dnsSourceListChg()'></select>
									</div>
									<script language=JavaScript type=text/javascript>
										initDnsSourceList();
									</script>
								</div>
								<div class="form-group" id='dnssourcepart_2' style="display: none">
									<label class="col-lg-5" for="DnsSrvOne_Source"><%tcWebApi_get("String_Entry","LANPrimaryDNSText","s")%></label>
									<input type="text" class="form-control col-lg-6" name="DnsSrvOne_Source" size="39" maxlength="39" id="DnsSrvOne_Source" value="<%if tcWebApi_get("Dhcp6s_Entry","DNSserver","h") <> "N/A" then tcWebApi_get("Dhcp6s_Entry","DNSserver","s") end if%>">
									<em class="mandatory-sign"></em>
								</div>
								<div class="form-group" id='dnssourcepart_3' style="display: none">
									<label class="col-lg-5" for="DnsSrvTwo_Source"><%tcWebApi_get("String_Entry","LANSecondaryDNSText","s")%></label>
									<input type="text" class="form-control col-lg-6" name="DnsSrvTwo_Source" size="39" maxlength="39" id="DnsSrvTwo_Source" value="<%if tcWebApi_get("Dhcp6s_Entry","SecDNSserver","h") <> "N/A" then tcWebApi_get("Dhcp6s_Entry","SecDNSserver","s") end if%>">
								</div>
							</div>
							<div id=DHCP6SPrefixCfg style="DISPLAY: none">
								<div class="form-group">
									<label class="col-lg-5" for="AddrFormat"><%tcWebApi_get("String_Entry","DHCP6SPrefixCfgText","s")%></label>
									<div class="col-lg-6 custom-select">
										<select id="AddrFormat" name="AddrFormat">
											<option value="AddrPool" <%if tcWebApi_get("Dhcp6s_Entry","AddrFormat","h") = "AddrPool" then asp_Write("selected") end if%>><%tcWebApi_get("String_Entry","DHCP6AddrPoolText","s")%></option> 
											<option value="EUI64" <%if tcWebApi_get("Dhcp6s_Entry","AddrFormat","h") = "EUI64" then asp_Write("selected") end if%>><%tcWebApi_get("String_Entry","DHCP6EUI64Text","s")%></option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-lg-5" for="dhcpPrefix"><%tcWebApi_get("String_Entry","DHCP6PrefixText","s")%></label>
									<input type="text" maxLength=39 class="form-control col-lg-6" name="dhcpPrefix" id="dhcpPrefix" value="<%if tcWebApi_get("Dhcp6s_Entry","PrefixIPv6", "h") <> "N/A" then tcWebApi_get("Dhcp6s_Entry","PrefixIPv6","s") end if%>" onchange="this.value = this.value.toLowerCase( )">
									<em class="mandatory-sign"></em>
								</div>
								<div class="form-group">
									<label class="col-lg-5" for="PrefixLen"><%tcWebApi_get("String_Entry","LANJS7Text","s")%></label>
									<input type="text" maxLength=2 class="form-control col-lg-4" name="PrefixLen" id="PrefixLen" value="<%if tcWebApi_get("Dhcp6s_Entry","Prefixv6Len", "h") <> "N/A" then tcWebApi_get("Dhcp6s_Entry","Prefixv6Len", "s") end if%>">
									<em class="mandatory-sign"></em>
									<label>[16 - 64]</label>
								</div>
								<div class="form-group">
									<label class="col-lg-5" for="t1"><%tcWebApi_get("String_Entry","DHCP6PreferredLifetimeText","s")%></label>
									<input type="text" maxLength=10 class="form-control col-lg-4" name="t1" id="t1" value="<%if tcWebApi_get("Dhcp6s_Entry","PreferredLifetime", "h") <> "N/A" then tcWebApi_get("Dhcp6s_Entry","PreferredLifetime", "s") end if%>">
									<em class="mandatory-sign"></em>
									<label>[60 - 4294967295 s]</label>
								</div>
								<div class="form-group">
									<label class="col-lg-5" for="t2"><%tcWebApi_get("String_Entry","DHCP6ValidLifetimeText","s")%></label>
									<input type="text" maxLength=10 class="form-control col-lg-4" name="t2" id="t2" value="<%if tcWebApi_get("Dhcp6s_Entry","ValidLifetime", "h") <> "N/A" then tcWebApi_get("Dhcp6s_Entry","ValidLifetime", "s") end if%>">
									<em class="mandatory-sign"></em>
									<label>[60 - 4294967295 s]</label>
								</div>								
								<div class="form-group">
									<label class="col-lg-5" for="DnsSrvOne"><%tcWebApi_get("String_Entry","LANPrimaryDNSText","s")%></label>
									<input type="text" maxLength=39 class="form-control col-lg-6" name="DnsSrvOne" id="DnsSrvOne" value="<%if tcWebApi_get("Dhcp6s_Entry","DNSserver","h") <> "N/A" then tcWebApi_get("Dhcp6s_Entry","DNSserver","s") end if%>">
									<em class="mandatory-sign"></em>
								</div>
								<div class="form-group">
									<label class="col-lg-5" for="DnsSrvTwo"><%tcWebApi_get("String_Entry","LANSecondaryDNSText","s")%></label>
									<input type="text" maxLength=39 class="form-control col-lg-6" name="DnsSrvTwo" id="DnsSrvTwo" value="<%if tcWebApi_get("Dhcp6s_Entry","SecDNSserver","h") <> "N/A" then tcWebApi_get("Dhcp6s_Entry","SecDNSserver","s") end if%>">
								</div>
							</div>
						</fieldset>
					</div>
				</div>
				<div class="col-lg-12 d-flex align-items-center justify-content-center">
					<button type="button" class="page-button large-button" onclick="doSubmit();"><%tcWebApi_get("String_Entry","ButtonApplyText","s")%></button>
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
