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
		<title>Viettel ONT - <%tcWebApi_get("String_Entry","ErrorText","s")%>!</title>
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
							<div id="head-text" class="mr-auto"><%tcWebApi_get("String_Entry","Redirect1Text","s")%></div>
							<a href="#" onclick="gotoLoginPage()"  style="color: black !important"><em class="fa fa-times"></em></a>
						</header>
						<div id="body-text">
							<p><%tcWebApi_get("String_Entry","Redirect2Text","s")%> <a href="tel:18008119">18008119</a> <%tcWebApi_get("String_Entry","Redirect3Text","s")%></p>
							<p><%tcWebApi_get("String_Entry","Redirect4Text","s")%><b><%tcWebApi_get("Wan_PVC0_Entry0","USERNAME","s")%></b></p>
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
