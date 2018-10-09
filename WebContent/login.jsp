<%@include file="/common/sub_header.jsp"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Bibliosoft</title>
</script><link href="<%=path %>/ncss/css/style.css" rel="stylesheet" type="text/css" />

<script language="javascript">
$(function() {
	$('.loginbox').css( {
		'position' : 'absolute',
		'left' : ($(window).width() - 692) / 2
	});
	$(window).resize(function() {
		$('.loginbox').css( {
			'position' : 'absolute',
			'left' : ($(window).width() - 692) / 2
		});
	})
});
</script>

</head>
	<body
		style="background-color: #1c77ac; background-image: url(images/light.png); background-repeat: no-repeat; background-position: center top; overflow: hidden;">


		<div id="mainBody">
			<div id="cloud1" class="cloud"></div>
			<div id="cloud2" class="cloud"></div>
		</div>


		<div class="logintop">
			<span>Welcome to login：Bibliosoft</span>
		</div>

		<div class="loginbody">
			<span class="systemlogo"></span>	
			<div class="loginbox">
				<form name="form1" action="loginuser!logon.action" method="post">
				
				<input type="hidden" id="messageInfo" value="${requestScope.messageInfo}" />
					<ul>						
						<li>
							<input name="username" id="username" type="text" class="loginuser"  
								onclick="JavaScript:this.value=''"  />
						</li>
						<li>
							<input name="password"  id="password" type="password" class="loginpwd"  
								onclick="JavaScript:this.value=''" />
						</li>
						<li>
							<select name="type" id="type">
							   <option value="reader">Reader</option>
							    <option value="librarian">Librarian</option>
							   <option value="admin">Admin</option>					   
							</select>			
							<a href = "" style = "padding:0px 0px 0px 18px" onclick = "window.open('forgetPassword.jsp')">ForgetPassword</a>			
						</li>
						
						<li>
							<input name="" type="button" class="loginbtn" value="Log in"
								onclick="login();"/>
							<input name="" type="button" class="loginbtn" value="Sign up"
								onclick="register();"/>				 
						</li>
						
					</ul>
				</form>
			</div>
		</div>
	</body>
</html>
<script>

function login() {

	if ($("#username").val() == "") {
		$.messager.alert('Warning', 'Input the username！', 'warning');
		return;
	}
	if ($("#userpwd").val() == "") {
		$.messager.alert('Warning', 'Input the password！', 'warning');
		return;
	}
	document.forms[0].action = "<%=path%>/LoginAction";
	document.forms[0].submit();

}
function register() {

	var type=document.getElementById("type").value;
	if (type == "admin"){
		document.forms[0].action = "<%=path%>/admin/regAdmin.jsp";
	}
	if (type == "reader"){
		document.forms[0].action = "<%=path%>/reader/regReader.jsp";
	}
	if (type == "librarian"){
		document.forms[0].action = "<%=path%>/librarian/regLibrarian.jsp";
	}
	document.forms[0].submit();

}
</script>