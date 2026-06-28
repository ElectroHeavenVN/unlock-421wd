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
<title><%tcWebApi_get("String_Entry","BranchName","s")%> ONT - <%tcWebApi_get("String_Entry","EasyMeshStatus5Text","s")%></title><title><%tcWebApi_get("String_Entry","BranchName","s")%> ONT - <%tcWebApi_get("String_Entry","EasyMeshStatus5Text","s")%></title>		<meta charset="utf-8">
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
		</script>		<script src="/JS/graph.js"></script>
		<script>
    var max_cellspan = 2;
    var cy = "";
    var tree_info = [];
    var cli_db = [];
    var layout;
    var device_role = "";
    var al_mac = "";
    var devicename = "";
    var get_device_role_timer_id;
    var PortMac = [];
    var PortIP = [];
    function isUndefied(variable) {
        if (typeof variable == "undefined") {
            return true;
        }
        return false;
    }
    function checkWebStatus()
    {
            location.href = '/cgi-bin/wifi-mesh-topology.asp';
    }
    function toggle_display(string) {
        var tbody = document.getElementById("tbody_" + string);
        if (tbody.style.display == 'none') {
            tbody.style.display = "";
        }
        else {
            tbody.style.display = "none";
        }
    }
    function cancel_info_box() {
        $("#info_box").hide();
        $("#btn_cancel").hide();
    }
    function do_topo(action){
        $.ajax({
            url: "/cgi-bin/do_topo.cgi?action=" + action,
            method: 'GET', 
            complete: function(res){
                try {
                        if (/iPad|iPhone|iPod/.test(navigator.userAgent) && !window.MSStream) {
                            Pace.stop();
                        }
                        obj = JSON.parse(res.responseText);   
                        if (obj.success != "yes") {
                            alert("<%tcWebApi_get("String_Entry","EasyMeshTopologyFail","s")%>" + action + " topology");
                        }
                }
                catch {
                }
            }
        })
    }
    function do_savetopo() {
        console.log("Do save topo");
        var savetopo_btn = document.getElementById("save_topo");
        var cleartopo_btn = document.getElementById("clear_topo");
        //if (savetopo_btn.classList.contains("action-button"))
        cleartopo_btn.classList.add("action-button");
        cleartopo_btn.classList.remove("page-button");
        //if (!savetopo_btn.classList.contains("page-button"))
        savetopo_btn.classList.add("page-button");
        savetopo_btn.classList.remove("action-button");
        do_topo("save");
    }
    function do_cleartopo() {
        console.log("Do clear topo");
        var savetopo_btn = document.getElementById("save_topo");
        var cleartopo_btn = document.getElementById("clear_topo");
        savetopo_btn.classList.add("action-button");
        savetopo_btn.classList.remove("page-button");
        //if (!savetopo_btn.classList.contains("page-button"))
        cleartopo_btn.classList.add("page-button");
        cleartopo_btn.classList.remove("action-button");
        do_topo("clear");
    }
	function JSO_get_device_role()
	{
			var ret = '';
			var mapDevRole = "<% tcWebApi_get("Mesh_common","DeviceRole","s") %>";
	<% if mapDevRole <> "N/A" then %>
			ret = '{ ';
			ret = ret +	'"mapDevRole": "' + mapDevRole + '"';
			ret = ret + ' }';
	<% end if %>
			return ret;
	}
    function getIP_MAC_Mapping()
    {
        var aryInfoTemp = "<% tcWebApi_get("Info_Ether","PortIP","s") %>";
        aryInfoTemp += "<% tcWebApi_get("Info_Ether","ip","s") %>";
        PortIp = aryInfoTemp.split(',');
        aryInfoTemp = "<% tcWebApi_get("Info_Ether","PortMac","s") %>";
        aryInfoTemp += "<% tcWebApi_get("Info_Ether","PortMac2","s") %>";
        aryInfoTemp += "<% tcWebApi_get("Info_Ether","mac","s") %>".toLowerCase();
        PortMac = aryInfoTemp.split(',');
    }
    function get_dev1905_ip(macaddr)
    {
        var ret = PortMac.indexOf(macaddr.toLowerCase());
        if (ret != -1)
        {
            return PortIp[ret];
        }
        return "N/A";
    }
    function getDeviceRole()
    {
		var x = JSO_get_device_role();
		{
			console.log(x);
			try{
				var devRoleObj = JSON.parse(x.response);
				var devRole = parseInt(devRoleObj.mapDevRole);
				if(isNaN(devRole)){
					console.log("Incorrect Device Role",devRole);
					devRole = 0;
				}
				switch(devRole){
					case 0: // Auto
						clearTimeout(get_device_role_timer_id);
						get_device_role_timer_id = null;
						get_device_role_timer_id = setTimeout(getDeviceRole, 1000);
					break;
					case 1: // Controller
						device_role = "Controller";
					break;
					case 2: // Agent
						device_role = "Agent";
						//get_bh_connection_status();
						clearTimeout(get_device_role_timer_id);
						get_device_role_timer_id = null;
						get_device_role_timer_id = setTimeout(getDeviceRole, 5000);
					break;
					default:
						console.log("Invalid device role received: ",devRole);
					break;
				}
			}
			catch(e){
				console.log("Incorrect response received for get device role request!");
				clearTimeout(get_device_role_timer_id);
				get_device_role_timer_id = null;
				get_device_role_timer_id = setTimeout(getDeviceRole, 5000);
			}
		}
    }
    function getDeviceName()
    {
        devicename = "<% tcWebApi_get("devicename","DeviceName","s") %>";
    }
    function getAlMac()
    {
		al_mac = "<% tcWebApi_get("Mesh_mapcfg","AL-MAC","s") %>";
    }
	function JSO_get_client_capabilities()
	{
		var ret = "<% tcWebApi_MeshJsonHook("mesh_get_client_capabilities") %>";
		return ret;
	}
    function get_client_db_cb(rsp)
    {
        try{
            var r = JSON.parse(rsp);
            var rows;
            if(r.status == "SUCCESS"){
                console.log("get_client_db_cb success");
                cli_db = r['cli_db'];
                for(var cli_idx = 0; cli_idx < parseInt(r['num_clis']); cli_idx++){
                    if(cli_db[cli_idx]['BSSID'] == '00:00:00:00:00:00'){
                        continue;
                    }
                    rows = document.getElementById("tbody_clinfo").children;
                    for (var i =0 ; i < rows.length; i++) {
                        if (rows[i].cells[0].innerHTML.toUpperCase() == cli_db[cli_idx]['MAC'].toUpperCase()) {
                            rows[i].cells[4].innerHTML = cli_db[cli_idx]['Capability'];
                        }
                    }
                }
            }  
            else{
                console.log("Failed to get Client DB!\nStatus: ",r.status);
            }
            window.setTimeout(get_client_db, 10000);
        }
        catch(e){
            console.log("Incorrect response! Failed to get Client DB!",e.name,e.message);
            window.setTimeout(get_client_db, 10000);
        }
    }
    function get_client_db()
    {
        var x_response = JSO_get_client_capabilities();
		get_client_db_cb(x_response);
    }
    function get_client_cap(mac) {
        var ret = "";
        for (var i; i < cli_db.length; i++ ) {
            if (cli_db[i]['MAC'].toUpperCase() == mac.toUpperCase()) {
                ret = cli_db[i]['Capability'];
            }
        }
        return ret;
    }
    function draw_topology_table(jsTopoInfo)
    {
        tree_info = [];
        var topoInfoArr = jsTopoInfo['topology information'];
        if(!(topoInfoArr instanceof Array)){
            console.log("Incorrect TopologyInfo: Value of topology information is not an Array!");
            return;
        }
        for(var idx_1905=0; idx_1905 < topoInfoArr.length; idx_1905++){
            var obj_1905 = topoInfoArr[idx_1905];
            tree_info[idx_1905] = prep_tree_info(obj_1905);
        }
        tree_info.sort(function(a, b){return a.hopCount - b.hopCount});
        disp_topology_vis(tree_info);
        // [ONTS-772]: Don't need to show capabilites of clients
        // get_client_db();
    }
    function prep_tree_info(dev1905Obj)
    {
        var node = {};
        node["devRole"] = get_dev_role_string(dev1905Obj['Device role']);
        node["alMac"] = dev1905Obj['AL MAC'];
        node["IPAddr"] = get_dev1905_ip(node["alMac"]);
        node['devicename'] = dev1905Obj['Device name'];
        node["hopCount"] = parseInt(dev1905Obj['Distance from controller']);
        node['UplinkAlMac'] = dev1905Obj['Upstream 1905 device'];
        node["wifiStaInfo"] = {};
        node["ethStaInfo"] = {};
        node["BHInfo"] = "";
        if (node["devRole"] == "Agent") {
            if (typeof dev1905Obj['BH Info'] != "undefined")
                node["BHInfo"] = dev1905Obj['BH Info'];
        }
        node["radionum"] = dev1905Obj['Number of radios'];
        node["radioinfo"] = dev1905Obj['Radio Info'];
        node["BHInfo"] = dev1905Obj['BH Info'];
        node["BHMetric"] = dev1905Obj['backhaul link metrics'];
        node["BHAP"] = dev1905Obj['BH Interface(AP)'];
        node["BHAPCLI"] = dev1905Obj['BH Interface(APCLI)'];
        node["otherclient"] = dev1905Obj['Other Clients Info'];
        node["SerialNumber"] = dev1905Obj['Serial number'].length > 0 ? dev1905Obj['Serial number'] : "N/A";
        node["FirmwareVersion"] = dev1905Obj['Firmware version'].length > 0 ? dev1905Obj['Firmware version'] : "N/A";
        return node;
    }
    function get_uplink_tree_info(tree_info, mac)
    {
        for(var nIdx=0; nIdx < tree_info.length; nIdx++){
            if(tree_info[nIdx]['alMac'] == mac){
                return tree_info[nIdx]['alMac'];
            }
        }
        return "";
    }
	var cur_zoom = 1;
    function func_reset_view() {
        var controller_id = cy.$('[role = "Controller"]').data("id");
        console.log(controller_id);
        if ((typeof controller_id == 'string') && (controller_id.length != 0)) {
            cy_layout = cy.layout({
                name: 'breadthfirst',
				fit: true,
				spacingFactor: 1,
                animate: true,
                animationDuration: 200,
                randomize: true,
				roots: '[id = "' + controller_id + '"]',
				directed: true
            });
        }
        else {
            cy_layout = cy.layout({
                name: 'fcose',
                animate: true,
                animationDuration: 200,
                randomize: true,
            })
        }
        cy_layout.run();
		setTimeout(function(){
			cur_zoom = cy.zoom();
			cy.maxZoom(cur_zoom*2);
			cy.minZoom(cur_zoom/2);
		}, 500); 
        cy.autoungrabify(true);
    }
    function show_node_info(al_mac) {
        var id = -1;
        /* get id by al_mac */
        for (var i = 0; i < tree_info.length; i++) {
            if (al_mac == tree_info[i]['alMac']) {
                id = i;
                break;
            }
        }
        if (id == -1) {
            console.log("This device has no info");
            return;
        }
		// ONTS-75: hyperlink agent
		var ipaddr = get_dev1905_ip(al_mac)
        // [ONTS-772]: Show some extra suggestion about links to agent webpages
        var raw_text = tree_info[i]['devRole'] + " - " + al_mac + " - " + tree_info[i]['devicename'];
        var hyperlink_style = 'style="text-decoration: underline"'
    	if (ipaddr == "N/A")
    	{
        	$("#info_box_title").html(raw_text);
    	}
    	else
        {
        	$("#info_box_title").html('<a ' + hyperlink_style +' href="https://' + get_dev1905_ip(al_mac) + '"' +' target="_blank">' + raw_text + '</a>'
                                        + '\t\t<span><i style="font-weight:500">(Click beside link to access its webpage)</i></span>');
        }
		$("#tbody_overview tr").hide();
        $("#tbody_apcap tr").hide();
        $("#tbody_bhinfo tr").hide();
        $("#tbody_clinfo tr").hide();
        $(".ap" + id + "_overview").show();
        $(".ap" + id + "_apcap").show();
        $(".ap" + id + "_bhinfo").show();
        $(".ap" + id + "_clinfo").show();
        $("#info_box").show();
        $("#btn_cancel").show();
    }
    function set_event() {
        cy.on('tap', 'node', function(evt){
            var node = evt.target;
            console.log( 'tapped ' + node.id() );
            show_node_info(node.id());
        });
    }
    function init_cy() {
        cy = cytoscape({
            container: document.getElementById("display_tree"), // container to render in
            elements: [
            ],
            style: [
                // the stylesheet for the graph
                {
                    selector: "node",
                    style: {
                        "background-color": "#fff",
                        "shape": "round-rectangle",
                        width: 120,
                        "content": "data(name)",
                        "font-size": "12px",
                        "font-weight": "bold",
                        "text-valign": "center",
                        "text-halign": "center",
                        "text-wrap": "wrap",
                        "padding": 5,
                        "line-height": 1.3,
                        "border-width": 3
                    }
                },
                {
                    selector: "edge",
                    style: {
                        width: 3,
                        // // [ONTS-772]: Add threshold of -75 to change color of line connecting ctrl and agent
                        "line-color": edge => parseInt(edge.data("rssi")) < -75 ? "red" : "#ccc",
                        "line-style": "dashed",
                        "target-arrow-color": "#ccc",
                        "target-arrow-shape": "triangle",
                        label: function(edge) { // ONTS-907
                            if (edge.data("medium") == "5G")
                                return `${edge.data("medium")}(${edge.data("rssi")}dBm)`
                            else if (edge.data("medium") == "Ethernet")
                                return `${edge.data("medium")}`
                        }
                    }
                },
                {
                    selector: "[medium = 'Ethernet']",
                    style: {
                        "line-style": "solid"
                    }
                },
                {
                    selector: "[role = 'Controller']",
                    style: {
                        "border-color": "#ec1b2e"
                    }
                },
                {
                    selector: "[role = 'Agent']",
                    style: {
                        "border-color": "#F5C105"
                    }
                },
                {
                    selector: "[role = 'Controller'][this_dev = 1]",
                    style: {
                        "background-color": "#fbd1d5"
                    }
                },
                {
                    selector: "[role = 'Agent'][this_dev = 1]",
                    style: {
                        "background-color": "#fdf3cd"
                    }
                }
            ],
            layout: {
            }
        });
    } 
    function insert_row(tb, classname, name, namespan, val, valspan) {
        var row = tb.insertRow(-1);
        row.classList = classname;
        var cell = row.insertCell(0);
        cell.innerHTML = name;
        cell.classList = "font-weight-bold";
        cell.colSpan = namespan;
        var cell = row.insertCell(1);
        cell.innerHTML = val;
        cell.colSpan = valspan;
    }
    function print_node_info(nIdx) {
        var tbody_overview, tbody_apcap, tbody_bhinfo, tbody_clinfo, row, cell;
        var cl;
        tbody_overview = document.getElementById("tbody_overview");
        tbody_clinfo = document.getElementById("tbody_clinfo");
        /* Radio info */
        tbody_apcap = document.getElementById("tbody_apcap");
        cl = "ap" + nIdx + "_apcap";
        row = tbody_overview.insertRow(-1);
		row.classList = cl
		cell = row.insertCell(0);
		cell.innerHTML = "Overview";
		cell.colSpan = 3;
		cell.classList = "text-center subhead";
		insert_row(tbody_overview, cl, "Serial Number", 1,  tree_info[nIdx]['SerialNumber'], 2);
		insert_row(tbody_overview, cl, "Firmware Version", 1,  tree_info[nIdx]['FirmwareVersion'], 2);
        row = tbody_apcap.insertRow(-1);
		row.classList = cl
		cell = row.insertCell(0);
		cell.innerHTML = "IP Info";
		cell.colSpan = 3;
		cell.classList = "text-center subhead";
		insert_row(tbody_apcap, cl, "LAN IP Address", 1, tree_info[nIdx]['IPAddr'] , 2);
        var radionum = parseInt(tree_info[nIdx]['radionum']);
        if (!isNaN(radionum)) {
            var radio_obj = tree_info[nIdx]['radioinfo'];
            for (var i = 0; i < radionum; i++) {
                row = tbody_apcap.insertRow(-1);
                row.classList = "ap" + nIdx + "_apcap"
                cell = row.insertCell(0);
                cell.innerHTML = "Radio " + i;
                cell.colSpan = 3;
                cell.classList = "text-center subhead";
                insert_row(tbody_apcap, cl, "Channel", 1, radio_obj[i]['channel'], 2);
                //insert_row(tbody_apcap, cl, "Bandwidth", 1, radio_obj[i]['BW'], 2);
                row = tbody_apcap.insertRow(-1);
                row.classList = "ap" + nIdx + "_apcap"
                cell = row.insertCell(0);
                cell.innerHTML = "BSS(s) List";
                cell.classList = "font-weight-bold";
                cell.rowSpan = 1 + radio_obj[i]['BSSINFO'].length;
                cell = row.insertCell(1);
                cell.innerHTML = "BSSID(s)";
                cell.classList = "font-weight-bold";
                cell = row.insertCell(2);
                cell.innerHTML = "SSID(s)";
                cell.classList = "font-weight-bold";
                for (var j = 0; j < radio_obj[i]['BSSINFO'].length; j ++) {
                    row = tbody_apcap.insertRow(-1);
                    row.classList = "ap" + nIdx + "_apcap"
                    cell = row.insertCell(0);
                    cell.innerHTML = radio_obj[i]['BSSINFO'][j]['BSSID'];
                    cell = row.insertCell(1);
                    cell.innerHTML = radio_obj[i]['BSSINFO'][j]['SSID'];;
                }
            }
        }
        /* BH info */
        tbody_bhinfo = document.getElementById("tbody_bhinfo");
        cl = "ap" + nIdx + "_bhinfo";
        var bhnum = tree_info[nIdx]['BHMetric'].length;
        var bhmetric_obj = tree_info[nIdx]['BHMetric'];
        var bh_medium;
        if (tree_info[nIdx]['devRole'] == "Agent") {
            row = tbody_bhinfo.insertRow(-1);
            row.classList = "ap" + nIdx + "_bhinfo"
            cell = row.insertCell(0);
            cell.innerHTML = "Upstream Backhaul Link";
            cell.colSpan = 3;
            cell.classList = "text-center subhead";
            insert_row(tbody_bhinfo, cl, "Distance from controller", 1, tree_info[nIdx]['hopCount'], 2);
            insert_row(tbody_bhinfo, cl, "Upstream Device", 1, tree_info[nIdx]['UplinkAlMac'], 2);
            // [ONTS-772]: Get BH medium from BHInfo, other info from backhaul Metric
            for (var i = 0; i < tree_info[nIdx]['BHInfo'].length; i++)
            {
                if (tree_info[nIdx]['UplinkAlMac'] == tree_info[nIdx]['BHInfo'][i]['neighbor almac addr'])
                {
                    bh_medium = tree_info[nIdx]['BHInfo'][i]['Backhaul Medium Type'];
                    insert_row(tbody_bhinfo, cl, "Bachkhaul Type", 1, bh_medium, 2);
                    break;
                }
            }
            /* Find info in Backhaul link metric */
            for (var i = 0; i < bhnum; i++) {
                if (tree_info[nIdx]['UplinkAlMac'] == bhmetric_obj[i]['neighbor_al']) {
                    insert_row(tbody_bhinfo, cl, "Local interface MAC", 1, bhmetric_obj[i]['metrics'][0]['local_if_mac'], 2);
                    insert_row(tbody_bhinfo, cl, "Neighbor interface MAC", 1, bhmetric_obj[i]['metrics'][0]['neighbor_if_mac'], 2);
                    insert_row(tbody_bhinfo, cl, "PhyRate", 1, bhmetric_obj[i]['metrics'][0]['phyRate'], 2);
                    if (bh_medium != "Ethernet") 
                    {
                        insert_row(tbody_bhinfo, cl, "RSSI", 1, bhmetric_obj[i]['metrics'][0]['RSSI'], 2);
                    }
                    break;
                }
            }
        }
/* ONTS-75: Hide Other Backhaul Links on Control
        if ((tree_info[nIdx]['devRole'] == "Controller") || (bhnum > 1)) {
            row = tbody_bhinfo.insertRow(-1);
            row.classList = "ap" + nIdx + "_bhinfo"
            cell = row.insertCell(0);
            cell.innerHTML = "Other Backhaul Links";
            cell.colSpan = 3;
            cell.classList = "text-center subhead";
        }
        for (var i = 0; i < bhnum; i++) {
            if (tree_info[nIdx]['UplinkAlMac'] != bhmetric_obj[i]['neighbor_al']) {
                // finding medium type
                var medium_type = "Ethernet";
                var device_rowspan = 2;
                for (var j=0; j < tree_info[nIdx]['BHAPCLI'].length; j++) {
                    if (tree_info[nIdx]['BHAPCLI'][j]['MAC address'] == bhmetric_obj[i]['metrics']['local_if_mac']) {
                        medium_type = "Wireless";
                        //device_rowspan = 5;
                        break;
                    }
                }
                row = tbody_bhinfo.insertRow(-1);
                row.classList = "ap" + nIdx + "_bhinfo"
                cell = row.insertCell(0);
                cell.innerHTML = "Neighbor Device - " + bhmetric_obj[i]['neighbor_al'];
                cell.rowSpan = device_rowspan;
                cell.classList = "text-center";
                //insert_row(tbody_bhinfo, cl, "Neighbor Device", 1, bhmetric_obj[i]['neighbor_al'], 2);
                //cell = row.insertCell(1);
                //cell.innerHTML = "Bachkhaul Type";
                //cell.classList = "font-weight-bold";
                //cell = row.insertCell(2);
                //cell.innerHTML = medium_type;
                //insert_row(tbody_bhinfo, cl, "Bachkhaul Type", 1, medium_type, 2);
				cell = row.insertCell(1);
				cell.innerHTML = "Local interface MAC";
				cell.classList = "font-weight-bold";
                cell = row.insertCell(2);
				cell.innerHTML = bhmetric_obj[i]['metrics'][0]['local_if_mac']
                //insert_row(tbody_bhinfo, cl, "Local interface MAC", 1, bhmetric_obj[i]['metrics'][0]['local_if_mac'], 2);
                insert_row(tbody_bhinfo, cl, "Neighbor interface MAC", 1, bhmetric_obj[i]['metrics'][0]['neighbor_if_mac'], 2);
                if (medium_type != "Ethernet"){
                    insert_row(tbody_bhinfo, cl, "PhyRate", 1, bhmetric_obj[i]['metrics'][0]['phyRate'], 2);
                    insert_row(tbody_bhinfo, cl, "RSSI", 1, bhmetric_obj[i]['metrics'][0]['RSSI'], 2);
                }
                break;
            }
        }
*/
        /* Client info */
        tbody_clinfo = document.getElementById("tbody_clinfo");
        row = tbody_clinfo.insertRow(0);
        row.classList = "ap" + nIdx + "_clinfo"
        cell = row.insertCell(0);
        cell.classList = "font-weight-bold";
        cell.innerHTML = "MAC Address";
        cell = row.insertCell(1);
        cell.classList = "font-weight-bold";
        cell.innerHTML = "Band/Interace";
        //cell = row.insertCell(2);
        //cell.classList = "font-weight-bold";
        //cell.innerHTML = "Last assoc time";
        cell = row.insertCell(2);
        cell.classList = "font-weight-bold";
		cell.innerHTML = "Link speed (Mbps)";
        cell = row.insertCell(3);
        cell.classList = "font-weight-bold";
        cell.innerHTML = "RSSI (dBm)";
        // [ONTS-772]: Remove  Capability add Last Downlink, Last Uplink, IP
        // cell = row.insertCell(4);
        // cell.classList = "font-weight-bold";
        // cell.innerHTML = "Capability";
        cell = row.insertCell(4);
        cell.classList = "font-weight-bold";
        cell.innerHTML = "Last Downlink (KB)";
        cell = row.insertCell(5);
        cell.classList = "font-weight-bold";
        cell.innerHTML = "Last Uplink (KB)";
        cell = row.insertCell(6);
        cell.classList = "font-weight-bold";
        cell.innerHTML = "IP";
        var connected_sta_obj;
        if (!isNaN(radionum)) {
            var radio_obj = tree_info[nIdx]['radioinfo'];
            for (var i = 0; i < radionum; i++) {
                for (var j = 0; j < radio_obj[i]['BSSINFO'].length; j ++) {
                    connected_sta_obj = radio_obj[i]['BSSINFO'][j]['connected sta info']
                    if (typeof connected_sta_obj != "undefined") {  
                        for (var k = 0; k < connected_sta_obj.length; k ++) {
                            if (connected_sta_obj[k]['BH STA'] != "Yes") {
                                row = tbody_clinfo.insertRow(-1);
                                row.classList = "ap" + nIdx + "_clinfo"
                                cell = row.insertCell(0);
                                cell.innerHTML = connected_sta_obj[k]['STA MAC address'];
                                cell = row.insertCell(1);
                                cell.innerHTML = connected_sta_obj[k]['Medium'];
                                cell = row.insertCell(2);
                                //cell.innerHTML = connected_sta_obj[k]['last assoc time'];
								cell.innerHTML = connected_sta_obj[k]['uplink speed'];
                                cell = row.insertCell(3);
                                cell.innerHTML = connected_sta_obj[k]['uplink rssi'];
                                cell = row.insertCell(4);
                                cell.innerHTML = connected_sta_obj[k]['Tp Tx Dl KBps'];
                                cell = row.insertCell(5);
                                cell.innerHTML = connected_sta_obj[k]['Tp Rx Ul KBps'];
                                cell = row.insertCell(6);
                                cell.innerHTML = get_dev1905_ip(connected_sta_obj[k]['STA MAC address']);
                            }
                        }
                    }
                }
            }
        }
        for (var i = 0; i < tree_info[nIdx]['otherclient'].length; i++) {
            row = tbody_clinfo.insertRow(-1);
            row.classList = "ap" + nIdx + "_clinfo"
            cell = row.insertCell(-1);
            cell.innerHTML = tree_info[nIdx]['otherclient'][i]['Client Address'];
            cell = row.insertCell(-1);
            cell.innerHTML = tree_info[nIdx]['otherclient'][i]['Medium'];
            cell = row.insertCell(-1);
            cell.innerHTML = "1000";
            cell = row.insertCell(-1);
            cell.innerHTML = "-";
            cell = row.insertCell(-1);
            cell.innerHTML = "-";
            cell = row.insertCell(-1);
            cell.innerHTML = "-";
            cell = row.insertCell(-1);
            cell.innerHTML = get_dev1905_ip(tree_info[nIdx]['otherclient'][i]['Client Address']);
        }
    }
    function disp_topology_vis(tree_info)
    {
        var edge_id = 0;
        var name;
        var this_device;
        init_cy();
        /* reset info box */ 
        document.getElementById("tbody_overview").innerHTML = "";
        document.getElementById("tbody_apcap").innerHTML = "";
        document.getElementById("tbody_bhinfo").innerHTML = "";
        document.getElementById("tbody_clinfo").innerHTML = "";
        for(var nIdx=0; nIdx < tree_info.length; nIdx++){
            /* add node to cy graph */
            name = tree_info[nIdx]['devRole'] + " \n " + tree_info[nIdx]['alMac'];
            if (al_mac == tree_info[nIdx]['alMac']) {
                this_device = 1;
            }
            else {
                this_device = 0;
            }
            cy.add([
                {
                    group: "nodes",
                    data: { 
                        id: tree_info[nIdx]['alMac'],
                        role: tree_info[nIdx]['devRole'],
                        name: name,
                        this_dev: this_device
                    },
                },
            ]);
            if (tree_info[nIdx]['devRole'] == "Agent") {
                var upLinkNodeStr = get_uplink_tree_info(tree_info, tree_info[nIdx]['UplinkAlMac']);
                if ((upLinkNodeStr != "") && (!isUndefied(cy.$id(upLinkNodeStr).data("id")))) {
                    cy.add([
                        { group: "edges", data: { id: "e" + edge_id , source: upLinkNodeStr, target: tree_info[nIdx]['alMac'] } },
                    ]);
                    // [ONTS-772]: Get BH medium from BHInfo, other info from backhaul Metric
                    for (var i = 0; i < tree_info[nIdx]['BHInfo'].length; i++)
                    {
                        if (tree_info[nIdx]['BHInfo'][i]['neighbor almac addr'] == tree_info[nIdx]['UplinkAlMac']) 
                        {
                            if (typeof tree_info[nIdx]['BHInfo'][i]['Backhaul Medium Type'] != "undefined") {
                                cy.edges("[id = 'e" +edge_id + "']").data("medium", tree_info[nIdx]['BHInfo'][i]['Backhaul Medium Type']);
                                for (var j = 0; j < tree_info[nIdx]['BHMetric'].length; j++)
                                {
                                    if (tree_info[nIdx]['BHMetric'][j]['neighbor_al'] == tree_info[nIdx]['UplinkAlMac'])
                                    {
                                        cy.edges("[id = 'e" +edge_id + "']").data("rssi", tree_info[nIdx]['BHMetric'][j]['metrics'][0]['RSSI']);
                                        break;
                                    }
                                }
                            }
                            break;
                        }
                    }
                    edge_id ++;
                }
                else{
                    console.log("INFO: AGENT WITH NO UP-LINK MAC = ",tree_info[nIdx]['alMac']);
                    //topoErrMsg.innerHTML += "<br />ERROR: Agent with AL-MAC " + tree_info[nIdx]['alMac'] +" has no upstream 1905 device!";
                    //topoErrMsg.style.display = "";
                }
            }
            /* add node to info table */
            print_node_info(nIdx);
        }
        set_event();
        func_reset_view();
    }
    function get_dev_role_string(devRole)
    {
        switch(parseInt(devRole)){
            case 1:
                return 'Controller';
            case 2:
                return 'Agent';
            default:
                return 'Not Configured';
        }
    }
    function get_run_time_topology_cb(rsp)
    {
        var r = JSON.parse(rsp);
        if(r.status == "SUCCESS"){
            var tmp_jsTopoInfo = r.luaTopologyInfo;
            tmp_jsTopoInfo = tmp_jsTopoInfo.replace(/\\u0022/g, '"');
            tmp_jsTopoInfo = tmp_jsTopoInfo.replace(/\\\\u0022/g, '"');
            var jsTopoInfo = JSON.parse(tmp_jsTopoInfo);
            document.getElementById("display_tree").innerHTML = "";
            draw_topology_table(jsTopoInfo);
        }
        else{
            console.log("Failed to get Topology Info!\nStatus: ",r.status);
        }
    }
	function JSO_get_runtime_topology()
	{
			var ret = "<% tcWebApi_MeshJsonHook("mesh_get_run_time_topology") %>";
			ret = ret.replace(/\'/g,'\\\\u0022');
			return ret;
	}
    function get_run_time_topology()
    {
        var x_response = JSO_get_runtime_topology();
		get_run_time_topology_cb(x_response);
    }
    function display_error(string) {
        $("#error_div").show();
        $("#error_text").text(string);
        $("#display_tree").hide();
        $("#reset_view").hide();
    }
    function load() {
        var savetopo_btn = document.getElementById("save_topo");
        var cleartopo_btn = document.getElementById("clear_topo");
        var VtSaveTopology = "<% tcWebApi_get("mesh.common", "VtSaveTopology", "s") %>"
        if (VtSaveTopology == "2"){
            cleartopo_btn.classList.add("action-button");
            cleartopo_btn.classList.remove("page-button");
            savetopo_btn.classList.add("page-button");
            savetopo_btn.classList.remove("action-button");
        }
        else {
            savetopo_btn.classList.add("action-button");
            savetopo_btn.classList.remove("page-button");
            cleartopo_btn.classList.add("page-button");
            cleartopo_btn.classList.remove("action-button");
        }
        <% if tcWebApi_get("globalstate_common", "wlanLoad", "h") = "0" then %>
            display_error("l1profile.dat file is not available!");
        <% else %>
        <% if tcWebApi_get("WLan_Common", "MultiSSIDConfigEnable", "h") = "Yes" then %>
        <% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then %>
            var webstate = "<% tcWebApi_get("Mesh_action","map_action_complete","s") %>";
            if (webstate == "1") {
                display_error("Device is applying the saved settings now!\n" + 
                                "It is recommended to wait until all the saved settings are applied.\n");
                setTimeout(checkWebStatus, 5000);
            }
            else {
                getDeviceRole();
                getAlMac();
                getDeviceName();
                getIP_MAC_Mapping();
                get_run_time_topology();
                // [ONTS-772]: Don't get client capabilities
                // get_client_db();
            }
        <% else %>
            display_error("EasyMesh is currently disabled!");
        <% end if %> /* tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1"  */
        <% else %>
            display_error("<%tcWebApi_get("String_Entry","EasyMeshBasic13Test","s")%>");
        <% end if %> /* tcWebApi_get("WLan_Common", "MultiSSIDConfigEnable", "h") = "0" */
        <% end if %> /* tcWebApi_get("globalstate_common", "wlanLoad", "h") = "0" */       
    }
</script>
		</script>
		<style>
        table {
            width: 100%;
            margin-bottom: 18px;
            padding: 0;
            font-size: 13px;
            border-collapse: collapse;
        }
        table th, table td {
            padding: 10px 10px 9px;
            line-height: 18px;
            text-align: left;
        }
                .cbi-section-table {
            background-color: white;
            border-radius: 15px;
            box-shadow: 2px 2px 3px 0 rgba(169, 180, 216, 0.16)
        }
        .cbi-section-node .cbi-section-table {
	        box-shadow: 0 0 0 !important;
        }
        .cbi-section-table>tbody:first-child>tr:first-child>td {
            border-top: none;
        }
        .cbi-section-table>tbody:first-child>tr:first-child>td:first-child {
            border-top-left-radius: 15px;
        }
        .cbi-section-table>tbody:first-child>tr:first-child>td:last-child {
            border-top-right-radius: 15px;
        }
        .cbi-section-table>tbody:last-child>tr:last-child>td:first-child {
            border-bottom-left-radius: 15px;
        }
        .cbi-section-table>tbody:last-child>tr:last-child>td:last-child {
            border-bottom-right-radius: 15px;
        }
		#display_tree {
		width: 100%;
		height: 50vh;
		display: block;
		background-color: #fff;
		margin: 10px 0;
		border-radius:  20px;
	/*	box-shadow: -1px 3px 10px 0 rgb(169 180 216 / 16%); */
		}
		.topoinfo-table thead td{
			font-size: 14px;
			font-weight: bold;
		}
		.topoinfo-table tbody td{
			font-size: 12px;
		}
		.topoinfo-table tbody .subhead{
			font-size: 14px;
			font-weight: bold;
		}
		.topoinfo-table tr {
			border-top: solid 1px #ddd;
		}
		</style>
	</head>
	<body class="container" onload="">
<header class="fixed-top"><nav id="top-nav" class="navbar navbar-expand-lg container"><a class="navbar-brand " href="/cgi-bin/home.asp"><div><img src="/img/logo_home.png" width="100" height="18" alt=""><div style="font-family: sans-serif; font-weight: bold;font-size: 12px;color: #000; margin-top: 0">OPTICAL NETWORK TERMINATION</div></div></a><button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"><em class="fas fa-align-justify"></em></span></button><div class="collapse navbar-collapse" id="navbarCollapse"><ul class="navbar-nav mr-auto sidenav" id="navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/home.asp"><%tcWebApi_get("String_Entry","NavigationHomeText","s")%><span class="sr-only"></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/deviceinfo.asp"><%tcWebApi_get("String_Entry","NavigationStatusDeviceText","s")%><span class="sr-only"></span></a></li><li class="nav-item active"><a class="nav-link" href="/cgi-bin/wifi-mesh-topology.asp"><%tcWebApi_get("String_Entry","EasyMeshStatus5Text","s")%><span class="sr-only">(current)</span></a></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#status-menu" aria-controls="status-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NavigationStatusStatisticsText","s")%></a><ul class="nav-second-level collapse" id="status-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/sta-statistics.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationTrafficText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/sta-wifiusers.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationStatusUsersText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/sta-users.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","ARPStatusText","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#network-menu" aria-controls="network-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NAVNetwork","s")%></a><ul class="nav-second-level collapse" id="network-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/net-wan.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationBasInternetText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/net-lan.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationBasLANText","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#wifi-menu" aria-controls="wifi-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NAVWifi","s")%></a><ul class="nav-second-level collapse" id="wifi-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/wifi.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationWiFiSettingsText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/wifi-11ac.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationWiFi11acSettingsText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/wifi-mesh.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationMesh","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#firewall-menu" aria-controls="firewall-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NavigationAdvFirewallText","s")%></a><ul class="nav-second-level collapse" id="firewall-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-spi.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","ContentFirewallText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-urlfilter.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","FILTERTYPE_index2","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-macfilter.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVL2Filter","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/fw-parentalcontrol.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","ParentalControlText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/safehome.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","SafehomeText","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#apps-menu" aria-controls="apps-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NAVApplication","s")%></a><ul class="nav-second-level collapse" id="apps-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-dmz.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NatTopDMZText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-portforwarding.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NatVirsvrText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-sslim.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","SessionLimit","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-route.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","StaticRouteText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-ddns.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","dyDNS1Text","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/apps-wifischeduling.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","WifiSchedulingText","s")%></span></a></li></ul></li><li class="nav-item"><a class="nav-link nav-link-collapse" href="#" id="hasSubItems" data-toggle="collapse" data-target="#tools-menu" aria-controls="tools-menu" aria-expanded="false"><%tcWebApi_get("String_Entry","NavigationMaintenanceText","s")%></a><ul class="nav-second-level collapse" id="tools-menu" data-parent="#navAccordion"><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-admin.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationMainAdminText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-time.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVSysTime","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-firmware.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationMainFirmwareText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-config.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVConfig","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-diagnostic.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NavigationMainDiagnosticsText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-wan2lan.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","Wan2lanText","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-log.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","NAVLogs","s")%></span></a></li><li class="nav-item"><a class="nav-link" href="/cgi-bin/tools-reboot.asp"><span class="nav-link-text"><%tcWebApi_get("String_Entry","RebootText","s")%></span></a></li></ul></li></ul><div class="top-item-groups"><form name="LanguageForm" method="POST" action="/cgi-bin/wifi-mesh-topology.asp" class="nav-item dropdown"><input type="hidden" name="TokenString" value="<%tcWebApi_getToken()%>"><input type="hidden" name="Language_Flag" value="<% tcWebApi_get("LanguageSwitch_Entry","Type","s") %>"><a class="nav-link dropdown-toggle" href="#" id="LanguageDropdown" role="button" data-toggle="dropdown" aria-expanded="false"><% tcWebApi_get("String_Entry","LoginLanguage","s") %></a><ul class="dropdown-menu" aria-labelledby="LanguageDropdown"><li><a class="dropdown-item <% if tcWebApi_get("LanguageSwitch_Entry","Type","h") = "1" then asp_Write("active") end if %>" href="#" onclick="submitLanguageForm(1);"><% tcWebApi_get("String_Entry","LanguageVIELong","s") %></a></li><li><a class="dropdown-item <% if tcWebApi_get("LanguageSwitch_Entry","Type","h") = "2" then asp_Write("active") end if %>" href="#" onclick="submitLanguageForm(2);"><% tcWebApi_get("String_Entry","LanguageENGLong","s") %></a></li></ul></form><div id="signout" class="nav-item"><a class="nav-link" href="javascript:doLogout();"><em class="fa fa-sign-out-alt"></em><span class="nav-link-text"><% tcWebApi_get("String_Entry","LogoutText","s") %></span></a></div></div></div></header></nav><% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then
	if tcWebApi_get("Mesh_Common", "DeviceRole", "h") = "2" then %>
		<script language='javascript'>
		document.getElementById("network-menu").children[0].style="display: none";
		document.getElementById("network-menu").children[1].style="display: none";
		document.getElementById("wifi-menu").children[0].style="display: none";
		document.getElementById("wifi-menu").children[1].style="display: none";
		</script>
<% end if end if %>		<div id="content">
		<form class="form-inline" method="post" name="cbi" action="" autocomplete="off">
		<div class="row row-w-100">
			<div class="widget col-xs-12 col-lg-12">
				<!--
				<ul class="row ul-tab">
					<li class="tab tab-disabled">
						<a href="/cgi-bin/wifi-mesh.asp"><%tcWebApi_get("String_Entry","EasyMeshBasicTest","s")%></a>
					</li>
					<li class="tab">
						<a href="/cgi-bin/wifi-mesh-topology.asp"><%tcWebApi_get("String_Entry","EasyMeshStatusTest","s")%></a>
					</li>
				</ul>
				-->
				<div class="widget-body">
					<fieldset>
						<legend>Runtime Topology</legend>
		    			<div style="padding-left: 15px; display: none;" id="error_div">
						    <label id="error_text"></label>
						</div>
                        <div >
                            <label id="topoErrMsg"></label>
                        </div>
					</fieldset>
				    <div id="display_tree"></div>
				</div>
				<div class="pb-3">
				<button type="button" class="small-button action-button" id="reset_view" onclick="func_reset_view()" ><em class="fas fa-sync"></em><span> Reset View</span></button>
				<button type="button" class="small-button action-button" id="btn_cancel" onclick="cancel_info_box()" style="display: none"><em class="fas fa-times"></em><span> Close Table</span></button>
				</div>
                <div class="d-flex justify-content-end">
                    <button type="button" class="small-button" id="save_topo" onclick="do_savetopo()"><span> Save Topo</span></button>
                    <button type="button" class="small-button" id="clear_topo" onclick="do_cleartopo()"><span> Clear Topo</span></button>
                </div>
				<div id="info_box" class="table-responsive" style="display: none">
					<table class="cbi-section-table">
						<tbody>
							<tr>
								<td id="info_box_title" class="font-weight-bold p-3" style="font-size: 16px;">
								</td>
							</tr>
                            <tr><td class="p-0">
                                <table class="mb-1 topoinfo-table">
                                    <thead>
                                        <tr>
                                            <td colspan="2" id="label_overview" class="font-weight-bold"><a href="javascript:toggle_display('overview');">Overview <span><em class="fas fa-chevron-down"></em></span></a></td>
                                        </tr>
                                    </thead>
                                    <tbody id="tbody_overview" style="display: none">
                                    </tbody>
                                </table>
                            </td></tr>
							<tr><td class="p-0">
								<table class="mb-1 topoinfo-table">
									<thead>
										<tr>
											<td colspan="2" id="label_apcap" class="font-weight-bold"><a href="javascript:toggle_display('apcap');">AP Capabality <span><em class="fas fa-chevron-down"></em></span></a></td>
										</tr>
									</thead>
									<tbody id="tbody_apcap" style="display: none">
									</tbody>
								</table>
							</td></tr>
							<tr><td class="p-0">
								<table class="mb-1 topoinfo-table">
									<thead>
										<tr>
											<td colspan="2" id="label_bhinfo" class="font-weight-bold"><a href="javascript:toggle_display('bhinfo');">Backhaul Information <span><em class="fas fa-chevron-down"></em></span></a></td>
										</tr>
									</thead>
									<tbody id="tbody_bhinfo" style="display: none">
									</tbody>
								</table>
							</td></tr>
							<tr><td class="p-0">
								<table class="mb-1 topoinfo-table">
									<thead>
										<tr>
											<td colspan="2" id="label_clinfo" class="font-weight-bold"><a href="javascript:toggle_display('clinfo');">Clients List <span><em class="fas fa-chevron-down"></em></span></a></td>
										</tr>
									</thead>
									<tbody id="tbody_clinfo" style="display: none">
									</tbody>
								</table>
							</td></tr>
						</tbody>
						<tfoot>
							<tr>
							</tr>
						</tfoot>
					</table>
				</div>
			</div>
		</div>
		</form>
		</div>
		<script language="javascript" type=text/javascript>
load();
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
