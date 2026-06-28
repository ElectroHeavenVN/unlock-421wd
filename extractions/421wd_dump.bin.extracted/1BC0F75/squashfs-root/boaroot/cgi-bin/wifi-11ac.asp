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
If Request_Form("wlanWEPFlag")="1" Then
	tcWebApi_set("WebCurSet_Entry","wlan_ac_id","SSID_INDEX")
	tcWebApi_set("WLan11ac_Common","BssidNum","BssidNum")
	TCWebApi_set("WLan11ac_Common","Country","Countries_Channels")
	if Request_Form("wlan_APenable") = "1" then
		TCWebApi_set("WLan11ac_Common","APOn","wlan_APenable")
	else
		tcWebApi_constSet("WLan11ac_Common","APOn","0")
	end if
	TCWebApi_set("WLan11ac_Common","Channel","Channel_ID")
	' ONTS-62
	if Request_Form("Channel_ID") <> "0" then
		tcWebApi_constSet("WLan11ac_Common","AutoChannelSelect","0")
	elseif Request_Form("Channel_ID") = "0" then
		tcWebApi_constSet("WLan11ac_Common","AutoChannelSelect","3")
	end if
	TCWebApi_set("WLan11ac_Common","BeaconPeriod","BeaconInterval")
	TCWebApi_set("WLan11ac_Common","RTSThreshold","RTSThreshold")
	TCWebApi_set("WLan11ac_Common","FragThreshold","FragmentThreshold")
	TCWebApi_set("WLan11ac_Common","DtimPeriod","DTIM")
	TCWebApi_set("WLan11ac_Common","WirelessMode","WirelessMode")
	if Request_Form("wlTxPwr") = "6" then
		tcWebApi_constSet("WLan11ac_Common","TxPower", "100")
		tcWebApi_constSet("WLan11ac_Common","PaMode", "1")
		tcWebApi_constSet("WLan11ac_Common","PowerLevel", "128")
	elseif Request_Form("wlTxPwr") = "1" then
		tcWebApi_constSet("WLan11ac_Common","TxPower","75")
		tcWebApi_constSet("WLan11ac_Common","PowerLevel", "100")
		tcWebApi_constSet("WLan11ac_Common","PaMode", "0")
	elseif Request_Form("wlTxPwr") = "2" then
		tcWebApi_constSet("WLan11ac_Common","TxPower","50")
		tcWebApi_constSet("WLan11ac_Common","PowerLevel", "80")
		tcWebApi_constSet("WLan11ac_Common","PaMode", "0")
	elseif Request_Form("wlTxPwr") = "3" then
		tcWebApi_constSet("WLan11ac_Common","TxPower","25")
		tcWebApi_constSet("WLan11ac_Common","PowerLevel", "60")
		tcWebApi_constSet("WLan11ac_Common","PaMode", "0")
	end if
	if tcWebApi_get("Info_WLan11ac","isMT7615TxOffloadSupported","h") = "Yes" then 	
		TCWebApi_set("WLan11ac_Common","WHNAT","WLANTxOffload")
	end if
	If Request_Form("Is11nMode") = "1" then
		TCWebApi_set("WLan11ac_Common","HT_BW","WLANChannelBandwidth")
		If Request_Form("WLANChannelBandwidth")="1" then
			TCWebApi_set("WLan_Common","HT_EXTCHA","ExtChannFlag")
			If Request_Form("Is11acMode") = "1"  then
					TCWebApi_set("WLan11ac_Common","VHT_BW","WLan11acVHTChannelBandwidth")
					TCWebApi_set("WLan11ac_Common","VHT_SGI","WLan11acVHTGuardInterval")
					if Request_Form("RTDEVICE") = "7615"  then
						TCWebApi_set("WLan11ac_Common","VHT_Sec80_Channel","VHTSec80Channel")
						TCWebApi_set("WLan11ac_Common","ITxBfEn","WLan11acITxBfEn")
						TCWebApi_set("WLan11ac_Common","ETxBfEnCond","WLan11acETxBfEnCond")
						TCWebApi_set("WLan11ac_Common","ETxBfIncapable","WLan11acETxBfIncapable")
					end if	
			else	
					TCWebApi_set("WLan11ac_Common","VHT_BW","VHTBW")
			End if	
			If tcWebApi_get("WebCustom_Entry","isHTBW40M","h") = "Yes" then
				tcWebApi_set("WLan11ac_Common","HT_BSSCoexistence","Wlan_HTBW40M")
			End if
		else
			TCWebApi_set("WLan11ac_Common","VHT_BW","VHTBW")
			tcWebApi_set("WLan11ac_Common","HT_BSSCoexistence","Wlan_HTBW40M")
		End if
		TCWebApi_set("WLan11ac_Common","HT_GI","WLANGuardInterval")
		TCWebApi_set("WLan11ac_Entry","HT_MCS","WLANMCS")
	else
		TCWebApi_set("WLan11ac_Common","HT_BW","HTBW")
		TCWebApi_set("WLan11ac_Entry","HT_MCS","HTMCSAUTO")
		TCWebApi_set("WLan11ac_Entry","WMM","WMM_Selection")
		TCWebApi_set("WLan11ac_Common","VHT_BW","VHTBW")
	end IF
	If Request_Form("StationNum") <> "" then
		TCWebApi_set("WLan11ac_Entry","MaxStaNum","StationNum")
	End if
	TCWebApi_set("WLan11ac_Common","11nMode","Is11nMode")
	TCWebApi_set("WLan11ac_Common","11acMode","Is11acMode")
	TCWebApi_set("WLan11ac_Common","BasicRate","BasicRate_Value1")
	TCWebApi_set("WLan11ac_Entry","SSID","ESSID")
	TCWebApi_set("WLan11ac_Common","BeaconPeriod","BeaconInterval")
	if Request_Form("ESSID_HIDE_Selection") = "1" then
		TCWebApi_set("WLan11ac_Entry","HideSSID","ESSID_HIDE_Selection")
	else
		tcWebApi_constSet("WLan11ac_Entry","HideSSID","0")
	end if
	If Request_Form("isPerSSIDSupport") = "1" then
		if Request_Form("ESSID_Enable_Selection") = "1" then
			TCWebApi_set("WLan11ac_Entry","EnableSSID","ESSID_Enable_Selection")
		else
			tcWebApi_constSet("WLan11ac_Entry","EnableSSID","0")
		end if
	end if
	if Request_Form("isWPSSupported") = "1" then
		if Request_Form("UseWPS_Selection") = "1" then
			TCWebApi_set("WLan11ac_Entry","WPSConfMode","WpsConfModeAll")
		else
			TCWebApi_set("WLan11ac_Entry","WPSConfMode","WpsConfModeNone")
		end if
		' if Request_form("UseWPS_Selection") = "1" then
		' 	TCWebApi_set("WLan11ac_Entry","WPSMode","WPSMode_Selection")
		' else
		' 	tcWebApi_constSet("WLan11ac_Entry","WPSMode","0")
		' end if
	end if
	TCWebApi_set("WLan11ac_Entry","AuthMode","WEP_Selection")
	TCWebApi_save()
end if
If Request_Form("CountryChange")="1" Then
	tcWebApi_set("WebCurSet_Entry","wlan_ac_id","SSID_INDEX")
	TCWebApi_set("WLan11ac_Common","Country","Countries_Channels")
	if Request_Form("Countries_Channels") = "ARGENTINA" then
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand3")
	elseif Request_Form("Countries_Channels") = "ARMENIA" then	
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand2")
	elseif Request_Form("Countries_Channels") = "AUSTRIA" then
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")
	elseif Request_Form("Countries_Channels") = "AZERBAIJAN" then
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand2")
	elseif Request_Form("Countries_Channels") = "BELGIUM" then
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")
	elseif Request_Form("Countries_Channels") = "BELIZE" then 
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand4")
	elseif Request_Form("Countries_Channels") = "BOLIVIA" then
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand4")
	elseif Request_Form("Countries_Channels") = "BRAZIL" then
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")
	elseif Request_Form("Countries_Channels") = "BRUNEI DARUSSALAM" then
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand4")
	elseif Request_Form("Countries_Channels") = "BULGARIA" then
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")
	elseif Request_Form("Countries_Channels") = "CHINA" then			             
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand4")
	elseif Request_Form("Countries_Channels") = "CROATIA" then			             
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand2")			
	elseif Request_Form("Countries_Channels") = "CYPRUS" then			             
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")			
	elseif Request_Form("Countries_Channels") = "CZECH REPUBLIC" then
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand2")
	elseif Request_Form("Countries_Channels") = "DENMARK" then			             
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")
	elseif Request_Form("Countries_Channels") = "EGYPT" then			             
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand2")			
	elseif Request_Form("Countries_Channels") = "ESTONIA" then			             
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")			
	elseif Request_Form("Countries_Channels") = "FINLAND" then
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")
	elseif Request_Form("Countries_Channels") = "FRANCE" then			             
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand2")	
	elseif Request_Form("Countries_Channels") = "GEORGIA" then			             
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand2")			
	elseif Request_Form("Countries_Channels") = "GERMANY" then			             
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")			
	elseif Request_Form("Countries_Channels") = "GREECE" then
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")
	elseif Request_Form("Countries_Channels") = "HUNGARY" then			             
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")
	elseif Request_Form("Countries_Channels") = "ICELAND" then			             
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")			
	elseif Request_Form("Countries_Channels") = "INDONESIA" then			             
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand4")			
	elseif Request_Form("Countries_Channels") = "IRAN" then
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand4")
		elseif Request_Form("Countries_Channels") = "IRELAND" then			             
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")
	elseif Request_Form("Countries_Channels") = "ITALY" then			             
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")			
	elseif Request_Form("Countries_Channels") = "JAPAN" then			             
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand9")
	elseif Request_Form("Countries_Channels") = "KOREA DEMOCRATIC" then
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand5")
		elseif Request_Form("Countries_Channels") = "KOREA REPUBLIC" then			             
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand5")
	elseif Request_Form("Countries_Channels") = "LATVIA" then			             
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")			
	elseif Request_Form("Countries_Channels") = "LITHUANIA" then			             
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")			
	elseif Request_Form("Countries_Channels") = "LUXEMBOURG" then
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")
		elseif Request_Form("Countries_Channels") = "MONACO" then			             
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand2")
	elseif Request_Form("Countries_Channels") = "NETHERLANDS" then			             
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")			
	elseif Request_Form("Countries_Channels") = "PERU" then			             
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand4")			
	elseif Request_Form("Countries_Channels") = "PHILIPPINES" then
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand4")
	elseif Request_Form("Countries_Channels") = "POLAND" then			             
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")			
	elseif Request_Form("Countries_Channels") = "PORTUGAL" then
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")
	elseif Request_Form("Countries_Channels") = "SLOVAKIA" then
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")
		elseif Request_Form("Countries_Channels") = "SLOVENIA" then			             
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")
	elseif Request_Form("Countries_Channels") = "SOUTH AFRICA" then			             
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")			
	elseif Request_Form("Countries_Channels") = "SPAIN" then             
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")			
	elseif Request_Form("Countries_Channels") = "SWEDEN" then
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")
	elseif Request_Form("Countries_Channels") = "SWITZERLAND" then
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")
	elseif Request_Form("Countries_Channels") = "TAIWAN" then
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand3")
	elseif Request_Form("Countries_Channels") = "TRINIDAD AND TOBAGO" then
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand2")
	elseif Request_Form("Countries_Channels") = "TUNISIA" then 
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand2")
	elseif Request_Form("Countries_Channels") = "TURKEY" then  
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand2")
	elseif Request_Form("Countries_Channels") = "UNITED KINGDOM" then
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")	
	elseif Request_Form("Countries_Channels") = "URUGUAY" then
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand5")
	elseif Request_Form("Countries_Channels") = "UZBEKISTAN" then
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")
	elseif Request_Form("Countries_Channels") = "VENEZUELA" then
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand5")
	elseif Request_Form("Countries_Channels") = "VIETNAM" then
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand11")
	else
		TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand0")
	end if
	TCWebApi_save()
End If
IF Request_Form("wlanWEPFlag")="2" Then
	tcWebApi_set("WebCurSet_Entry","wlan_ac_id","SSID_INDEX")
	TCWebApi_save()
End if
If Request_Form("wlanWEPFlag")="3" Then
	if tcWebApi_get("WLan11ac_Common","rt_device","h") = "7615" then
		' TCWebApi_set("WLan11ac_Common","HT_TxStream","TxStream_Action")	
		' TCWebApi_set("WLan11ac_Common","HT_RxStream","RxStream_Action")		
	end if
	TCWebApi_set("WLan11ac_Entry","AuthMode","WEP_Selection")	
	tcWebApi_set("WebCurSet_Entry","wlan_ac_id","SSID_INDEX")
	tcWebApi_set("WLan11ac_Common","BssidNum","BssidNum")
	TCWebApi_set("WLan11ac_Common","Country","Countries_Channels")
	TCWebApi_set("WLan11ac_Common","Channel","Channel_ID")
	' ONTS-62
	if Request_Form("Channel_ID") <> "0" then
		tcWebApi_constSet("WLan11ac_Common","AutoChannelSelect","0")
	elseif Request_Form("Channel_ID") = "0" then
		tcWebApi_constSet("WLan11ac_Common","AutoChannelSelect","3")
	end if
	if Request_Form("wlan_APenable") = "1" then 
		TCWebApi_set("WLan11ac_Common","APOn","wlan_APenable")
	else
		tcWebApi_constSet("WLan11ac_Common","APOn","0")
	end if
	TCWebApi_set("WLan11ac_Common","BeaconPeriod","BeaconInterval")
  	TCWebApi_set("WLan11ac_Common","RTSThreshold","RTSThreshold")
	TCWebApi_set("WLan11ac_Common","FragThreshold","FragmentThreshold")
	TCWebApi_set("WLan11ac_Common","DtimPeriod","DTIM")
	TCWebApi_set("WLan11ac_Common","WirelessMode","WirelessMode")
	if Request_Form("wlTxPwr") = "6" then
		tcWebApi_constSet("WLan11ac_Common","TxPower", "100")
		tcWebApi_constSet("WLan11ac_Common","PaMode", "1")
		tcWebApi_constSet("WLan11ac_Common","PowerLevel", "128")
	elseif Request_Form("wlTxPwr") = "1" then
		tcWebApi_constSet("WLan11ac_Common","TxPower","75")
		tcWebApi_constSet("WLan11ac_Common","PowerLevel", "100")
		tcWebApi_constSet("WLan11ac_Common","PaMode", "0")
	elseif Request_Form("wlTxPwr") = "2" then
		tcWebApi_constSet("WLan11ac_Common","TxPower","50")
		tcWebApi_constSet("WLan11ac_Common","PowerLevel", "80")
		tcWebApi_constSet("WLan11ac_Common","PaMode", "0")
	elseif Request_Form("wlTxPwr") = "3" then
		tcWebApi_constSet("WLan11ac_Common","TxPower","25")
		tcWebApi_constSet("WLan11ac_Common","PowerLevel", "60")
		tcWebApi_constSet("WLan11ac_Common","PaMode", "0")
	end if
	if tcWebApi_get("Info_WLan11ac","isMT7615TxOffloadSupported","h") = "Yes" then 	
		TCWebApi_set("WLan11ac_Common","WHNAT","WLANTxOffload")
	end if
	If Request_Form("Is11nMode") = "1" then
		TCWebApi_set("WLan11ac_Common","HT_BW","WLANChannelBandwidth")
		if Request_Form("WLANChannelBandwidth")="1" then
			TCWebApi_set("WLan_Common","HT_EXTCHA","ExtChannFlag")
			If Request_Form("Is11acMode") = "1"  then
					TCWebApi_set("WLan11ac_Common","VHT_BW","WLan11acVHTChannelBandwidth")
					TCWebApi_set("WLan11ac_Common","VHT_SGI","WLan11acVHTGuardInterval")
					if Request_Form("RTDEVICE") = "7615"  then
						TCWebApi_set("WLan11ac_Common","VHT_Sec80_Channel","VHTSec80Channel")
						TCWebApi_set("WLan11ac_Common","ITxBfEn","WLan11acITxBfEn")
						TCWebApi_set("WLan11ac_Common","ETxBfEnCond","WLan11acETxBfEnCond")
						TCWebApi_set("WLan11ac_Common","ETxBfIncapable","WLan11acETxBfIncapable")
					end if	
			else	
					TCWebApi_set("WLan11ac_Common","VHT_BW","VHTBW")
			End if
			if tcWebApi_get("WebCustom_Entry","isHTBW40M","h") = "Yes" then
				tcWebApi_set("WLan11ac_Common","HT_BSSCoexistence","Wlan_HTBW40M")
			end if
		else
			TCWebApi_set("WLan11ac_Common","VHT_BW","VHTBW")
			tcWebApi_set("WLan11ac_Common","HT_BSSCoexistence","Wlan_HTBW40M")
		end if
		TCWebApi_set("WLan11ac_Common","HT_GI","WLANGuardInterval")
		TCWebApi_set("WLan11ac_Entry","HT_MCS","WLANMCS")
	else
		TCWebApi_set("WLan11ac_Common","HT_BW","HTBW")
		TCWebApi_set("WLan11ac_Entry","HT_MCS","HTMCSAUTO")
		TCWebApi_set("WLan11ac_Entry","WMM","WMM_Selection")
		TCWebApi_set("WLan11ac_Common","VHT_BW","VHTBW")
	end IF
	If Request_Form("StationNum") <> "" then
		TCWebApi_set("WLan11ac_Entry","MaxStaNum","StationNum")
	End if
	TCWebApi_set("WLan11ac_Common","11nMode","Is11nMode")	
	TCWebApi_set("WLan11ac_Common","11acMode","Is11acMode")
	TCWebApi_set("WLan11ac_Entry","SSID","ESSID")
	TCWebApi_set("WLan11ac_Common","BeaconPeriod","BeaconInterval")	
	if Request_Form("ESSID_HIDE_Selection") = "1" then
		TCWebApi_set("WLan11ac_Entry","HideSSID","ESSID_HIDE_Selection")
	else
		tcWebApi_constSet("WLan11ac_Entry","HideSSID","0")
	end if
	If Request_Form("isPerSSIDSupport") = "1" then
		if Request_Form("ESSID_Enable_Selection") = "1" then
			TCWebApi_set("WLan11ac_Entry","EnableSSID","ESSID_Enable_Selection")
		else
			tcWebApi_constSet("WLan11ac_Entry","EnableSSID","0")
		end if
	end if
	if Request_Form("isWPSSupported") = "1" then	
		if Request_Form("UseWPS_Selection") = "1" then
			TCWebApi_set("WLan11ac_Entry","WPSConfMode","WpsConfModeAll")
		else
			TCWebApi_set("WLan11ac_Entry","WPSConfMode","WpsConfModeNone")
		end if
		' if Request_form("UseWPS_Selection") = "1" then
		' 	TCWebApi_set("WLan11ac_Entry","WPSMode","WPSMode_Selection")
		' end if
	end if	
	if Request_Form("WEP_Selection") <> "OPEN" then
		TCWebApi_set("WLan11ac_Entry","WPAPSK","PreSharedKey")
		TCWebApi_set("WLan11ac_Entry","EncrypType","TKIP_Selection")
		TCWebApi_set("WLan11ac_Entry","RekeyInterval","keyRenewalInterval")
	end if
	if Request_Form("isWPSSupported") = "1" then
	TCWebApi_set("WLan11ac_Entry","WPSConfStatus","WPSConfigured")
	end if
	if tcWebApi_get("WLan_Bndstrg","BndStrgEnable", "h") = "1" then
		if Request_Form("SSID_INDEX") = "0" then
			TCWebApi_set("WLan_Entry0","SSID","ESSID")
			TCWebApi_set("WLan_Entry0","WscDefaultSSID1","ESSID")
			TCWebApi_set("WLan_Entry0","AuthMode","WEP_Selection")
			if Request_Form("WEP_Selection") <> "OPEN" then
				TCWebApi_set("WLan_Entry0","WPAPSK","PreSharedKey")
			end if
			tcWebApi_commit("WLan_Entry0")
		end if		
	end if
	TCWebApi_save()
	tcWebApi_commit("WLan11ac_Entry")	
End If
if Request_Form("isWDSSupported") = "1" then
	If Request_Form("wlanWEPFlag")="4" Then
		TCWebApi_set("WLan11ac_WDS","WdsEncrypType","WDS_EncrypType_Selection")
	End If
	TCWebApi_save()
End If
if Request_Form("isWPSSupported") = "1" then
If Request_Form("WpsStart")="1" Then
	TCWebApi_set("Info_WLan11ac","WPSActiveStatus","WpsStart")
	TCWebApi_set("WLan11ac_Entry","WPSConfMode","WpsConfModeAll")
	TCWebApi_set("WLan11ac_Entry","WPSMode","WPSMode_Selection")
	tcWebApi_commit("WLan11ac_Entry")
End If
If Request_Form("WpsOOB")="1" Then
	TCWebApi_set("Info_WLan11ac","WPSOOBActive","WpsOOB")
	tcWebApi_commit("WLan11ac_Entry")
end if
If tcWebApi_get("WLan11ac_Common","APEnableStatus", "h") = "3" then
if Request_Form("wlan_APenable") = "1" then
	tcWebApi_constSet("WLan_Bndstrg","BndStrgEnable","0")
	tcWebApi_constSet("WLan11ac_Common","APEnableStatus","0")
end if
end if
' if Request_Form("wlan_APenable") = "1" then
' If Request_Form("SSID_INDEX")="0" Then
' 	tcWebApi_commit("Mesh_radio5glbssinfo_Entry0")
' else If Request_Form("SSID_INDEX")="1" Then
' 	tcWebApi_commit("Mesh_radio5glbssinfo_Entry1")
' else If Request_Form("SSID_INDEX")="2" Then
' 	tcWebApi_commit("Mesh_radio5glbssinfo_Entry2")
' else If Request_Form("SSID_INDEX")="3" Then
' 	tcWebApi_commit("Mesh_radio5glbssinfo_Entry3")
' end if
' end if
' end if
' end if
' else
' 	tcWebApi_commit("Mesh_radio5glbssinfo_Entry0")
' end if
' ONTS-927
If Request_Form("wlanWEPFlag")="1" Then
    TCWebApi_commit("WLan_Mesh")
else if Request_Form("wlanWEPFlag")="3" Then
    TCWebApi_commit("WLan_Mesh")
end if
end if
If Request_Form("WpsGenerate") = "1" then
	TCWebApi_commit("WLan11ac_Entry")
end if
	TCWebApi_save()
end if
%>
<!doctype html>
<html>
	<head>
<title><%tcWebApi_get("String_Entry","BranchName","s")%> ONT - <%tcWebApi_get("String_Entry","NavigationWiFi11acSettingsText","s")%></title>		<meta charset="utf-8">
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
		</script><script language="javascript" type=text/javascript>
<% if tcWebApi_get("Mesh_dat","MapEnable","h") = "1" then %>
<% if tcWebApi_get("Mesh_Common","DeviceRole","h") <> "1" then %>
	location.pathname = "/cgi-bin/home.asp";
<% end if %>
<% if tcWebApi_get("WebCurSet_Entry","wlan_ac_id","h") = "3" then
	tcWebApi_ConstSet("WebCurSet_Entry","wlan_ac_id","0")
 end if %>
<% end if %>
HT5GExtCh = new Array(22);
HT5GExtCh[0] = 1;
HT5GExtCh[1] = 0;
HT5GExtCh[2] = 1;
HT5GExtCh[3] = 0;
HT5GExtCh[4] = 1;
HT5GExtCh[5] = 0;
HT5GExtCh[6] = 1;
HT5GExtCh[7] = 0;
HT5GExtCh[8] = 1;
HT5GExtCh[9] = 0;
HT5GExtCh[10] = 1;
HT5GExtCh[11] = 0;
HT5GExtCh[12] = 1;
HT5GExtCh[13] = 0;
HT5GExtCh[14] = 1;
HT5GExtCh[15] = 0;
HT5GExtCh[16] = 1;
HT5GExtCh[17] = 0;
HT5GExtCh[18] = 1;
HT5GExtCh[19] = 0;
HT5GExtCh[20] = 1;
HT5GExtCh[21] = 0;
<% if tcWebApi_get("WebCustom_Entry","isWPSSupported","h") = "Yes"  then %>
var wpsenable;
<% end if %>
var wepidx;
var WEPSelectIndex;
var ShowAdvanced = 0;
function wlClickEnble(wlEnbleCl)
{   
	if (document.ConfigForm.wlan_APenable.checked == true)
	{
		setDisplay('wlInfo',1);
		setDisplay('ssid-header',1);
		setDisplay('ssid-widget',1);
	}
	else
	{
		setDisplay('wlInfo',0);
		setDisplay('ssid-header',0);
		setDisplay('ssid-widget',0);
	}
}
<% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then %>
var isMeshBssCfg = 0;
function mesh_save_check()
{
		if(isMeshBssCfg)
		{
			var wlwpa_check = 0;
			// ONTS-760
			// if((document.ConfigForm.WEP_Selection.value != 'OPEN') && (document.ConfigForm.WEP_Selection.value != 'WPA2PSK'))
			// {
			// 	alert("<%tcWebApi_get("String_Entry","HintOpenEasyMeshText2","s")%>");
			// 	return 0;
			// }
			var TKIP_Selection_val = document.ConfigForm.TKIP_Selection.value;
			if ((TKIP_Selection_val == "NONE") || (TKIP_Selection_val == "AES"))
			{
					wlwpa_check = 1;
			}
			if((0 == wlwpa_check) && (document.ConfigForm.WEP_Selection.value != 'OPEN'))
			{
				alert("<%tcWebApi_get("String_Entry","HintOpenEasyMeshText3","s")%>");
				return 0;
			}
		}
		return 1;
}
function easymesh_checkAuthMode(wlAuthMode)
{
	if(wlAuthMode)
	{
		for (var idx=0; idx < wlAuthMode.length; idx++) 
		{
			var tmpAuthMode = wlAuthMode.options[idx].value;
			tmpAuthMode = tmpAuthMode.toUpperCase();
			// [ONTS-772]: Here we enable all authmode in case mesh is enabled
			// if((tmpAuthMode != 'OPEN') && (tmpAuthMode != 'WPA2PSK'))
			// {
			// 	//wlAuthMode.options[idx].disabled = true;
			// 	cs_disable_option("WEP_Selection", idx);
			// }
			// else
			// {
			// 	//wlAuthMode.options[idx].disabled = false;
			// 	cs_enable_option("WEP_Selection", idx);
			// }
			cs_enable_option("WEP_Selection", idx);
			// end [ONTS-772]
		}
	}
}
function easymesh_checkEncrType(wlEncrType)
{
	if(wlEncrType)
	{
		for (var idx=0; idx < wlEncrType.length; idx++) 
		{
			var tmpEncrType = wlEncrType.options[idx].value;
			tmpEncrType = tmpEncrType.toUpperCase();
			if(tmpEncrType != "AES")
			{
				//wlEncrType.options[idx].disabled = true;
				cs_disable_option("TKIP_Selection", idx);
			}
			else
			{
				//wlEncrType.options[idx].disabled = false;
				cs_enable_option("TKIP_Selection", idx);
			}
		}
	}
}
function easymesh_onload()
{
	var wl_authMode="", wl_encrypType = "";
	var mapDevRole = "<% tcWebApi_get("Mesh_common","DeviceRole","s") %>";
	var al_mac = "<% tcWebApi_get("Mesh_mapcfg","AL-MAC","s") %>";
	var bss_gl_al_mac = "";
	var bss_gl_fh_support = 0, bss_gl_bh_support = 0;
	var node_idx = document.ConfigForm.SSID_INDEX.value;
	node_idx = parseInt(node_idx) + 1;
	isMeshBssCfg = 0;
	document.getElementById('div_mesh_check_msg').style.display = 'none';
	if(mapDevRole != 1 && mapDevRole != 2)
	{
			console.log("EasyMesh Device Role is neither Controller nor Agent!");
			return;
	}
	bss_gl_al_mac = "<% tcWebApi_get("Mesh_radio5glbssinfo","AL-MAC","s") %>";
	switch(node_idx)
	{
			case 1:
				bss_gl_fh_support = "<% tcWebApi_get("Mesh_radio5glbssinfo_entry0","FrontHaul","s") %>";
				bss_gl_bh_support = "<% tcWebApi_get("Mesh_radio5glbssinfo_entry0","BackHaul","s") %>";
				wl_authMode = "<% tcWebApi_get("WLan11ac_Entry.1","AuthMode","s") %>";
				wl_encrypType = "<% tcWebApi_get("WLan11ac_Entry.1","EncrypType","s") %>";
				break;
			case 2:
				bss_gl_fh_support = "<% tcWebApi_get("Mesh_radio5glbssinfo_entry1","FrontHaul","s") %>";
				bss_gl_bh_support = "<% tcWebApi_get("Mesh_radio5glbssinfo_entry1","BackHaul","s") %>";
				wl_authMode = "<% tcWebApi_get("WLan11ac_Entry.2","AuthMode","s") %>";
				wl_encrypType = "<% tcWebApi_get("WLan11ac_Entry.2","EncrypType","s") %>";
				break;
			case 3:
				bss_gl_fh_support = "<% tcWebApi_get("Mesh_radio5glbssinfo_entry2","FrontHaul","s") %>";
				bss_gl_bh_support = "<% tcWebApi_get("Mesh_radio5glbssinfo_entry2","BackHaul","s") %>";
				wl_authMode = "<% tcWebApi_get("WLan11ac_Entry.3","AuthMode","s") %>";
				wl_encrypType = "<% tcWebApi_get("WLan11ac_Entry.3","EncrypType","s") %>";
				break;
			case 4:
				bss_gl_fh_support = "<% tcWebApi_get("Mesh_radio5glbssinfo_entry3","FrontHaul","s") %>";
				bss_gl_bh_support = "<% tcWebApi_get("Mesh_radio5glbssinfo_entry3","BackHaul","s") %>";
				wl_authMode = "<% tcWebApi_get("WLan11ac_Entry.4","AuthMode","s") %>";
				wl_encrypType = "<% tcWebApi_get("WLan11ac_Entry.4","EncrypType","s") %>";
				break;
			case 5:
				bss_gl_fh_support = "<% tcWebApi_get("Mesh_radio5glbssinfo_entry4","FrontHaul","s") %>";
				bss_gl_bh_support = "<% tcWebApi_get("Mesh_radio5glbssinfo_entry4","BackHaul","s") %>";
				wl_authMode = "<% tcWebApi_get("WLan11ac_Entry.5","AuthMode","s") %>";
				wl_encrypType = "<% tcWebApi_get("WLan11ac_Entry.5","EncrypType","s") %>";
				break;
			case 6:
				bss_gl_fh_support = "<% tcWebApi_get("Mesh_radio5glbssinfo_entry5","FrontHaul","s") %>";
				bss_gl_bh_support = "<% tcWebApi_get("Mesh_radio5glbssinfo_entry5","BackHaul","s") %>";
				wl_authMode = "<% tcWebApi_get("WLan11ac_Entry.6","AuthMode","s") %>";
				wl_encrypType = "<% tcWebApi_get("WLan11ac_Entry.6","EncrypType","s") %>";
				break;
			case 7:
				bss_gl_fh_support = "<% tcWebApi_get("Mesh_radio5glbssinfo_entry6","FrontHaul","s") %>";
				bss_gl_bh_support = "<% tcWebApi_get("Mesh_radio5glbssinfo_entry6","BackHaul","s") %>";
				wl_authMode = "<% tcWebApi_get("WLan11ac_Entry.7","AuthMode","s") %>";
				wl_encrypType = "<% tcWebApi_get("WLan11ac_Entry.7","EncrypType","s") %>";
				break;
			case 8:
				bss_gl_fh_support = "<% tcWebApi_get("Mesh_radio5glbssinfo_entry7","FrontHaul","s") %>";
				bss_gl_bh_support = "<% tcWebApi_get("Mesh_radio5glbssinfo_entry7","BackHaul","s") %>";
				wl_authMode = "<% tcWebApi_get("WLan11ac_Entry.8","AuthMode","s") %>";
				wl_encrypType = "<% tcWebApi_get("WLan11ac_Entry.8","EncrypType","s") %>";
				break;
			case 9:
				bss_gl_fh_support = "<% tcWebApi_get("Mesh_radio5glbssinfo_entry8","FrontHaul","s") %>";
				bss_gl_bh_support = "<% tcWebApi_get("Mesh_radio5glbssinfo_entry8","BackHaul","s") %>";
				wl_authMode = "<% tcWebApi_get("WLan11ac_Entry.9","AuthMode","s") %>";
				wl_encrypType = "<% tcWebApi_get("WLan11ac_Entry.9","EncrypType","s") %>";
				break;
			case 10:
				bss_gl_fh_support = "<% tcWebApi_get("Mesh_radio5glbssinfo_entry9","FrontHaul","s") %>";
				bss_gl_bh_support = "<% tcWebApi_get("Mesh_radio5glbssinfo_entry9","BackHaul","s") %>";
				wl_authMode = "<% tcWebApi_get("WLan11ac_Entry.10","AuthMode","s") %>";
				wl_encrypType = "<% tcWebApi_get("WLan11ac_Entry.10","EncrypType","s") %>";
				break;
			case 11:
				bss_gl_fh_support = "<% tcWebApi_get("Mesh_radio5glbssinfo_entry10","FrontHaul","s") %>";
				bss_gl_bh_support = "<% tcWebApi_get("Mesh_radio5glbssinfo_entry10","BackHaul","s") %>";
				wl_authMode = "<% tcWebApi_get("WLan11ac_Entry.11","AuthMode","s") %>";
				wl_encrypType = "<% tcWebApi_get("WLan11ac_Entry.11","EncrypType","s") %>";
				break;
			case 12:
				bss_gl_fh_support = "<% tcWebApi_get("Mesh_radio5glbssinfo_entry11","FrontHaul","s") %>";
				bss_gl_bh_support = "<% tcWebApi_get("Mesh_radio5glbssinfo_entry11","BackHaul","s") %>";
				wl_authMode = "<% tcWebApi_get("WLan11ac_Entry.12","AuthMode","s") %>";
				wl_encrypType = "<% tcWebApi_get("WLan11ac_Entry.12","EncrypType","s") %>";
				break;
			case 13:
				bss_gl_fh_support = "<% tcWebApi_get("Mesh_radio5glbssinfo_entry12","FrontHaul","s") %>";
				bss_gl_bh_support = "<% tcWebApi_get("Mesh_radio5glbssinfo_entry12","BackHaul","s") %>";
				wl_authMode = "<% tcWebApi_get("WLan11ac_Entry.13","AuthMode","s") %>";
				wl_encrypType = "<% tcWebApi_get("WLan11ac_Entry.13","EncrypType","s") %>";
				break;
			case 14:
				bss_gl_fh_support = "<% tcWebApi_get("Mesh_radio5glbssinfo_entry13","FrontHaul","s") %>";
				bss_gl_bh_support = "<% tcWebApi_get("Mesh_radio5glbssinfo_entry13","BackHaul","s") %>";
				wl_authMode = "<% tcWebApi_get("WLan11ac_Entry.14","AuthMode","s") %>";
				wl_encrypType = "<% tcWebApi_get("WLan11ac_Entry.14","EncrypType","s") %>";
				break;
			case 15:
				bss_gl_fh_support = "<% tcWebApi_get("Mesh_radio5glbssinfo_entry14","FrontHaul","s") %>";
				bss_gl_bh_support = "<% tcWebApi_get("Mesh_radio5glbssinfo_entry14","BackHaul","s") %>";
				wl_authMode = "<% tcWebApi_get("WLan11ac_Entry.15","AuthMode","s") %>";
				wl_encrypType = "<% tcWebApi_get("WLan11ac_Entry.15","EncrypType","s") %>";
				break;
			case 16	:
				bss_gl_fh_support = "<% tcWebApi_get("Mesh_radio5glbssinfo_entry15","FrontHaul","s") %>";
				bss_gl_bh_support = "<% tcWebApi_get("Mesh_radio5glbssinfo_entry15","BackHaul","s") %>";
				wl_authMode = "<% tcWebApi_get("WLan11ac_Entry.16","AuthMode","s") %>";
				wl_encrypType = "<% tcWebApi_get("WLan11ac_Entry.16","EncrypType","s") %>";
				break;
			default:
				bss_gl_al_mac = "";
				bss_gl_fh_support = 0;
				bss_gl_bh_support = 0;
				wl_authMode = "";
				wl_encrypType = "";
				break;
	}
	al_mac = al_mac.toUpperCase();
	bss_gl_al_mac = bss_gl_al_mac.toUpperCase();
	if((al_mac == null) || (al_mac == "N/A") || (al_mac == "") || (al_mac == "00:00:00:00:00:00") 
	|| (bss_gl_al_mac == null) || (bss_gl_al_mac == "N/A") || (bss_gl_al_mac == "") || (bss_gl_al_mac == "00:00:00:00:00:00"))
	{
			return;
	}
	if( ((bss_gl_al_mac == al_mac) || (bss_gl_al_mac == "FF:FF:FF:FF:FF:FF")) 
			&& ((1 == bss_gl_fh_support) || (1 == bss_gl_bh_support)) )
	{
			easymesh_checkAuthMode(document.ConfigForm.WEP_Selection);
			easymesh_checkEncrType(document.ConfigForm.TKIP_Selection);
			// ONTS-760
			// if((wl_authMode.toUpperCase() != "OPEN") && (wl_authMode.toUpperCase() != "WPA2PSK"))
			// {
			// 		alert("When EasyMesh Enable, AutoMode must be \"OPEN\" or \"WPA2PSK\"!");
			// } 
			if(wl_authMode.toUpperCase() != "OPEN")
			{
					if((wl_encrypType.toUpperCase() != "NONE") && (wl_encrypType.toUpperCase() != "AES"))
					{
						alert("When EasyMesh Enable, Encryption Type must be \"NONE\" or \"AES\"!");
					}
			}
	}
	isMeshBssCfg = 1;
	//document.getElementById('div_mesh_check_msg').style.display = ''; /* ONTS-508 */
	return;
}
<% end if %>
function CongigureClass()
{
	this.WPSConfStatus = '<% tcWebApi_get("WLan11ac_Entry","WPSConfStatus","s")%>';
}
var Configure = new CongigureClass();
function doCheckWepSelectIndex()
{
<% if tcWebApi_get("WebCustom_Entry","isWlanEncrypt","h") = "Yes"  then %>
		WEPSelectIndex = document.ConfigForm.WEP_Selection.selectedIndex + 1;
<% else %>
		WEPSelectIndex = document.ConfigForm.WEP_Selection.selectedIndex;
<% end if %>
	return true;	
}
<% if tcWebApi_get("WebCustom_Entry","isWPSSupported","h") = "Yes"  then %>
function doStartWPS(){
	if(document.ConfigForm.isInWPSing.value==0){
		alert("Please Start WPS peer within 2 minutes.");
	}
	document.ConfigForm.WpsStart.value = 1;
	submitAsync("ConfigForm");
}
function doResetOOB(){
	document.ConfigForm.WpsOOB.value = 1;
	submitAsync("ConfigForm");
}
function doGenerate(){
	document.ConfigForm.WpsGenerate.value = "1";
	submitAsync("ConfigForm");
}
<% end if %>
function strESSIDCheck(str) {
	if(str.value.match(/[^\x00-\xff]/g)){
		alert("Invalid SSID Input!");
		return true;
	}
	if(document.ConfigForm.ESSID.value.length <= 0){
		alert("SSID is empty");
		return true;
	}
	return false;
}	
function display_wifischedule_note() {
	var ws_running = "<%tcWebApi_get("wifischeduling.common","Running","s")%>";
	if (ws_running == '1') {
		$("#wifischedule_band_note").show();
		$("#enableSsid_div").hide();
		$("#wifischedule_note").show();
		$("#bandsteeringnote_div").hide();
		$("#wlEnbl_div").hide();
	}
	else {
		$("#wifischedule_band_note").hide();
		$("#wifischedule_note").hide();
	}
}
function showUI()
{
<% if tcWebApi_get("Mesh_dat","MapEnable","h") = "1" then %>
<% if tcWebApi_get("Mesh_Common","DeviceRole","h") <> "1" then %>
	location.pathname = "/cgi-bin/home.asp";
	return;
<% end if %>
<% end if %>
//ONTS-122
<% if tcWebApi_get("WLan_Bndstrg","BndStrgEnable","h") = "1" then %>
<% if tcWebApi_get("WLan11ac_Common","APEnableStatus","h") <> "3" then %>
	$("#bandsteeringnote_div").show();
	$("#wlEnbl_div").hide();
	<% if tcWebApi_get("WebCurSet_Entry","wlan_ac_id","h") = "0" then %>
	$("#enableSsid_div").hide();
	<% end if %>
<% end if %>
<% end if %>
	display_wifischedule_note();
	doCheckSSID();
	RefreshChannPage();
	doCheckWepSelectIndex();	
<% if tcWebApi_get("WLan11ac_Common","rt_device","h") = "7615" then %>
	initWLan11ac2ndFrequencySel();	
	VHTBandwidthRefreshPage();
	if(initFlag == true)
	{
		initWLan11acTxBeamFormingSel();
		initFlag = false;
	}
<% end if %>
	if(document.ConfigForm.isDot1XSupported.value==1)
	{
		if(document.ConfigForm.isAuthenTypeSupported.value==1)
		{
			document.getElementById("WEP_Selection_div").style.display="none";
			document.getElementById("WEP_Selection_show_div").style.display="";
			doWEPChange2();
		}
		else
		{
			document.getElementById("WEP_Selection_div").style.display="";
			document.getElementById("WEP_Selection_show_div").style.display="none";
		}
	}	
	if(document.ConfigForm.WirelessMode.selectedIndex>=1){
		document.ConfigForm.Is11nMode.value=1;
		if(document.ConfigForm.WirelessMode.selectedIndex>=3) /* ONTS-377 */
		{
			document.ConfigForm.Is11acMode.value=1;
		}else{
			document.ConfigForm.Is11acMode.value=0;
		}
<% if tcWebApi_get("WebCustom_Entry","isHTBW40M","h") = "Yes" then %>
		if((document.ConfigForm.WLANChannelBandwidth.selectedIndex == 1)||(document.ConfigForm.WLANChannelBandwidth.selectedIndex == 2)){
<% else %>
		if(document.ConfigForm.WLANChannelBandwidth.selectedIndex == 1){
<% end if %>
			if(InsExtChOpt(document.ConfigForm.Channel_ID.value) == 1)
				document.ConfigForm.WLANExtensionChannel.selectedIndex = 1;
				else
				document.ConfigForm.WLANExtensionChannel.selectedIndex = 0;
				document.ConfigForm.WLANExtensionChannel.disabled = true;
				cs_disable("WLANExtensionChannel");
		}
	}else{
		document.ConfigForm.Is11nMode.value=0;
		document.ConfigForm.Is11acMode.value=0;
	}
<% if tcWebApi_get("WebCustom_Entry","isWPSSupported","h") = "Yes"  then %>
	if(document.ConfigForm.isInWPSing.value==1){
		document.ConfigForm.ResetOOB.disabled = true;
		document.ConfigForm.BUTTON.disabled = true;
		document.ConfigForm.CancelBtn.disabled = true;
	}
	if(document.ConfigForm.wlan_VC.value==0){
		wpsenable = document.ConfigForm.UseWPS_Selection.checked;
	}
<% end if %>
	wepidx = WEPSelectIndex;
	if(document.ConfigForm.bharti_ssid2.value==1)
		doloadSSID2();		
		McsRefreshPage();
<% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then %>
	easymesh_onload();
<% end if %>
	if ($("#WEP_Selection").val() == "OPEN") {
		$("#wpaPreShareKey").hide();
		$("#keyrenwal_div").hide();
		$("#encr_type_div").hide();
	}
	else {
		$("#wpaPreShareKey").show();
		if (ShowAdvanced == 1) {
			$("#keyrenwal_div").show();
		}
		$("#encr_type_div").show();
	}
	wlClickEnble();
}
function doCheckSSID()
{	
	var ssid_val = document.ConfigForm.wlan_VC.value;	
	var ssid_optval = document.ConfigForm.SSID_INDEX.value;	
	if(ssid_val != ssid_optval)	
	{		
		document.ConfigForm.wlanWEPFlag.value = 2;
		submitAsync("ConfigForm");
	}
}	
function doRegionCheck(){
	var vCountryName = document.ConfigForm.Countries_Channels.value;
	var ctlCountryRegionABand = document.ConfigForm.hCountryRegionABand;
	var ctlCountryRegionABand0 = document.ConfigForm.CountryRegionABand0;
	var ctlCountryRegionABand1 = document.ConfigForm.CountryRegionABand1;
	var ctlCountryRegionABand2 = document.ConfigForm.CountryRegionABand2;
	var ctlCountryRegionABand3 = document.ConfigForm.CountryRegionABand3;
	var ctlCountryRegionABand4 = document.ConfigForm.CountryRegionABand4;
	var ctlCountryRegionABand5 = document.ConfigForm.CountryRegionABand5;
	var ctlCountryRegionABand6 = document.ConfigForm.CountryRegionABand6;
	var ctlCountryRegionABand7 = document.ConfigForm.CountryRegionABand7;
	var ctlCountryRegionABand8 = document.ConfigForm.CountryRegionABand8;
	var ctlCountryRegionABand9 = document.ConfigForm.CountryRegionABand9;
	var ctlCountryRegionABand10 = document.ConfigForm.CountryRegionABand10;
	var ctlCountryRegionABand11 = document.ConfigForm.CountryRegionABand11;
	if(vCountryName == "ARGENTINA")
		ctlCountryRegionABand.value = ctlCountryRegionABand3.value;
	else if (vCountryName == "ARMENIA")
		ctlCountryRegionABand.value = ctlCountryRegionABand2.value;
	else if (vCountryName == "AUSTRIA")
		ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
	else if (vCountryName == "AZERBAIJAN")
		ctlCountryRegionABand.value = ctlCountryRegionABand2.value;
	else if (vCountryName == "BELGIUM")
		ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
	else if (vCountryName == "BELIZE")
		ctlCountryRegionABand.value = ctlCountryRegionABand4.value;
	else if (vCountryName == "BOLIVIA")
		ctlCountryRegionABand.value = ctlCountryRegionABand4.value;
	else if (vCountryName == "BRAZIL")
		ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
	else if (vCountryName == "BRUNEI DARUSSALAM")
		ctlCountryRegionABand.value = ctlCountryRegionABand4.value;
	else if (vCountryName == "BULGARIA")
		ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
	else if (vCountryName == "CHINA")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand4.value;		
	else if (vCountryName == "CROATIA")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand2.value;		
	else if (vCountryName == "CYPRUS")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand1.value;		
	else if (vCountryName == "CZECH REPUBLIC")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand2.value;		
	else if (vCountryName == "DENMARK")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand1.value;	
	else if (vCountryName == "EGYPT")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand2.value;
	else if (vCountryName == "ESTONIA")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
	else if (vCountryName == "FINLAND")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
	else if (vCountryName == "FRANCE")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand2.value;
	else if (vCountryName == "GEORGIA")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand2.value;
	else if (vCountryName == "GERMANY")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
	else if (vCountryName == "GREECE")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
	else if (vCountryName == "HUNGARY")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
	else if (vCountryName == "ICELAND")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
	else if (vCountryName == "INDONESIA")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand4.value;
	else if (vCountryName == "IRAN")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand4.value;
	else if (vCountryName == "IRELAND")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
	else if (vCountryName == "ITALY")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
	else if (vCountryName == "JAPAN")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand9.value;
	else if (vCountryName == "KOREA DEMOCRATIC")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand5.value;
	else if (vCountryName == "KOREA REPUBLIC")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand5.value;
	else if (vCountryName == "LATVIA")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
	else if (vCountryName == "LITHUANIA")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
	else if (vCountryName == "LUXEMBOURG")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
	else if (vCountryName == "MONACO")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand2.value;
	else if (vCountryName == "NETHERLANDS")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
	else if (vCountryName == "PERU")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand4.value;
	else if (vCountryName == "PHILIPPINES")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand4.value;
	else if (vCountryName == "POLAND")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
	else if (vCountryName == "PORTUGAL")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
	else if (vCountryName == "SLOVAKIA")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
	else if (vCountryName == "SLOVENIA")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
	else if (vCountryName == "SOUTH AFRICA")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
	else if (vCountryName == "SPAIN")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
	else if (vCountryName == "SWEDEN")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
	else if (vCountryName == "SWITZERLAND")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
	else if (vCountryName == "TAIWAN")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand3.value;
	else if (vCountryName == "TRINIDAD AND TOBAGO")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand2.value;
	else if (vCountryName == "TUNISIA")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand2.value;
	else if (vCountryName == "TURKEY")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand2.value;
	else if (vCountryName == "UNITED KINGDOM")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
	else if (vCountryName == "URUGUAY")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand5.value;
	else if (vCountryName == "UZBEKISTAN")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand1.value;
	else if (vCountryName == "VENEZUELA")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand5.value;
	else if (vCountryName == "VIETNAM")			             
		ctlCountryRegionABand.value = ctlCountryRegionABand11.value;
	else
		ctlCountryRegionABand.value = ctlCountryRegionABand0.value;
	RefreshChannPage();
	if(document.ConfigForm.RTDEVICE.value == "7615")
	{
		initWLan11ac2ndFrequencySel();
		VHTBandwidthRefreshPage();
	}
	document.ConfigForm.CountryChange.value = 1; 
}
var bInit = 1;
function RefreshChannPage(){
	var index = 0;
	var ctlChannel_ID = document.ConfigForm.Channel_ID;
	var vChannel = ctlChannel_ID.value;
	var vCountryRegionABand = document.ConfigForm.hCountryRegionABand.value;
	if(bInit == 1){
		vChannel = "<% tcWebApi_get("WLan11ac_Common","Channel","s") %>";
		bInit = 0;
	}
	ctlChannel_ID.length = 0;
	if (ctlChannel_ID.parentNode.children.length > 2) {
		ctlChannel_ID.parentNode.children[2].innerHTML  = "";
		}
	if(vCountryRegionABand == 0){
		cs_addoption(ctlChannel_ID, "0", "AUTO");
		cs_addoption(ctlChannel_ID, "36", "36");
		cs_addoption(ctlChannel_ID, "40", "40");
		cs_addoption(ctlChannel_ID, "44", "44");
		cs_addoption(ctlChannel_ID, "48", "48");
		cs_addoption(ctlChannel_ID, "52", "52");
		cs_addoption(ctlChannel_ID, "56", "56");
		cs_addoption(ctlChannel_ID, "60", "60");
		cs_addoption(ctlChannel_ID, "64", "64");
		cs_addoption(ctlChannel_ID, "149", "149");
		cs_addoption(ctlChannel_ID, "153", "153");
		cs_addoption(ctlChannel_ID, "157", "157");
		cs_addoption(ctlChannel_ID, "161", "161");
		cs_addoption(ctlChannel_ID, "165", "165");
	}else if(vCountryRegionABand == 1){
		cs_addoption(ctlChannel_ID, "0", "AUTO");
		cs_addoption(ctlChannel_ID, "36", "36");
		cs_addoption(ctlChannel_ID, "40", "40");
		cs_addoption(ctlChannel_ID, "44", "44");
		cs_addoption(ctlChannel_ID, "48", "48");
		cs_addoption(ctlChannel_ID, "52", "52");
		cs_addoption(ctlChannel_ID, "56", "56");
		cs_addoption(ctlChannel_ID, "60", "60");
		cs_addoption(ctlChannel_ID, "64", "64");
		cs_addoption(ctlChannel_ID, "100", "100");
		cs_addoption(ctlChannel_ID, "104", "104");
		cs_addoption(ctlChannel_ID, "108", "108");
		cs_addoption(ctlChannel_ID, "112", "112");
		cs_addoption(ctlChannel_ID, "116", "116");
		cs_addoption(ctlChannel_ID, "120", "120");
		cs_addoption(ctlChannel_ID, "124", "124");
		cs_addoption(ctlChannel_ID, "128", "128");
		cs_addoption(ctlChannel_ID, "132", "132");
		cs_addoption(ctlChannel_ID, "136", "136");
		cs_addoption(ctlChannel_ID, "140", "140");
	}else if(vCountryRegionABand == 2){
		cs_addoption(ctlChannel_ID, "0", "AUTO");
		cs_addoption(ctlChannel_ID, "36", "36");
		cs_addoption(ctlChannel_ID, "40", "40");
		cs_addoption(ctlChannel_ID, "44", "44");
		cs_addoption(ctlChannel_ID, "48", "48");
		cs_addoption(ctlChannel_ID, "52", "52");
		cs_addoption(ctlChannel_ID, "56", "56");
		cs_addoption(ctlChannel_ID, "60", "60");
		cs_addoption(ctlChannel_ID, "64", "64");
	}else if(vCountryRegionABand == 3){
		cs_addoption(ctlChannel_ID, "0", "AUTO");
		cs_addoption(ctlChannel_ID, "52", "52");
		cs_addoption(ctlChannel_ID, "56", "56");
		cs_addoption(ctlChannel_ID, "60", "60");
		cs_addoption(ctlChannel_ID, "64", "64");
		cs_addoption(ctlChannel_ID, "149", "149");
		cs_addoption(ctlChannel_ID, "153", "153");
		cs_addoption(ctlChannel_ID, "157", "157");
		cs_addoption(ctlChannel_ID, "161", "161");
	}else if(vCountryRegionABand == 4){
		cs_addoption(ctlChannel_ID, "0", "AUTO");
		cs_addoption(ctlChannel_ID, "149", "149");
		cs_addoption(ctlChannel_ID, "153", "153");
		cs_addoption(ctlChannel_ID, "157", "157");
		cs_addoption(ctlChannel_ID, "161", "161");
		cs_addoption(ctlChannel_ID, "165", "165");
	}else if(vCountryRegionABand == 5){
		cs_addoption(ctlChannel_ID, "0", "AUTO");
		cs_addoption(ctlChannel_ID, "149", "149");
		cs_addoption(ctlChannel_ID, "153", "153");
		cs_addoption(ctlChannel_ID, "157", "157");
		cs_addoption(ctlChannel_ID, "161", "161");
	}else if(vCountryRegionABand == 6){
		cs_addoption(ctlChannel_ID, "0", "AUTO");
		cs_addoption(ctlChannel_ID, "36", "36");
		cs_addoption(ctlChannel_ID, "40", "40");
		cs_addoption(ctlChannel_ID, "44", "44");
		cs_addoption(ctlChannel_ID, "48", "48");
	}else if(vCountryRegionABand == 8){
		cs_addoption(ctlChannel_ID, "0", "AUTO");
		cs_addoption(ctlChannel_ID, "52", "52");
		cs_addoption(ctlChannel_ID, "56", "56");
		cs_addoption(ctlChannel_ID, "60", "60");
		cs_addoption(ctlChannel_ID, "64", "64");
	}else if(vCountryRegionABand == 9){
		cs_addoption(ctlChannel_ID, "0", "AUTO");
		cs_addoption(ctlChannel_ID, "36", "36");
		cs_addoption(ctlChannel_ID, "40", "40");
		cs_addoption(ctlChannel_ID, "44", "44");
		cs_addoption(ctlChannel_ID, "48", "48");
		cs_addoption(ctlChannel_ID, "52", "52");
		cs_addoption(ctlChannel_ID, "56", "56");
		cs_addoption(ctlChannel_ID, "60", "60");
		cs_addoption(ctlChannel_ID, "64", "64");
		cs_addoption(ctlChannel_ID, "100", "100");
		cs_addoption(ctlChannel_ID, "104", "104");
		cs_addoption(ctlChannel_ID, "108", "108");
		cs_addoption(ctlChannel_ID, "112", "112");
		cs_addoption(ctlChannel_ID, "116", "116");
		cs_addoption(ctlChannel_ID, "120", "120");
		cs_addoption(ctlChannel_ID, "124", "124");
		cs_addoption(ctlChannel_ID, "128", "128");
		cs_addoption(ctlChannel_ID, "132", "132");
		cs_addoption(ctlChannel_ID, "136", "136");
		cs_addoption(ctlChannel_ID, "140", "140");
		cs_addoption(ctlChannel_ID, "149", "149");
		cs_addoption(ctlChannel_ID, "153", "153");
		cs_addoption(ctlChannel_ID, "157", "157");
		cs_addoption(ctlChannel_ID, "161", "161");
		cs_addoption(ctlChannel_ID, "165", "165");
	}else if(vCountryRegionABand == 10){
		cs_addoption(ctlChannel_ID, "0", "AUTO");
		cs_addoption(ctlChannel_ID, "36", "36");
		cs_addoption(ctlChannel_ID, "40", "40");
		cs_addoption(ctlChannel_ID, "44", "44");
		cs_addoption(ctlChannel_ID, "48", "48");
		cs_addoption(ctlChannel_ID, "149", "149");
		cs_addoption(ctlChannel_ID, "153", "153");
		cs_addoption(ctlChannel_ID, "157", "157");
		cs_addoption(ctlChannel_ID, "161", "161");
		cs_addoption(ctlChannel_ID, "165", "165");
	}else if(vCountryRegionABand == 11){
		cs_addoption(ctlChannel_ID, "0", "AUTO");
		cs_addoption(ctlChannel_ID, "36", "36");
		cs_addoption(ctlChannel_ID, "40", "40");
		cs_addoption(ctlChannel_ID, "44", "44");
		cs_addoption(ctlChannel_ID, "48", "48");
		cs_addoption(ctlChannel_ID, "52", "52");
		cs_addoption(ctlChannel_ID, "56", "56");
		cs_addoption(ctlChannel_ID, "60", "60");
		cs_addoption(ctlChannel_ID, "64", "64");
		cs_addoption(ctlChannel_ID, "100", "100");
		cs_addoption(ctlChannel_ID, "104", "104");
		cs_addoption(ctlChannel_ID, "108", "108");
		cs_addoption(ctlChannel_ID, "112", "112");
		cs_addoption(ctlChannel_ID, "116", "116");
		cs_addoption(ctlChannel_ID, "120", "120");
		cs_addoption(ctlChannel_ID, "149", "149");
		cs_addoption(ctlChannel_ID, "153", "153");
		cs_addoption(ctlChannel_ID, "157", "157");
		cs_addoption(ctlChannel_ID, "161", "161");
	}else{
		cs_addoption(ctlChannel_ID, "0", "AUTO");
		cs_addoption(ctlChannel_ID, "36", "36");
		cs_addoption(ctlChannel_ID, "40", "40");
		cs_addoption(ctlChannel_ID, "44", "44");
		cs_addoption(ctlChannel_ID, "48", "48");
		cs_addoption(ctlChannel_ID, "52", "52");
		cs_addoption(ctlChannel_ID, "56", "56");
		cs_addoption(ctlChannel_ID, "60", "60");
		cs_addoption(ctlChannel_ID, "64", "64");
		cs_addoption(ctlChannel_ID, "100", "100");
		cs_addoption(ctlChannel_ID, "104", "104");
		cs_addoption(ctlChannel_ID, "108", "108");
		cs_addoption(ctlChannel_ID, "112", "112");
		cs_addoption(ctlChannel_ID, "116", "116");
		cs_addoption(ctlChannel_ID, "120", "120");
		cs_addoption(ctlChannel_ID, "124", "124");
		cs_addoption(ctlChannel_ID, "128", "128");
		cs_addoption(ctlChannel_ID, "132", "132");
		cs_addoption(ctlChannel_ID, "136", "136");
		cs_addoption(ctlChannel_ID, "140", "140");
		cs_addoption(ctlChannel_ID, "149", "149");
		cs_addoption(ctlChannel_ID, "153", "153");
		cs_addoption(ctlChannel_ID, "157", "157");
		cs_addoption(ctlChannel_ID, "161", "161");
		cs_addoption(ctlChannel_ID, "165", "165");
	}
	cs_chooseoption(ctlChannel_ID,0);
	setSelect("Channel_ID", vChannel);
	if(document.ConfigForm.Is11nMode.value == "1"){
		document.getElementById("11nMode_0_div").style.display="none";
		if(document.ConfigForm.Is11acMode.value == "1"){
			document.getElementById("11nMode_1_div").style.display="none";
			document.getElementById("11acMode_1_div").style.display="";
		}
		else{
			document.getElementById("11nMode_1_div").style.display="";
 			document.getElementById("11acMode_1_div").style.display="none";
		}
	}else{
		//document.getElementById("11nMode_0_div").style.display=""; /* ONTS-227 */
		document.getElementById("11nMode_1_div").style.display="none";
		document.getElementById("11acMode_1_div").style.display="none";
	}
// ONTS-377: remove
//<% if tcWebApi_get("WebCustom_Entry","isHTBW40M","h") = "Yes" then %>
//	if((document.ConfigForm.WLANChannelBandwidth.value == 1 ) || (document.ConfigForm.WLANChannelBandwidth.value == 2 ))
//<% else %>
//	if(document.ConfigForm.WLANChannelBandwidth.value == "1")
//<% end if %>
//	{
//		//document.getElementById("HT_BW_1_div").style.display="";
//		if(document.ConfigForm.Is11acMode.value == "1"){
//			document.getElementById("11acMode_1_div").style.display="";
//			document.getElementById("11nMode_1_div").style.display="none";
//		}else{
//			document.getElementById("11acMode_1_div").style.display="none";
//		}
//	}else{
//		document.getElementById("HT_BW_1_div").style.display="none";
//		document.getElementById("11acMode_1_div").style.display="none";
//	}
	if(document.ConfigForm.isWPSSupported.value == "1")
	{
		//if(document.ConfigForm.wlan_VC.value == 0 ){
			if(document.ConfigForm.UseWPS_Selection.checked == true)
				document.getElementById("WPSConfMode_1_div").style.display="none"; /* ONTS-317: don't show */
			else
				document.getElementById("WPSConfMode_1_div").style.display="none";
		//}
	}
}
var MCSInit = 1;
function McsRefreshPage(){
	var rt_device = "<%tcWebApi_get("WLan11ac_Common","rt_device","s")%>";
	var index = 0;
	var WLANMCS_ID = document.ConfigForm.WLANMCS;
	var vWLANMCS = WLANMCS_ID.value;
	var ls11acmode = document.ConfigForm.Is11acMode.value;
	if(MCSInit == 1){
		vWLANMCS = "<%tcWebApi_get("WLan11ac_Entry","HT_MCS","s")%>";
		MCSInit = 0;
	}
	WLANMCS_ID.length = 0;
	if (WLANMCS_ID.parentNode.getElementsByClassName("select-items")[0]) {
		WLANMCS_ID.parentNode.getElementsByClassName("select-items")[0].innerHTML = "";
	}
	cs_addoption(WLANMCS_ID, "0", "0");
	cs_addoption(WLANMCS_ID, "1", "1");
	cs_addoption(WLANMCS_ID, "2", "2");
	cs_addoption(WLANMCS_ID, "3", "3");
	cs_addoption(WLANMCS_ID, "4", "4");
	cs_addoption(WLANMCS_ID, "5", "5");
	cs_addoption(WLANMCS_ID, "6", "6");
	cs_addoption(WLANMCS_ID, "7", "7");
	if(ls11acmode == "1"){
		cs_addoption(WLANMCS_ID, "8", "8");
		if (document.ConfigForm.WLANChannelBandwidth.selectedIndex != 0)
		cs_addoption(WLANMCS_ID, "9", "9");
	}
	else if (rt_device == "7612" || rt_device == "7613" || rt_device == "7615") {
		cs_addoption(WLANMCS_ID, "8", "8");
		cs_addoption(WLANMCS_ID, "9", "9");
		cs_addoption(WLANMCS_ID, "10", "10");
		cs_addoption(WLANMCS_ID, "11", "11");
		cs_addoption(WLANMCS_ID, "12", "12");
		cs_addoption(WLANMCS_ID, "13", "13");
		cs_addoption(WLANMCS_ID, "14", "14");
		cs_addoption(WLANMCS_ID, "15", "15");
	}
	cs_addoption(WLANMCS_ID, "33", "AUTO");
	cs_chooseoption(WLANMCS_ID,0);
	setSelect("WLANMCS", vWLANMCS);
}
<% If tcWebApi_get("WLan11ac_Common","rt_device","h") = "7615" Then %>
var VHTSec80Channel = "<% tcWebApi_get("WLan11ac_Common","VHT_Sec80_Channel","s") %>";
var initFlag = true;
function initWLan11acTxBeamFormingSel()			//init TxBeamforming sel
{
	var ITxBfEn = "<%tcWebApi_get("WLan11ac_Common","ITxBfEn","s")%>";
	var ETxBfEnCond = "<%tcWebApi_get("WLan11ac_Common","ETxBfEnCond","s")%>";
	var ETxBfIncapable = "<%tcWebApi_get("WLan11ac_Common","ETxBfIncapable","s")%>";
	if(ITxBfEn == "1" && ETxBfEnCond == "1" && ETxBfIncapable == "0")		//Both
	{
		document.ConfigForm.WLan11acTxBeamForming[0].selected = true;
	}
	else if(ITxBfEn == "0" && ETxBfEnCond == "1" && ETxBfIncapable == "0")		//Explicit
	{
		document.ConfigForm.WLan11acTxBeamForming[1].selected = true;
	}
	else if(ITxBfEn == "1" && ETxBfEnCond == "0" && ETxBfIncapable == "1")		//Implicit
	{
		document.ConfigForm.WLan11acTxBeamForming[2].selected = true;
	}
	else if(ITxBfEn == "0" && ETxBfEnCond == "0" && ETxBfIncapable == "1")		//Disable
	{
		document.ConfigForm.WLan11acTxBeamForming[3].selected = true;
	}
	else
	{
		document.ConfigForm.WLan11acTxBeamForming[3].selected = true;
	}
}
function doVHTTxBeamFormingChange()
{
	if(document.ConfigForm.WLan11acTxBeamForming[0].selected == true)			//Both
	{
		document.ConfigForm.WLan11acITxBfEn.value = "1";
		document.ConfigForm.WLan11acETxBfEnCond.value = "1";
		document.ConfigForm.WLan11acETxBfIncapable.value = "0";
	}
	else if(document.ConfigForm.WLan11acTxBeamForming[1].selected == true)		//Explicit
	{
		document.ConfigForm.WLan11acITxBfEn.value = "0";
		document.ConfigForm.WLan11acETxBfEnCond.value = "1";
		document.ConfigForm.WLan11acETxBfIncapable.value = "0";
	}
	else if(document.ConfigForm.WLan11acTxBeamForming[2].selected == true)		//Implicit
	{
		document.ConfigForm.WLan11acITxBfEn.value = "1";
		document.ConfigForm.WLan11acETxBfEnCond.value = "0";
		document.ConfigForm.WLan11acETxBfIncapable.value = "1";
	}
	else if(document.ConfigForm.WLan11acTxBeamForming[3].selected == true)		//Disable
	{
		document.ConfigForm.WLan11acITxBfEn.value = "0";
		document.ConfigForm.WLan11acETxBfEnCond.value = "0";
		document.ConfigForm.WLan11acETxBfIncapable.value = "1";
	}
	else
	{
		document.ConfigForm.WLan11acITxBfEn.value = "0";
		document.ConfigForm.WLan11acETxBfEnCond.value = "0";
		document.ConfigForm.WLan11acETxBfIncapable.value = "1";
	}
}
function setVHTbwChannel()
{
	document.ConfigForm.VHTSec80Channel.value = VHTSec80Channel;					
}
function initWLan11ac2ndFrequencySel()		//init 2ndFrequencyChannel sel options
{
	document.ConfigForm.WLan11ac2ndFrequency.length = 0;
	var opts = document.ConfigForm.Channel_ID.options;
	var selindex = document.ConfigForm.Channel_ID.selectedIndex;
	var optsval = opts[selindex].value;
	var oindex = 0;
	var fcount = new Array(5);
	fcount[0] = "36~48";
	fcount[1] = "52~64";
	fcount[2] = "100~112";
	fcount[3] = "116~128";
	fcount[4] = "149~161";
	if(optsval >= 36 && optsval <= 48)
	{
		document.ConfigForm.WLan11ac2ndFrequency[oindex++] = new Option(fcount[1],0);
		document.ConfigForm.WLan11ac2ndFrequency[oindex++] = new Option(fcount[2],1);
		document.ConfigForm.WLan11ac2ndFrequency[oindex++] = new Option(fcount[3],2);
		document.ConfigForm.WLan11ac2ndFrequency[oindex++] = new Option(fcount[4],3);
		if(VHTSec80Channel == "52")
		{
			document.ConfigForm.WLan11ac2ndFrequency[0].selected = true;
		}
		else if(VHTSec80Channel == "100")
		{
			document.ConfigForm.WLan11ac2ndFrequency[1].selected = true;
		}
		else if(VHTSec80Channel == "116")
		{
			document.ConfigForm.WLan11ac2ndFrequency[2].selected = true;
		}
		else if(VHTSec80Channel == "149")
		{
			document.ConfigForm.WLan11ac2ndFrequency[3].selected = true;
		}		
	}
	else if(optsval >= 52 && optsval <= 64)
	{
		document.ConfigForm.WLan11ac2ndFrequency[oindex++] = new Option(fcount[0],0);
		document.ConfigForm.WLan11ac2ndFrequency[oindex++] = new Option(fcount[2],1);
		document.ConfigForm.WLan11ac2ndFrequency[oindex++] = new Option(fcount[3],2);
		document.ConfigForm.WLan11ac2ndFrequency[oindex++] = new Option(fcount[4],3);
		if(VHTSec80Channel == "36")
		{
			document.ConfigForm.WLan11ac2ndFrequency[0].selected = true;
		}
		else if(VHTSec80Channel == "100")
		{
			document.ConfigForm.WLan11ac2ndFrequency[1].selected = true;
		}
		else if(VHTSec80Channel == "116")
		{
			document.ConfigForm.WLan11ac2ndFrequency[2].selected = true;
		}
		else if(VHTSec80Channel == "149")
		{
			document.ConfigForm.WLan11ac2ndFrequency[3].selected = true;
		}	
	}	
	else if(optsval >= 100 && optsval <= 112)
	{
		document.ConfigForm.WLan11ac2ndFrequency[oindex++] = new Option(fcount[0],0);
		document.ConfigForm.WLan11ac2ndFrequency[oindex++] = new Option(fcount[1],1);
		document.ConfigForm.WLan11ac2ndFrequency[oindex++] = new Option(fcount[3],2);
		document.ConfigForm.WLan11ac2ndFrequency[oindex++] = new Option(fcount[4],3);
		if(VHTSec80Channel == "36")
		{
			document.ConfigForm.WLan11ac2ndFrequency[0].selected = true;
		}
		else if(VHTSec80Channel == "52")
		{
			document.ConfigForm.WLan11ac2ndFrequency[1].selected = true;
		}
		else if(VHTSec80Channel == "116")
		{
			document.ConfigForm.WLan11ac2ndFrequency[2].selected = true;
		}
		else if(VHTSec80Channel == "149")
		{
			document.ConfigForm.WLan11ac2ndFrequency[3].selected = true;
		}		
	}
	else if(optsval >= 116 && optsval <= 128)
	{
		document.ConfigForm.WLan11ac2ndFrequency[oindex++] = new Option(fcount[0],0);
		document.ConfigForm.WLan11ac2ndFrequency[oindex++] = new Option(fcount[1],1);
		document.ConfigForm.WLan11ac2ndFrequency[oindex++] = new Option(fcount[2],2);
		document.ConfigForm.WLan11ac2ndFrequency[oindex++] = new Option(fcount[4],3);
		if(VHTSec80Channel == "36")
		{
			document.ConfigForm.WLan11ac2ndFrequency[0].selected = true;
		}
		else if(VHTSec80Channel == "52")
		{
			document.ConfigForm.WLan11ac2ndFrequency[1].selected = true;
		}
		else if(VHTSec80Channel == "100")
		{
			document.ConfigForm.WLan11ac2ndFrequency[2].selected = true;
		}
		else if(VHTSec80Channel == "149")
		{
			document.ConfigForm.WLan11ac2ndFrequency[3].selected = true;
		}	
	}
	else if(optsval >= 149 && optsval <= 161)
	{
		document.ConfigForm.WLan11ac2ndFrequency[oindex++] = new Option(fcount[0],0);
		document.ConfigForm.WLan11ac2ndFrequency[oindex++] = new Option(fcount[1],1);
		document.ConfigForm.WLan11ac2ndFrequency[oindex++] = new Option(fcount[2],2);
		document.ConfigForm.WLan11ac2ndFrequency[oindex++] = new Option(fcount[3],3);
		if(VHTSec80Channel == "36")
		{
			document.ConfigForm.WLan11ac2ndFrequency[0].selected = true;
		}
		else if(VHTSec80Channel == "52")
		{
			document.ConfigForm.WLan11ac2ndFrequency[1].selected = true;
		}
		else if(VHTSec80Channel == "100")
		{
			document.ConfigForm.WLan11ac2ndFrequency[2].selected = true;
		}
		else if(VHTSec80Channel == "116")
		{
			document.ConfigForm.WLan11ac2ndFrequency[3].selected = true;
		}		
	}
	else if(selindex != 0)
	{
		document.ConfigForm.WLan11ac2ndFrequency[oindex++] = new Option(fcount[0],0);
		document.ConfigForm.WLan11ac2ndFrequency[oindex++] = new Option(fcount[1],1);
		document.ConfigForm.WLan11ac2ndFrequency[oindex++] = new Option(fcount[2],2);
		document.ConfigForm.WLan11ac2ndFrequency[oindex++] = new Option(fcount[3],3);
		document.ConfigForm.WLan11ac2ndFrequency[oindex++] = new Option(fcount[4],4);
		if(VHTSec80Channel == "36")
		{
			document.ConfigForm.WLan11ac2ndFrequency[0].selected = true;
		}
		else if(VHTSec80Channel == "52")
		{
			document.ConfigForm.WLan11ac2ndFrequency[1].selected = true;
		}
		else if(VHTSec80Channel == "100")
		{
			document.ConfigForm.WLan11ac2ndFrequency[2].selected = true;
		}
		else if(VHTSec80Channel == "116")
		{
			document.ConfigForm.WLan11ac2ndFrequency[3].selected = true;
		}
		else if(VHTSec80Channel == "149")
		{
			document.ConfigForm.WLan11ac2ndFrequency[4].selected = true;
		}	
	}
	onVHTbwChannelChange();		
}
function onVHTbwChannelChange()
{
	var opts = document.ConfigForm.Channel_ID.options;
	var selindex = document.ConfigForm.Channel_ID.selectedIndex;
	var optsval = opts[selindex].value;
	var j = document.ConfigForm.WLan11ac2ndFrequency.selectedIndex;
	if(optsval >= 36 && optsval <= 48)
	{
		switch(j)
		{
			case 0:
				VHTSec80Channel = "52";
				break;
			case 1:
				VHTSec80Channel = "100";
				break;
			case 2:
				VHTSec80Channel = "116";
				break;
			case 3:
				VHTSec80Channel = "149";
				break;
		}
	}
	else if(optsval >= 52 && optsval <= 64)
	{
		switch(j)
		{
			case 0:
				VHTSec80Channel = "36";
				break;
			case 1:
				VHTSec80Channel = "100";
				break;
			case 2:
				VHTSec80Channel = "116";
				break;
			case 3:
				VHTSec80Channel = "149";
				break;
		}
	}		
	else if(optsval >= 100 && optsval <= 112)
	{
		switch(j)
		{
			case 0:
				VHTSec80Channel = "36";
				break;
			case 1:
				VHTSec80Channel = "52";
				break;
			case 2:
				VHTSec80Channel = "116";
				break;
			case 3:
				VHTSec80Channel = "149";
				break;
		}
	}	
	else if(optsval >= 116 && optsval <= 128)
	{				
		switch(j)
		{
			case 0:
				VHTSec80Channel = "36";
				break;
			case 1:
				VHTSec80Channel = "52";
				break;
			case 2:
				VHTSec80Channel = "100";
				break;
			case 3:
				VHTSec80Channel = "149";
				break;
		}
	}	
	else if(optsval >= 149 && optsval <= 161)
	{		
		switch(j)
		{
			case 0:
				VHTSec80Channel = "36";
				break;
			case 1:
				VHTSec80Channel = "52";
				break;
			case 2:
				VHTSec80Channel = "100";
				break;
			case 3:
				VHTSec80Channel = "116";
				break;
		}
	}
	else if(selindex != 0)
	{
		switch(j)
		{
			case 0:
				VHTSec80Channel = "36";
				break;
			case 1:
				VHTSec80Channel = "52";
				break;
			case 2:
				VHTSec80Channel = "100";
				break;
			case 3:
				VHTSec80Channel = "116";
				break;
			case 4:
				VHTSec80Channel = "149";
				break;
		}
	}	
}	
function VHTBandwidthRefreshPage()
{
	if((document.ConfigForm.WLan11acVHTChannelBandwidth.options.length > 4) &&
		(document.ConfigForm.TxStream_Action.selectedIndex == 3) &&
		(document.ConfigForm.RxStream_Action.selectedIndex == 3))
	{
		if(document.ConfigForm.WLan11acVHTChannelBandwidth.options[4].selected == true && document.ConfigForm.Channel_ID.selectedIndex != 0)
		{
			document.getElementById("WLan11ac2ndFrequencyTable").style.display = "";
		}
		else
		{
			document.getElementById("WLan11ac2ndFrequencyTable").style.display = "none";
		}
	}
	else
	{
		document.getElementById("WLan11ac2ndFrequencyTable").style.display = "none";
	}
}
<% End If %>
<% if tcWebApi_get("WebCustom_Entry","isWPSSupported","h") = "Yes"  then %>
function dowpscheck(){				//modified by fred to support WPS2.0
	var wlan=document.ConfigForm;
	if(wlan.SSID_INDEX.value==0){	
		if(wlan.UseWPS_Selection.checked == true){
			//check if WscV2Supported
<% if tcWebApi_get("WLan11ac_Entry0","WscV2Support","h") = "1"  then %>
			if (wlan.ESSID_HIDE_Selection.checked == false){
				alert("SSID broadcast must be enabled if you want to use WPS, in other cases you need to disable WPS firstly!");
			  wlan.UseWPS_Selection.checked = false;
			  return 0;
			}
			if(wlan.TKIP_Selection.value== "TKIP")
			{
				//WPAPSK ,WPA2PSK and WPAPSKWPA2PSK with TKIP	
				alert("Encryption type must not be TKIP if you want to use WPS, in other cases you need to disable WPS firstly!");
				wlan.UseWPS_Selection.checked = false;
				return 0;
			}
			return 1;
<% end if %>
		//do simple check if only WPS 1.0 supported, use original check code in 1.0
<% if tcWebApi_get("WLan11ac_Entry0","WscV2Support","h") <> "1"  then %>
		//WEPSelectIndex 1=WEP64,2=WEP128,3=Radius-WEP64,4=Radius-WEP128
		return 1;
<% end if %>
		}
		else{
			return 1;
		}
	}else{
		return 1;
	}
}
<%  end if %>
<% if tcWebApi_get("WebCustom_Entry","isWPSSupported","h") = "Yes"  then %>
function doBroadcastSSIDChange(){
	//check if WscV2Supported
<% if tcWebApi_get("WLan11ac_Entry0","WscV2Support","h") = "1"  then %>
	var wlan=document.ConfigForm;
	if((wlan.SSID_INDEX.value==0) && (wlan.UseWPS_Selection.checked == true) && (wlan.ESSID_HIDE_Selection.checked == false))
	{
			var rv = confirm("WPS will be disabled!");
			if (rv == false)
			{
				wlan.ESSID_HIDE_Selection.checked = true;
			}
			else
			{
				wlan.ESSID_HIDE_Selection.checked = false;
				wlan.UseWPS_Selection.checked = false;
			}
	}
  showUI();
<% end if %>
	return 1;	
}
function doEncryptionChange(object){
	//check if WscV2Supported
<% if tcWebApi_get("WLan11ac_Entry0","WscV2Support","h") = "1"  then %>
	var wlan=document.ConfigForm;	
	if((wlan.SSID_INDEX.value==0) && (wlan.UseWPS_Selection.checked == true) && (object.value == "TKIP"))
	{
		var rv = confirm("WPS will be disabled!");
		if (rv == false)
		{
			object.value="AES";
		}
		else
		{
			object.value = "TKIP";
			wlan.UseWPS_Selection.checked = false;
		}
	}
	showUI();
<% end if %>
	return 1;
}
<% end if %>
function doWEPChange(){
	doCheckWepSelectIndex();
	var wlan=document.ConfigForm;	
	if(WEPSelectIndex == 0)
	{
		// var rv = confirm("Your network will be set to OPEN without security setting, we strongly suggest you choose WPAPSK or WPA2PSK encryption!!");
		// if (rv == false)
		// {
		// 	cs_chooseoption(wlan.WEP_Selection, wepidx)
		// 	//wlan.WEP_Selection.selectedIndex = wepidx;
		// }
	}
	wlan.wlanWEPFlag.value = 1;
	showUI();
}
function doWEPChange2(){
<% if tcWebApi_get("WebCustom_Entry","isWPSSupported","h") = "Yes"  then %>
	if(dowpscheck()){
<% end if %>
		document.ConfigForm.wlanWEPFlag.value = 1;
		if(WEPSelectIndex != 9){
<% if tcWebApi_get("WebCustom_Entry","isWlanEncrypt","h") = "Yes"  then %>
			document.ConfigForm.WEP_Selection.selectedIndex = 8;
<% else %>
			document.ConfigForm.WEP_Selection.selectedIndex = 9;
<% end if %>
			submitAsync("ConfigForm");
		}
<% if tcWebApi_get("WebCustom_Entry","isWPSSupported","h") = "Yes"  then %>
	}
<% end if %>
}
function doWDSEncrypTypeChange(){
		document.ConfigForm.wlanWEPFlag.value = 4;
}
function doSSIDChange(){
	document.ConfigForm.wlanWEPFlag.value = 2;
	submitAsync("ConfigForm");
}
function doExtChaLockChange() {
	if(document.ConfigForm.WirelessMode.selectedIndex >= 1){
		if(document.ConfigForm.RTDEVICE.value == "7615" || document.ConfigForm.RTDEVICE.value == "7613")
		{
			initWLan11ac2ndFrequencySel();
			VHTBandwidthRefreshPage();
		}
<% if tcWebApi_get("WebCustom_Entry","isHTBW40M","h") = "Yes" then %>
		if((document.ConfigForm.WLANChannelBandwidth.selectedIndex == 1)||(document.ConfigForm.WLANChannelBandwidth.selectedIndex == 2)){
<% else %>
		if(document.ConfigForm.WLANChannelBandwidth.selectedIndex == 1){
<% end if %>
			document.ConfigForm.wlanWEPFlag.value = 1;
			showUI();
		}
	}
}
function doWirelessModeChange(){
	document.ConfigForm.wlanWEPFlag.value = 1;
	if(document.ConfigForm.WirelessMode.selectedIndex>=1){
		document.ConfigForm.Is11nMode.value=1;
		if(document.ConfigForm.WirelessMode.selectedIndex>=3){
			document.ConfigForm.Is11acMode.value=1;
			document.getElementById("11nMode_1_div").style.display="none";
			document.getElementById("11acMode_1_div").style.display="";
			setSelect('WLan11acVHTChannelBandwidth', "2"); // 80MHz
		}else{
			document.ConfigForm.Is11acMode.value=0;	
			document.getElementById("11nMode_1_div").style.display="";
			document.getElementById("11acMode_1_div").style.display="none";
			setSelect('WLANChannelBandwidth', "2"); // 40MHz
		}
	}else{
		document.ConfigForm.Is11nMode.value=0;
		document.ConfigForm.Is11acMode.value=0;
		document.getElementById("11nMode_1_div").style.display="none";
		document.getElementById("11acMode_1_div").style.display="none";
	}
	//showUI(); /* ONTS-439 */
}
function doVHTBandwidthChange(){
	document.ConfigForm.wlanWEPFlag.value = 1;
	showUI();
}
function doChannelBandwidthChange(){
	document.ConfigForm.wlanWEPFlag.value = 1;
	showUI();
}
function doExtChannChange(){
	if(document.ConfigForm.WLANExtensionChannel.selectedIndex==0){
		document.ConfigForm.ExtChannFlag.value = 0;
	}else{
		document.ConfigForm.ExtChannFlag.value = 1;
	}
}
<% if tcWebApi_get("WebCustom_Entry","isWPSSupported","h") = "Yes"  then %>
function doWPSUseChange(){
	if(dowpscheck()){
		document.ConfigForm.wlanWEPFlag.value = 1;
		RefreshChannPage();
		showUI();
	}
	if(document.ConfigForm.enableWps.checked)
	{
		document.ConfigForm.WpsActive.value = "1";
	}
	else
	{
		if(getValue('isInWPSing')!=0)	//WPS is running
		{
			alert("<%tcWebApi_get("String_Entry","WPSWorkingText","s")%>");
			document.ConfigForm.enableWps.checked = true;
			document.ConfigForm.WpsActive.value = "1";
		}
		else
		{
			document.ConfigForm.WpsActive.value = "0";
		}
	}
}
function doWPSModeChange(){
	document.ConfigForm.wlanWEPFlag.value = 1;
	submitAsync("ConfigForm");
}
<% end if %>
function wpapskCheck(object) {
	var keyvalue=object.value;
	var wpapsklen=object.value.length;
	var special_char_pwd = new Array("\\", "'", "`", "/", "\"", " ", ",");
 	if(wpapsklen >= 8 && wpapsklen < 64)
 	{
  		if(keyvalue.match(/[^\x00-\xff]/g))
 	  	{
			alert("Pre-Shared Key should be between 8 and 63 ASCII characters or 64 Hex string.");
			return true;
 	  	}
		// ONTS-75:
		for (var i = 0; i < special_char_pwd.length; i++)
		{
			if(keyvalue.includes(special_char_pwd[i]))
			{
				alert("<%tcWebApi_get("String_Entry","PasswordText","s")%> <%tcWebApi_get("String_Entry","InvalidCharacterText","s")%> '" + special_char_pwd[i] + "'");
				return true;
			}
 		} 	
	}else if(wpapsklen==64){
		for(i=0;i<64;i++){
			var c=keyvalue.charAt(i);
			if(doHexCheck(c)<0){
				alert("Pre-Shared Key Hex value error!");
				return true;
			}
		}
	}else {
		alert('<%tcWebApi_get("String_Entry","PreliminaryKeyText","s")%>');
		return true;
	}			
	return false;
}
function WDSKeyCheck(object) {
	var keyvalue=object.value;
	var wdskeylen=object.value.length;
 	if(wdskeylen < 8) {
  	alert('WDS Key length error!');
		return true;
	}else if(wdskeylen==64){
		for(i=0;i<64;i++){
			var c=keyvalue.charAt(i);
			if(doHexCheck(c)<0){
				alert('WDS Key Hex value error!');
				return true;
			}
		}
	}else if(wdskeylen > 64) {
    alert('WDS Key length error!');
		return true;
	}			
	return false;
}
function doWEPTypeChange(){
}
function doHexCheck(c)
{
  if ((c >= "0")&&(c <= "9"))
  {
    return 1;
  }
  else if ((c >= "A")&&(c <= "F"))
  {
    return 1;
  }
  else if ((c >= "a")&&(c <= "f"))
  {
    return 1;
  }
  return -1;
}
function doNonSympolCheck(c)
{
	if ((c >= "0")&&(c <= "9"))
	{
		return 1;
	}
	else if ((c >= "A")&&(c <= "Z"))
	{
		return 1;
	}
	else if ((c >= "a")&&(c <= "z"))
	{
		return 1;
	}
  return -1;
}
function doKEYcheck(object)
{
	var index = object.value.indexOf("0x");
	len=object.value.length;
	if(len == 0){
		return true;
	}
	if(WEPSelectIndex==1)
	{
		if(len==5)/*wep 64*/
		{
			return true;
		}
		else if(len==10)/*wep 64*/
		{
			for(i=0;i<len;i++)
			{
				var c = object.value.charAt(i);	
				if(doHexCheck(c)==-1)
				{
					alert("<%tcWebApi_get("String_Entry","WirelessJS9Text","s")%>");
						return false;
				}
			}
		}
		else
		{
			alert("Invalid Key Value");
			return false;
		}
	}
	else if(WEPSelectIndex==2)
	{
		if(len==13)/*wep 128*/
		{
			return true;
		}
		else if(len==26)/*wep 128*/
		{
			for(i=0;i<len;i++)
			{
				var c = object.value.charAt(i);	
				if(doHexCheck(c)==-1)
				{
					alert("Invalid Key Value");
					return false;
				}
			}
		}
		else
		{
			alert("Invalid Key Value");
			return false;
		}
	}
	if(document.ConfigForm.isDot1XSupported.value==1)
	{
		if(WEPSelectIndex==6)
		{
			if(len==5)/*wep 64*/
			{
				return true;
			}
			else if(len==10)/*wep 64*/
			{
				for(i=0;i<len;i++)
				{
					var c = object.value.charAt(i);	
					if(doHexCheck(c)==-1)
					{
						alert("Invalid Key Value");
						return false;
					}
				}
			}
			else
			{
				alert("Invalid Key Value");
				return false;
			}
		}
		else if(WEPSelectIndex==7)
		{
			if(len==13)/*wep 128*/
			{
				return true;
			}
			else if(len==26)/*wep 128*/
			{
				for(i=0;i<len;i++)
				{
					var c = object.value.charAt(i);	
					if(doHexCheck(c)==-1)
					{
						alert("nvalid Key Value");
						return false;
					}
				}
			}
			else
			{
				alert("nvalid Key Value");
				return false;
			}
		}
	}
	return true;
}
function doMACcheck(object)
{
  var szAddr = object.value;
  var len = szAddr.length;
  var errMsg = "Invalid MAC Address";
  if ( len == 0 )
  {
    object.value ="00:00:00:00:00:00";
    return false;
  }
  if ( len == 12 )
  {
    var newAddr = "";
    var i = 0;
    for ( i = 0; i < len; i++ )
    {
      var c = szAddr.charAt(i);
      if ( doHexCheck(c) < 0 )
      {
      	alert("Invalid MAC Address");        
        return true;
      }
      if ( (i == 2) || (i == 4) || (i == 6) || (i == 8) || (i == 10) )
        newAddr = newAddr + ":";
      newAddr = newAddr + c;
    }
    object.value = newAddr;
  }
  else if ( len == 17 )
  {
    var i = 2;
    var c0 = szAddr.charAt(0);
    var c1 = szAddr.charAt(1);
    if ( (doHexCheck(c0) < 0) || (doHexCheck(c1) < 0) )
    {
			alert("Invalid MAC Address");       	
			return true;
    }
    i = 2;
    while ( i < len )
    {
      var c0 = szAddr.charAt(i);
      var c1 = szAddr.charAt(i+1);
      var c2 = szAddr.charAt(i+2);  
      if ( (c0 != ":") || (doHexCheck(c1) < 0) || (doHexCheck(c2) < 0) )
      {
				alert("Invalid MAC Address");         	
				return true;
      }
      i = i + 3;
    }
  }
  else
  {
		alert("Invalid MAC Address");         	
		return true;
  }
  return false;
}
function checkBeacon(value) 
{
	if (!isNumeric(value)) {
		ShowAdvanced = 0;
		showAdvanced(); /* Show before alert */
		alert("<%tcWebApi_get("String_Entry","BeaconIntervalintegerText","s")%>");    
		return true;
	}
	if (value < 20 || value > 1000) {
		ShowAdvanced = 0;
		showAdvanced(); /* Show before alert */
		alert("<%tcWebApi_get("String_Entry","BeaconIntervalrangeText","s")%>");    
		return true;  	
	}
	return false;
}
function checkRTS(value) 
{
	if (!isNumeric(value)) {
		ShowAdvanced = 0;
		showAdvanced(); /* Show before alert */
		alert("<%tcWebApi_get("String_Entry","RTSThresholdintegerText","s")%>");    
		return true;
	}
	if (value < 1500 || value > 2347) {
		ShowAdvanced = 0;
		showAdvanced(); /* Show before alert */
		alert("<%tcWebApi_get("String_Entry","RTSThresholdrangeText","s")%>");    
		return true;  	
	}
	return false;
}
function checkFrag(value) 
{
	if (!isNumeric(value)) {
		ShowAdvanced = 0;
		showAdvanced(); /* Show before alert */
		alert("<%tcWebApi_get("String_Entry","FragmentThresholdintegerText","s")%>");    
		return true;
	}
	if (value < 256 || value > 2346) {
		ShowAdvanced = 0;
		showAdvanced(); /* Show before alert */
		alert("<%tcWebApi_get("String_Entry","FragmentThresholdrangeText","s")%>");    
		return true;  	
	}
	if (value % 2) {
		ShowAdvanced = 0;
		showAdvanced(); /* Show before alert */
		alert("<%tcWebApi_get("String_Entry","FragmentThresholdevenText","s")%>");    
		return true;  	
	}
	return false;
}
function checkDTIM(value) 
{
	if (!isNumeric(value)) {
		ShowAdvanced = 0;
		showAdvanced(); /* Show DTIM before alert */
		alert("<%tcWebApi_get("String_Entry","DTIMintegerText","s")%>: " + value);
		return true;
	}
	if (value < 1 || value > 255) {
		ShowAdvanced = 0;
		showAdvanced(); /* Show DTIM before alert */
		alert("<%tcWebApi_get("String_Entry","DTIMvalueText","s")%>");	
		return true;
	}	
	return false;
}
<% If tcWebApi_get("WebCustom_Entry","isMaxStaNumSupported","h") = "Yes" Then %>
function checkStationNum(value, limit) 
{
	if (!isNumeric(value) || parseInt(value,10) < 1 || parseInt(value,10) > parseInt(limit,10))
	{
		ShowAdvanced = 0;
		showAdvanced(); /* Show before alert */
		alert('<%tcWebApi_get("String_Entry","NumberConnectText","s")%>');
		return true;
	}	
	return false;
}
<% End If %>
function checkRekeyinteral(value, flag) 
{
	if (!isNumeric(value)) {
		ShowAdvanced = 0;
		showAdvanced(); /* Show before alert */
		// if(flag == 1){
		// 	alert("WPA Group Rekey Interval : Non-integer value given"); 
		// }else{
		// 	alert("Key Renewal Interval : Non-integer value given");
		// }
		alert("<%tcWebApi_get("String_Entry","WPAGroupintegerText","s")%>"); 
		return true;
	}
	if (value < 10 || value > 4194303) {
		ShowAdvanced = 0;
		showAdvanced(); /* Show before alert */
		// if(flag == 1){
		// 	alert("WPA Group Rekey Interval must be between 10 and 4194303");
		// }else{
		// 	alert("Key Renewal Interval must be between 10 and 4194303");
		// }
		alert("<%tcWebApi_get("String_Entry","WPAGrouprangeText","s")%>");
		return true;
	}	
	return false;
}
function quotationCheck(object, limit_len) {
	var len = object.value.length;
	var c;
	var i, j = 0;
  for (i = 0; i < len; i++)
  {
	 	var c = object.value.charAt(i);
	  if (c == '"')
		{
			j += 6;
		}
		else
			j++;
  }
 	if (j > limit_len-1)
	{
    alert('too many quotation marks!');		
    return true;
	}	
	return false;
}
function isValidIpAddr(ip1,ip2,ip3,ip4)
{
	if(ip1==0 || ip4==0 || ip4==255 || ip1==127 )	
		return false;			
	return true;	
}
function inValidIPAddr(Address)
{
	var address = Address.match("^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$");
	var digits;
	var i;
	if(address == null) { 
		alert('<%tcWebApi_get("String_Entry","IsInvalidIPAddrText","s")%>' + Address);
		return true;
	}
	digits = address[0].split(".");
	for(i=0; i < 4; i++)
	{
		if((Number(digits[i]) > 255 ) || (Number(digits[i]) < 0 ) || (Number(digits[0]) > 223) || (digits[i] == null))
		{ 
			alert('<%tcWebApi_get("String_Entry","IsInvalidIPAddrText","s")%>' + Address);
			return true;
		}
	}
	if(!isValidIpAddr(digits[0],digits[1],digits[2],digits[3],false))
	{
		alert('<%tcWebApi_get("String_Entry","IsInvalidIPAddrText","s")%>' + Address);
		return true;
	}
	return false;
}
function ValidateChecksum(PIN)
{
	var accum = 0;
	accum += 3 * (((PIN - PIN % 10000000) / 10000000) % 10);
	accum += 1 * (((PIN - PIN % 1000000) / 1000000) % 10);
	accum += 3 * (((PIN - PIN % 100000) / 100000) % 10);
	accum += 1 * (((PIN - PIN % 10000) / 10000) % 10);
	accum += 3 * (((PIN - PIN % 1000) / 1000) % 10);
	accum += 1 * (((PIN - PIN % 100) / 100) % 10);
	accum += 3 * (((PIN - PIN % 10) / 10) % 10);
	accum += 1 * (((PIN - PIN % 1) / 1) % 10);
	if ((accum % 10) == 0)
		return true;
	else
		return false;
}
<% if tcWebApi_get("WebCustom_Entry","isWPSSupported","h") = "Yes"  then %>
<% if tcWebApi_get("WLan11ac_Entry0","WscV2Support","h") = "1"  then %>
//interface for future use
function ValidateChecksum_4(PIN)
{
	return true;
}
function ignoreSpaces(string) {
   var temp = "";
   string = '' + string;
   splitstring = string.split(" ");
   for(i = 0; i < splitstring.length; i++)
       temp += splitstring[i];
   return temp;
}
function ignoreDash(string) {
   var temp = "";
   string = '' + string;
   splitstring = string.split("-");
   for(i = 0; i < splitstring.length; i++)
       temp += splitstring[i];
   return temp;
}
<% end if %>
<% end if %>	
function doSubmit(){
<% if tcWebApi_get("Info_WLan11ac","isbharti","h") = "Yes" then %>
	if(0 == WEPSelectIndex)	
	{
		return false;
	}
<% end if %>
	document.ConfigForm.BeaconInterval.value = document.ConfigForm.BeaconInterval.value.trim();
	document.ConfigForm.RTSThreshold.value = document.ConfigForm.RTSThreshold.value.trim();
	document.ConfigForm.FragmentThreshold.value = document.ConfigForm.FragmentThreshold.value.trim();
	document.ConfigForm.DTIM.value = document.ConfigForm.DTIM.value.trim();
	if(checkBeacon(document.ConfigForm.BeaconInterval.value) ||
		checkRTS(document.ConfigForm.RTSThreshold.value) ||
		checkFrag(document.ConfigForm.FragmentThreshold.value) ||
		checkDTIM(document.ConfigForm.DTIM.value)
<% If tcWebApi_get("WebCustom_Entry","isMaxStaNumSupported","h") = "Yes" Then %>
		|| checkStationNum(document.ConfigForm.StationNum.value, "32")
<% End If %>
	){
		return false;
	}
<% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then %>
	if(0 == mesh_save_check())
	{
		return false;
	}
<% end if %>
	if(WEPSelectIndex != 0){ 
		document.ConfigForm.hRekeyMethod.value = "TIME";
		if (wpapskCheck(document.ConfigForm.PreSharedKey)){
			return false;
		}
		if(quotationCheck(document.ConfigForm.PreSharedKey, 385) ){
			return false;	 
		}
		if(checkRekeyinteral(document.ConfigForm.keyRenewalInterval.value, 0)){
			return false;
		}  			
	}
	if(quotationCheck(document.ConfigForm.ESSID, 193)||strESSIDCheck(document.ConfigForm.ESSID)){
		return;	   
	}
	document.ConfigForm.wlanWEPFlag.value = 3;
	if(document.ConfigForm.WirelessMode.selectedIndex>=1){
		document.ConfigForm.Is11nMode.value=1;
		if(document.ConfigForm.WirelessMode.selectedIndex>=3){
			document.ConfigForm.Is11acMode.value=1;
			if(document.ConfigForm.WLan11acVHTChannelBandwidth.selectedIndex == 1){
				document.ConfigForm.Wlan_HTBW40M.value = 0;
				document.ConfigForm.WLANChannelBandwidth.value = 1;
				document.ConfigForm.WLan11acVHTChannelBandwidth.value = 0;
			}
			else if(document.ConfigForm.WLan11acVHTChannelBandwidth.selectedIndex == 2){
				document.ConfigForm.Wlan_HTBW40M.value = 0;
				document.ConfigForm.WLANChannelBandwidth.value = 1;
				document.ConfigForm.WLan11acVHTChannelBandwidth.value = 1;
			}
			else if(document.ConfigForm.WLan11acVHTChannelBandwidth.selectedIndex == 3){
				document.ConfigForm.Wlan_HTBW40M.value = 1;
				document.ConfigForm.WLANChannelBandwidth.value = 1;
				document.ConfigForm.WLan11acVHTChannelBandwidth.value = 1;
			}
			else{
				document.ConfigForm.Wlan_HTBW40M.value = 0;
				document.ConfigForm.WLANChannelBandwidth.value = 0;
				document.ConfigForm.WLan11acVHTChannelBandwidth.value = 0;
			}
		}else{
			document.ConfigForm.Is11acMode.value=0;
			if(document.ConfigForm.WLANChannelBandwidth.selectedIndex == 0){
				document.ConfigForm.Wlan_HTBW40M.value = 0;
				document.ConfigForm.WLANChannelBandwidth.value = 0;
			}
			else if(document.ConfigForm.WLANChannelBandwidth.selectedIndex == 1){
				document.ConfigForm.Wlan_HTBW40M.value = 0;
				document.ConfigForm.WLANChannelBandwidth.value = 1;
			}
			else{
				document.ConfigForm.Wlan_HTBW40M.value = 1;
				document.ConfigForm.WLANChannelBandwidth.value = 1;
			}
		}
	}else{
		document.ConfigForm.Is11nMode.value=0;
		document.ConfigForm.Is11acMode.value=0;
	}
<% if tcWebApi_get("WLan11ac_Common","rt_device","h") = "7615" then %>
	doVHTTxBeamFormingChange();
	if((document.ConfigForm.WLan11acVHTChannelBandwidth.options.length > 4) && (document.ConfigForm.WLan11acVHTChannelBandwidth.options[4].selected == true) && (document.ConfigForm.Channel_ID.selectedIndex != 0))
	{
		setVHTbwChannel();
	}
<% end if %>
/*
	if(!checkSelectedKEY()){
		return false;
	}
*/
	submitAsync("ConfigForm");
}
function checkSelectedKEY(){
	var group;
	var curCBX;
	var vAuthMode = document.ConfigForm.WEP_Selection.value;
	if(vAuthMode == "Radius-WEP64"){
		group = document.ConfigForm.DefWEPKey1;
	}
	else if(vAuthMode == "Radius-WEP128"){
		group = document.ConfigForm.DefWEPKey2;
	}
	else if(vAuthMode == "WEP-64Bits"){
		group = document.ConfigForm.DefWEPKey3;
	}
	else if(vAuthMode == "WEP-128Bits"){
		group = document.ConfigForm.DefWEPKey4;
	}else{
		return true;
	}
	for (var i=0; i<group.length; i++){
		if (group[i].checked)
		break;
	}
	if(vAuthMode == "Radius-WEP64"){
		switch (i)
		{
		case 0:
			curCBX = document.ConfigForm.WEP_Key11;
			break;
		case 1:
			curCBX = document.ConfigForm.WEP_Key21;
			break;
		case 2:
			curCBX = document.ConfigForm.WEP_Key31;
			break;
		case 3:
			curCBX = document.ConfigForm.WEP_Key41;
			break;
		default:
		  ;
		}
	}
	else if(vAuthMode == "Radius-WEP128"){
		switch (i)
		{
		case 0:
			curCBX = document.ConfigForm.WEP_Key12;
			break;
		case 1:
			curCBX = document.ConfigForm.WEP_Key22;
			break;
		case 2:
			curCBX = document.ConfigForm.WEP_Key32;
			break;
		case 3:
			curCBX = document.ConfigForm.WEP_Key42;
			break;
		default:
		  ;
		}
	}
	else if(vAuthMode == "WEP-64Bits"){
		switch (i)
		{
		case 0:
			curCBX = document.ConfigForm.WEP_Key13;
			break;
		case 1:
			curCBX = document.ConfigForm.WEP_Key23;
			break;
		case 2:
			curCBX = document.ConfigForm.WEP_Key33;
			break;
		case 3:
			curCBX = document.ConfigForm.WEP_Key43;
			break;
		default:
		  ;
		}
	}
	else if(vAuthMode == "WEP-128Bits"){
		switch (i)
		{
		case 0:
			curCBX = document.ConfigForm.WEP_Key14;
			break;
		case 1:
			curCBX = document.ConfigForm.WEP_Key24;
			break;
		case 2:
			curCBX = document.ConfigForm.WEP_Key34;
			break;
		case 3:
			curCBX = document.ConfigForm.WEP_Key44;
			break;
		default:
		  ;
		}
	}
	len=curCBX.value.length;
	index = curCBX.value.indexOf("0x");
	if(WEPSelectIndex==1)/*wep 64*/
	{
		if(len==5)
		{
			for(i=0;i<len;i++)
			{
				var c = curCBX.value.charAt(i);	
				if(doNonSympolCheck(c)==-1)
				{
					alert("Invalid Key Value");
					curCBX.focus();
					return false;
				}
			}
		}
		else if(len==10)
		{
			for(i=0;i<len;i++)
			{
				var c = curCBX.value.charAt(i);	
				if(doHexCheck(c)==-1)
				{
					alert("Invalid Key Value");
					curCBX.focus();
					return false;
				}
			}
		}
		else if(len==12)
		{
			if(index==0)
			{
				for(i=2;i<len;i++)
				{
					var c = curCBX.value.charAt(i);	
					if(doHexCheck(c)==-1)
					{
						alert("Invalid Key Value");
						curCBX.focus();
						return false;
					}
				}
			}
			else
			{
				alert("Invalid Key Value");
				curCBX.focus();
				return false;
			}
		}
		else
		{
			alert("Invalid Key Value");
			curCBX.focus();
			return false;
		}
	}
	else if(WEPSelectIndex==2)/*wep 128*/
	{
		if(len==13)
		{
			for(i=0;i<len;i++)
			{
				var c = curCBX.value.charAt(i);	
				if(doNonSympolCheck(c)==-1)
				{
					alert("Invalid Key Value");
					curCBX.focus();
					return false;
				}
			}
		}
		else if(len==26)
		{
			for(i=0;i<len;i++)
			{
				var c = curCBX.value.charAt(i);	
				if(doHexCheck(c)==-1)
				{
					alert("Invalid Key Value");
					curCBX.focus();
					return false;
				}
			}
		}
		else if(len==28)
		{
			if(index==0)
			{
				for(i=2;i<len;i++)
				{
					var c = curCBX.value.charAt(i);	
					if(doHexCheck(c)==-1)
					{
						alert("Invalid Key Value");
						curCBX.focus();
						return false;
					}
				}
			}
			else
			{
				alert("Invalid Key Value");
				curCBX.focus();
				return false;
			}
		}
		else
		{
			alert("Invalid Key Value");
			curCBX.focus();
			return false;
		}
	}
	return true;
}
function checkFocus(value){
	if(WEPSelectIndex == 0){
		document.ConfigForm.WEP_Selection.focus();
	}
}
function autoWLAN_WDS_Active()
{
	if(document.ConfigForm.WDS_EncrypType_Selection != null){
		document.ConfigForm.WDS_EncrypType_Selection.disabled = false;
		document.ConfigForm.WDS_Key.disabled = false;
	}
	document.ConfigForm.WLANWDS_PEER_MAC1.disabled = false;
	document.ConfigForm.WLANWDS_PEER_MAC2.disabled = false;
	document.ConfigForm.WLANWDS_PEER_MAC3.disabled = false;
	document.ConfigForm.WLANWDS_PEER_MAC4.disabled = false;
}	
function autoWLAN_WDS_Deactive()
{
	if(document.ConfigForm.WDS_EncrypType_Selection != null){
		document.ConfigForm.WDS_EncrypType_Selection.disabled = true;
		document.ConfigForm.WDS_Key.disabled = true;
	}
	document.ConfigForm.WLANWDS_PEER_MAC1.disabled = true;
	document.ConfigForm.WLANWDS_PEER_MAC2.disabled = true;
	document.ConfigForm.WLANWDS_PEER_MAC3.disabled = true;
	document.ConfigForm.WLANWDS_PEER_MAC4.disabled = true;
}
function InsExtChOpt(CurrCh)
{
	var ExtChann = document.ConfigForm.ExtChannFlag;
	if ((1*CurrCh >= 36) && (1*CurrCh <= 64))
	{
			CurrCh = 1*CurrCh;
			CurrCh /= 4;
			CurrCh -= 9;
			ExtChann.value = HT5GExtCh[CurrCh];
	}
	else if ((1*CurrCh >= 100) && (1*CurrCh <= 136))
	{
			CurrCh = 1*CurrCh;
			CurrCh /= 4;
			CurrCh -= 17;
			ExtChann.value = HT5GExtCh[CurrCh];
	}
	else if ((1*CurrCh >= 149) && (1*CurrCh <= 161))
	{
			CurrCh = 1*CurrCh;
			CurrCh -= 1;
			CurrCh /= 4;
			CurrCh -= 19;
			ExtChann.value = HT5GExtCh[CurrCh];
	}
	else
	{
			ExtChann.value = 0;
	}
	return ExtChann.value;
}
function doloadSSID2()
{
	if(document.ConfigForm.SSID_INDEX.selectedIndex == 1)
	{
		var j;
		var frm = document.ConfigForm;
		for(j = 0; j < frm.elements.length; j++)
		{	
			if(frm.elements[j].type != "hidden")		
				frm.elements[j].disabled = true;
		}
	}
	document.ConfigForm.SSID_INDEX.disabled = false;
}
function isNumeric(s)
{
  var len = s.length;
  var ch;
  if(len==0)
    return false;
  for( i=0; i< len; i++)
  {
    ch= s.charAt(i);
    if( ch > '9' || ch < '0')
    {
      return false;
    }
  }
  return true;
}
function SelectValue(o,v){
	for(var i=0; i<o.options.length; i++)
		if(o.options[i].value == v){
		o.options[i].selected=true;
		break;
	}
}
<% if tcWebApi_get("WLan11ac_Common","rt_device","h") = "7615" then %>
function doWirelessTxStreamChange(){
	var length = document.ConfigForm.WLan11acVHTChannelBandwidth.options.length;
	var index = document.ConfigForm.WLan11acVHTChannelBandwidth.selectedIndex;
	for(var i=0; i<length; i++)
		document.ConfigForm.WLan11acVHTChannelBandwidth.options.remove(0);
	document.ConfigForm.WLan11acVHTChannelBandwidth.options[0] = new Option("0/40 MHz", "0");
	document.ConfigForm.WLan11acVHTChannelBandwidth.options[1] = new Option("20/40/80 MHz", "1");
	if(document.ConfigForm.TxStream_Action.selectedIndex == 3)
	{
			document.ConfigForm.WLan11acVHTChannelBandwidth.options[2] = new Option("160 MHz", "2");
			document.ConfigForm.WLan11acVHTChannelBandwidth.options[3] = new Option("80+80 MHz", "3");
	}
	if(index > document.ConfigForm.WLan11acVHTChannelBandwidth.options.length-1)
		document.ConfigForm.WLan11acVHTChannelBandwidth.options[1].selected = true;
	else
		document.ConfigForm.WLan11acVHTChannelBandwidth.options[index].selected = true;		
	VHTBandwidthRefreshPage();		
}
function doWirelessRxStreamChange(){
	var length = document.ConfigForm.WLan11acVHTChannelBandwidth.options.length;
	var index = document.ConfigForm.WLan11acVHTChannelBandwidth.selectedIndex;
	for(var i=0; i<length; i++)
		document.ConfigForm.WLan11acVHTChannelBandwidth.options.remove(0);
	document.ConfigForm.WLan11acVHTChannelBandwidth.options[0] = new Option("20/40 MHz", "0");
	document.ConfigForm.WLan11acVHTChannelBandwidth.options[1] = new Option("20/40/80 MHz", "1");
	if(document.ConfigForm.RxStream_Action.selectedIndex == 3)
	{
			document.ConfigForm.WLan11acVHTChannelBandwidth.options[2] = new Option("160 MHz", "2");
			document.ConfigForm.WLan11acVHTChannelBandwidth.options[3] = new Option("80+80 MHz", "3");
	}
	if(index > document.ConfigForm.WLan11acVHTChannelBandwidth.options.length-1)
		document.ConfigForm.WLan11acVHTChannelBandwidth.options[1].selected = true;
	else
		document.ConfigForm.WLan11acVHTChannelBandwidth.options[index].selected = true;		
	VHTBandwidthRefreshPage();		
}
<%end if%>
function showAdvanced() {
	if (ShowAdvanced == 0) {
		$("#adv-div-1").show();
		$("#adv-div-2").show();
		if ($("#WEP_Selection").val() != "OPEN") {
			$("#keyrenwal_div").show();
		}
		ShowAdvanced = 1;
	}
	else {
		$("#adv-div-1").hide();
		$("#adv-div-2").hide();
		$("#keyrenwal_div").hide();
		ShowAdvanced = 0;
	}
}
</script>
	</head>
	<body onload="showUI();" class="container">
<header class="fixed-top"><nav id="top-nav" class="navbar navbar-expand-lg container"><a class="navbar-brand " href="/cgi-bin/home.asp"><div><img src="/img/logo_home.png" width="100" height="18" alt=""><div style="font-family: sans-serif; font-weight: bold;font-size: 12px;color: #000; margin-top: 0">OPTICAL NETWORK TERMINATION</div></div></a><button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"><em class="fas fa-align-justify"></em></span></button><div class="collapse navbar-collapse" id="navbarCollapse"><ul class="navbar-nav mr-auto sidenav" id="navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/home.asp"><%tcWebApi_get("String_Entry","NavigationHomeText","s")%><span class="sr-only"></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/deviceinfo.asp"><%tcWebApi_get("String_Entry","NavigationStatusDeviceText","s")%><span class="sr-only"></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/wifi-mesh-topology.asp"><%tcWebApi_get("String_Entry","EasyMeshStatus5Text","s")%><span class="sr-only"></span></a></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#status-menu" aria-controls="status-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NavigationStatusStatisticsText","s")%></a><ul class="nav-second-level collapse" id="status-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/sta-statistics.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationTrafficText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/sta-wifiusers.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationStatusUsersText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/sta-users.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","ARPStatusText","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#network-menu" aria-controls="network-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NAVNetwork","s")%></a><ul class="nav-second-level collapse" id="network-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/net-wan.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationBasInternetText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/net-lan.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationBasLANText","s")%></span></a></li></ul></li><li class="nav-item active"><a class="nav-link nav-link-collapse nav-link-show" href="#" id="hasSubItems" data-toggle="collapse" data-target="#wifi-menu" aria-controls="wifi-menu" aria-expanded="true"><%tcWebApi_get("String_Entry","NAVWifi","s")%></a><ul class="nav-second-level show" id="wifi-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/wifi.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationWiFiSettingsText","s")%></span></a></li><li class="nav-item active"><a class="nav-link" href="/cgi-bin/wifi-11ac.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationWiFi11acSettingsText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/wifi-mesh.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationMesh","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#firewall-menu" aria-controls="firewall-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NavigationAdvFirewallText","s")%></a><ul class="nav-second-level collapse" id="firewall-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-spi.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","ContentFirewallText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-urlfilter.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","FILTERTYPE_index2","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-macfilter.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVL2Filter","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-parentalcontrol.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","ParentalControlText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/safehome.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","SafehomeText","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#apps-menu" aria-controls="apps-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NAVApplication","s")%></a><ul class="nav-second-level collapse" id="apps-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-dmz.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NatTopDMZText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-portforwarding.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NatVirsvrText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-sslim.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","SessionLimit","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-route.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","StaticRouteText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-ddns.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","dyDNS1Text","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-wifischeduling.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","WifiSchedulingText","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#tools-menu" aria-controls="tools-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NavigationMaintenanceText","s")%></a><ul class="nav-second-level collapse" id="tools-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-admin.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationMainAdminText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-time.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVSysTime","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-firmware.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationMainFirmwareText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-config.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVConfig","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-diagnostic.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationMainDiagnosticsText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-wan2lan.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","Wan2lanText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-log.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVLogs","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-reboot.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","RebootText","s")%></span></a></li></ul></li></ul><div class="top-item-groups"><form name="LanguageForm" method="POST" action="/cgi-bin/wifi-11ac.asp" class="nav-item dropdown"><input type="hidden" name="TokenString" value="<%tcWebApi_getToken()%>"><input type="hidden" name="Language_Flag" value="<% tcWebApi_get("LanguageSwitch_Entry","Type","s") %>"><a class="nav-link dropdown-toggle" href="#" id="LanguageDropdown" role="button" data-toggle="dropdown" aria-expanded="false"><% tcWebApi_get("String_Entry","LoginLanguage","s") %></a><ul class="dropdown-menu" aria-labelledby="LanguageDropdown"><li><a class="dropdown-item <% if tcWebApi_get("LanguageSwitch_Entry","Type","h") = "1" then asp_Write("active") end if %>" href="#" onclick="submitLanguageForm(1);"><% tcWebApi_get("String_Entry","LanguageVIELong","s") %></a></li><li><a class="dropdown-item <% if tcWebApi_get("LanguageSwitch_Entry","Type","h") = "2" then asp_Write("active") end if %>" href="#" onclick="submitLanguageForm(2);"><% tcWebApi_get("String_Entry","LanguageENGLong","s") %></a></li></ul></form><div id="signout" class="nav-item"><a class="nav-link" href="javascript:doLogout();"><em class="fa fa-sign-out-alt"></em><span class="nav-link-text"><% tcWebApi_get("String_Entry","LogoutText","s") %></span></a></div></div></div></header></nav><% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then
	if tcWebApi_get("Mesh_Common", "DeviceRole", "h") = "2" then %>
		<script language='javascript'>
		document.getElementById("network-menu").children[0].style="display: none";
		document.getElementById("network-menu").children[1].style="display: none";
		document.getElementById("wifi-menu").children[0].style="display: none";
		document.getElementById("wifi-menu").children[1].style="display: none";
		</script>
<% end if end if %>		<div id="content">
			<form class="form-inline" METHOD="POST" ACTION="/cgi-bin/wifi-11ac.asp" name="ConfigForm" >
			<div class="row row-w-100">
<input type="hidden" name="TokenString" value="<%tcWebApi_getToken()%>">
<INPUT TYPE="HIDDEN" ID="wlanWEPFlag" NAME="wlanWEPFlag" VALUE="0" >
<INPUT TYPE="HIDDEN" ID="CountryChange" NAME="CountryChange" VALUE="0" >
<INPUT TYPE="HIDDEN" ID="WDS_EncrypType_NONE" NAME="WDS_EncrypType_NONE" value="NONE" >
<INPUT TYPE="HIDDEN" ID="WDS_EncrypType_WEP" NAME="WDS_EncrypType_WEP" value="WEP" >
<INPUT TYPE="HIDDEN" ID="BasicRate_Value1" NAME="BasicRate_Value1" VALUE="15" >
<INPUT TYPE="HIDDEN" ID="BasicRate_Value2" NAME="BasicRate_Value2" VALUE="3" >
<INPUT TYPE="HIDDEN" ID="BasicRate_Value3" NAME="BasicRate_Value3" VALUE="351" >
<INPUT TYPE="HIDDEN" ID="CountryRegionABand0" NAME="CountryRegionABand0" value="0" >
<INPUT TYPE="HIDDEN" ID="CountryRegionABand1" NAME="CountryRegionABand1" value="1" >
<INPUT TYPE="HIDDEN" ID="CountryRegionABand2" NAME="CountryRegionABand2" value="2" >
<INPUT TYPE="HIDDEN" ID="CountryRegionABand3" NAME="CountryRegionABand3" value="3" >
<INPUT TYPE="HIDDEN" ID="CountryRegionABand4" NAME="CountryRegionABand4" value="4" >
<INPUT TYPE="HIDDEN" ID="CountryRegionABand5" NAME="CountryRegionABand5" value="5" >
<INPUT TYPE="HIDDEN" ID="CountryRegionABand6" NAME="CountryRegionABand6" value="6" >
<INPUT TYPE="HIDDEN" ID="CountryRegionABand7" NAME="CountryRegionABand7" value="7" >
<INPUT TYPE="HIDDEN" ID="CountryRegionABand8" NAME="CountryRegionABand8" value="8" >
<INPUT TYPE="HIDDEN" ID="CountryRegionABand9" NAME="CountryRegionABand9" value="9" >
<INPUT TYPE="HIDDEN" ID="CountryRegionABand10" NAME="CountryRegionABand10" value="10" >
<INPUT TYPE="HIDDEN" ID="CountryRegionABand11" NAME="CountryRegionABand11" value="11" >	
<INPUT TYPE="HIDDEN" ID="HTMCSAUTO" NAME="HTMCSAUTO" value="33" >
<INPUT TYPE="HIDDEN" ID="HTBW" NAME="HTBW" value="0" >
<INPUT TYPE="HIDDEN" ID="VHTBW" NAME="VHTBW" value="0" >
<INPUT TYPE="HIDDEN" ID="RTDEVICE" NAME="RTDEVICE" value="<% tcWebApi_get("WLan11ac_Common","rt_device","s") %>" >
<% if tcWebApi_get("WLan11ac_Common","rt_device","h") = "7615" then %>
<INPUT TYPE="HIDDEN" ID="VHTSec80Channel" NAME="VHTSec80Channel" value="<% tcWebApi_get("WLan11ac_Common","VHT_Sec80_Channel","s") %>" >
<INPUT TYPE="HIDDEN" ID="WLan11acITxBfEn" NAME="WLan11acITxBfEn" value="<% tcWebApi_get("WLan11ac_Common","ITxBfEn","s") %>" >
<INPUT TYPE="HIDDEN" ID="WLan11acETxBfEnCond" NAME="WLan11acETxBfEnCond" value="<% tcWebApi_get("WLan11ac_Common","ETxBfEnCond","s") %>" >
<INPUT TYPE="HIDDEN" ID="WLan11acETxBfIncapable" NAME="WLan11acETxBfIncapable" value="<% tcWebApi_get("WLan11ac_Common","ETxBfIncapable","s") %>" >
<% end if %>
<% if tcWebApi_get("WebCustom_Entry","isHTBW40M","h") = "Yes" then %>
<INPUT TYPE="HIDDEN" ID="Wlan_HTBW40M" NAME="Wlan_HTBW40M" value="<% tcWebApi_get("WLan11ac_Common","HT_BSSCoexistence","s") %>" >
<% end if %>
<INPUT TYPE="HIDDEN" ID="Is11nMode" NAME="Is11nMode" value="<% tcWebApi_get("WLan11ac_Common","11nMode","s") %>" >
<INPUT TYPE="HIDDEN" ID="Is11acMode" NAME="Is11acMode" value="<% tcWebApi_get("WLan11ac_Common","11acMode","s") %>" >														
<INPUT TYPE="HIDDEN" ID="CountryName" NAME="CountryName" value="<% tcWebApi_get("WLan11ac_Common","Country","s") %>" >
<INPUT TYPE="HIDDEN" ID="ExtChannFlag" NAME="ExtChannFlag" value="<% tcWebApi_get("WLan11ac_Common","HT_EXTCHA","s") %>" >
<INPUT TYPE="HIDDEN" ID="BssidNum" NAME="BssidNum" value="<% tcWebApi_get("WLan11ac_Common","BssidNum","s") %>" >
<INPUT TYPE="HIDDEN" ID="hCountryRegionABand" NAME="hCountryRegionABand" value="<% tcWebApi_get("WLan11ac_Common","CountryRegionABand","s") %>" >
<% if tcWebApi_get("WebCustom_Entry","isWPSSupported","h") = "Yes"  then %>
<INPUT TYPE="HIDDEN" ID="WPSConfigured" NAME="WPSConfigured" value="2" >
<INPUT TYPE="HIDDEN" ID="WpsConfModeAll" NAME="WpsConfModeAll" value="7" >
<INPUT TYPE="HIDDEN" ID="WpsConfModeNone" NAME="WpsConfModeNone" value="0" >
<INPUT TYPE="HIDDEN" ID="WpsStart" NAME="WpsStart" value="0" >
<INPUT TYPE="HIDDEN" ID="WpsOOB" NAME="WpsOOB" value="0" >
<INPUT TYPE="HIDDEN" ID="WpsGenerate" NAME="WpsGenerate" value="0" >
<INPUT TYPE="HIDDEN" ID="isInWPSing" NAME="isInWPSing" value="<% tcWebApi_get("Info_WLan11ac","wlanWPStimerRunning_0","s") %>" >
<% end if %>
<INPUT TYPE="HIDDEN" ID="maxStaNum" NAME="maxStaNum" value="<% tcWebApi_get("Info_WLan11ac","maxStaNumSupported","s") %>" >
<INPUT TYPE="HIDDEN" ID="isAuthenTypeSupported" NAME="isAuthenTypeSupported" value="<% if tcWebApi_get("Info_WLan11ac","isAuthenTypeSupported","h") = "Yes" then asp_write("1") else asp_write("0") end if %>" >
<INPUT TYPE="HIDDEN" ID="isDot1XSupported" NAME="isDot1XSupported" value="<% if tcWebApi_get("Info_WLan11ac","isDot1XSupported","h") = "Yes" then asp_write("1") else asp_write("0") end if %>" >
<INPUT TYPE="HIDDEN" ID="isDot1XEnhanceSupported" NAME="isDot1XEnhanceSupported" value="<% if tcWebApi_get("Info_WLan11ac","isDot1XEnhanceSupported","h") = "Yes" then asp_write("1") else asp_write("0") end if %>" >
<INPUT TYPE="HIDDEN" ID="isWDSSupported" NAME="isWDSSupported" value="<% if tcWebApi_get("Info_WLan11ac","isWDSSupported","h") = "Yes" then asp_write("1") else asp_write("0") end if %>" >
<INPUT TYPE="HIDDEN" ID="bharti_ssid2" NAME="bharti_ssid2" value="<% if tcWebApi_get("Info_WLan11ac","isbharti","h") = "Yes" then asp_write("1") else asp_write("0") end if %>" >
<INPUT TYPE="HIDDEN" ID="wlan_VC" NAME="wlan_VC" value="<% tcWebApi_get("WebCurSet_Entry","wlan_ac_id","s") %>" >
<INPUT TYPE="HIDDEN" ID="isWPSSupported"  NAME="isWPSSupported" value="<% if tcWebApi_get("WebCustom_Entry","isWPSSupported","h") = "Yes" then asp_write("1") else asp_write("0") end if %>" >
<INPUT TYPE="HIDDEN" ID="isPerSSIDSupport" NAME="isPerSSIDSupport" value="<% if tcWebApi_get("WebCustom_Entry","isPerSSIDSupport","h") = "Yes" then asp_write("1") else asp_write("0") end if %>" >
<INPUT TYPE="HIDDEN" ID="WscV2Support" NAME="WscV2Support" value="<% if tcWebApi_get("WLan11ac_Entry0","WscV2Support","h") = "1" then asp_write("1") else asp_write("0") end if %>" >
<INPUT TYPE="HIDDEN" ID="hRekeyMethod" NAME="hRekeyMethod" value="DISABLE" >				
				<div class="widget col-xs-12 col-lg-12">
					<header><%tcWebApi_get("String_Entry","AccessPointSettingsText","s")%></header>
					<div class="widget-body">
						<fieldset>
							<div class="form-group" id="wlEnbl_div">
								<label class="col-lg-5" for="wlEnbl"><%tcWebApi_get("String_Entry","EnableWirelessText","s")%></label>
								<label class="toggle-switch">
									<input type="checkbox" name="wlan_APenable" id="wlan_APenable" onclick=wlClickEnble(this) value="ON" <% if tcWebApi_get("WLan11ac_Common","APOn","h") = "1" then asp_Write("checked") end if %>>
									<span class="slider"></span>
								</label>
								<input type="hidden" id="hwlKeys0" name="hwlKeys0" value="0">
								<input type="hidden" id="hwlKeys1" name="hwlKeys1" value="0">
								<input type="hidden" id="hwlKeys2" name="hwlKeys2" value="0">
								<input type="hidden" id="hwlKeys3" name="hwlKeys3" value="0">
								<input type="hidden" id="hwlgMode" name="hwlgMode" value="0">
								<input type="hidden" id="hwlAuthMode" name="hwlAuthMode" value="0">
								<input type="hidden" id="hwlEnbl" name="hwlEnbl" value="0">
								<input type="hidden" id="hWPSMode" name="hWPSMode" value="0">
								<input type="hidden" id="henableSsid" name="henableSsid" value="0">
								<input type="hidden" id="hwlHide" name="hwlHide" value="0">
								<!--
								<INPUT TYPE="hidden" id="isInWPSing" NAME="isInWPSing" value="<%If TCWebApi_get("Info_WLan","wlanWPStimerRunning","h") <> "N/A" then tcWebApi_get("Info_WLan","wlanWPStimerRunning","s") else asp_write("0") end if%>">
								<INPUT TYPE="HIDDEN" id="WpsConfModeAll" NAME="WpsConfModeAll" value="7">
								<INPUT TYPE="HIDDEN" id="WpsConfModeNone" NAME="WpsConfModeNone" value="0">
								<INPUT TYPE="hidden" id="hWpsStart" NAME="hWpsStart" value="0">
								<INPUT TYPE="hidden" id="WpsOOB" NAME="WpsOOB" value="0">
								<INPUT TYPE="hidden" id="WpsGenerate" NAME="WpsGenerate" value="0">
								-->
								<INPUT TYPE="hidden" id="isCUCSupport" NAME="isCUCSupport" value="<%if tcWebApi_get("Info_WLan","isCUCSupport","h")="Yes" then asp_write("1") else asp_write("0") end if%>">
								<INPUT type="hidden" id="SSIDPre" NAME="SSIDPre" value="<%tcWebApi_get("WLan_Common","SSIDPre","s")%>">			
								<INPUT type="HIDDEN" NAME="isDot1XSupported" value="<% if tcWebApi_get("Info_WLan","isDot1XSupported","h") = "Yes" then asp_write("1") else asp_write("0") end if %>">
								<INPUT type="HIDDEN" NAME="isDot1XEnhanceSupported" value="<% if tcWebApi_get("Info_WLan","isDot1XEnhanceSupported","h") = "Yes" then asp_write("1") else asp_write("0") end if %>">	
								<INPUT TYPE="HIDDEN" ID="isWDSSupported" NAME="isWDSSupported" value="0" >
								<INPUT TYPE="HIDDEN" ID="WDS_EncrypType_NONE" NAME="WDS_EncrypType_NONE" value="NONE" >
							</div>
							<div class="form-group col-lg-12" id="wifischedule_band_note" style="display: none;">
								<label class=" input-description">
									<p><%tcWebApi_get("String_Entry","WSWarningText","s")%>&nbsp;<a href="/cgi-bin/apps-wifischeduling.asp"><%tcWebApi_get("String_Entry","WifiSchedulingText","s")%></a>.</p>
								</label>
							</div>
							<div class="form-group col-lg-12" id="bandsteeringnote_div" style="display: none;">
								<label class=" input-description">
							<% if tcWebApi_get("WebCurSet_Entry","wlan_ac_id","h") = "0" then %>
								<p><%tcWebApi_get("String_Entry","BandSteeringNote1Text","s")%>&nbsp;<a href="/cgi-bin/home.asp"><%tcWebApi_get("String_Entry","NavigationHomeText","s")%></a>.</p>
							<% else %>
								<p><%tcWebApi_get("String_Entry","BandSteeringNote2Text","s")%>&nbsp;<a href="/cgi-bin/home.asp"><%tcWebApi_get("String_Entry","NavigationHomeText","s")%></a>.</p>
							<% end if %>
								</label>
							</div>
						</fieldset>
						<div id="wlInfo"  style="display: none">
						<fieldset >
							<div class="form-group" id=>
								<label class="col-lg-5" for="WirelessMode"><%tcWebApi_get("String_Entry","ModeText","s")%></label>
								<div class="col-lg-5 custom-select">
									<SELECT ID="WirelessMode" NAME="WirelessMode" SIZE="1" onChange="doWirelessModeChange()">
										<OPTION value="2" <% if tcWebApi_get("WLan11ac_Common","WirelessMode","h") = "2" then asp_Write("selected") end if %> >802.11a </OPTION>
										<OPTION value="11" <% if tcWebApi_get("WLan11ac_Common","WirelessMode","h") = "11" then asp_Write("selected") end if %> >802.11n</OPTION>
										<OPTION value="8" <% if tcWebApi_get("WLan11ac_Common","WirelessMode","h") = "8" then asp_Write("selected") end if %> >802.11a/n</OPTION>
										<OPTION value="14" <% if tcWebApi_get("WLan11ac_Common","WirelessMode","h") = "14" then asp_Write("selected") end if %> >802.11a/n/ac</OPTION>
										<OPTION value="15" <% if tcWebApi_get("WLan11ac_Common","WirelessMode","h") = "15" then asp_Write("selected") end if %> >802.11ac</OPTION>
									</SELECT>
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-5" for=""><%tcWebApi_get("String_Entry","SelectChannelText","s")%></label>
								<div class="col-lg-5 custom-select">
									<SELECT ID="Countries_Channels" NAME="Countries_Channels" SIZE="1" onChange="doRegionCheck()" >
										<SCRIPT language=javascript >
											var countryarr = new Array(98);
											countryarr[0]="ALBANIA";
											countryarr[1]="ALGERIA";
											countryarr[2]="ARGENTINA";
											countryarr[3]="ARMENIA";
											countryarr[4]="AUSTRALIA";
											countryarr[5]="AUSTRIA";
											countryarr[6]="AZERBAIJAN";
											countryarr[7]="BAHRAIN";
											countryarr[8]="BELARUS";
											countryarr[9]="BELGIUM";
											countryarr[10]="BELIZE";
											countryarr[11]="BOLIVIA";
											countryarr[12]="BRAZIL";
											countryarr[13]="BRUNEI DARUSSALAM";
											countryarr[14]="BULGARIA";
											countryarr[15]="CANADA";
											countryarr[16]="CHILE";
											countryarr[17]="CHINA";
											countryarr[18]="COLOMBIA";
											countryarr[19]="COSTA RICA";
											countryarr[20]="CROATIA";
											countryarr[21]="CYPRUS";
											countryarr[22]="CZECH REPUBLIC";
											countryarr[23]="DENMARK";
											countryarr[24]="DOMINICAN REPUBLIC";
											countryarr[25]="ECUADOR";
											countryarr[26]="EGYPT";
											countryarr[27]="ELSALVADOR";
											countryarr[28]="FINLAND";
											countryarr[29]="FRANCE";
											countryarr[30]="GEORGIA";
											countryarr[31]="GERMANY";
											countryarr[32]="GREECE";
											countryarr[33]="GUATEMALA";
											countryarr[34]="HONDURAS";
											countryarr[35]="HONGKONG";
											countryarr[36]="HUNGARY";
											countryarr[37]="ICELAND";
											countryarr[38]="INDIA";
											countryarr[39]="INDONESIA";
											countryarr[40]="IRAN";
											countryarr[41]="IRELAND";
											countryarr[42]="ISRAEL";
											countryarr[43]="ITALY";
											countryarr[44]="JAPAN";
											countryarr[45]="KAZAKHSTAN";
											countryarr[46]="KOREA DEMOCRATIC";
											countryarr[47]="KOREA REPUBLIC";
											countryarr[48]="LATVIA";
											countryarr[49]="LEBANON";
											countryarr[50]="LIECHTENSTEIN";
											countryarr[51]="LITHUANIA";
											countryarr[52]="LUXEMBOURG";
											countryarr[53]="MACAU";
											countryarr[54]="MACEDONIA";
											countryarr[55]="MALAYSIA";
											countryarr[56]="MEXICO";
											countryarr[57]="MONACO";
											countryarr[58]="MOROCCO";
											countryarr[59]="NETHERLANDS";
											countryarr[60]="NEW ZEALAND";
											countryarr[61]="NORWAY";
											countryarr[62]="OMAN";
											countryarr[63]="PAKISTAN";
											countryarr[64]="PANAMA";
											countryarr[65]="PERU";
											countryarr[66]="PHILIPPINES";
											countryarr[67]="POLAND";
											countryarr[68]="PORTUGAL";
											countryarr[69]="PUERTO RICO";
											countryarr[70]="QATAR";
											countryarr[71]="ROMANIA";
											countryarr[72]="RUSSIA";
											countryarr[73]="SAUDI ARABIA";
											countryarr[74]="SINGAPORE";
											countryarr[75]="SLOVAKIA";
											countryarr[76]="SLOVENIA";
											countryarr[77]="SOUTH AFRICA";
											countryarr[78]="SPAIN";
											countryarr[79]="SWEDEN";
											countryarr[80]="SWITZERLAND";
											countryarr[81]="SYRIAN ARAB REPUBLIC";
											countryarr[82]="TAIWAN";
											countryarr[83]="THAILAND";
											countryarr[84]="TRINIDAD AND TOBAGO";
											countryarr[85]="TUNISIA";
											countryarr[86]="TURKEY";
											countryarr[87]="UKRAINE";
											countryarr[88]="UNITED ARAB EMIRATES";
											countryarr[89]="UNITED KINGDOM";
											countryarr[90]="UNITED STATES";
											countryarr[91]="URUGUAY";
											countryarr[92]="UZBEKISTAN";
											countryarr[93]="VENEZUELA";
											countryarr[94]="VIETNAM";
											countryarr[95]="YEMEN";
											countryarr[96]="ZIMBABWE";
											countryarr[97]="Undefined";
											for(i=0;i<98;i++)
											{
												if(document.ConfigForm.CountryName.value.match(countryarr[i]) != null)
												{
													document.ConfigForm.Countries_Channels[i]=new Option(countryarr[i],countryarr[i],false,true);
													document.ConfigForm.Countries_Channels[i].selected=true;
												}
												else
												{
													if(countryarr[i].match("TAIWAN") !=null){
														document.ConfigForm.Countries_Channels[i]=new Option(countryarr[i],countryarr[i],true,false);
													}
													else
													{
														document.ConfigForm.Countries_Channels[i]=new Option(countryarr[i],countryarr[i],false,false);
														document.ConfigForm.Countries_Channels[i].selected=false;
													}
												}
											}	
										</SCRIPT>				
									</SELECT> 
								</div>
								&nbsp;
								<!-- <div class="col-lg-1 custom-select <% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then asp_write("d-none") end if%> "> -->
								<div class="col-lg-1 custom-select">
									<SELECT ID="Channel_ID" NAME="Channel_ID" SIZE="1" onChange="doExtChaLockChange()"></SELECT>
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-5" for="CurrentChannel"><%tcWebApi_get("String_Entry","CurrentChannelText","s")%></label>
<% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then %>
								<INPUT class="form-control col-lg-5" TYPE="TEXT" ID="CurrentChannel" NAME="CurrentChannel" STYLE="WIDTH:62" MAXLENGTH="2" VALUE="<% If tcWebApi_get("Info_WLan11ac","CurrentChannel","h") <> "N/A" then tcWebApi_get("Info_WLan11ac","CurrentChannel","s") end if %>" disabled >
<% else %>
<% if tcWebApi_get("WLan11ac_Common","Channel","h") = "0" then %>
								<INPUT class="form-control col-lg-5" TYPE="TEXT" ID="CurrentChannel" NAME="CurrentChannel" STYLE="WIDTH:62" MAXLENGTH="2" VALUE="<% If tcWebApi_get("Info_WLan11ac","CurrentChannel","h") <> "N/A" then tcWebApi_get("Info_WLan11ac","CurrentChannel","s") end if %>" disabled >
<% else %>
								<INPUT class="form-control col-lg-5" TYPE="TEXT" ID="CurrentChannel_Common" NAME="CurrentChannel" STYLE="WIDTH:62" MAXLENGTH="2" VALUE="<% If tcWebApi_get("WLan11ac_Common","Channel","h") <> "N/A" then tcWebApi_get("WLan11ac_Common","Channel","s") end if %>" disabled >
<% end if %>
<% end if %>
							</div>
						</fieldset>
						<fieldset id="11nMode_1_div">
							<div class="form-group" id=>
								<label class="col-lg-5" for="WLANChannelBandwidth"><%tcWebApi_get("String_Entry","BandwidthText","s")%></label>
								<div class="col-lg-5 custom-select">
									<select id="WLANChannelBandwidth" name="WLANChannelBandwidth" STYLE="WIDTH:105" SIZE="1" onChange="doChannelBandwidthChange();" >
										<option value="0" <% if tcWebApi_get("WLan11ac_Common","HT_BW","h") = "0" then asp_Write("selected") end if %> >20 MHz</option>
<% if tcWebApi_get("WebCustom_Entry","isHTBW40M","h") = "Yes" then %>
										<option value="2" <% If tcWebApi_get("WLan11ac_Common","HT_BW","h") = "1" Then %> <% if tcWebApi_get("WLan11ac_Common","HT_BSSCoexistence","h") = "0" then asp_Write("selected") end if %><% End If %> >40 MHz</option>
										<option value="1" <% If tcWebApi_get("WLan11ac_Common","HT_BSSCoexistence","h") = "1" Then %>
										<% if tcWebApi_get("WLan11ac_Common","HT_BW","h") <> "0" then asp_Write("selected") end if %> <% End If %>
										<% if tcWebApi_get("WLan11ac_Common","HT_BW","h") = "N/A" then asp_Write("selected") end if %> >20/40 MHz</option>
<% else %>
										<option value="1" <% if tcWebApi_get("WLan11ac_Common","HT_BW","h") = "1" then asp_Write("selected") end if %><% if tcWebApi_get("WLan11ac_Common","HT_BW","h") = "N/A" then asp_Write("selected") end if %> >20/40 MHz</option>
<% end if %>
									</select>
								</div>
							</div>
							<div class="form-group" id="HT_BW_1_div" style="display:none">
								<label class="col-lg-5" for="WLANExtenedChannelBW"><%tcWebApi_get("String_Entry","ExtenedChannelText","s")%></label>
								<div class="col-lg-5 custom-select">
									<select id="WLANExtensionChannel" name="WLANExtensionChannel" SIZE="1" onChange="doExtChannChange();">
										<option value="0" <% if tcWebApi_get("WLan11ac_Common","HT_EXTCHA","h") = "0" then asp_Write("selected") end if %><% if tcWebApi_get("WLan11ac_Common","HT_EXTCHA","h") = "N/A" then asp_Write("selected") end if %> ><%tcWebApi_get("String_Entry","DownExtenedChannelText","s")%></option>
										<option value="1" <% if tcWebApi_get("WLan11ac_Common","HT_EXTCHA","h") = "1" then asp_Write("selected") end if %> ><%tcWebApi_get("String_Entry","UpExtenedChannelText","s")%></option>
									</select>
								</div>
							</div>
							<div class="form-group" style="display:none">
								<label class="col-lg-5" for="WLANGuardInterval"><%tcWebApi_get("String_Entry","ProtectedIntervalText","s")%></label>
								<div class="col-lg-5 custom-select">
									<select id="WLANGuardInterval" name="WLANGuardInterval" SIZE="1" >
										<option value="0" <% if tcWebApi_get("WLan11ac_Common","HT_GI","h") = "0" then asp_Write("selected") end if %> >800 nsec</option>
										<option value="1" <% if tcWebApi_get("WLan11ac_Common","HT_GI","h") = "1" then asp_Write("selected") end if %><% if tcWebApi_get("WLan11ac_Common","HT_GI","h") = "N/A" then asp_Write("selected") end if %> >AUTO</option>
									</select>
								</div>
							</div>
							<div class="form-group" style="display:none">
								<label class="col-lg-5" for="WLANMCS">MCS</label>
								<div class="col-lg-5 custom-select">
									<select id="WLANMCS" name="WLANMCS" STYLE="WIDTH:105" SIZE="1" ></select>
								</div>
							</div>
						</fieldset>
						<fieldset id="11acMode_1_div">
							<div class="form-group">
								<label class="col-lg-5" for="WLan11acVHTChannelBandwidth"> <%tcWebApi_get("String_Entry","BandwidthText","s")%></label>
								<div class="col-lg-5 custom-select">
									<select id="WLan11acVHTChannelBandwidth" name="WLan11acVHTChannelBandwidth" SIZE="1" onChange="doVHTBandwidthChange();">
										<option value="0" <% if tcWebApi_get("WLan11ac_Common","HT_BW","h") = "0" then asp_Write("selected") end if %> > 20 MHz</option>
										<option value="1" <% if tcWebApi_get("WLan11ac_Common","HT_BW","h") = "1" then %><% if tcWebApi_get("WLan11ac_Common","VHT_BW","h") = "0" then %> 
											<% if tcWebApi_get("WLan11ac_Common","HT_BSSCoexistence","h") = "0" then asp_Write("selected") end if  %> <% end if %> <% end if %> > 40 MHz</option>
										<option value="2" <% if tcWebApi_get("WLan11ac_Common","HT_BW","h") = "1" then %><% if tcWebApi_get("WLan11ac_Common","VHT_BW","h") = "1" then %> 
											<% if tcWebApi_get("WLan11ac_Common","HT_BSSCoexistence","h") = "0" then asp_Write("selected") end if  %> <% end if %> <% end if %> > 80 MHz</option>
										<option value="3" <% if tcWebApi_get("WLan11ac_Common","HT_BW","h") = "1" then %><% if tcWebApi_get("WLan11ac_Common","VHT_BW","h") = "1" then %> 
											<% if tcWebApi_get("WLan11ac_Common","HT_BSSCoexistence","h") = "1" then asp_Write("selected") end if  %> <% end if %> <% end if %> > 20/40/80 MHz</option>
									</select>
								</div>
							</div>
<% If tcWebApi_get("WLan11ac_Common","rt_device","h") = "7615" Then %>
							<div id="WLan11ac2ndFrequencyTable" style="display:none">
								<div class="form-group">
									<label class="col-lg-5" for="WLan11ac2ndFrequency"><%tcWebApi_get("String_Entry","SecondFrequencyText","s")%></label>
									<div class="col-lg-5 custom-select">
										<select id="WLan11ac2ndFrequency" name="WLan11ac2ndFrequency" SIZE="1" onChange="onVHTbwChannelChange();"></select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-lg-5" for="WLan11acTxBeamForming"><%tcWebApi_get("String_Entry","FixTransmissionText","s")%></label>
									<div class="col-lg-5 custom-select">
										<select id="WLan11acTxBeamForming" name="WLan11acTxBeamForming" STYLE="WIDTH:109" SIZE="1">
											<option value="3">Both</option>
											<option value="2">Explicit TxBF</option>
											<option value="1">Implicit TxBF</option>
											<option value="0">Disable</option>
										</select>
									</div>
								</div>
							</div>
<% end if %>
							<div class="form-group" style="display:none">
								<label class="col-lg-5" for="WLan11acVHTGuardInterval">VHT<%tcWebApi_get("String_Entry","ProtectedIntervalText","s")%></label>
								<div class="col-lg-5 custom-select">
									<select id="WLan11acVHTGuardInterval" name="WLan11acVHTGuardInterval" STYLE="WIDTH:109" SIZE="1">
										<option value="0" <% if tcWebApi_get("WLan11ac_Common","VHT_SGI","h") = "0" then asp_Write("selected") end if %>>800 nsec</option>
										<option value="1" <% if tcWebApi_get("WLan11ac_Common","VHT_SGI","h") = "1" then asp_Write("selected") end if %><% if tcWebApi_get("WLan11ac_Common","VHT_SGI","h") = "N/A" then asp_Write("selected") end if %>>AUTO</option>
									</select>
								</div>
							</div>
						</fieldset>
						<fieldset id="adv-div-1" style="display: none;">
							<div class="form-group" id=wlPutOutPower>
								<label class="col-lg-5" for="wlTxPwr"><%tcWebApi_get("String_Entry","TransmittedPowerText","s")%></label>
								<div class="col-lg-5 custom-select">
									<SELECT style="WIDTH: 123px" size=1 id=wlTxPwr name=wlTxPwr> 
										<OPTION value=3 <% if tcWebApi_get("WLan11ac_Common","TxPower","h") = "25" then asp_Write("selected") end if %> >25%</OPTION> 
										<OPTION value=2 <% if tcWebApi_get("WLan11ac_Common","TxPower","h") = "50" then asp_Write("selected") end if %> >50%</OPTION> 
										<OPTION value=1 <% if tcWebApi_get("WLan11ac_Common","TxPower","h") = "75" then asp_Write("selected") end if %> >75%</OPTION> 
										<OPTION value=6 <% if tcWebApi_get("WLan11ac_Common","TxPower","h") = "100" then asp_Write("selected") end if %> >100%</OPTION> 
									</SELECT> 
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-5" for="DTIM"><%tcWebApi_get("String_Entry","DTIMIntervalText","s")%></label>
								<INPUT class="form-control col-lg-3" TYPE="TEXT" ID="DTIM" NAME="DTIM" STYLE="WIDTH:62" MAXLENGTH="5" VALUE="<% If tcWebApi_get("WLan11ac_Common","DtimPeriod","h") <> "N/A" then tcWebApi_get("WLan11ac_Common","DtimPeriod","s") else asp_Write("1") end if %>" >&nbsp;
								(<%tcWebApi_get("String_Entry","RangeText","s")%> 1~255)
							</div>
							<div class="form-group">
								<label class="col-lg-5" for="BeaconInterval"><%tcWebApi_get("String_Entry","BeanconIntervalText","s")%></label>
								<INPUT class="form-control col-lg-3" TYPE="TEXT" ID="BeaconInterval" NAME="BeaconInterval" STYLE="WIDTH:62" MAXLENGTH="4" VALUE="<% If tcWebApi_get("WLan11ac_Common","BeaconPeriod","h") <> "N/A" then tcWebApi_get("WLan11ac_Common","BeaconPeriod","s") else asp_Write("100") end if %>">&nbsp;
								(<%tcWebApi_get("String_Entry","BeaconRangeTipText","s")%>)
							</div>
							<div class="form-group">
								<label class="col-lg-5" for="RTSThreshold"><%tcWebApi_get("String_Entry","WlanRTSThresholdText","s")%></label>
								<INPUT class="form-control col-lg-3" TYPE="TEXT"  ID="RTSThreshold" NAME="RTSThreshold" STYLE="WIDTH:62" MAXLENGTH="5" VALUE="<% If tcWebApi_get("WLan11ac_Common","RTSThreshold","h") <> "N/A" then tcWebApi_get("WLan11ac_Common","RTSThreshold","s") else asp_Write("2347") end if %>">&nbsp;
								(<%tcWebApi_get("String_Entry","RTSrangeTipText","s")%>)
							</div>
							<div class="form-group">
								<label class="col-lg-5" for="FragmentThreshold"><%tcWebApi_get("String_Entry","WlanFragmentThresholdText","s")%></label>
								<INPUT class="form-control col-lg-3" TYPE="TEXT" ID="FragmentThreshold" NAME="FragmentThreshold" STYLE="WIDTH:62" MAXLENGTH="5" VALUE="<% If tcWebApi_get("WLan11ac_Common","FragThreshold","h") <> "N/A" then tcWebApi_get("WLan11ac_Common","FragThreshold","s") else asp_Write("2346") end if %>">&nbsp;
								(<%tcWebApi_get("String_Entry","FragmentRangeTipText","s")%>)
							</div>
						</fieldset>
					</div>
					</div>
					<header style="display: none" id="ssid-header"><%tcWebApi_get("String_Entry","SSIDSettingsText","s")%></header>
					<div  style="display: none" class="widget-body" id="ssid-widget">
						<fieldset>
							<div class="form-group" id=>
								<div class="form-group col-lg-12" id="wifischedule_note" style="display: none;">
									<label class=" input-description">
										<p><%tcWebApi_get("String_Entry","WSWarningText","s")%>&nbsp;<a href="/cgi-bin/apps-wifischeduling.asp"><%tcWebApi_get("String_Entry","WifiSchedulingText","s")%></a>.</p>
									</label>
								</div>
								<label class="col-lg-5" for="SSID_INDEX"><%tcWebApi_get("String_Entry","IndexText","s")%></label>
								<div class="col-lg-5 custom-select">
									<select ID="SSID_INDEX" NAME="SSID_INDEX" SIZE="1" onChange="doSSIDChange()">
										<OPTION value="0" <% if TCWebApi_get("WebCurSet_Entry","wlan_ac_id","h") = "0" then asp_write("selected") end if %> >SSIDAC1</OPTION>
<% if tcWebApi_get("GUI_Entry0","ssidOneOnly","h") <> "support" then %>
<% if tcWebApi_get("WebCustom_Entry","isFonSupport","h") <> "Yes" then %>
										<OPTION value="1" <% if TCWebApi_get("WebCurSet_Entry","wlan_ac_id","h") = "1" then asp_write("selected") end if %> >SSIDAC2</OPTION>
<% end if %>
										<OPTION value="2" <% if TCWebApi_get("WebCurSet_Entry","wlan_ac_id","h") = "2" then asp_write("selected") end if %> >SSIDAC3</OPTION>
<% if tcWebApi_get("Mesh_dat","MapEnable","h") <> "1" then %>
										<OPTION value="3" <% if TCWebApi_get("WebCurSet_Entry","wlan_ac_id","h") = "3" then asp_write("selected") end if %> >SSIDAC4</OPTION>
<% end if %>
<% end if %>
									</select>
								</div>
							</div>
							<div class="form-group" id="enableSsid_div">
								<label class="col-lg-5" for="ESSID_Enable_Selection"><%tcWebApi_get("String_Entry","EnableSSIDText","s")%></label>
								<label class="toggle-switch">
									<INPUT type=checkbox id=ESSID_Enable_Selection name=ESSID_Enable_Selection  <% If tcWebApi_get("WLan11ac_Entry","EnableSSID","h") = "1" then asp_Write("checked") end if %>>
									<span class="slider"></span>
								</label>
							</div>
							<div class="form-group">
								<label class="col-lg-5" for="wlSsid">SSID</label>
								<INPUT class="form-control col-lg-5" ID="ESSID" NAME="ESSID" MAXLENGTH="32" VALUE="<% If tcWebApi_get("WLan11ac_Entry","SSID","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry","SSID","s") end if %>">
							</div>
							<div class="form-group">
								<label class="col-lg-5" for="ESSID_HIDE_Selection"><%tcWebApi_get("String_Entry","CancelBroadcastText","s")%></label>
								<label class="toggle-switch">
									<INPUT type=checkbox <% If tcWebApi_get("WLan11ac_Entry","HideSSID","h") = "1" then asp_Write("checked") end if %> <% If tcWebApi_get("WLan11ac_Entry","HideSSID","h") = "N/A" then asp_Write("checked") end if %> onClick="doBroadcastSSIDChange();" id=ESSID_HIDE_Selection name=ESSID_HIDE_Selection>
									<span class="slider"></span>
								</label>
							</div>
							<div class="form-group" id="adv-div-2" style="display: none;">
								<label class="col-lg-5" for="wlSsid"><%tcWebApi_get("String_Entry","ConnectDeviceText","s")%></label>
								<INPUT class="form-control col-lg-5" ID="StationNum" NAME="StationNum" TYPE="text" STYLE="WIDTH:62" value="<% if tcWebApi_get("WLan11ac_Entry","MaxStaNum","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry","MaxStaNum","s") else asp_Write("0") end if %>" MAXLENGTH="2" >
								<label class="offset-lg-5 input-description">(<%tcWebApi_get("String_Entry","RangeText","s")%> 1~32)</label>
							</div>
							<div class="form-group" id="11nMode_0_div" style="display: none">
								<label class="col-lg-5" for="WMM_Selection">WMM<%tcWebApi_get("String_Entry","EnableText","s")%></label>
								<label class="toggle-switch">
									<INPUT type=checkbox<% If tcWebApi_get("WLan11ac_Entry","WMM","h") = "1" then asp_Write("checked") end if %> onClick="doBroadcastSSIDChange();" id=WMM_Selection name=WMM_Selection>
									<span class="slider"></span>
								</label>
							</div>
							<DIV id=authen>
							<div class="form-group" id=>
								<label class="col-lg-5" for="wlSecurMode"><%tcWebApi_get("String_Entry","WirelessAuthTypeText","s")%></label>
								<div class="col-lg-5 custom-select">
									<SELECT ID="WEP_Selection" NAME="WEP_Selection" SIZE="1" onChange="doWEPChange()">
										<OPTION value="OPEN" <% if tcWebApi_get("WLan11ac_Entry","AuthMode","h") = "OPEN" then asp_Write("selected") elseif tcWebApi_get("WLan11ac_Entry","AuthMode","h") = "N/A" then asp_Write("selected") end if %> >OPEN</OPTION>
										<OPTION value="WPAPSK" <% if tcWebApi_get("WLan11ac_Entry","AuthMode","h") = "WPAPSK" then asp_Write("selected") end if %>  >WPA-PSK</OPTION>
										<OPTION value="WPA2PSK" <% if tcWebApi_get("WLan11ac_Entry","AuthMode","h") = "WPA2PSK" then asp_Write("selected") end if %> >WPA2-PSK</OPTION>
										<OPTION value="WPAPSKWPA2PSK" <% if tcWebApi_get("WLan11ac_Entry","AuthMode","h") = "WPAPSKWPA2PSK" then asp_Write("selected") end if %> >WPA/WPA2-PSK</OPTION>
									</SELECT>
								</div>
							</div>
							<div class="form-group" id=wpaPreShareKey>
								<label class="col-lg-5" for="PreSharedKey"><%tcWebApi_get("String_Entry","PasswordText","s")%></label>
								<div class="input-group col-lg-5 px-0">
									<input class="form-control" TYPE="password" ID="PreSharedKey" NAME="PreSharedKey" STYLE="WIDTH:140" SIZE="48" MAXLENGTH="63" VALUE="<% If tcWebApi_get("WLan11ac_Entry","WPAPSK","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry","WPAPSK","s") end if %>" >
									<div class="input-group-addon show-password-btn">
										<a href="#" id="pw-eye"><i class="fa fa-eye-slash" aria-hidden="true"></i></a>
									</div>
								</div>
								<!-- <label class="offset-lg-5 input-description">(8~63<%tcWebApi_get("String_Entry","CharactersOr64StringText","s")%>)</label> -->
							</div>
							<div class="form-group" id="keyrenwal_div" style="display: none;">
								<label class="col-lg-5" for="wlSsid"><%tcWebApi_get("String_Entry","KeyRenwalText","s")%></label>
								<INPUT class="form-control col-lg-5" id="keyRenewalInterval" NAME="keyRenewalInterval" SIZE="7" MAXLENGTH="7" >&nbsp;<%tcWebApi_get("String_Entry","SecondsText","s")%>
							</div>
							<script language="JavaScript" type="text/JavaScript">
								var rekeystr = "<% tcWebApi_get("WLan11ac_Entry","RekeyInterval","s") %>";
								if("N/A" == rekeystr || "" == rekeystr)
									document.getElementById('keyRenewalInterval').value = "3600";
								else
									document.getElementById('keyRenewalInterval').value = rekeystr;
							</script>
							<div class="form-group" id=encr_type_div>
								<label class="col-lg-5" for="TKIP_Selection"><%tcWebApi_get("String_Entry","EncryptionTypeText","s")%></label>
								<div class="col-lg-5 custom-select">
									<SELECT ID="TKIP_Selection" NAME="TKIP_Selection" onChange="doEncryptionChange(this)" SIZE="1">
										<OPTION value="TKIP" <% If tcWebApi_get("WLan11ac_Entry","EncrypType","h") = "TKIP" then asp_Write("selected") end if %> >TKIP</OPTION>
										<OPTION value="AES" <% if tcWebApi_get("WLan11ac_Entry","EncrypType","h") = "AES" then asp_Write("selected") end if %> >AES</OPTION>
										<OPTION value="TKIPAES" <% if tcWebApi_get("WLan11ac_Entry","EncrypType","h") = "TKIPAES" then asp_Write("selected") end if %> >TKIP+AES</OPTION>
									</SELECT>
								</div>
							</div>
							<DIV id=wpsinfo>
								<div class="form-group" id="wpsenableTR">
									<label class="col-lg-5" for="enableWps"><%tcWebApi_get("String_Entry","WPSEnableText","s")%></label>
									<label class="toggle-switch">
										<INPUT type=checkbox id=UseWPS_Selection name=UseWPS_Selection <% If tcWebApi_get("WLan11ac_Entry","WPSConfMode","h") <> "0" then asp_Write("checked") end if %> onclick="doWPSUseChange()">
										<span class="slider"></span>
										<INPUT TYPE="hidden" id="WpsActive" NAME="WpsActive" value="0">
									</label>
								</div>
								<div class="form-group d-none" id=wpsmodeTR style="display: none">
									<label class="col-lg-5" for="wpsmode">WPS <%tcWebApi_get("String_Entry","ModeText","s")%></label>
									<div class="col-lg-5 custom-select">
										<SELECT id=wpsmode style="WIDTH: 123px" onchange=wpsModeChange() size=1 name=wpsmode>
											<OPTION value=ap-pbc <%if tcWebApi_get("WLan11ac_Entry","WPSMode","h") = "1" then asp_Write("selected") end if%>>PBC</OPTION>
											<OPTION value=ap-pin <%if tcWebApi_get("WLan11ac_Entry","WPSMode","h") = "0" then asp_Write("selected") end if%>>PIN</OPTION>
										</SELECT>
									</div>
								</div>
								<div id="WPSConfMode_1_div" style="display: none">
								<div class="form-group" id=wpssta>
									<label class="col-lg-5" for="wpsmode"><%tcWebApi_get("String_Entry","WPSStatusText","s")%></label>
									<label class="col-lg-5 status-value "><% if tcWebApi_get("Info_WLan11ac", "wlanWPSStatus_0", "h") = "Idle" then asp_Write("Idle")
					elseif tcWebApi_get("Info_WLan11ac", "wlanWPSStatus_0", "h") = "In progress" then asp_Write("Inprogress")
					elseif tcWebApi_get("Info_WLan11ac", "wlanWPSStatus_0", "h") = "Configured" then asp_Write("Configured")
					elseif tcWebApi_get("Info_WLan11ac", "wlanWPSStatus_0", "h") = "WPS process Fail" then asp_Write("WPS process Fail")
					else tcWebApi_get("Info_WLan11ac", "wlanWPSStatus_0", "s") end if%></label>
								</div>
								<div class="form-group" id="ResetOOB" >
									<div class="d-none d-lg-block col-lg-5"></div>
									<input class="btn small-button btn-secondary" id="StartWPS" name="StartWPS" value="<% IF tcWebApi_get("Info_WLan11ac","wlanWPStimerRunning_0","h") = "0" then asp_Write("Start WPS") end if %> <% IF tcWebApi_get("Info_WLan11ac","wlanWPStimerRunning_0","h") = "1" then asp_Write("Stop WPS") end if %><% IF tcWebApi_get("Info_WLan11ac","wlanWPStimerRunning_0","h") = "N/A" then asp_Write("Start WPS") end if %>" onclick="doStartWPS();" type="button">
									<!-- <input class="btn small-button btn-secondary" name="ResetOOB" value="Reset to OOB" onclick="doResetOOB();" type="button" > -->
								</div>
							</DIV>
							</DIV>
<% if tcWebApi_get("WLan11ac_Common","rt_device","h") = "7615" then %>
							<div class="form-group" style="display:none">
								<label class="col-lg-5" for="TKIP_Selection">Tx Stream</label>
								<div class="col-lg-5 custom-select">
									<SELECT NAME="TxStream_Action" SIZE="1" onChange="doWirelessTxStreamChange()">
										<OPTION value="1" <% if tcWebApi_get("WLan11ac_Common","HT_TxStream","h") = "1" then asp_Write("selected") end if %>>1
										<OPTION value="2" <% if tcWebApi_get("WLan11ac_Common","HT_TxStream","h") = "2" then asp_Write("selected") end if %>>2
										<% if tcWebApi_get("Info_WLan11ac","isMT7615DSupported","h") <> "Yes" then %>				
										<OPTION value="3" <% if tcWebApi_get("WLan11ac_Common","HT_TxStream","h") = "3" then asp_Write("selected") end if %>>3
										<OPTION value="4" <% if tcWebApi_get("WLan11ac_Common","HT_TxStream","h") = "4" then asp_Write("selected") end if %>>4	
										<%end if%>
									</SELECT>
								</div>
							</div>
							<div class="form-group" style="display:none">
								<label class="col-lg-5" for="TKIP_Selection">Rx Stream</label>
								<div class="col-lg-5 custom-select">
									<SELECT NAME="RxStream_Action" SIZE="1" onChange="doWirelessTxStreamChange()">
										<OPTION value="1" <% if tcWebApi_get("WLan11ac_Common","HT_RxStream","h") = "1" then asp_Write("selected") end if %>>1
										<OPTION value="2" <% if tcWebApi_get("WLan11ac_Common","HT_RxStream","h") = "2" then asp_Write("selected") end if %>>2
										<% if tcWebApi_get("Info_WLan11ac","isMT7615DSupported","h") <> "Yes" then %>				
										<OPTION value="3" <% if tcWebApi_get("WLan11ac_Common","HT_RxStream","h") = "3" then asp_Write("selected") end if %>>3
										<OPTION value="4" <% if tcWebApi_get("WLan11ac_Common","HT_RxStream","h") = "4" then asp_Write("selected") end if %>>4	
										<%end if%>
									</SELECT>
								</div>
							</div>
<%end if%>
<% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then %>
							<DIV id="div_mesh_check_msg" style="display: none">
								<p><FONT color=red><%tcWebApi_get("String_Entry","PromotText","s")%></FONT></p>
								<p><%tcWebApi_get("String_Entry","HintOpenEasyMeshText1","s")%></p>
							</DIV>
<% end if %>
						</fieldset>
					</div>
				<div class="col-lg-12 d-flex align-items-center justify-content-center">
					<button id="btnADV" type="button" class="action-button small-button" onclick="showAdvanced();"><%tcWebApi_get("String_Entry","ButtonAdvancedText","s")%></button>
					<button id="btnOK" type="button" class="page-button small-button" onclick="doSubmit();"><%tcWebApi_get("String_Entry","ButtonApplyText","s")%></button>
				</div>
			</div>
			</div>
			</form>
		</div>
<script language="JavaScript">
	var enableOpenFlag = "<%tcWebApi_get("dynCwmpAttr_Entry","aSSIDEnable","s")%>";
	var beaconTypeOpenFlag = "<%tcWebApi_get("dynCwmpAttr_Entry","aWLanBeaconType","s")%>";
	var ssidOpenFlag = "<%tcWebApi_get("dynCwmpAttr_Entry","aWLanSSID","s")%>";
	if(enableOpenFlag == "0")
		getElById('enableSsid').disabled = true;
	if(beaconTypeOpenFlag == "0")
		getElById('wlSecurMode').disabled = true;
	if(ssidOpenFlag == "0")
		getElById('wlSsid').disabled = true;
</script>
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
