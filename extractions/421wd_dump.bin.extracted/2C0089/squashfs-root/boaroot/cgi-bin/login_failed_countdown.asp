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
		<script language='javascript' src='/JS/jquery.js'></script>
	<body onLoad="getTimeNow();" class="container" id="extra-page">
		<INPUT TYPE="HIDDEN" NAME="uptime" id="uptime" VALUE="0">
		<div id="content">
			<div class="row  justify-content-center">
				<div id="login-fail-box" class="col-xs-12 col-sm-10 col-md-7">
					<div id="single-card" class="card p-4">
						<header class="d-flex mb-4">
							<div class="hidden-xs hidden-sm mr-2"><em class="fas fa-exclamation-triangle"></em></div>
							<div id="head-text" class="mr-auto"><%tcWebApi_get("String_Entry","LoginFailHeader","s")%></div>
						</header>
						<p id="body-text">
							<p>
								<%tcWebApi_get("String_Entry","LoginFailCountDown","s")%> <span id="counter"></span>
							</p>
						</p>
					</div>
				</div>
			</div>
		</div>
        <script type="text/javascript">
		function gotoLoginPage() {
			window.location.href = '/cgi-bin/login.asp';
		}
		function getTimeNow(){
			$.ajax({
			url: '/cgi-bin/login_failed_countdown.cgi',
			method: 'GET',
			complete: function(res)
				{
					{
						var obj = JSON.parse(res.responseText);
						document.getElementById("uptime").value = obj["uptime"];
						var count;
						var TimeLastFailed = <%tcWebApi_get("Account_Entry0","LoginFailedTime","s")%>
						if (0 != TimeLastFailed )
						{
							var count;
							count = 60 - (document.getElementById("uptime").value - TimeLastFailed);
							count = count.toExponential(1);
							setInterval(function() 
							{
								/*ONT-203*/
								if (count <= 0) {
									gotoLoginPage();
								}
								var el = document.getElementById('counter');
								el.innerHTML = count--;
							}, 1000)
						}
						else
						{
							gotoLoginPage();
						}
					}
				}
			})
		}
		</script>
	</body>
</html>
