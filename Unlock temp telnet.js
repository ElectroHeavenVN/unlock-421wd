await fetch("/cgi-bin/tools-admin.asp", {
    "credentials": "include",
    "headers": {
        "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8",
        "X-Requested-With": "XMLHttpRequest",
    },
    "body": new URLSearchParams({
        "TokenString": document.querySelector('input[name="TokenString"]').value,
        "adminFlag": "0",
        "AccessFlag": "1",
        "WANLANAccessFlag": "1",
        "UseWAN0": "No",
        "UseLAN0": "Yes",
        "isChangePort": "0",
        "uiViewTools_Lan0": "on",
        "StdioTimeOut": "1200",
        "http_port": "80",
        "https_port": "443",
        "customerdebug_flag": "1",
        "temptelnet_change_flag": "1",
        "ssh_change_flag": "1",
        "temptelnet_value": "Yes",
        "ssh_value": "Yes"
    }).toString(),
    "method": "POST",
    "mode": "cors"
});