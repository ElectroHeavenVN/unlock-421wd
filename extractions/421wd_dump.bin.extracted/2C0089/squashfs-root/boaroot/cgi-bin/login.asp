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
		<title><%tcWebApi_get("String_Entry","ButtonLogInText","s")%></title>
		<meta charset="utf-8">
		<meta HTTP-EQUIV="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<meta http-equiv="x-ua-compatible" content="IE=edge">
		<script language='javascript' src='/JS/jquery.js'></script>
		<script language='javascript' src='/JS/util.js'></script>
		<script language='javascript' src='/JS/bootstrap.bundle.min.js'></script>
		<link rel="stylesheet" type="text/css" href="/style.css">
	<script language="javascript" type=text/javascript>
	function CheckLogin()
	{
		var obj;
		obj=document.getElementById("username");
		if(obj.value==""){
			alert("<%tcWebApi_get("String_Entry","LoginInputEmpty","s")%>")
			return false;
		}
		obj=document.getElementById("password");
		if(obj.value==""){
			alert("<%tcWebApi_get("String_Entry","LoginInputEmpty","s")%>")
			return false;
		}
		return true;
	}
	function doReset()
	{
		document.getElementById("username").value="";
		document.getElementById("password").value="";
		document.getElementById("username").focus();
	}
	function doSubmit(index)
	{
		document.login_page.StatusActionFlag.value = index;
		document.login_page.submit();
	}
	function loginAction() 
	{
		if(false == CheckLogin()){
			return false;
		}
		document.login_page.StatusActionFlag.value = "-1";
		document.login_page.submit();
		return true;
	}
	function select_lang(index)
	{
		if( document.login_page.lang.selectedIndex==0 )
			doSubmit(1);
		else if ( document.login_page.lang.selectedIndex==1 )
			doSubmit(2);
	}		
	function changeLang(lang_val)
	{
		$.ajax({
			url: '/cgi-bin/change_lang.cgi?LanguageFlag=1&LanguageValue='+lang_val,
			method: 'GET',
			complete: function(res){
				{
					location.reload();
				}
			}
		}
		)
	}
	</script>
	<body onload="" class="container" id="extra-page">
		<div id="content">
			<div class="row  justify-content-center">
				<div id="login-box" class="col-xs-12  col-sm-10 col-md-7 col-lg-5">
					<div id="upper-card" class="card justify-content-center ">
						<div id="login-logo-img" style="margin-left: auto; margin-right: auto;"><img src="/img/logo_login.png"></div>
						<div id="login-logo-text" class="row justify-content-center mt-1" style="color: #fff;"><b>OPTICAL NETWORK TERMINATION</b></div>
					</div>
					<div id="lower-card" class="card">
						<form method="POST" action="/cgi-bin/login.asp" name="login_page" id="loginui" >
							<input type="hidden" name="StatusActionFlag" value="-1">
							<fieldset class="row justify-content-center">
								<div class="input-group">
									<div class="input-group-prepend">
										<span class="input-group-text border-right-0">
											<i class="fa fa-user"></i>
										</span>
									</div>
									<input type="text" name="Username" id="username" value="" class="form-control border-left-0 border-md" maxlength="30" placeholder="<%tcWebApi_get("String_Entry","LoginUsernameText","s")%>" autocomplete="off">
								</div>
								<div class="input-group">
									<div class="input-group-prepend border-right-0">
										<span class="input-group-text">
											<i class="fa fa-lock"></i>
										</span>
									</div>
									<input type="password" name="Password" id="password" value="" class="form-control border-left-0 border-md" maxlength="30" placeholder="<%tcWebApi_get("String_Entry","LoginPasswordText","s")%>" autocomplete="off">
								</div>
							</fieldset>
							<button type="button" id="login-button" class="btn btn-primary btn-block" onclick="loginAction()">
								<%tcWebApi_get("String_Entry","ButtonLogInText","s")%>
							</button>
							<div class="d-flex align-items-center justify-content-center">
								<a class="label nav-link dropdown-toggle" href="#" id="LanguageDropdown" role="button" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-globe" aria-hidden="true"></i>
									<%tcWebApi_get("String_Entry","LoginLanguage","s")%></a>
								<ul class="dropdown-menu" aria-labelledby="LanguageDropdown">
									<li><a class="dropdown-item <% if tcWebApi_get("LanguageSwitch_Entry","Type","h") = "1" then asp_Write("active") end if %>" href="#" onclick="changeLang(1);">Tiếng Việt</a></li>
									<li><a class="dropdown-item <% if tcWebApi_get("LanguageSwitch_Entry","Type","h") = "2" then asp_Write("active") end if %>" href="#" onclick="changeLang(2);">English</a></li>
								</ul>
							</div>
							<div id="forgetpw">
								<a href="/cgi-bin/login_forget_password.asp" class="label" id="forgetpw_button"><%tcWebApi_get("String_Entry","LoginForgetPassword","s")%>?</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<script>
			$("input").keypress(function(e)
			{
				if (e.which == 13)
				{
					loginAction();
				}
			});
		</script>
		<footer>
			<p><%tcWebApi_get("String_Entry","SaleConsultantText","s")%>: <a href="tel:18008168">18008168</a></p>
			<p><%tcWebApi_get("String_Entry","ReportProblemText","s")%>: <a href="tel:18008119">18008119</a></p>
			<p>&copy; 2021 by VHT. All rights reserved.</p>
		</footer>
	</body>
</html>
