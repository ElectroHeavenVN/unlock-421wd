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
		<title><%tcWebApi_get("String_Entry","BranchName","s")%> ONT - <%tcWebApi_get("String_Entry","ErrorText","s")%>!</title>
		<meta charset="utf-8">
		<meta HTTP-EQUIV="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<meta http-equiv="x-ua-compatible" content="IE=edge">		
		<link rel="stylesheet" type="text/css" href="/style.css">
        <script>
           function gotoLoginPage() {
				window.location.href = 'https://<%tcwebApi_get("Lan_Entry0","IP","s")%>/cgi-bin/login.asp';
			}
        </script>
	<body onload="" class="container" id="extra-page">
		<div id="content">
			<div class="row  justify-content-center">
				<div id="login-fail-box" class="col-xs-12 col-sm-10 col-md-7">
					<div id="single-card" class="card p-4">
						<header class="d-flex mb-4">
							<div class="hidden-xs hidden-sm mr-2"><em class="fas fa-exclamation-triangle"></em></div>
							<% if tcWebApi_get("String_Entry","BranchName","h") = "Mytel" then %>
								<% if tcWebApi_get("xpon.common","phyStatus","h") = "down" then %>	
									<div id="head-text" class="mr-auto"><%tcWebApi_get("String_Entry","Redirect1Text_lostphy","s")%></div>
								<% end if %>
								<% if tcWebApi_get("xpon.common","phyStatus","h") = "gpon_phy_down" then %>	
									<div id="head-text" class="mr-auto"><%tcWebApi_get("String_Entry","Redirect1Text_lostphy","s")%></div>
								<% end if %>
								<% if tcWebApi_get("xpon.common","phyStatus","h") = "gpon_phy_up" then %>	
									<% if tcWebApi_get("wan.pvc.1.entry.1","IPVERSION","h") = "IPv4/IPv6" then %>
										<% if tcWebApi_get("waninfo.entry.1","Status","h") <> "up" then %>				
											<div id="head-text" class="mr-auto"><%tcWebApi_get("String_Entry","Redirect1Text","s")%></div>
										<% end if %>
										<% if tcWebApi_get("waninfo.entry.1","Status6","h") <> "up" then %>
											<% if tcWebApi_get("waninfo.entry.1","Status","h") <> "up" then %>
											<% else %>
												<div id="head-text" class="mr-auto"><%tcWebApi_get("String_Entry","Redirect1Text","s")%></div>
											<% end if %>
										<% end if %>	
									<% end if %>
									<% if tcWebApi_get("wan.pvc.1.entry.1","IPVERSION","h") = "IPv4" then %>
										<% if tcWebApi_get("waninfo.entry.1","Status","h") <> "up" then %>
											<div id="head-text" class="mr-auto"><%tcWebApi_get("String_Entry","Redirect1Text","s")%></div>
										<% end if %>	
									<% end if %>
									<% if tcWebApi_get("wan.pvc.1.entry.1","IPVERSION","h") = "IPv6" then %>
										<% if tcWebApi_get("waninfo.entry.1","Status6","h") <> "up" then %>
											<div id="head-text" class="mr-auto"><%tcWebApi_get("String_Entry","Redirect1Text","s")%></div>
										<% end if %>	
									<% end if %>
								<% end if %>
							<% else %>
								<div id="head-text" class="mr-auto"><%tcWebApi_get("String_Entry","Redirect1Text","s")%></div>
							<% end if %>
							<a href="#" onclick="gotoLoginPage()"  style="color: black !important"><em class="fa fa-times"></em></a>
						</header>
						<div id="body-text">
							<% if tcWebApi_get("String_Entry","BranchName","h") = "Mytel" then %>
								<% if tcWebApi_get("xpon.common","phyStatus","h") = "gpon_phy_up" then %>
								<% if tcWebApi_get("xpon.common","trafficStatus","h") = "down" then %>
									<p><%tcWebApi_get("String_Entry","Redirect2Text","s")%> <a href="tel:<%tcWebApi_get("String_Entry","ReportProblemsContact","h")%></a>"><%tcWebApi_get("String_Entry","ReportProblemsContact","s")%></a> <%tcWebApi_get("String_Entry","Redirect3Text","s")%></p>
									<p><%tcWebApi_get("String_Entry","Redirect4Text","s")%> <b><%tcWebApi_get("Wan_PVC0_Entry0","USERNAME","s")%></b></p>
								<% end if %>
								<% end if %>
								<% if tcWebApi_get("xpon.common","phyStatus","h") = "down" then %>	
									<p><%tcWebApi_get("String_Entry","Redirect2Text_lostphy","s")%> <a href="tel:<%tcWebApi_get("String_Entry","ReportProblemsContact","h")%></a>"><%tcWebApi_get("String_Entry","ReportProblemsContact","s")%></a> <%tcWebApi_get("String_Entry","Redirect3Text","s")%></p>
									<p><%tcWebApi_get("String_Entry","Redirect4Text","s")%> <b><%tcWebApi_get("Wan_PVC0_Entry0","USERNAME","s")%></b></p>
								<% end if %>
								<% if tcWebApi_get("xpon.common","phyStatus","h") = "gpon_phy_down" then %>	
									<p><%tcWebApi_get("String_Entry","Redirect2Text_lostphy","s")%> <a href="tel:<%tcWebApi_get("String_Entry","ReportProblemsContact","h")%></a>"><%tcWebApi_get("String_Entry","ReportProblemsContact","s")%></a> <%tcWebApi_get("String_Entry","Redirect3Text","s")%></p>
									<p><%tcWebApi_get("String_Entry","Redirect4Text","s")%> <b><%tcWebApi_get("Wan_PVC0_Entry0","USERNAME","s")%></b></p>
								<% end if %>
								<% if tcWebApi_get("xpon.common","phyStatus","h") = "gpon_phy_up" then %>	
									<% if tcWebApi_get("xpon.common","trafficStatus","h") = "up" then %>
										<% if tcWebApi_get("wan.pvc.1.entry.1","IPVERSION","h") = "IPv4/IPv6" then%>
											<% if tcWebApi_get("waninfo.entry.1","Status","h") <> "up" then%>
											<p><%tcWebApi_get("String_Entry","Redirect2Text","s")%> <a href="tel:<%tcWebApi_get("String_Entry","ReportProblemsContact","h")%></a>"><%tcWebApi_get("String_Entry","ReportProblemsContact","s")%></a> <%tcWebApi_get("String_Entry","Redirect3Text","s")%></p>
											<p><%tcWebApi_get("String_Entry","Redirect4Text","s")%> <b><%tcWebApi_get("Wan_PVC0_Entry0","USERNAME","s")%></b></p>
										<% end if %>
										<% if tcWebApi_get("waninfo.entry.1","Status6","h") <> "up" then %>
											<% if tcWebApi_get("waninfo.entry.1","Status","h") <> "up" then %>
											<% else %>
												<p><%tcWebApi_get("String_Entry","Redirect2Text","s")%> <a href="tel:<%tcWebApi_get("String_Entry","ReportProblemsContact","h")%></a>"><%tcWebApi_get("String_Entry","ReportProblemsContact","s")%></a> <%tcWebApi_get("String_Entry","Redirect3Text","s")%></p>
												<p><%tcWebApi_get("String_Entry","Redirect4Text","s")%> <b><%tcWebApi_get("Wan_PVC0_Entry0","USERNAME","s")%></b></p>
											<% end if %>	
										<% end if %>
										<% end if %>
										<% if tcWebApi_get("wan.pvc.1.entry.1","IPVERSION","h") = "IPv4" then %>
											<% if tcWebApi_get("waninfo.entry.1","Status","h") <> "up" then %>
											<p><%tcWebApi_get("String_Entry","Redirect2Text","s")%> <a href="tel:<%tcWebApi_get("String_Entry","ReportProblemsContact","h")%></a>"><%tcWebApi_get("String_Entry","ReportProblemsContact","s")%></a> <%tcWebApi_get("String_Entry","Redirect3Text","s")%></p>
											<p><%tcWebApi_get("String_Entry","Redirect4Text","s")%> <b><%tcWebApi_get("Wan_PVC0_Entry0","USERNAME","s")%></b></p>
											<% end if %>	
										<% end if %>
										<% if tcWebApi_get("wan.pvc.1.entry.1","IPVERSION","h") = "IPv6" then %>
											<% if tcWebApi_get("waninfo.entry.1","Status6","h") <> "up" then %>
											<p><%tcWebApi_get("String_Entry","Redirect2Text","s")%> <a href="tel:<%tcWebApi_get("String_Entry","ReportProblemsContact","h")%></a>"><%tcWebApi_get("String_Entry","ReportProblemsContact","s")%></a> <%tcWebApi_get("String_Entry","Redirect3Text","s")%></p>
											<p><%tcWebApi_get("String_Entry","Redirect4Text","s")%> <b><%tcWebApi_get("Wan_PVC0_Entry0","USERNAME","s")%></b></p>
											<% end if %>	
										<% end if %>
									<% end if %>
								<% end if %>
							<% else %>
								<p><%tcWebApi_get("String_Entry","Redirect2Text","s")%> <a href="tel:<%tcWebApi_get("String_Entry","ReportProblemsContact","h")%>"><%tcWebApi_get("String_Entry","ReportProblemsContact","s")%></a> <%tcWebApi_get("String_Entry","Redirect3Text","s")%></p>
								<p><%tcWebApi_get("String_Entry","Redirect4Text","s")%><b><%tcWebApi_get("Wan_PVC0_Entry0","USERNAME","s")%></b></p>
							<% end if %>
							<div class="col-lg-12 d-flex align-items-center justify-content-center">
								<button type="button" class="page-button small-button" onclick="gotoLoginPage();"><%tcWebApi_get("String_Entry","GoToSettingText","s")%></button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
