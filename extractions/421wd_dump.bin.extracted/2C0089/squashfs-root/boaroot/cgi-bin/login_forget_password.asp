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
		<title>Viettel ONT - <%tcWebApi_get("String_Entry","LoginForgetPassword","s")%></title>
		<meta charset="utf-8">
		<meta HTTP-EQUIV="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<meta http-equiv="x-ua-compatible" content="IE=edge">		
		<link rel="stylesheet" type="text/css" href="/style.css">
	<body onload="" class="container" id="extra-page">
		<div id="content">
			<div class="row  justify-content-center">
				<div id="login-fail-box" class="col-xs-12 col-sm-10 col-md-7">
					<div id="single-card" class="card p-4">
						<header class="d-flex mb-4">
							<div class="hidden-xs hidden-sm mr-2"><em class="fas fa-exclamation-triangle"></em></div>
							<div id="head-text" class="mr-auto"><%tcWebApi_get("String_Entry","LoginForgetPassword","s")%></div>
							<a href="/cgi-bin/login.asp" style="color: black !important"><em class="fa fa-times"></em></a>
						</header>
						<div id="body-text">
							<p><%tcWebApi_get("String_Entry","ForgetPasswordGuideText","s")%>&nbsp<strong>admin</strong><%tcWebApi_get("String_Entry","ForgetPasswordGuide1Text","s")%>&nbsp<strong>"<%tcWebApi_get("GPON_ONU", "VendorId", "s")%>..."</strong><br>
								<%tcWebApi_get("String_Entry","ForgetPasswordGuide2Text","s")%>&nbsp<a href="tel:18008119">18008119</a>
                                <%tcWebApi_get("String_Entry","ForgetPasswordGuide3Text","s")%></p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
