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
if Request_Form("VirServer_Flag") = "1" then
if tcWebApi_get("WebCustom_Entry","isCTJOYME2Supported","h") <> "Yes" then
	TCWebApi_set("WebCurSet_Entry","nat_pvc","VirServEntryCurIndex")
	TCWebApi_set("WebCurSet_Entry","nat_ifidx","VirServEntryCurIndex")
end if
	TCWebApi_set("WebCurSet_Entry","virServ_id","VirServCurIndex")
	TCWebApi_commit("WebCurSet_Entry")
if tcWebApi_get("WebCustom_Entry","isCTJOYME2Supported","h") <> "Yes" then
	TCWebApi_set("VirServer_Entry","IFName","PortMappingInterface")
	TCWebApi_unset("VirServer_Entry_Entry")
	TCWebApi_commit("VirServer_Entry_Entry")	
	TCWebApi_set("VirServer_Entry_Entry","Active","EnableVirServer_Flag")
	TCWebApi_set("VirServer_Entry_Entry","Protocal","PortMappingProtocol")
	TCWebApi_set("VirServer_Entry_Entry","SrcIP","RemoteHost")
	TCWebApi_set("VirServer_Entry_Entry","STARTPORT","ExternalPort")
	TCWebApi_set("VirServer_Entry_Entry","ENDPORT","InternalPort")
	TCWebApi_set("VirServer_Entry_Entry","LOCALIP","InternalClient")
	TCWebApi_set("VirServer_Entry_Entry","MapName","MappingName")	
	TCWebApi_set("VirServer_Entry_Entry","isCustomize","constsrvNameAdd")	
	TCWebApi_commit("VirServer_Entry_Entry")
	tcWebApi_save()
else
	TCWebApi_set("VirServer_Entry","Active","EnableVirServer_Flag")
	TCWebApi_set("VirServer_Entry","Protocal","PortMappingProtocol")
	TCWebApi_set("VirServer_Entry","SrcIP","RemoteHost")
	TCWebApi_set("VirServer_Entry","STARTPORT","ExternalPort")
	TCWebApi_set("VirServer_Entry","INTPORT","InternalPort")
	TCWebApi_set("VirServer_Entry","LOCALIP","InternalClient")
	TCWebApi_set("VirServer_Entry","MapName","MappingName")	
	TCWebApi_set("VirServer_Entry","isCustomize","constsrvNameAdd") 	
	TCWebApi_commit("VirServer_Entry")
	tcWebApi_save()
end if
elseif Request_Form("VirServer_Flag") = "2" then
if tcWebApi_get("WebCustom_Entry","isCTJOYME2Supported","h") <> "Yes" then
	TCWebApi_set("WebCurSet_Entry","nat_pvc","VirServEntryCurIndex")	
	TCWebApi_set("WebCurSet_Entry","nat_ifidx","VirServEntryCurIndex")
	if Request_Form("hVirServEntry0") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry0")
			TCWebApi_unset("VirServer_Entry_Entry")		
			TCWebApi_commit("VirServer_Entry_Entry")
	end if
	if Request_Form("hVirServEntry1") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry1")
			TCWebApi_unset("VirServer_Entry_Entry")	
			TCWebApi_commit("VirServer_Entry_Entry")
	end if
	if Request_Form("hVirServEntry2") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry2")
			TCWebApi_unset("VirServer_Entry_Entry")		
			TCWebApi_commit("VirServer_Entry_Entry")	
	end if
	if Request_Form("hVirServEntry3") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry3")
			TCWebApi_unset("VirServer_Entry_Entry")		
			TCWebApi_commit("VirServer_Entry_Entry")
	end if
	if Request_Form("hVirServEntry4") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry4")
			TCWebApi_unset("VirServer_Entry_Entry")
			TCWebApi_commit("VirServer_Entry_Entry")
	end if
	if Request_Form("hVirServEntry5") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry5")
			TCWebApi_unset("VirServer_Entry_Entry")
			TCWebApi_commit("VirServer_Entry_Entry")
	end if
	if Request_Form("hVirServEntry6") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry6")
			TCWebApi_unset("VirServer_Entry_Entry")		
			TCWebApi_commit("VirServer_Entry_Entry")
	end if
	if Request_Form("hVirServEntry7") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry7")
			TCWebApi_unset("VirServer_Entry_Entry")
			TCWebApi_commit("VirServer_Entry_Entry")
	end if	
	if Request_Form("hVirServEntry8") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry8")
			TCWebApi_unset("VirServer_Entry_Entry")	
			TCWebApi_commit("VirServer_Entry_Entry")
	end if	
	if Request_Form("hVirServEntry9") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry9")
			TCWebApi_unset("VirServer_Entry_Entry")		
			TCWebApi_commit("VirServer_Entry_Entry")
	end if	
else
	TCWebApi_set("WebCurSet_Entry","nat_ifidx","VirServEntryCurIndex")
	if Request_Form("hVirServEntry0") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry0")
		TCWebApi_set("VirServer_Entry","vDelEntry","vDelEntry")
			TCWebApi_unset("VirServer_Entry")		
			TCWebApi_commit("VirServer_Entry")
	end if
	if Request_Form("hVirServEntry1") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry1")
		TCWebApi_set("VirServer_Entry","vDelEntry","vDelEntry")
			TCWebApi_unset("VirServer_Entry")		
			TCWebApi_commit("VirServer_Entry")
	end if
	if Request_Form("hVirServEntry2") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry2")
		TCWebApi_set("VirServer_Entry","vDelEntry","vDelEntry")
			TCWebApi_unset("VirServer_Entry")		
			TCWebApi_commit("VirServer_Entry")
	end if
	if Request_Form("hVirServEntry3") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry3")
		TCWebApi_set("VirServer_Entry","vDelEntry","vDelEntry")
			TCWebApi_unset("VirServer_Entry")		
			TCWebApi_commit("VirServer_Entry")
	end if
	if Request_Form("hVirServEntry4") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry4")
		TCWebApi_set("VirServer_Entry","vDelEntry","vDelEntry")
			TCWebApi_unset("VirServer_Entry")		
			TCWebApi_commit("VirServer_Entry")
	end if
	if Request_Form("hVirServEntry5") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry5")
		TCWebApi_set("VirServer_Entry","vDelEntry","vDelEntry")
			TCWebApi_unset("VirServer_Entry")		
			TCWebApi_commit("VirServer_Entry")
	end if
	if Request_Form("hVirServEntry6") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry6")
		TCWebApi_set("VirServer_Entry","vDelEntry","vDelEntry")
			TCWebApi_unset("VirServer_Entry")		
			TCWebApi_commit("VirServer_Entry")
	end if
	if Request_Form("hVirServEntry7") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry7")
		TCWebApi_set("VirServer_Entry","vDelEntry","vDelEntry")
			TCWebApi_unset("VirServer_Entry")		
			TCWebApi_commit("VirServer_Entry")
	end if	
	if Request_Form("hVirServEntry8") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry8")
		TCWebApi_set("VirServer_Entry","vDelEntry","vDelEntry")
			TCWebApi_unset("VirServer_Entry")		
			TCWebApi_commit("VirServer_Entry")
	end if	
	if Request_Form("hVirServEntry9") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry9")
		TCWebApi_set("VirServer_Entry","vDelEntry","vDelEntry")
			TCWebApi_unset("VirServer_Entry")		
			TCWebApi_commit("VirServer_Entry")
	end if	
	if Request_Form("hVirServEntry10") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry10")
		TCWebApi_set("VirServer_Entry","vDelEntry","vDelEntry")
			TCWebApi_unset("VirServer_Entry")		
			TCWebApi_commit("VirServer_Entry")
	end if
	if Request_Form("hVirServEntry11") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry11")
		TCWebApi_set("VirServer_Entry","vDelEntry","vDelEntry")
			TCWebApi_unset("VirServer_Entry")		
			TCWebApi_commit("VirServer_Entry")
	end if
	if Request_Form("hVirServEntry12") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry12")
		TCWebApi_set("VirServer_Entry","vDelEntry","vDelEntry")
			TCWebApi_unset("VirServer_Entry")		
			TCWebApi_commit("VirServer_Entry")
	end if
	if Request_Form("hVirServEntry13") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry13")
		TCWebApi_set("VirServer_Entry","vDelEntry","vDelEntry")
			TCWebApi_unset("VirServer_Entry")		
			TCWebApi_commit("VirServer_Entry")
	end if
	if Request_Form("hVirServEntry14") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry14")
		TCWebApi_set("VirServer_Entry","vDelEntry","vDelEntry")
			TCWebApi_unset("VirServer_Entry")		
			TCWebApi_commit("VirServer_Entry")
	end if
	if Request_Form("hVirServEntry15") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry15")
		TCWebApi_set("VirServer_Entry","vDelEntry","vDelEntry")
			TCWebApi_unset("VirServer_Entry")		
			TCWebApi_commit("VirServer_Entry")
	end if
	if Request_Form("hVirServEntry16") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry16")
		TCWebApi_set("VirServer_Entry","vDelEntry","vDelEntry")
			TCWebApi_unset("VirServer_Entry")		
			TCWebApi_commit("VirServer_Entry")
	end if
	if Request_Form("hVirServEntry17") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry17")
		TCWebApi_set("VirServer_Entry","vDelEntry","vDelEntry")
			TCWebApi_unset("VirServer_Entry")		
			TCWebApi_commit("VirServer_Entry")
	end if	
	if Request_Form("hVirServEntry18") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry18")
		TCWebApi_set("VirServer_Entry","vDelEntry","vDelEntry")
			TCWebApi_unset("VirServer_Entry")		
			TCWebApi_commit("VirServer_Entry")
	end if	
	if Request_Form("hVirServEntry19") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry19")
		TCWebApi_set("VirServer_Entry","vDelEntry","vDelEntry")
			TCWebApi_unset("VirServer_Entry")		
			TCWebApi_commit("VirServer_Entry")
	end if	
	if Request_Form("hVirServEntry20") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry20")
		TCWebApi_set("VirServer_Entry","vDelEntry","vDelEntry")
			TCWebApi_unset("VirServer_Entry")		
			TCWebApi_commit("VirServer_Entry")
	end if
	if Request_Form("hVirServEntry21") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry21")
		TCWebApi_set("VirServer_Entry","vDelEntry","vDelEntry")
			TCWebApi_unset("VirServer_Entry")		
			TCWebApi_commit("VirServer_Entry")
	end if
	if Request_Form("hVirServEntry22") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry22")
		TCWebApi_set("VirServer_Entry","vDelEntry","vDelEntry")
			TCWebApi_unset("VirServer_Entry")		
			TCWebApi_commit("VirServer_Entry")
	end if
	if Request_Form("hVirServEntry23") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry23")
		TCWebApi_set("VirServer_Entry","vDelEntry","vDelEntry")
			TCWebApi_unset("VirServer_Entry")		
			TCWebApi_commit("VirServer_Entry")
	end if
	if Request_Form("hVirServEntry24") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry24")
		TCWebApi_set("VirServer_Entry","vDelEntry","vDelEntry")
			TCWebApi_unset("VirServer_Entry")		
			TCWebApi_commit("VirServer_Entry")
	end if
	if Request_Form("hVirServEntry25") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry25")
		TCWebApi_set("VirServer_Entry","vDelEntry","vDelEntry")
			TCWebApi_unset("VirServer_Entry")		
			TCWebApi_commit("VirServer_Entry")
	end if
	if Request_Form("hVirServEntry26") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry26")
		TCWebApi_set("VirServer_Entry","vDelEntry","vDelEntry")
			TCWebApi_unset("VirServer_Entry")		
			TCWebApi_commit("VirServer_Entry")
	end if
	if Request_Form("hVirServEntry27") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry27")
		TCWebApi_set("VirServer_Entry","vDelEntry","vDelEntry")
			TCWebApi_unset("VirServer_Entry")		
			TCWebApi_commit("VirServer_Entry")
	end if	
	if Request_Form("hVirServEntry28") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry28")
		TCWebApi_set("VirServer_Entry","vDelEntry","vDelEntry")
			TCWebApi_unset("VirServer_Entry")		
			TCWebApi_commit("VirServer_Entry")
	end if	
	if Request_Form("hVirServEntry29") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry29")
		TCWebApi_set("VirServer_Entry","vDelEntry","vDelEntry")
			TCWebApi_unset("VirServer_Entry")		
			TCWebApi_commit("VirServer_Entry")
	end if	
end if
	tcWebApi_save()
elseif Request_Form("VirServer_Flag") = "3" then
	TCWebApi_set("WebCurSet_Entry","nat_pvc","VirServEntryCurIndex")
	TCWebApi_set("WebCurSet_Entry","nat_ifidx","VirServEntryCurIndex")
	TCWebApi_commit("WebCurSet_Entry")
elseif Request_Form("VirServer_Flag") = "4" then
if tcWebApi_get("WebCustom_Entry","isCTJOYME2Supported","h") = "Yes" then
	TCWebApi_set("WebCurSet_Entry","nat_ifidx","VirServEntryCurIndex")
	if Request_Form("hVirServEntry0") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry0")
			TCWebApi_set("VirServer_Entry","Active","vEnableEntry0")
			TCWebApi_commit("VirServer_Entry")
	end if
	if Request_Form("hVirServEntry1") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry1")
			TCWebApi_set("VirServer_Entry","Active","vEnableEntry1")
			TCWebApi_commit("VirServer_Entry")
	end if
	if Request_Form("hVirServEntry2") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry2")
			TCWebApi_set("VirServer_Entry","Active","vEnableEntry2")
			TCWebApi_commit("VirServer_Entry")
	end if
	if Request_Form("hVirServEntry3") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry3")
			TCWebApi_set("VirServer_Entry","Active","vEnableEntry3")
			TCWebApi_commit("VirServer_Entry")
	end if
	if Request_Form("hVirServEntry4") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry4")
			TCWebApi_set("VirServer_Entry","Active","vEnableEntry4")
			TCWebApi_commit("VirServer_Entry")
	end if
	if Request_Form("hVirServEntry5") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry5")
			TCWebApi_set("VirServer_Entry","Active","vEnableEntry5")
			TCWebApi_commit("VirServer_Entry")
	end if
	if Request_Form("hVirServEntry6") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry6")
			TCWebApi_set("VirServer_Entry","Active","vEnableEntry6")
			TCWebApi_commit("VirServer_Entry")
	end if
	if Request_Form("hVirServEntry7") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry7")
			TCWebApi_set("VirServer_Entry","Active","vEnableEntry7")
			TCWebApi_commit("VirServer_Entry")
	end if	
	if Request_Form("hVirServEntry8") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry8")
			TCWebApi_set("VirServer_Entry","Active","vEnableEntry8")
			TCWebApi_commit("VirServer_Entry")
	end if	
	if Request_Form("hVirServEntry9") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry9")
			TCWebApi_set("VirServer_Entry","Active","vEnableEntry9")
			TCWebApi_commit("VirServer_Entry")
	end if	
	if Request_Form("hVirServEntry10") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry10")
			TCWebApi_set("VirServer_Entry","Active","vEnableEntry10")
			TCWebApi_commit("VirServer_Entry")
	end if
	if Request_Form("hVirServEntry11") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry11")
			TCWebApi_set("VirServer_Entry","Active","vEnableEntry11")
			TCWebApi_commit("VirServer_Entry")
	end if
	if Request_Form("hVirServEntry12") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry12")
			TCWebApi_set("VirServer_Entry","Active","vEnableEntry12")
			TCWebApi_commit("VirServer_Entry")
	end if
	if Request_Form("hVirServEntry13") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry13")
			TCWebApi_set("VirServer_Entry","Active","vEnableEntry13")
			TCWebApi_commit("VirServer_Entry")
	end if
	if Request_Form("hVirServEntry14") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry14")
			TCWebApi_set("VirServer_Entry","Active","vEnableEntry14")
			TCWebApi_commit("VirServer_Entry")
	end if
	if Request_Form("hVirServEntry15") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry15")
			TCWebApi_set("VirServer_Entry","Active","vEnableEntry15")
			TCWebApi_commit("VirServer_Entry")
	end if
	if Request_Form("hVirServEntry16") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry16")
			TCWebApi_set("VirServer_Entry","Active","vEnableEntry16")
			TCWebApi_commit("VirServer_Entry")
	end if
	if Request_Form("hVirServEntry17") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry17")
			TCWebApi_set("VirServer_Entry","Active","vEnableEntry17")
			TCWebApi_commit("VirServer_Entry")
	end if	
	if Request_Form("hVirServEntry18") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry18")
			TCWebApi_set("VirServer_Entry","Active","vEnableEntry18")
			TCWebApi_commit("VirServer_Entry")
	end if	
	if Request_Form("hVirServEntry19") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry19")
			TCWebApi_set("VirServer_Entry","Active","vEnableEntry19")
			TCWebApi_commit("VirServer_Entry")
	end if	
	if Request_Form("hVirServEntry20") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry20")
			TCWebApi_set("VirServer_Entry","Active","vEnableEntry20")
			TCWebApi_commit("VirServer_Entry")
	end if
	if Request_Form("hVirServEntry21") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry21")
			TCWebApi_set("VirServer_Entry","Active","vEnableEntry21")
			TCWebApi_commit("VirServer_Entry")
	end if
	if Request_Form("hVirServEntry22") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry22")
			TCWebApi_set("VirServer_Entry","Active","vEnableEntry22")
			TCWebApi_commit("VirServer_Entry")
	end if
	if Request_Form("hVirServEntry23") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry23")
			TCWebApi_set("VirServer_Entry","Active","vEnableEntry23")
			TCWebApi_commit("VirServer_Entry")
	end if
	if Request_Form("hVirServEntry24") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry24")
			TCWebApi_set("VirServer_Entry","Active","vEnableEntry24")
			TCWebApi_commit("VirServer_Entry")
	end if
	if Request_Form("hVirServEntry25") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry25")
			TCWebApi_set("VirServer_Entry","Active","vEnableEntry25")
			TCWebApi_commit("VirServer_Entry")
	end if
	if Request_Form("hVirServEntry26") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry26")
			TCWebApi_set("VirServer_Entry","Active","vEnableEntry26")
			TCWebApi_commit("VirServer_Entry")
	end if
	if Request_Form("hVirServEntry27") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry27")
			TCWebApi_set("VirServer_Entry","Active","vEnableEntry27")
			TCWebApi_commit("VirServer_Entry")
	end if	
	if Request_Form("hVirServEntry28") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry28")
			TCWebApi_set("VirServer_Entry","Active","vEnableEntry28")
			TCWebApi_commit("VirServer_Entry")
	end if	
	if Request_Form("hVirServEntry29") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry29")
			TCWebApi_set("VirServer_Entry","Active","vEnableEntry29")
			TCWebApi_commit("VirServer_Entry")
	end if	
end if
	tcWebApi_save()
elseif Request_Form("VirServer_Flag") = "6" then
	TCWebApi_set("WebCurSet_Entry","nat_pvc","VirServEntryCurIndex")
	TCWebApi_set("WebCurSet_Entry","nat_ifidx","VirServEntryCurIndex")
	TCWebApi_set("WebCurSet_Entry","virServ_id","VirServEntryCurIndex")
	TCWebApi_commit("WebCurSet_Entry")
if tcWebApi_get("WebCustom_Entry","isCTJOYME2Supported","h") = "Yes" then
	if Request_Form("hVirServEntry0") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry0")
			TCWebApi_set("VirServer_Entry","Active","EnableVirServer_Flag")
			TCWebApi_set("VirServer_Entry","Protocal","PortMappingProtocolEdit")
			TCWebApi_set("VirServer_Entry","SrcIP","RemoteHost")
			TCWebApi_set("VirServer_Entry","STARTPORT","ExternalPort")
			TCWebApi_set("VirServer_Entry","INTPORT","InternalPort")
			TCWebApi_set("VirServer_Entry","LOCALIP","InternalClient")
			TCWebApi_set("VirServer_Entry","MapName","MappingName")	
			if Request_Form("constsrvNameEdit") <> "" then
				TCWebApi_set("VirServer_Entry","isCustomize","constsrvNameEdit") 
			else
				TCWebApi_constset("VirServer_Entry","isCustomize","")
			end if	
			TCWebApi_commit("VirServer_Entry")
	end if
	if Request_Form("hVirServEntry1") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry1")
			TCWebApi_set("VirServer_Entry","Active","EnableVirServer_Flag")
			TCWebApi_set("VirServer_Entry","Protocal","PortMappingProtocolEdit")
			TCWebApi_set("VirServer_Entry","SrcIP","RemoteHost")
			TCWebApi_set("VirServer_Entry","STARTPORT","ExternalPort")
			TCWebApi_set("VirServer_Entry","INTPORT","InternalPort")
			TCWebApi_set("VirServer_Entry","LOCALIP","InternalClient")
			TCWebApi_set("VirServer_Entry","MapName","MappingName")	
			if Request_Form("constsrvNameEdit") <> "" then
				TCWebApi_set("VirServer_Entry","isCustomize","constsrvNameEdit") 
			else
				TCWebApi_constset("VirServer_Entry","isCustomize","")
			end if	
			TCWebApi_commit("VirServer_Entry")
	end if
	if Request_Form("hVirServEntry2") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry2")
			TCWebApi_set("VirServer_Entry","Active","EnableVirServer_Flag")
			TCWebApi_set("VirServer_Entry","Protocal","PortMappingProtocolEdit")
			TCWebApi_set("VirServer_Entry","SrcIP","RemoteHost")
			TCWebApi_set("VirServer_Entry","STARTPORT","ExternalPort")
			TCWebApi_set("VirServer_Entry","INTPORT","InternalPort")
			TCWebApi_set("VirServer_Entry","LOCALIP","InternalClient")
			TCWebApi_set("VirServer_Entry","MapName","MappingName")	
			if Request_Form("constsrvNameEdit") <> "" then
				TCWebApi_set("VirServer_Entry","isCustomize","constsrvNameEdit") 
			else
				TCWebApi_constset("VirServer_Entry","isCustomize","")
			end if	
			TCWebApi_commit("VirServer_Entry")
	end if
	if Request_Form("hVirServEntry3") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry3")
			TCWebApi_set("VirServer_Entry","Active","EnableVirServer_Flag")
			TCWebApi_set("VirServer_Entry","Protocal","PortMappingProtocolEdit")
			TCWebApi_set("VirServer_Entry","SrcIP","RemoteHost")
			TCWebApi_set("VirServer_Entry","STARTPORT","ExternalPort")
			TCWebApi_set("VirServer_Entry","INTPORT","InternalPort")
			TCWebApi_set("VirServer_Entry","LOCALIP","InternalClient")
			TCWebApi_set("VirServer_Entry","MapName","MappingName")	
			if Request_Form("constsrvNameEdit") <> "" then
				TCWebApi_set("VirServer_Entry","isCustomize","constsrvNameEdit") 
			else
				TCWebApi_constset("VirServer_Entry","isCustomize","")
			end if
			TCWebApi_commit("VirServer_Entry")
	end if
	if Request_Form("hVirServEntry4") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry4")
			TCWebApi_set("VirServer_Entry","Active","EnableVirServer_Flag")
			TCWebApi_set("VirServer_Entry","Protocal","PortMappingProtocolEdit")
			TCWebApi_set("VirServer_Entry","SrcIP","RemoteHost")
			TCWebApi_set("VirServer_Entry","STARTPORT","ExternalPort")
			TCWebApi_set("VirServer_Entry","INTPORT","InternalPort")
			TCWebApi_set("VirServer_Entry","LOCALIP","InternalClient")
			TCWebApi_set("VirServer_Entry","MapName","MappingName")	
			if Request_Form("constsrvNameEdit") <> "" then
				TCWebApi_set("VirServer_Entry","isCustomize","constsrvNameEdit") 
			else
				TCWebApi_constset("VirServer_Entry","isCustomize","")
			end if
			TCWebApi_commit("VirServer_Entry")
	end if
	if Request_Form("hVirServEntry5") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry5")
			TCWebApi_set("VirServer_Entry","Active","EnableVirServer_Flag")
			TCWebApi_set("VirServer_Entry","Protocal","PortMappingProtocolEdit")
			TCWebApi_set("VirServer_Entry","SrcIP","RemoteHost")
			TCWebApi_set("VirServer_Entry","STARTPORT","ExternalPort")
			TCWebApi_set("VirServer_Entry","INTPORT","InternalPort")
			TCWebApi_set("VirServer_Entry","LOCALIP","InternalClient")
			TCWebApi_set("VirServer_Entry","MapName","MappingName")	
			if Request_Form("constsrvNameEdit") <> "" then
				TCWebApi_set("VirServer_Entry","isCustomize","constsrvNameEdit") 
			else
				TCWebApi_constset("VirServer_Entry","isCustomize","")
			end if	
			TCWebApi_commit("VirServer_Entry")
	end if
	if Request_Form("hVirServEntry6") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry6")
			TCWebApi_set("VirServer_Entry","Active","EnableVirServer_Flag")
			TCWebApi_set("VirServer_Entry","Protocal","PortMappingProtocolEdit")
			TCWebApi_set("VirServer_Entry","SrcIP","RemoteHost")
			TCWebApi_set("VirServer_Entry","STARTPORT","ExternalPort")
			TCWebApi_set("VirServer_Entry","INTPORT","InternalPort")
			TCWebApi_set("VirServer_Entry","LOCALIP","InternalClient")
			TCWebApi_set("VirServer_Entry","MapName","MappingName")	
			if Request_Form("constsrvNameEdit") <> "" then
				TCWebApi_set("VirServer_Entry","isCustomize","constsrvNameEdit") 
			else
				TCWebApi_constset("VirServer_Entry","isCustomize","")
			end if	
			TCWebApi_commit("VirServer_Entry")
	end if
	if Request_Form("hVirServEntry7") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry7")
			TCWebApi_set("VirServer_Entry","Active","EnableVirServer_Flag")
			TCWebApi_set("VirServer_Entry","Protocal","PortMappingProtocolEdit")
			TCWebApi_set("VirServer_Entry","SrcIP","RemoteHost")
			TCWebApi_set("VirServer_Entry","STARTPORT","ExternalPort")
			TCWebApi_set("VirServer_Entry","INTPORT","InternalPort")
			TCWebApi_set("VirServer_Entry","LOCALIP","InternalClient")
			TCWebApi_set("VirServer_Entry","MapName","MappingName")	
			if Request_Form("constsrvNameEdit") <> "" then
				TCWebApi_set("VirServer_Entry","isCustomize","constsrvNameEdit") 
			else
				TCWebApi_constset("VirServer_Entry","isCustomize","")
			end if	
			TCWebApi_commit("VirServer_Entry")
	end if	
	if Request_Form("hVirServEntry8") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry8")
			TCWebApi_set("VirServer_Entry","Active","EnableVirServer_Flag")
			TCWebApi_set("VirServer_Entry","Protocal","PortMappingProtocolEdit")
			TCWebApi_set("VirServer_Entry","SrcIP","RemoteHost")
			TCWebApi_set("VirServer_Entry","STARTPORT","ExternalPort")
			TCWebApi_set("VirServer_Entry","INTPORT","InternalPort")
			TCWebApi_set("VirServer_Entry","LOCALIP","InternalClient")
			TCWebApi_set("VirServer_Entry","MapName","MappingName")	
			if Request_Form("constsrvNameEdit") <> "" then
				TCWebApi_set("VirServer_Entry","isCustomize","constsrvNameEdit") 
			else
				TCWebApi_constset("VirServer_Entry","isCustomize","")
			end if	
			TCWebApi_commit("VirServer_Entry")
	end if	
	if Request_Form("hVirServEntry9") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry9")
			TCWebApi_set("VirServer_Entry","Active","EnableVirServer_Flag")
			TCWebApi_set("VirServer_Entry","Protocal","PortMappingProtocolEdit")
			TCWebApi_set("VirServer_Entry","SrcIP","RemoteHost")
			TCWebApi_set("VirServer_Entry","STARTPORT","ExternalPort")
			TCWebApi_set("VirServer_Entry","INTPORT","InternalPort")
			TCWebApi_set("VirServer_Entry","LOCALIP","InternalClient")
			TCWebApi_set("VirServer_Entry","MapName","MappingName")	
			if Request_Form("constsrvNameEdit") <> "" then
				TCWebApi_set("VirServer_Entry","isCustomize","constsrvNameEdit") 
			else
				TCWebApi_constset("VirServer_Entry","isCustomize","")
			end if	
			TCWebApi_commit("VirServer_Entry")
	end if
	if Request_Form("hVirServEntry10") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry10")
			TCWebApi_set("VirServer_Entry","Active","EnableVirServer_Flag")
			TCWebApi_set("VirServer_Entry","Protocal","PortMappingProtocolEdit")
			TCWebApi_set("VirServer_Entry","SrcIP","RemoteHost")
			TCWebApi_set("VirServer_Entry","STARTPORT","ExternalPort")
			TCWebApi_set("VirServer_Entry","INTPORT","InternalPort")
			TCWebApi_set("VirServer_Entry","LOCALIP","InternalClient")
			TCWebApi_set("VirServer_Entry","MapName","MappingName")	
			if Request_Form("constsrvNameEdit") <> "" then
				TCWebApi_set("VirServer_Entry","isCustomize","constsrvNameEdit") 
			else
				TCWebApi_constset("VirServer_Entry","isCustomize","")
			end if	
			TCWebApi_commit("VirServer_Entry")
	end if
	if Request_Form("hVirServEntry11") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry11")
			TCWebApi_set("VirServer_Entry","Active","EnableVirServer_Flag")
			TCWebApi_set("VirServer_Entry","Protocal","PortMappingProtocolEdit")
			TCWebApi_set("VirServer_Entry","SrcIP","RemoteHost")
			TCWebApi_set("VirServer_Entry","STARTPORT","ExternalPort")
			TCWebApi_set("VirServer_Entry","INTPORT","InternalPort")
			TCWebApi_set("VirServer_Entry","LOCALIP","InternalClient")
			TCWebApi_set("VirServer_Entry","MapName","MappingName")	
			if Request_Form("constsrvNameEdit") <> "" then
				TCWebApi_set("VirServer_Entry","isCustomize","constsrvNameEdit") 
			else
				TCWebApi_constset("VirServer_Entry","isCustomize","")
			end if	
			TCWebApi_commit("VirServer_Entry")
	end if
	if Request_Form("hVirServEntry12") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry12")
			TCWebApi_set("VirServer_Entry","Active","EnableVirServer_Flag")
			TCWebApi_set("VirServer_Entry","Protocal","PortMappingProtocolEdit")
			TCWebApi_set("VirServer_Entry","SrcIP","RemoteHost")
			TCWebApi_set("VirServer_Entry","STARTPORT","ExternalPort")
			TCWebApi_set("VirServer_Entry","INTPORT","InternalPort")
			TCWebApi_set("VirServer_Entry","LOCALIP","InternalClient")
			TCWebApi_set("VirServer_Entry","MapName","MappingName")	
			if Request_Form("constsrvNameEdit") <> "" then
				TCWebApi_set("VirServer_Entry","isCustomize","constsrvNameEdit") 
			else
				TCWebApi_constset("VirServer_Entry","isCustomize","")
			end if	
			TCWebApi_commit("VirServer_Entry")
	end if
	if Request_Form("hVirServEntry13") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry13")
			TCWebApi_set("VirServer_Entry","Active","EnableVirServer_Flag")
			TCWebApi_set("VirServer_Entry","Protocal","PortMappingProtocolEdit")
			TCWebApi_set("VirServer_Entry","SrcIP","RemoteHost")
			TCWebApi_set("VirServer_Entry","STARTPORT","ExternalPort")
			TCWebApi_set("VirServer_Entry","INTPORT","InternalPort")
			TCWebApi_set("VirServer_Entry","LOCALIP","InternalClient")
			TCWebApi_set("VirServer_Entry","MapName","MappingName")	
			if Request_Form("constsrvNameEdit") <> "" then
				TCWebApi_set("VirServer_Entry","isCustomize","constsrvNameEdit") 
			else
				TCWebApi_constset("VirServer_Entry","isCustomize","")
			end if	
			TCWebApi_commit("VirServer_Entry")
	end if
	if Request_Form("hVirServEntry14") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry14")
			TCWebApi_set("VirServer_Entry","Active","EnableVirServer_Flag")
			TCWebApi_set("VirServer_Entry","Protocal","PortMappingProtocolEdit")
			TCWebApi_set("VirServer_Entry","SrcIP","RemoteHost")
			TCWebApi_set("VirServer_Entry","STARTPORT","ExternalPort")
			TCWebApi_set("VirServer_Entry","INTPORT","InternalPort")
			TCWebApi_set("VirServer_Entry","LOCALIP","InternalClient")
			TCWebApi_set("VirServer_Entry","MapName","MappingName")	
			if Request_Form("constsrvNameEdit") <> "" then
				TCWebApi_set("VirServer_Entry","isCustomize","constsrvNameEdit") 
			else
				TCWebApi_constset("VirServer_Entry","isCustomize","")
			end if	
			TCWebApi_commit("VirServer_Entry")
	end if
	if Request_Form("hVirServEntry15") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry15")
			TCWebApi_set("VirServer_Entry","Active","EnableVirServer_Flag")
			TCWebApi_set("VirServer_Entry","Protocal","PortMappingProtocolEdit")
			TCWebApi_set("VirServer_Entry","SrcIP","RemoteHost")
			TCWebApi_set("VirServer_Entry","STARTPORT","ExternalPort")
			TCWebApi_set("VirServer_Entry","INTPORT","InternalPort")
			TCWebApi_set("VirServer_Entry","LOCALIP","InternalClient")
			TCWebApi_set("VirServer_Entry","MapName","MappingName")	
			if Request_Form("constsrvNameEdit") <> "" then
				TCWebApi_set("VirServer_Entry","isCustomize","constsrvNameEdit") 
			else
				TCWebApi_constset("VirServer_Entry","isCustomize","")
			end if	
			TCWebApi_commit("VirServer_Entry")
	end if
	if Request_Form("hVirServEntry16") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry16")
			TCWebApi_set("VirServer_Entry","Active","EnableVirServer_Flag")
			TCWebApi_set("VirServer_Entry","Protocal","PortMappingProtocolEdit")
			TCWebApi_set("VirServer_Entry","SrcIP","RemoteHost")
			TCWebApi_set("VirServer_Entry","STARTPORT","ExternalPort")
			TCWebApi_set("VirServer_Entry","INTPORT","InternalPort")
			TCWebApi_set("VirServer_Entry","LOCALIP","InternalClient")
			TCWebApi_set("VirServer_Entry","MapName","MappingName")	
			if Request_Form("constsrvNameEdit") <> "" then
				TCWebApi_set("VirServer_Entry","isCustomize","constsrvNameEdit") 
			else
				TCWebApi_constset("VirServer_Entry","isCustomize","")
			end if	
			TCWebApi_commit("VirServer_Entry")
	end if
	if Request_Form("hVirServEntry17") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry17")
			TCWebApi_set("VirServer_Entry","Active","EnableVirServer_Flag")
			TCWebApi_set("VirServer_Entry","Protocal","PortMappingProtocolEdit")
			TCWebApi_set("VirServer_Entry","SrcIP","RemoteHost")
			TCWebApi_set("VirServer_Entry","STARTPORT","ExternalPort")
			TCWebApi_set("VirServer_Entry","INTPORT","InternalPort")
			TCWebApi_set("VirServer_Entry","LOCALIP","InternalClient")
			TCWebApi_set("VirServer_Entry","MapName","MappingName")	
			if Request_Form("constsrvNameEdit") <> "" then
				TCWebApi_set("VirServer_Entry","isCustomize","constsrvNameEdit") 
			else
				TCWebApi_constset("VirServer_Entry","isCustomize","")
			end if	
			TCWebApi_commit("VirServer_Entry")
	end if	
	if Request_Form("hVirServEntry18") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry18")
			TCWebApi_set("VirServer_Entry","Active","EnableVirServer_Flag")
			TCWebApi_set("VirServer_Entry","Protocal","PortMappingProtocolEdit")
			TCWebApi_set("VirServer_Entry","SrcIP","RemoteHost")
			TCWebApi_set("VirServer_Entry","STARTPORT","ExternalPort")
			TCWebApi_set("VirServer_Entry","INTPORT","InternalPort")
			TCWebApi_set("VirServer_Entry","LOCALIP","InternalClient")
			TCWebApi_set("VirServer_Entry","MapName","MappingName")	
			if Request_Form("constsrvNameEdit") <> "" then
				TCWebApi_set("VirServer_Entry","isCustomize","constsrvNameEdit") 
			else
				TCWebApi_constset("VirServer_Entry","isCustomize","")
			end if	
			TCWebApi_commit("VirServer_Entry")
	end if	
	if Request_Form("hVirServEntry19") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry19")
			TCWebApi_set("VirServer_Entry","Active","EnableVirServer_Flag")
			TCWebApi_set("VirServer_Entry","Protocal","PortMappingProtocolEdit")
			TCWebApi_set("VirServer_Entry","SrcIP","RemoteHost")
			TCWebApi_set("VirServer_Entry","STARTPORT","ExternalPort")
			TCWebApi_set("VirServer_Entry","INTPORT","InternalPort")
			TCWebApi_set("VirServer_Entry","LOCALIP","InternalClient")
			TCWebApi_set("VirServer_Entry","MapName","MappingName")	
			if Request_Form("constsrvNameEdit") <> "" then
				TCWebApi_set("VirServer_Entry","isCustomize","constsrvNameEdit") 
			else
				TCWebApi_constset("VirServer_Entry","isCustomize","")
			end if	
			TCWebApi_commit("VirServer_Entry")
	end if
	if Request_Form("hVirServEntry20") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry20")
			TCWebApi_set("VirServer_Entry","Active","EnableVirServer_Flag")
			TCWebApi_set("VirServer_Entry","Protocal","PortMappingProtocolEdit")
			TCWebApi_set("VirServer_Entry","SrcIP","RemoteHost")
			TCWebApi_set("VirServer_Entry","STARTPORT","ExternalPort")
			TCWebApi_set("VirServer_Entry","INTPORT","InternalPort")
			TCWebApi_set("VirServer_Entry","LOCALIP","InternalClient")
			TCWebApi_set("VirServer_Entry","MapName","MappingName")	
			if Request_Form("constsrvNameEdit") <> "" then
				TCWebApi_set("VirServer_Entry","isCustomize","constsrvNameEdit") 
			else
				TCWebApi_constset("VirServer_Entry","isCustomize","")
			end if	
			TCWebApi_commit("VirServer_Entry")
	end if
	if Request_Form("hVirServEntry21") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry21")
			TCWebApi_set("VirServer_Entry","Active","EnableVirServer_Flag")
			TCWebApi_set("VirServer_Entry","Protocal","PortMappingProtocolEdit")
			TCWebApi_set("VirServer_Entry","SrcIP","RemoteHost")
			TCWebApi_set("VirServer_Entry","STARTPORT","ExternalPort")
			TCWebApi_set("VirServer_Entry","INTPORT","InternalPort")
			TCWebApi_set("VirServer_Entry","LOCALIP","InternalClient")
			TCWebApi_set("VirServer_Entry","MapName","MappingName")	
			if Request_Form("constsrvNameEdit") <> "" then
				TCWebApi_set("VirServer_Entry","isCustomize","constsrvNameEdit") 
			else
				TCWebApi_constset("VirServer_Entry","isCustomize","")
			end if	
			TCWebApi_commit("VirServer_Entry")
	end if
	if Request_Form("hVirServEntry22") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry22")
			TCWebApi_set("VirServer_Entry","Active","EnableVirServer_Flag")
			TCWebApi_set("VirServer_Entry","Protocal","PortMappingProtocolEdit")
			TCWebApi_set("VirServer_Entry","SrcIP","RemoteHost")
			TCWebApi_set("VirServer_Entry","STARTPORT","ExternalPort")
			TCWebApi_set("VirServer_Entry","INTPORT","InternalPort")
			TCWebApi_set("VirServer_Entry","LOCALIP","InternalClient")
			TCWebApi_set("VirServer_Entry","MapName","MappingName")	
			if Request_Form("constsrvNameEdit") <> "" then
				TCWebApi_set("VirServer_Entry","isCustomize","constsrvNameEdit") 
			else
				TCWebApi_constset("VirServer_Entry","isCustomize","")
			end if	
			TCWebApi_commit("VirServer_Entry")
	end if
	if Request_Form("hVirServEntry23") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry23")
			TCWebApi_set("VirServer_Entry","Active","EnableVirServer_Flag")
			TCWebApi_set("VirServer_Entry","Protocal","PortMappingProtocolEdit")
			TCWebApi_set("VirServer_Entry","SrcIP","RemoteHost")
			TCWebApi_set("VirServer_Entry","STARTPORT","ExternalPort")
			TCWebApi_set("VirServer_Entry","INTPORT","InternalPort")
			TCWebApi_set("VirServer_Entry","LOCALIP","InternalClient")
			TCWebApi_set("VirServer_Entry","MapName","MappingName")	
			if Request_Form("constsrvNameEdit") <> "" then
				TCWebApi_set("VirServer_Entry","isCustomize","constsrvNameEdit") 
			else
				TCWebApi_constset("VirServer_Entry","isCustomize","")
			end if	
			TCWebApi_commit("VirServer_Entry")
	end if
	if Request_Form("hVirServEntry24") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry24")
			TCWebApi_set("VirServer_Entry","Active","EnableVirServer_Flag")
			TCWebApi_set("VirServer_Entry","Protocal","PortMappingProtocolEdit")
			TCWebApi_set("VirServer_Entry","SrcIP","RemoteHost")
			TCWebApi_set("VirServer_Entry","STARTPORT","ExternalPort")
			TCWebApi_set("VirServer_Entry","INTPORT","InternalPort")
			TCWebApi_set("VirServer_Entry","LOCALIP","InternalClient")
			TCWebApi_set("VirServer_Entry","MapName","MappingName")	
			if Request_Form("constsrvNameEdit") <> "" then
				TCWebApi_set("VirServer_Entry","isCustomize","constsrvNameEdit") 
			else
				TCWebApi_constset("VirServer_Entry","isCustomize","")
			end if	
			TCWebApi_commit("VirServer_Entry")
	end if
	if Request_Form("hVirServEntry25") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry25")
			TCWebApi_set("VirServer_Entry","Active","EnableVirServer_Flag")
			TCWebApi_set("VirServer_Entry","Protocal","PortMappingProtocolEdit")
			TCWebApi_set("VirServer_Entry","SrcIP","RemoteHost")
			TCWebApi_set("VirServer_Entry","STARTPORT","ExternalPort")
			TCWebApi_set("VirServer_Entry","INTPORT","InternalPort")
			TCWebApi_set("VirServer_Entry","LOCALIP","InternalClient")
			TCWebApi_set("VirServer_Entry","MapName","MappingName")	
			if Request_Form("constsrvNameEdit") <> "" then
				TCWebApi_set("VirServer_Entry","isCustomize","constsrvNameEdit") 
			else
				TCWebApi_constset("VirServer_Entry","isCustomize","")
			end if	
			TCWebApi_commit("VirServer_Entry")
	end if
	if Request_Form("hVirServEntry26") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry26")
			TCWebApi_set("VirServer_Entry","Active","EnableVirServer_Flag")
			TCWebApi_set("VirServer_Entry","Protocal","PortMappingProtocolEdit")
			TCWebApi_set("VirServer_Entry","SrcIP","RemoteHost")
			TCWebApi_set("VirServer_Entry","STARTPORT","ExternalPort")
			TCWebApi_set("VirServer_Entry","INTPORT","InternalPort")
			TCWebApi_set("VirServer_Entry","LOCALIP","InternalClient")
			TCWebApi_set("VirServer_Entry","MapName","MappingName")	
			if Request_Form("constsrvNameEdit") <> "" then
				TCWebApi_set("VirServer_Entry","isCustomize","constsrvNameEdit") 
			else
				TCWebApi_constset("VirServer_Entry","isCustomize","")
			end if	
			TCWebApi_commit("VirServer_Entry")
	end if
	if Request_Form("hVirServEntry27") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry27")
			TCWebApi_set("VirServer_Entry","Active","EnableVirServer_Flag")
			TCWebApi_set("VirServer_Entry","Protocal","PortMappingProtocolEdit")
			TCWebApi_set("VirServer_Entry","SrcIP","RemoteHost")
			TCWebApi_set("VirServer_Entry","STARTPORT","ExternalPort")
			TCWebApi_set("VirServer_Entry","INTPORT","InternalPort")
			TCWebApi_set("VirServer_Entry","LOCALIP","InternalClient")
			TCWebApi_set("VirServer_Entry","MapName","MappingName")	
			if Request_Form("constsrvNameEdit") <> "" then
				TCWebApi_set("VirServer_Entry","isCustomize","constsrvNameEdit") 
			else
				TCWebApi_constset("VirServer_Entry","isCustomize","")
			end if	
			TCWebApi_commit("VirServer_Entry")
	end if	
	if Request_Form("hVirServEntry28") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry28")
			TCWebApi_set("VirServer_Entry","Active","EnableVirServer_Flag")
			TCWebApi_set("VirServer_Entry","Protocal","PortMappingProtocolEdit")
			TCWebApi_set("VirServer_Entry","SrcIP","RemoteHost")
			TCWebApi_set("VirServer_Entry","STARTPORT","ExternalPort")
			TCWebApi_set("VirServer_Entry","INTPORT","InternalPort")
			TCWebApi_set("VirServer_Entry","LOCALIP","InternalClient")
			TCWebApi_set("VirServer_Entry","MapName","MappingName")	
			if Request_Form("constsrvNameEdit") <> "" then
				TCWebApi_set("VirServer_Entry","isCustomize","constsrvNameEdit") 
			else
				TCWebApi_constset("VirServer_Entry","isCustomize","")
			end if	
			TCWebApi_commit("VirServer_Entry")
	end if	
	if Request_Form("hVirServEntry29") <> "99" then
		TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry29")
			TCWebApi_set("VirServer_Entry","Active","EnableVirServer_Flag")
			TCWebApi_set("VirServer_Entry","Protocal","PortMappingProtocolEdit")
			TCWebApi_set("VirServer_Entry","SrcIP","RemoteHost")
			TCWebApi_set("VirServer_Entry","STARTPORT","ExternalPort")
			TCWebApi_set("VirServer_Entry","INTPORT","InternalPort")
			TCWebApi_set("VirServer_Entry","LOCALIP","InternalClient")
			TCWebApi_set("VirServer_Entry","MapName","MappingName")	
			if Request_Form("constsrvNameEdit") <> "" then
				TCWebApi_set("VirServer_Entry","isCustomize","constsrvNameEdit") 
			else
				TCWebApi_constset("VirServer_Entry","isCustomize","")
			end if	
			TCWebApi_commit("VirServer_Entry")
	end if
	tcWebApi_save()
end if
end if
%>
<!doctype html>
<html>
	<head>
<title>Viettel ONT - <%tcWebApi_get("String_Entry","NatVirsvrText","s")%></title>		<meta charset="utf-8">
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
		</script>		<script language=javascript src="/JS/util.js"></script>
		<script language="javascript" type=text/javascript>
		var VirServEntryIndex = 0;
		var VirSerIdleEntryIndex = 0;
		var VirSerIdleFlag = 0;
		var WanInfo = new Array();
		var nEntryNum = <% tcWebApi_get("WanInfo_Common","CycleNum","s") %>;
		var vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
		var vEntryName = vArrayStr.split(',');
		vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
		var vEntryValue = vArrayStr.split(',');
		vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
		var vEntryIndex = vArrayStr.split(',');
		vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
		var vActive = vArrayStr.split(',');
		vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
		var vNATENABLE = vArrayStr.split(',');
		var LockAdd = false;
		var EditFlag = false;
		var LockEdit = false;
		var isWanInterfaceExist = false;
		var isCustomizeApp = true;
		var gLockAddEdit = false;
		var AppIdx = 0;
		var LanIP = "<%tcWebApi_get("Lan_Entry0","IP","s")%>";
		var LanMask = "<%tcWebApi_get("Lan_Entry0","netmask","s")%>"
		/*sort*/
		vEntryName = SortUtil.UpdateWanIFName( vEntryName, nEntryNum );
		vEntryValue = SortUtil.SortMyArray( vEntryValue );
		vEntryIndex = SortUtil.SortMyArray( vEntryIndex );
		vActive = SortUtil.SortMyArray( vActive );
		vNATENABLE = SortUtil.SortMyArray( vNATENABLE );
		/* Wan Info */
		function stWanInfo(domain,Name,Enable,NATEnabled,ConnectionType,ServiceList)
		{
			this.domain = domain;
			this.key = this.domain;
			this.Name = Name;
			this.ConnectionType = ConnectionType;
			this.ServiceList = ServiceList;
			if(Enable == "Yes")
				this.Enable = 1;
			else
				this.Enable = 0;
			if(NATEnabled == "Enable")
				this.NATEnabled = 1;
			else
				this.NATEnabled = 0;		
			this.CntStatus = '';
		}
		for (i = 0; i < nEntryNum; i++)
		{
			WanInfo[i] = new stWanInfo(vEntryValue[i],vEntryName[i],vActive[i],vNATENABLE[i],vEntryName[i],vEntryName[i]);
		}
		function stPortMap(domain,ProtMapEnabled,Protocol,RemoteHost,ExPort,InPort,InClient,Description,isCustomize)
		{
			domain = ""+domain;	
			this.domain = domain;
			this.key = this.domain;
			this.ProtMapEnabled = ProtMapEnabled;
			this.Protocol = Protocol;
			this.RemoteHost = RemoteHost;
			this.ExPort = ExPort;
			this.InPort = InPort;
			this.InClient = InClient;
			this.Description = Description;
			var index = domain.lastIndexOf('PortMapping');
			this.interface = domain.substr(0,index - 1);
			this.interface = domain;
			this.NATEnabled = '';
			this.Enable = '';
			this.isCustomize = isCustomize;
		}
		var PortMapping = new Array();
		var indexPortMapping = 0;
		var MAX_VIRSERVER_NUM = 30;
		nEntryNum = <% tcWebApi_get("WanInfo_Common","CycleNum","s") %>;
		vArrayStr = "<% tcWebApi_get("WanInfo_Common","VirServerCycleValue","s") %>";
		var vNatActive = vArrayStr.split(',');
		vArrayStr = "<% tcWebApi_get("WanInfo_Common","VirServerCycleValue","s") %>";
		var vNatProtocol = vArrayStr.split(',');
		vArrayStr = "<% tcWebApi_get("WanInfo_Common","VirServerCycleValue","s") %>";
		var vNatSrcIP = vArrayStr.split(',');
		vArrayStr = "<% tcWebApi_get("WanInfo_Common","VirServerCycleValue","s") %>";
		var vNatSTARTPORT = vArrayStr.split(',');
		vArrayStr = "<% tcWebApi_get("WanInfo_Common","VirServerCycleValue","s") %>";
		var vNatENDPORT = vArrayStr.split(',');
		vArrayStr = "<% tcWebApi_get("WanInfo_Common","VirServerCycleValue","s") %>";
		var vNatLOCALIP = vArrayStr.split(',');
		vArrayStr = "<% tcWebApi_get("WanInfo_Common","VirServerCycleValue","s") %>";
		var vNatMapName = vArrayStr.split(',');
		vArrayStr = "<% tcWebApi_get("WanInfo_Common","VirServerCycleValue","s") %>";
		var vIsCustomize = vArrayStr.split(',');
		for (j = 0; j < MAX_VIRSERVER_NUM; j++)
		{
			if(vNatActive[j] == "Yes" || vNatActive[j] == "No")
			{
				PortMapping[indexPortMapping] = new stPortMap(j,vNatActive[j],vNatProtocol[j],vNatSrcIP[j],vNatSTARTPORT[j],vNatENDPORT[j],vNatLOCALIP[j],vNatMapName[j], vIsCustomize[j]);
				indexPortMapping++;
			}
			else if(0 == VirSerIdleFlag){
				VirSerIdleEntryIndex = j;
				VirSerIdleFlag = 1;
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
		function CheckExternalPort(value)
		{
			var httpsPort;
			var httpPort;
			var tr069Port;
			var Port1 = "1900";
			var Port2 = "8081";
			httpsPort = "<% tcWebApi_get("Account_WebMng","HttpsPort","s") %>";
			if(httpsPort == "")
			{
				httpsPort = "443";
			}
			httpPort = "<% tcWebApi_get("Account_WebMng","HttpPort","s") %>";
			if(httpPort == "")
			{
				httpsPort = "80";
			}
			tr069Port = "<% tcWebApi_get("Cwmp_Entry","conReqPort","s") %>";
			if(tr069Port == "")
			{
				tr069Port = "8888";
			}
			if((value == httpPort) || (value == httpsPort) || 
			(value == tr069Port) || (value == Port1) || (value == Port2))
			{
				alert('<%tcWebApi_get("String_Entry","PFJS2Text","s")%>' );
				return false;
			}
			return true;
		}
		function CheckInternalPort(value)
		{
			if(false == isCustomizeApp)/*global varable for defining which apps is customize or not */
			{
				if(value != v[AppIdx].e[0].iStart)
				{
					alert('<%tcWebApi_get("String_Entry","PFJS15Text","s")%>' );
					return false;
				}
			}
			else
			{
				return true;
			}	
		}
		function CheckProtocol(value)/*global varable for defining which apps is customize or not */
		{
			var key = "0";
			if(value == "TCP/UDP")
			{
				key = "0";
			}
			else if(value == "TCP")
			{
				key = "1";
			}
			else if(value == "UDP")
			{
				key = "2";
			}
			else
			{
				key = "0";
			}
			if(false == isCustomizeApp)
			{
				if(key != v[AppIdx].e[0].proto)
				{
					alert('<%tcWebApi_get("String_Entry","PFJS14Text","s")%>'); 
					return false;
				}
			}
			else
			{
				return true;
			}	
		}
		function CheckPortMapping(addflag, index)
		{
			if(1 == addflag) /* Add*/
			{
				if(VirServEntryIndex >= 30)
				{
					alert('<%tcWebApi_get("String_Entry","PFPortText","s")%>')
					return false;
				}
			}
			if(PortMapping.length >= 32)
			{
				alert('<%tcWebApi_get("String_Entry","PFRuleText","s")%>')
				return false;
			}
			if (WanInfo.length == 0)
			{
				alert('<%tcWebApi_get("String_Entry","PFWanAddText","s")%>');
				return false;
			}
			with (getElById('PortMappingForm'))
			{
				if (RemoteHost.value != "")
				{
					if (isValidIpAddress(RemoteHost.value) == false)
					{
						alert('<%tcWebApi_get("String_Entry","PFJS0Text","s")%>');
						return false;
					}
					else if ((isLoopIpAddress(getValue('RemoteHost'))==true)||(isBroadcastIpAddress(getValue('RemoteHost'))==true)
					||(isNtwkSgmtIpAddress(getValue('RemoteHost'))==true))
					{
						alert('<%tcWebApi_get("String_Entry","PFJS1Text","s")%>');
						return false;
					}
				}
				if(1 == addflag) /* Add */
				{
					if(PortMappingProtocol.value != "")
					{
						if(false == CheckProtocol(PortMappingProtocol.value))
							return false;
					}
				}
				else if(0 == addflag) /* edit */
				{
					if(PortMappingProtocolEdit.value != "")
					{
						if(false == CheckProtocol(PortMappingProtocolEdit.value))
							return false;
					}
				}
				if (ExternalPort.value == "")
				{
					alert('<%tcWebApi_get("String_Entry","PFJS2Text","s")%>' );
					return false;
				}
				if (ExternalPort.value != "")
				{
					if(false == CheckExternalPort(ExternalPort.value))
						return false;
				}
				if (InternalPort.value == "")
				{
					alert('<%tcWebApi_get("String_Entry","PFJS3Text","s")%>' );
					return false;
				}
				if (InternalPort.value != "")
				{
					if(false == CheckInternalPort(InternalPort.value))
						return false;
				}
				if (InternalClient.value == "")
				{
					alert('<%tcWebApi_get("String_Entry","PFJS4Text","s")%>' );
					return false;
				}
				if (!ip_poolcheck($('#InternalClient').val(),LanIP,LanMask)) {
						alert("<%tcWebApi_get("String_Entry","NatSessionsLANSubnetText","s")%>");/* IP should be in subnet*/
						$('#InternalClient').focus();
						return false;
					}
				if ($('#InternalClient').val() == LanIP)
				{
					alert("<%tcWebApi_get("String_Entry","NatDmzAddrJS2Text","s")%>");
					$('#InternalClient').focus();
					return false;
				}
				if (MappingName.value == "")
				{
					alert('<%tcWebApi_get("String_Entry","PFJS5Text","s")%>' );
					return false;
				}
				if (isAbcIpAddress(InternalClient.value) == false ||(isBroadcastIpAddress(getValue('InternalClient'))==true)
				||(isNtwkSgmtIpAddress(getValue('InternalClient'))==true))
				{
					alert('<%tcWebApi_get("String_Entry","PFJS4Text","s")%>');
					return false;
				}
				if (isValidPort(ExternalPort.value) == false )
				{
					alert('<%tcWebApi_get("String_Entry","PFJS2Text","s")%>' );
					return false;
				}
				if (isValidPort(InternalPort.value) == false )
				{
					alert('<%tcWebApi_get("String_Entry","PFJS3Text","s")%>' );
					return false;
				}
				if (isValidName(MappingName.value) == false)
				{
					alert('<%tcWebApi_get("String_Entry","PFJS6Text","s")%>');
					return false;
				}
				for (i = 0; i < PortMapping.length; i++)
				{
					if(1 == addflag) /* Add*/
					{
						if (PortMapping[i].Description == MappingName.value)
						{
							alert('<%tcWebApi_get("String_Entry","PFJS7Text","s")%>');
							return false;
						}
						if (PortMapping[i].Protocol == PortMappingProtocol.value
						&& PortMapping[i].ExPort == ExternalPort.value
						&& PortMapping[i].InPort == InternalPort.value
						&& PortMapping[i].RemoteHost == RemoteHost.value
						&& PortMapping[i].InClient == InternalClient.value)
						{
							alert('<%tcWebApi_get("String_Entry","PFJS8Text","s")%>');
							return false;
						}
						if((PortMapping[i].Protocol == PortMappingProtocol.value)
						|| (PortMapping[i].Protocol == "TCP/UDP")
						|| (PortMappingProtocol.value == "TCP/UDP"))
						{
							if(PortMapping[i].ExPort == ExternalPort.value)
							{
								alert('<%tcWebApi_get("String_Entry","PFJS9Text","s")%>');
								return false;
							}
							else
							{
								if((PortMapping[i].InPort == InternalPort.value)
								&& (PortMapping[i].InClient == InternalClient.value))
								{
									alert('<%tcWebApi_get("String_Entry","PFJS10Text","s")%>'); 
									return false;
								}
							}
						}
					}
					else
					{
						/*imode = 0: Edit */
						if(index == i)
						{
							continue;
						}
						if (PortMapping[i].Description == MappingName.value)
						{
							alert('<%tcWebApi_get("String_Entry","PFJS7Text","s")%>');
							return false;
						}
						if (PortMapping[i].Protocol == PortMappingProtocolEdit.value
						&& PortMapping[i].ExPort == ExternalPort.value
						&& PortMapping[i].InPort == InternalPort.value
						&& PortMapping[i].RemoteHost == RemoteHost.value
						&& PortMapping[i].InClient == InternalClient.value)
						{
							alert('<%tcWebApi_get("String_Entry","PFJS8Text","s")%>');
							return false;
						}
						if((PortMapping[i].Protocol == PortMappingProtocolEdit.value)
						|| (PortMapping[i].Protocol == "TCP/UDP")
						|| (PortMappingProtocolEdit.value == "TCP/UDP"))
						{
							if(PortMapping[i].ExPort == ExternalPort.value)
							{
								alert('<%tcWebApi_get("String_Entry","PFJS9Text","s")%>');
								return false;
							}
							else
							{
								if((PortMapping[i].InPort == InternalPort.value)
								&& (PortMapping[i].InClient == InternalClient.value))
								{
									alert('<%tcWebApi_get("String_Entry","PFJS10Text","s")%>'); 
									return false;
								}
							}
						}
					}
				}
			}
			return true;
		}
		function CheckForm(type, addflag, index)
		{
			switch (type)
			{
			case 1:
				return CheckPortMapping(addflag, index);
				break;
			case 2:
				with(getElById('PortMappingForm'))
				{
					var rml = getElById('rml');
					if (rml == null)
					{
						return false;
					}
				}
			}
			return true;
		}
		FIRST_APP = "<%tcWebApi_get("String_Entry","NatSelectText","s")%>";
		TOTAL_APP = 14;
		function cV(name, entryNum)
		{
			this.name = name;
			this.eNum = entryNum;
			this.e = new Array(5);
		}
		function iVe(eStart, eEnd, proto, iStart, iEnd)
		{
			this.eStart = eStart; /* External Port */
			this.eEnd = eEnd;
			this.proto = proto; /* Protocol */
			this.iStart = iStart; /* Internal Port */
			this.iEnd = iEnd; 
		}
		/* Pre-defined Value for the specific Service Type*/
		var v = new Array(TOTAL_APP);
		v[0] = new cV("Domain Name Server",1);
		v[0].e[0] = new iVe("53", "53", "2", "53", "53");
		v[1] = new cV("FTP Server",1);
		v[1].e[0] = new iVe("21", "21", "1", "21", "21");
		v[2] = new cV("IPSEC",1);
		v[2].e[0] = new iVe("500", "500", "2", "500", "500");
		v[3] = new cV("Mail POP3",1);
		v[3].e[0] = new iVe("110", "110", "1", "110", "110");
		v[4] = new cV("Mail SMTP",1);
		v[4].e[0] = new iVe("25", "25", "1", "25", "25");
		v[5] = new cV("PPTP",1);
		v[5].e[0] = new iVe("1723", "1723", "1", "1723", "1723");
		v[6] = new cV("Real Player 8 Plus",1);
		v[6].e[0] = new iVe("7070", "7070", "2", "7070", "7070");
		v[7] = new cV("Secure Shell Server",1);
		v[7].e[0] = new iVe("22", "22", "1", "22", "22");
		v[8] = new cV("Secure Web Server HTTPS",1); /* not used*/
		v[8].e[0] = new iVe("443", "443", "1", "443", "443");
		v[9] = new cV("SNMP",1);
		v[9].e[0] = new iVe("161", "161", "2", "161", "161");
		v[10] = new cV("SNMP Trap",1);
		v[10].e[0] = new iVe("162", "162", "2", "162", "162");
		v[11] = new cV("Telnet Server",1);
		v[11].e[0] = new iVe("23", "23", "1", "23", "23");
		v[12] = new cV("TFTP",1);
		v[12].e[0] = new iVe("69", "69", "2", "69", "69");
		v[13] = new cV("Web Server HTTP",1);/* not used */
		v[13].e[0] = new iVe("80", "80", "1", "80", "80");
		/* Delete the adundant space in strings */
		function trimspace(str)
		{
			var strTemp = new String(str);
			while (-1 != strTemp.search(" "))
			{
				strTemp = strTemp.replace(" ", "");
			}
			return strTemp;
		}
		function getEntryIndex(ctl)
		{
			for (i = 0; i < nEntryNum; i++)
			{
				if (getSelectVal(ctl) == vEntryValue[i])
					return vEntryIndex[i];
			}
			return 999;
		}
		function getEntryValue(idx)
		{
			for (i = 0; i < nEntryNum; i++)
			{
				if (idx == vEntryIndex[i])
					return vEntryValue[i];
			}
			return 999;
		}
		function radioClickAdd()
		{
			if (document.PortMappingForm.radiosrv[0].checked == true)
			{
					cs_disable("constsrvNameAdd");
					isCustomizeApp = true;
			}
			else
			{
					cs_enable("constsrvNameAdd");
					isCustomizeApp = false;
			}
		}
		function radioClickEdit(index)
		{
			if (document.PortMappingForm.radiosrv_edit[0].checked == true)
			{
					console.log("disable select name");
					cs_disable("constsrvNameEdit");
					isCustomizeApp = true;
			}
			else
			{
					console.log("enable select name");		
					cs_enable("constsrvNameEdit");
					isCustomizeApp = false;
			}
		}
		function clearAll()
		{
		}
		function appSelectAdd(sName)
		{
			clearAll();
			with (getElById('PortMappingForm'))
			{
				if (sName == FIRST_APP)
				{
					return;
				}
				for(i = 0; i < TOTAL_APP; i++)
				{
					if(v[i].name == sName)
					{
						switch (v[i].e[0].proto)
						{
						case '0':
							setSelect('PortMappingProtocol','TCP/UDP');
							break;
						case '1':
							setSelect('PortMappingProtocol','TCP');
							break;
						case '2':
							setSelect('PortMappingProtocol','UDP');
							break;
						}
						RemoteHost.value = "";
						ExternalPort.value = v[i].e[0].eStart;
						InternalPort.value = v[i].e[0].iStart;
						MappingName.value = trimspace(sName);
						AppIdx = i;
					}
				}
			}
		}
		function appSelectEdit(sName)
		{
			clearAll();
			with (getElById('PortMappingForm'))
			{
				if (sName == FIRST_APP)
				{
					return;
				}
				for(i = 0; i < TOTAL_APP; i++)
				{
					if(v[i].name == sName)
					{
						switch (v[i].e[0].proto)
						{
						case '0':
							setSelect('PortMappingProtocolEdit','TCP/UDP');
							break;
						case '1':
							setSelect('PortMappingProtocolEdit','TCP');
							break;
						case '2':
							setSelect('PortMappingProtocolEdit','UDP');
							break;
						}
						RemoteHost.value = "";
						ExternalPort.value = v[i].e[0].eStart;
						InternalPort.value = v[i].e[0].iStart;
						MappingName.value = trimspace(sName);
						AppIdx = i;
					}
				}
			}
		}
		function RemovePortMapping(Form, CheckTag)
		{
			var rml = getElById(CheckTag);
			var i;
			if (rml.length > 0)
			{
				for (i = 0; i < rml.length; i++)
				{
					if (rml[i].checked == true)
					{
						/*Form.addParameter(rml[i].value,'');*/
						var ctlName = "hVirServEntry"+i;
						console.log(ctlName);
						setText(ctlName,rml[i].value);
					}
				}
			}
			else if (rml.checked == true)
			{
				/*Form.addParameter(rml.value,'');*/
				var ctlName = "hVirServEntry0";
				console.log(ctlName);
				setText(ctlName,rml.value);		
			}
		}
		function ModifyPortMappingEnable(Form, CheckTag, flag)
		{
			var rml = getElById(CheckTag);
			var i, cnt;
			var enable;
			var ctlName;
			if (rml == null)
			{
				alert('<%tcWebApi_get("String_Entry","PFJS11Text","s")%>');/* Remember to replace */
				return false;
			}
			if (1 == flag)
				enable = "Yes";
			else
				enable = "No";
			if (rml.length > 0)
			{
				cnt = 0;
				for (i = 0; i < rml.length; i++)
				{
					if (rml[i].checked == true)
					{
						cnt++;
						ctlName = "hVirServEntry"+i;
						setText(ctlName,rml[i].value);
						ctlName = "vEnableEntry"+i;
						setText(ctlName,enable);
						if(1 == flag)
							console.log("Open");
						else
							console.log("Close");
					}
				}
				if (0 == cnt)
				{
					alert('<%tcWebApi_get("String_Entry","PFJS11Text","s")%>');/* Remember to replace */
					return false;
				}
			}
			else if (rml.checked == true)
			{
				ctlName = "hVirServEntry0";
				setText(ctlName,rml.value);
				ctlName = "vEnableEntry0";
				setText(ctlName,enable);
			}
			else
			{
				alert('<%tcWebApi_get("String_Entry","PFJS11Text","s")%>');/* Remember to replace */
				return false;
			}
			return true;
		}
		function ChooseEditInterface(index)
		{
			var ctlName;
			ctlName = "hVirServEntry"+index;
			setText(ctlName,index);
			return true;
		}
		function toggle_checkbox(source) {
  			checkboxes = document.getElementsByName('rml');
  			for(var i = 0, n = checkboxes.length; i < n; i++) {
    			checkboxes[i].checked = source.checked;
  			}
		}
		function generate_if_option(){
			var html = '<option value="999">' + '' + '</option>';
			// document.write('<option value="999">' + '' + '</option>');
			for (i = 0; i < nEntryNum; i++)
			{
				<% if tcwebApi_get("WebCustom_Entry","isCTPONCZGDSupported","h") = "Yes" then %>
					if((vEntryName[i].indexOf('_TR069_')<0 && vEntryName[i].indexOf('_INTERNET_')>-1) && (vEntryName[i].indexOf('_R_')>-1))
				<%else%>				
					if((vEntryName[i].indexOf('_TR069_')<0 || vEntryName[i].indexOf('_INTERNET_')>-1) && (vEntryName[i].indexOf('_R_')>-1))
				<%end if%>
				{
					// document.write('<option value=' + vEntryValue[i] + ' id=portmp_' + i + '>' + vEntryName[i] + '</option>');
					html += '<option value=' + vEntryValue[i] + ' id=portmp_' + i + '>' + vEntryName[i] + '</option>';
				}
			}
			getElById('PortMappingInterface').innerHTML = html;
		}
		function ShowPortMapping()
		{
			setDisable('ButtonAdd',0);
			var i;
			/* Create Table */
			var html = '<table class="table-bordered-radius simple-table w-100">'
						+'<thead class="thead-light">'
							+'<tr align="middle">'
								+'<th scope="col">'
								+ '<div class="custom-control custom-checkbox col-lg-3 custom_cb_table">'
								+ '<input type="checkbox" class="custom-control-input" name="checkall" id="checkall" onclick="toggle_checkbox(this)">'
								+ '<label class="custom-control-label" for="checkall"></label>'
								+ '</div>'
								+ '</th>' /* Check */
								+'<th scope="col"><%tcWebApi_get("String_Entry","PFMappingNameText","s")%></th>' 
								+'<th scope="col"><%tcWebApi_get("String_Entry","PFProtocolText","s")%></th>' 
								+'<th scope="col"><%tcWebApi_get("String_Entry","PFInternalClientText","s")%></th>' 
								+'<th scope="col"><%tcWebApi_get("String_Entry","PFInternalPortText","s")%></th>' 
								+'<th scope="col"><%tcWebApi_get("String_Entry","PFExternalPortText","s")%></th>' 
								+'<th scope="col"><%tcWebApi_get("String_Entry","PFStatusText","s")%></th>' 
								+'<th scope="col"><%tcWebApi_get("String_Entry","PFModifyText","s")%></th>' 
							+'</tr>'
						+'</thead>';
			VirServEntryIndex = 0; /* Initialize Entry Index*/
			html += '<tbody>';
			if (0 == PortMapping.length )
			{
				html += '<tr align="middle">';
					html += '<td align="center"></td>';
					html += '<td align="center"></td>';
					html += '<td align="center"></td>';
					html += '<td align="center"></td>';
					html += '<td align="center"></td>';
					html += '<td align="center"></td>';
					html += '<td align="center"></td>';
					html += '<td align="center"></td>';
				html += '</tr>';
			}
			else
			{
				for (i = 0; i < PortMapping.length; i++)
				{
					html += '<tr align="middle">';
						html += '<td align="center">';
							html  += '<div class="custom-control custom-checkbox col-lg-3 custom_cb_table">';
								html += '<input type="checkbox" class="custom-control-input" name="rml" id="cb_'+ i + '" value="'+ PortMapping[i].domain + '">';
								html += '<label class="custom-control-label" for="cb_'+ i + '"></label>';
							html += '</div>';
						html += '</td>';/* rml is checkbox */
						html += '<td align="center">' + getDisplayText(PortMapping[i].Description,20) + '&nbsp;</td>';
						html += '<td align="center">' + getDisplayText(PortMapping[i].Protocol,10) + '&nbsp;</td>';
						html += '<td align="center">' + getDisplayText(PortMapping[i].InClient,15) + '&nbsp;</td>';
						html += '<td align="center">' + getDisplayText(PortMapping[i].InPort,5) + '&nbsp;</td>';
						html += '<td align="center">' + getDisplayText(PortMapping[i].ExPort,5) + '&nbsp;</td>';
						if (PortMapping[i].ProtMapEnabled == "Yes")
						{
							// html += '<td align="center">' + 'Open' + '&nbsp;</td>';/* REMEBER: Replace*/
							html += '<td align="center">';
							html += '<label class="col-lg-5" for="cb_enblService"></label>';
							html += '<label class="toggle-switch">';
								html += '<input id=cb_enblService'+ i + ' onclick="doToggle(4,' + i + ')" type=checkbox name=cb_enblService' + i + ' CHECKED>';
								html += '<span class="slider"></span>';
								html += '<input id=enblService' + i + ' type=hidden name="enblService">';
							html += '</label>';
							html += '</td>';
						}
						else
						{
							// html += '<td align="center">' + 'Close' + '&nbsp;</td>';/* REMEBER: Replace*/
							html += '<td align="center">';
							html += '<label class="col-lg-5" for="cb_enblService"></label>';
							html += '<label class="toggle-switch">';
								html += '<input id=cb_enblService' + i + ' onclick="doToggle(4,' + i + ')" type=checkbox name=cb_enblService' + i + '>';
								html += '<span class="slider"></span>';
								html += '<input id=enblService' + i + ' type=hidden name="enblService">';
							html += '</label>';
							html += '</td>';
						}
						html += '<td align="center">';
							html += '<em data-toggle="tooltip" data-placement="top" title="" class="fa fa-pencil-alt icon-btn" onclick="doEdit(' + i +')" data-original-title="Edit"></em>';
						html += '</td>';
					html += '</tr>';
					html += '<tr  ><td id=tr_edit' + i + ' style="DISPLAY:none" colspan=8 ></td></tr>';
					VirServEntryIndex++;
				}
			}
			html += '</tbody>';
			html += '</table>';
			getElById('portMappingInfo').innerHTML = html;
		}
		function LoadFrame()
		{
			// setSelect('PortMappingInterface',getEntryValue(<% tcWebApi_get("WebCurSet_Entry","nat_ifidx","s") %>));
			if (!displayInterface())
			{
			//	return;
			}
			if(document.PortMappingForm.isVirServerSupported.value == 1){	
	     		ShowPortMapping();
        	}
		}
		function CancelAddCnt()
		{
			with (getElById('PortMappingForm'))
			{
				cs_removeoption(getElement('PortMappingInterface'),PortMappingInterface.length - 1);
				LockAdd = false;
				gLockAddEdit = false;
				ButtonAdd.disabled = false;
			}
		}
		function doCancelAdd(){
			var wanIdItem = getElement('PortMappingInterface');
			LockAdd = false;
			gLockAddEdit = false;
			if (wanIdItem.value == -1)
			{
				CancelAddCnt();
			}
			else
			{
				ButtonAdd.disabled = false;
				var html = '';
				getElById('ConfigInfo').innerHTML = html;
				// RefreshPage();	
			}
		}
		function doCancelEdit(index){
			var wanIdItem = getElement('PortMappingInterface');
			LockEdit = false;
			gLockAddEdit = false;
			if (wanIdItem.value == -1)
			{
				CancelAddCnt();
			}
			else
			{
				var html = '';
				getElById('tr_edit'+ index).style.display = "none";
				getElById('tr_edit'+ index).innerHTML = html;
				// RefreshPage();	
			}
		}
		function ShowConfigInfo()
		{
			var i;
			var x;
			if(false == gLockAddEdit)
			{
				gLockAddEdit = true;
				/* Create Table */
				if(LockAdd == false) /* Flag >< LockAdd */
				{
					LockAdd = true;
					var html ='<div class="form-group">'
							+'<label class="col-lg-5"></label>'
							+ '<div class="custom-control custom-radio col-lg-3">'
								+ '<input onclick="radioClickAdd();" CHECKED type="radio" class="custom-control-input" id="radiosrv1" name="radiosrv" value="CustomizeText">'
								+ '<label class="custom-control-label" for="radiosrv1">&nbsp;<%tcWebApi_get("String_Entry","PFCustomizeText","s")%>&nbsp;</label>'
							+ '</div>'
							+ '<div class="custom-control custom-radio  col-lg-3">'
								+ '<input onclick="radioClickAdd();" type="radio" class="custom-control-input" id="radiosrv2" name="radiosrv" value="SelectText">'
								+ '<label class="custom-control-label" for="radiosrv2">&nbsp;<%tcWebApi_get("String_Entry","PFSelectApplicationText","s")%>&nbsp;</label>'
							+ '</div>'
						+ '</div>'
						+ '<div class="form-group">'
							+ '<label class="col-lg-5" for="">Service Type</label>'
							+ '<div class="col-lg-7 custom-select select-disable" name="select_srvname" id="select_srvname">'
								+ '<select disabled onchange="appSelectAdd(this.value);" id="constsrvNameAdd" name="constsrvNameAdd">'
									+ '<option value="FIRST_APP" selected><%tcWebApi_get("String_Entry","PFSelectText","s")%></option>'
									+ '<option value="Domain Name Server">Domain Name Server</option>'
									+ '<option value="FTP Server" >FTP Server</option>'
									+ '<option value="IPSEC" >IPSEC</option>'
									+ '<option value="Mail POP3" >Mail POP3</option>'
									+ '<option value="Mail SMTP" >Mail SMTP</option>'
									+ '<option value="PPTP" >PPTP</option>'
									+ '<option value="Real Player 8 Plus" >Real Player 8 Plus</option>'
									+ '<option value="Secure Shell Server" >Secure Shell Server</option>'
									+ '<option value="SNMP" >SNMP</option>'
									+ '<option value="SNMP Trap" >SNMP Trap</option>'
									+ '<option value="Telnet Server" >Telnet Server</option>'
									+ '<option value="TFTP" >TFTP</option>'
								+ '</select>'
							+ '</div>'
						+ '</div>'
						+ '<div class="form-group">'
							+ '<label class="col-lg-5" for=""><%tcWebApi_get("String_Entry","PFProtocolText","s")%></label>'
								+ '<div class="col-lg-7 custom-select" name="select_prot" id="select_prot">'
									+ '<select id="PortMappingProtocol" name="PortMappingProtocol" size=1>'
										+ '<option value="TCP" >TCP</option>'
										+ '<option value="UDP" >UDP</option>'
										+ '<option value="TCP/UDP" selected>TCP/UDP</option>'
									+ '</select>'
								+ '</div>'
						+ '</div>'
						+ '<div class="form-group">'
							+ '<label class="col-lg-5" for="MappingName"><%tcWebApi_get("String_Entry","PFMappingNameText","s")%></label>'
							+ '<input type="text" class="form-control col-lg-7" name="MappingName" size="32" maxlength="30" id="MappingName" value="">'
						+ '</div>'
						+ '<div class="form-group" style="DISPLAY: none">'
							+ '<label class="col-lg-5" for="RemoteHost"><%tcWebApi_get("String_Entry","PFRemoteHostText","s")%></label>'
							+ '<input type="text" class="form-control col-lg-7" name="RemoteHost" size="32" maxlength="30" id="RemoteHost" value="">'
						+ '</div>'
						+ '<div class="form-group">'
							+ '<label class="col-lg-5" for="InternalClient"><%tcWebApi_get("String_Entry","PFInternalClientText","s")%></label>'
							+ '<input type="text" class="form-control col-lg-7" name="InternalClient" size="32" maxlength="30" id="InternalClient" value="">'
						+ '</div>'
						+ '<div class="form-group">'
							+ '<label class="col-lg-5" for="InternalPort"><%tcWebApi_get("String_Entry","PFInternalPortText","s")%></label>'
							+ '<input type="text" class="form-control col-lg-7" name="InternalPort" size="32" maxlength="30" id="InternalPort" value="">'
						+ '</div>'
						+ '<div class="form-group">'
							+ '<label class="col-lg-5" for="ExternalPort"><%tcWebApi_get("String_Entry","PFExternalPortText","s")%></label>'
							+ '<input type="text" class="form-control col-lg-7" name="ExternalPort" size="32" maxlength="30" id="ExternalPort" value="">'
						+ '</div>'
						+ '<div class="d-flex align-items-center justify-content-center">'
							+ '<button type="button" class="page-button small-button" onclick="doApply(1,1,99);"><%tcWebApi_get("String_Entry","PFButtonApplyText","s")%></button>'
							+ '<button type="button" class="action-button small-button" onclick="doCancelAdd();" name="ButtonCancelAdd" id= "ButtonCancelAdd"><%tcWebApi_get("String_Entry","PFButtonCancelEditText","s")%></button>'
						+ '</div>';
					getElById('ConfigInfo').innerHTML = html;
					var sel_servname = document.getElementById('select_srvname');
					generate_cs(sel_servname);
					// var sel_ifname = document.getElementById('select_ifname');
					// generate_if_option();
					// generate_cs(sel_ifname);
					var sel_prot = document.getElementById('select_prot');
					generate_cs(sel_prot);
				}
				else if(LockAdd == false)
				{
					var html = '';
					getElById('ConfigInfo').innerHTML = html;
				}
			}
			else{
				alert('<%tcWebApi_get("String_Entry","PFJS12Text","s")%>'); // Rember: Replace
			}
		}
		function fill_edit_value(index){
			var sel_servname = document.getElementById('constsrvNameEdit'); 
			if ((PortMapping[index].isCustomize == "N/A") || (PortMapping[index].isCustomize == ""))
			{
				setRadio('radiosrv_edit','CustomizeText');
				isCustomizeApp = true;
				cs_disable("constsrvNameEdit");
			}
			else if(PortMapping[index].isCustomize != "")
			{
				setRadio('radiosrv_edit','SelectText');
				isCustomizeApp = false;
				cs_enable("constsrvNameEdit");
				if(PortMapping[index].isCustomize == "Domain Name Server")
				{
					setSelect('constsrvNameEdit','Domain Name Server');
					AppIdx = 0;
				}
				else if(PortMapping[index].isCustomize == "FTP Server")
				{
					setSelect('constsrvNameEdit','FTP Server');
					AppIdx = 1;
				}
				else if(PortMapping[index].isCustomize == "IPSEC")
				{
					setSelect('constsrvNameEdit','IPSEC');
					AppIdx = 2;
				}
				else if(PortMapping[index].isCustomize == "Mail POP3")
				{
					setSelect('constsrvNameEdit','Mail POP3');
					AppIdx = 3;
				}
				else if(PortMapping[index].isCustomize == "Mail SMTP")
				{
					setSelect('constsrvNameEdit','Mail SMTP');
					AppIdx = 4;
				}
				else if(PortMapping[index].isCustomize == "PPTP")
				{
					setSelect('constsrvNameEdit','PPTP');
					AppIdx = 5;
				}
				else if(PortMapping[index].isCustomize == "Real Player 8 Plus")
				{
					setSelect('constsrvNameEdit','Real Player 8 Plus');
					AppIdx = 6;
				}
				else if(PortMapping[index].isCustomize == "Secure Shell Server")
				{
					setSelect('constsrvNameEdit','Secure Shell Server');
					AppIdx = 7;
				}
				else if(PortMapping[index].isCustomize == "SNMP")
				{
					setSelect('constsrvNameEdit','SNMP');
					AppIdx = 8;
				}
				else if(PortMapping[index].isCustomize == "SNMP Trap")
				{
					setSelect('constsrvNameEdit','SNMP Trap');
					AppIdx = 9;
				}
				else if(PortMapping[index].isCustomize == "Telnet Server")
				{
					setSelect('constsrvNameEdit','Telnet Server');
					AppIdx = 10;
				}
				else if(PortMapping[index].isCustomize == "TFTP")
				{
					setSelect('constsrvNameEdit','TFTP');
					AppIdx = 11;
				}
			}
			setSelect('PortMappingProtocolEdit',PortMapping[index].Protocol);
			setText('MappingName', PortMapping[index].Description);
			setText('ExternalPort', PortMapping[index].ExPort);
			setText('InternalPort', PortMapping[index].InPort);
			setText('InternalClient', PortMapping[index].InClient);
		}
		function displayInterface() {
			var Wan_Indexes;
			var nEntryNum = "<% tcWebApi_get("WanInfo_Common","CycleNum","s") %>";
			//get all value
			// num 0
			var vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
			var Wan_WanName = vArrayStr.split(',');
			// num 1
			<% tcWebApi_get("WanInfo_Common","CycleValue","h") %>
			// num 2
			vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
			Wan_Indexes = vArrayStr.split(',');
			// num 3
			vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
			Wan_Actives = vArrayStr.split(',');
			// num 4		
			vArrayStr = "<% tcWebApi_get("WanInfo_Common","CycleValue","s") %>";
			var WANEnNAT = vArrayStr.split(',');
			var interface = 0;
			var defaultRouteWanIdx = "<% tcWebApi_get("WanInfo_Common","DefRouteIndexv4","s") %>";
			// Checking condition: type = INTERNET, Active = Yes, EnableNat 
			for (var i = 0; i < nEntryNum; i++) {
				if ((Wan_WanName[i].indexOf("INTERNET") >= 0) && (Wan_Actives[i] == "Yes") && (WANEnNAT[i] == "Enable")) {
					if(defaultRouteWanIdx != Wan_Indexes[i])
					{
						continue;
					}
					interface = Wan_WanName[i];
					break;
				}
			}
			if (interface) {
				$("#PortMappingInterface").html(interface);
				$("#PortMappingInterface").show();
				$("#nat_enable_div").show();
				$("#apply_button").show();
				isWanInterfaceExist = true;
				return 1;
			}
			else {
				/* No suitable interface for Port Forwarding */
				$("#PortMappingInterface").html("<%tcWebApi_get("String_Entry","NatDMZNoInterfaceText","s")%>");
				$("#PortMappingInterface").show();
				return 0;
			}
		}
		function doEdit(index){
			var i;
			var x;
			if(false == isWanInterfaceExist)
			{
				alert('<%tcWebApi_get("String_Entry","PFWanAddText","s")%>');
			}
			if(false == gLockAddEdit)
			{
				gLockAddEdit = true;
				if(false == LockEdit)
				{	
					LockEdit = true;
						var html ='<div class="form-group">'
								+'<label class="col-lg-5"></label>'
								+ '<div class="custom-control custom-radio col-lg-3">'
									+ '<input onclick="radioClickEdit();" CHECKED type="radio" class="custom-control-input" id="radiosrv1_edit" name="radiosrv_edit" value="CustomizeText">'
									+ '<label class="custom-control-label" for="radiosrv1_edit">&nbsp;<%tcWebApi_get("String_Entry","PFCustomizeText","s")%> &nbsp;</label>'
								+ '</div>'
								+ '<div class="custom-control custom-radio  col-lg-3">'
									+ '<input onclick="radioClickEdit();" type="radio" class="custom-control-input" id="radiosrv2_edit" name="radiosrv_edit" value="SelectText">'
									+ '<label class="custom-control-label" for="radiosrv2_edit">&nbsp;<%tcWebApi_get("String_Entry","PFSelectApplicationText","s")%> &nbsp;</label>'
								+ '</div>'
							+ '</div>'
							+ '<div class="form-group">'
								+ '<label class="col-lg-5" for="">Service Type</label>'
								+ '<div class="col-lg-7 custom-select select-disable" name="select_srvname_edit" id="select_srvname_edit">'
									+ '<select disabled onchange="appSelectEdit(this.value);" id="constsrvNameEdit" name="constsrvNameEdit">'
										+ '<option value="FIRST_APP" selected><%tcWebApi_get("String_Entry","PFSelectText","s")%></option>'
										+ '<option value="Domain Name Server" >Domain Name Server</option>'
										+ '<option value="FTP Server" >FTP Server</option>'
										+ '<option value="IPSEC" >IPSEC</option>'
										+ '<option value="Mail POP3" >Mail POP3</option>'
										+ '<option value="Mail SMTP" >Mail SMTP</option>'
										+ '<option value="PPTP" >PPTP</option>'
										+ '<option value="Real Player 8 Plus" >Real Player 8 Plus</option>'
										+ '<option value="Secure Shell Server" >Secure Shell Server</option>'
										+ '<option value="SNMP" >SNMP</option>'
										+ '<option value="SNMP Trap" >SNMP Trap</option>'
										+ '<option value="Telnet Server" >Telnet Server</option>'
										+ '<option value="TFTP" >TFTP</option>'
									+ '</select>'
								+ '</div>'
							+ '</div>'
							+ '<div class="form-group">'
								+ '<label class="col-lg-5" for=""><%tcWebApi_get("String_Entry","PFProtocolText","s")%></label>'
									+ '<div class="col-lg-7 custom-select" name="select_prot_edit" id="select_prot_edit">'
										+ '<select size=1 id="PortMappingProtocolEdit" name="PortMappingProtocolEdit">'
											+ '<option value="TCP" >TCP</option>'
											+ '<option value="UDP" >UDP</option>'
											+ '<option value="TCP/UDP" selected>TCP/UDP</option>'
										+ '</select>'
									+ '</div>'
							+ '</div>'
							+ '<div class="form-group">'
								+ '<label class="col-lg-5" for="MappingName"><%tcWebApi_get("String_Entry","PFMappingNameText","s")%></label>'
								+ '<input type="text" class="form-control col-lg-7" name="MappingName" size="32" maxlength="30" id="MappingName" value="">'
							+ '</div>'
							+ '<div class="form-group" style="DISPLAY: none">'
								+ '<label class="col-lg-5" for="RemoteHost"><%tcWebApi_get("String_Entry","PFRemoteHostText","s")%></label>'
								+ '<input type="text" class="form-control col-lg-7" name="RemoteHost" size="32" maxlength="30" id="RemoteHost" value="">'
							+ '</div>'
							+ '<div class="form-group">'
								+ '<label class="col-lg-5" for="InternalClient"><%tcWebApi_get("String_Entry","PFInternalClientText","s")%></label>'
								+ '<input type="text" class="form-control col-lg-7" name="InternalClient" size="32" maxlength="30" id="InternalClient" value="">'
							+ '</div>'
							+ '<div class="form-group">'
								+ '<label class="col-lg-5" for="InternalPort"><%tcWebApi_get("String_Entry","PFInternalPortText","s")%></label>'
								+ '<input type="text" class="form-control col-lg-7" name="InternalPort" size="32" maxlength="30" id="InternalPort" value="">'
							+ '</div>'
							+ '<div class="form-group">'
								+ '<label class="col-lg-5" for="ExternalPort"><%tcWebApi_get("String_Entry","PFExternalPortText","s")%></label>'
								+ '<input type="text" class="form-control col-lg-7" name="ExternalPort" size="32" maxlength="30" id="ExternalPort" value="">'
							+ '</div>'
							+ '<div class="d-flex align-items-center justify-content-center">'
								+ '<button type="button" class="page-button small-button" onclick="doApply(1,0,'+ index +');"><%tcWebApi_get("String_Entry","PFButtonApplyText","s")%></button>'
								+ '<button type="button" class="action-button small-button" onclick="doCancelEdit('+ index +');" name="ButtonCancelEdit" id= "ButtonCancelEdit"><%tcWebApi_get("String_Entry","PFButtonCancelEditText","s")%></button>'
							+ '</div>';
						getElById('tr_edit'+ index).innerHTML = html;
						getElById('tr_edit'+ index).style.display = "";
						var sel_servname = document.getElementById('select_srvname_edit');
						generate_cs(sel_servname);
						// var sel_ifname = document.getElementById('select_ifname');
						// generate_if_option();
						// generate_cs(sel_ifname);
						var sel_prot = document.getElementById('select_prot_edit');
						generate_cs(sel_prot);
						fill_edit_value(index);
				}
				else
				{
					alert('<%tcWebApi_get("String_Entry","PFJS13Text","s")%>'); // Rember: Replace
				}
			}
			else
			{
				alert('<%tcWebApi_get("String_Entry","PFJS12Text","s")%>'); // Rember: Replace
			}
		}
		function doToggle(iMode, index){
			var ctlName;
			var enable;
			var rml = getElById('rml');
			if(iMode == 4)/*open - close*/
			{
				if (PortMapping[index].ProtMapEnabled == "Yes")
				{
					enable = "No";
					console.log("Close");
				}
				else
				{
					enable = "Yes";
					console.log("Open");
				}
				ctlName = "hVirServEntry"+ index;
				if(PortMapping.length > 1)
				{	
					setText(ctlName,rml[index].value);
				}
				else
				{
					setText(ctlName,"0");
				}
				ctlName = "vEnableEntry"+ index;
				setText(ctlName,enable);
				document.PortMappingForm.VirServCurIndex.value = VirServEntryIndex;
				document.PortMappingForm.VirServer_Flag.value = "4";
				document.PortMappingForm.VirServEntryCurIndex.value = getEntryIndex('PortMappingInterface');
				submitAsync("PortMappingForm");
			}
		}
		function doApply(iMode, addflag, index){
				if(CheckForm(iMode, addflag, index) == false)
						return;
				if(1 == addflag)
				{
					/* Add mode */
					gLockAddEdit = false;
					document.PortMappingForm.VirServCurIndex.value = VirSerIdleEntryIndex;
					document.PortMappingForm.VirServer_Flag.value = "1";
				}
				else
				{
					/* Edit Mode */
					LockEdit = false;
					gLockAddEdit = false;
					ChooseEditInterface(index);
					document.PortMappingForm.VirServCurIndex.value = VirServEntryIndex;
					document.PortMappingForm.VirServer_Flag.value = "6";
				}
				document.PortMappingForm.VirServEntryCurIndex.value = getEntryIndex('PortMappingInterface');
				submitAsync("PortMappingForm");
		}
		function doButton(iMode, addflag){
			if(iMode == 1)/*add*/
			{
				// RefreshPage();
				if(false == isWanInterfaceExist)
				{
					alert('<%tcWebApi_get("String_Entry","PFWanAddText","s")%>');
				}
				else{	
					ShowConfigInfo(LockAdd);
				}
				document.PortMappingForm.VirServer_Flag.value = "7"; /* add behavior - do nothing with backend*/
			}
			else if(iMode == 2)/*del*/
			{
				if(CheckForm(iMode, 0, 999) == false)
					return;
				RemovePortMapping(PortMappingForm,'rml');
				document.PortMappingForm.VirServCurIndex.value = VirServEntryIndex;
				document.PortMappingForm.VirServer_Flag.value = "2";
				document.PortMappingForm.VirServEntryCurIndex.value = getEntryIndex('PortMappingInterface');
				submitAsync("PortMappingForm");
			}
			else if(iMode == 3)/*changeIF*/
			{
				document.PortMappingForm.VirServer_Flag.value = "3";
				document.PortMappingForm.VirServEntryCurIndex.value = getEntryIndex('PortMappingInterface');
				submitAsync("PortMappingForm");
			}	
			else if(iMode == 4)/*open*/
			{
				if (PortMapping[i].ProtMapEnabled == "Yes")
				{
					if ( false == ModifyPortMappingEnable(PortMappingForm, 'rml', 0) )
						return;
				}
				document.PortMappingForm.VirServCurIndex.value = VirServEntryIndex;
				document.PortMappingForm.VirServer_Flag.value = "4";
				document.PortMappingForm.VirServEntryCurIndex.value = getEntryIndex('PortMappingInterface');
				submitAsync("PortMappingForm");
			}
			else if(iMode == 5)/*close*/
			{
				if ( false == ModifyPortMappingEnable(PortMappingForm, 'rml', 0) )
					return;
				document.PortMappingForm.VirServCurIndex.value = VirServEntryIndex;
				document.PortMappingForm.VirServer_Flag.value = "4";
				document.PortMappingForm.VirServEntryCurIndex.value = getEntryIndex('PortMappingInterface');
				submitAsync("PortMappingForm");
			}
			else if(iMode == 6)/*apply - not used anymore*/
			{
				if(CheckForm(1, addflag, 999) == false)
						return;
				if(1 == addflag)
				{
					/* Add mode */
					document.PortMappingForm.VirServCurIndex.value = VirSerIdleEntryIndex;
					document.PortMappingForm.VirServer_Flag.value = "1";
				}
				else
				{
					/* Edit Mode */
					LockEdit = false;
					gLockAddEdit = false;
					document.PortMappingForm.VirServCurIndex.value = VirServEntryIndex;
					document.PortMappingForm.VirServer_Flag.value = "6";
				}
				document.PortMappingForm.VirServEntryCurIndex.value = getEntryIndex('PortMappingInterface');
				submitAsync("PortMappingForm");
			}
		}
		</script>
		<style>
			.custom_cb_table {
				padding-left:3rem;
			}
		</style>
	</head>
	<body onload="LoadFrame();" class="container">
<header class="fixed-top"><nav id="top-nav" class="navbar navbar-expand-lg container"><a class="navbar-brand " href="/cgi-bin/home.asp"><div><img src="/img/logo_home.png" width="100" height="18" alt=""><div style="font-family: sans-serif; font-weight: bold;font-size: 12px;color: #000; margin-top: 0">OPTICAL NETWORK TERMINATION</div></div></a><button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"><em class="fas fa-align-justify"></em></span></button><div class="collapse navbar-collapse" id="navbarCollapse"><ul class="navbar-nav mr-auto sidenav" id="navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/home.asp"><%tcWebApi_get("String_Entry","NavigationHomeText","s")%><span class="sr-only"></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/deviceinfo.asp"><%tcWebApi_get("String_Entry","NavigationStatusDeviceText","s")%><span class="sr-only"></span></a></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#status-menu" aria-controls="status-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NavigationStatusStatisticsText","s")%></a><ul class="nav-second-level collapse" id="status-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/sta-statistics.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationTrafficText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/sta-wifiusers.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationStatusUsersText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/sta-users.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","ARPStatusText","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#network-menu" aria-controls="network-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NAVNetwork","s")%></a><ul class="nav-second-level collapse" id="network-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/net-wan.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationBasInternetText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/net-lan.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationBasLANText","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#wifi-menu" aria-controls="wifi-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NAVWifi","s")%></a><ul class="nav-second-level collapse" id="wifi-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/wifi.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationWiFiSettingsText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/wifi-11ac.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationWiFi11acSettingsText","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#firewall-menu" aria-controls="firewall-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NavigationAdvFirewallText","s")%></a><ul class="nav-second-level collapse" id="firewall-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-spi.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","ContentFirewallText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-urlfilter.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","FILTERTYPE_index2","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-macfilter.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVL2Filter","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-parentalcontrol.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","ParentalControlText","s")%></span></a></li></ul></li><li class="nav-item active"><a class="nav-link nav-link-collapse nav-link-show" href="#" id="hasSubItems" data-toggle="collapse" data-target="#apps-menu" aria-controls="apps-menu" aria-expanded="true"><%tcWebApi_get("String_Entry","NAVApplication","s")%></a><ul class="nav-second-level show" id="apps-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-dmz.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NatTopDMZText","s")%></span></a></li><li class="nav-item active"><a class="nav-link" href="/cgi-bin/apps-portforwarding.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NatVirsvrText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-sslim.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","SessionLimit","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-route.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","StaticRouteText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-ddns.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","dyDNS1Text","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#tools-menu" aria-controls="tools-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NavigationMaintenanceText","s")%></a><ul class="nav-second-level collapse" id="tools-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-admin.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationMainAdminText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-time.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVSysTime","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-firmware.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationMainFirmwareText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-config.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVConfig","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-diagnostic.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationMainDiagnosticsText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-log.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVLogs","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-reboot.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","RebootText","s")%></span></a></li></ul></li></ul><div class="top-item-groups"><form name="LanguageForm" method="POST" action="/cgi-bin/apps-portforwarding.asp" class="nav-item dropdown"><input type="hidden" name="TokenString" value="<%tcWebApi_getToken()%>"><input type="hidden" name="Language_Flag" value="<% tcWebApi_get("LanguageSwitch_Entry","Type","s") %>"><a class="nav-link dropdown-toggle" href="#" id="LanguageDropdown" role="button" data-toggle="dropdown" aria-expanded="false"><% tcWebApi_get("String_Entry","LoginLanguage","s") %></a><ul class="dropdown-menu" aria-labelledby="LanguageDropdown"><li><a class="dropdown-item <% if tcWebApi_get("LanguageSwitch_Entry","Type","h") = "1" then asp_Write("active") end if %>" href="#" onclick="submitLanguageForm(1);"><% tcWebApi_get("String_Entry","LanguageVIELong","s") %></a></li><li><a class="dropdown-item <% if tcWebApi_get("LanguageSwitch_Entry","Type","h") = "2" then asp_Write("active") end if %>" href="#" onclick="submitLanguageForm(2);"><% tcWebApi_get("String_Entry","LanguageENGLong","s") %></a></li></ul></form><div id="signout" class="nav-item"><a class="nav-link" href="javascript:doLogout();"><em class="fa fa-sign-out-alt"></em><span class="nav-link-text"><% tcWebApi_get("String_Entry","LogoutText","s") %></span></a></div></div></div></header></nav><% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then
	if tcWebApi_get("Mesh_Common", "DeviceRole", "h") = "2" then %>
		<script language='javascript'>
		document.getElementById("wifi-menu").children[0].style="display: none";
		document.getElementById("wifi-menu").children[1].style="display: none";
		</script>
<% end if end if %>		<div id="content">
			<form class="form-inline" METHOD="POST" ACTION="/cgi-bin/apps-portforwarding.asp" name="PortMappingForm" id="PortMappingForm" >
				<input type="hidden" name="TokenString" value="<%tcWebApi_getToken()%>">
                <input type="hidden" id="VirServer_Flag" name="VirServer_Flag" value="0"> 
                <input type="hidden" id="EnableVirServer_Flag" name="EnableVirServer_Flag" value="Yes">
                <input type="hidden" id="VirServEntryCurIndex" name="VirServEntryCurIndex" value="0">
                <input type="hidden" id="VirServCurIndex" name="VirServCurIndex" value="0">
                <input type="hidden" id="hVirServEntry0" name="hVirServEntry0" value="99">
                <input type="hidden" id="hVirServEntry1" name="hVirServEntry1" value="99">
                <input type="hidden" id="hVirServEntry2" name="hVirServEntry2" value="99">
                <input type="hidden" id="hVirServEntry3" name="hVirServEntry3" value="99">
                <input type="hidden" id="hVirServEntry4" name="hVirServEntry4" value="99">
                <input type="hidden" id="hVirServEntry5" name="hVirServEntry5" value="99">
                <input type="hidden" id="hVirServEntry6" name="hVirServEntry6" value="99">
                <input type="hidden" id="hVirServEntry7" name="hVirServEntry7" value="99">
                <input type="hidden" id="hVirServEntry8" name="hVirServEntry8" value="99">
                <input type="hidden" id="hVirServEntry9" name="hVirServEntry9" value="99">
				<input type="hidden" id="hVirServEntry10" name="hVirServEntry10" value="99">
                <input type="hidden" id="hVirServEntry11" name="hVirServEntry11" value="99">
                <input type="hidden" id="hVirServEntry12" name="hVirServEntry12" value="99">
                <input type="hidden" id="hVirServEntry13" name="hVirServEntry13" value="99">
                <input type="hidden" id="hVirServEntry14" name="hVirServEntry14" value="99">
                <input type="hidden" id="hVirServEntry15" name="hVirServEntry15" value="99">
                <input type="hidden" id="hVirServEntry16" name="hVirServEntry16" value="99">
                <input type="hidden" id="hVirServEntry17" name="hVirServEntry17" value="99">
                <input type="hidden" id="hVirServEntry18" name="hVirServEntry18" value="99">
                <input type="hidden" id="hVirServEntry19" name="hVirServEntry19" value="99">
				<input type="hidden" id="hVirServEntry20" name="hVirServEntry20" value="99">
                <input type="hidden" id="hVirServEntry21" name="hVirServEntry21" value="99">
                <input type="hidden" id="hVirServEntry22" name="hVirServEntry22" value="99">
                <input type="hidden" id="hVirServEntry23" name="hVirServEntry23" value="99">
                <input type="hidden" id="hVirServEntry24" name="hVirServEntry24" value="99">
                <input type="hidden" id="hVirServEntry25" name="hVirServEntry25" value="99">
                <input type="hidden" id="hVirServEntry26" name="hVirServEntry26" value="99">
                <input type="hidden" id="hVirServEntry27" name="hVirServEntry27" value="99">
                <input type="hidden" id="hVirServEntry28" name="hVirServEntry28" value="99">
                <input type="hidden" id="hVirServEntry29" name="hVirServEntry29" value="99">	                
				<% if tcwebApi_get("WebCustom_Entry","isCTJOYME2Supported","h") = "Yes" then %>
 					<input type="hidden" id="vDelEntry" name="vDelEntry" value="0">
	                <input type="hidden" id="vEnableEntry0" name="vEnableEntry0" value="N/A">
	                <input type="hidden" id="vEnableEntry1" name="vEnableEntry1" value="N/A">
	                <input type="hidden" id="vEnableEntry2" name="vEnableEntry2" value="N/A">
	                <input type="hidden" id="vEnableEntry3" name="vEnableEntry3" value="N/A">
	                <input type="hidden" id="vEnableEntry4" name="vEnableEntry4" value="N/A">
	                <input type="hidden" id="vEnableEntry5" name="vEnableEntry5" value="N/A">
	                <input type="hidden" id="vEnableEntry6" name="vEnableEntry6" value="N/A">
	                <input type="hidden" id="vEnableEntry7" name="vEnableEntry7" value="N/A">
	                <input type="hidden" id="vEnableEntry8" name="vEnableEntry8" value="N/A">
	                <input type="hidden" id="vEnableEntry9" name="vEnableEntry9" value="N/A">
					<input type="hidden" id="vEnableEntry10" name="vEnableEntry10" value="N/A">
	                <input type="hidden" id="vEnableEntry11" name="vEnableEntry11" value="N/A">
	                <input type="hidden" id="vEnableEntry12" name="vEnableEntry12" value="N/A">
	                <input type="hidden" id="vEnableEntry13" name="vEnableEntry13" value="N/A">
	                <input type="hidden" id="vEnableEntry14" name="vEnableEntry14" value="N/A">
	                <input type="hidden" id="vEnableEntry15" name="vEnableEntry15" value="N/A">
	                <input type="hidden" id="vEnableEntry16" name="vEnableEntry16" value="N/A">
	                <input type="hidden" id="vEnableEntry17" name="vEnableEntry17" value="N/A">
	                <input type="hidden" id="vEnableEntry18" name="vEnableEntry18" value="N/A">
	                <input type="hidden" id="vEnableEntry19" name="vEnableEntry19" value="N/A">
					<input type="hidden" id="vEnableEntry20" name="vEnableEntry20" value="N/A">
	                <input type="hidden" id="vEnableEntry21" name="vEnableEntry21" value="N/A">
	                <input type="hidden" id="vEnableEntry22" name="vEnableEntry22" value="N/A">
	                <input type="hidden" id="vEnableEntry23" name="vEnableEntry23" value="N/A">
	                <input type="hidden" id="vEnableEntry24" name="vEnableEntry24" value="N/A">
	                <input type="hidden" id="vEnableEntry25" name="vEnableEntry25" value="N/A">
	                <input type="hidden" id="vEnableEntry26" name="vEnableEntry26" value="N/A">
	                <input type="hidden" id="vEnableEntry27" name="vEnableEntry27" value="N/A">
	                <input type="hidden" id="vEnableEntry28" name="vEnableEntry28" value="N/A">
	                <input type="hidden" id="vEnableEntry29" name="vEnableEntry29" value="N/A">
				<%end if%>
			<div class="row row-w-100">
				<div class="widget col-xs-12 col-lg-12">
					<header><%tcWebApi_get("String_Entry","PFConfigurationText","s")%></header>
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
									<iframe src ="<% if tcwebApi_get("LanguageSwitch_Entry", "Type", "h") = "1" then %>/help/help_portfw_vn.html<% else %>/help/help_portfw_en.html<%end if %>" class="help-frame"></iframe>
									<a id="see-mor-instruction" href="#" onclick="toggle_help_text();"><%tcWebApi_get("String_Entry","DDNSHide","s")%></a>
								</div>
							</div>
						</div>
					</div>
					<div class="widget-body">
						<div class="form-group">
								<label class="col-lg-5" for=""><%tcWebApi_get("String_Entry","PFInterfaceNameText","s")%></label>
								<label class="col-lg-7 text-label inline-text" id="PortMappingInterface"></label>
						</div>
						<div id="ConfigInfo"></div>
						<br>
						<div class="table-responsive-lg" id="portMappingInfo"></div>
<!-- 						<div class="d-flex justify-content-end">
							<button type="button" class="page-button small-button" onclick="doButton(4);" name="ButtonOpen" id= "ButtonOpen">OPEN</button>
							<button type="button" class="page-button small-button" onclick="doButton(5);" name="ButtonClose" id= "ButtonClose">CLOSE</button>
						</div> -->
						<br>
						<div class="d-flex justify-content-end">
							<button type="button" class="page-button small-button" onclick="doButton(1, 0);" name="ButtonAdd" id= "ButtonAdd"><%tcWebApi_get("String_Entry","PFButtonAddText","s")%></button>
							<button type="button" class="page-button small-button" onclick="doButton(2, 0);" name="ButtonDel" id= "ButtonDel"><%tcWebApi_get("String_Entry","PFButtonDeleteText","s")%></button>
						</div>
					</div>
				</div>
				<input type="hidden" id="isVirServerSupported" name="isVirServerSupported" value="<%if tcWebApi_get("Info_Ether","isVirServerSupported","h") = "Yes" then asp_write("1") else asp_write("0") end if%>">
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
