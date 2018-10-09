<%@include file="/common/sub_header.jsp"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>ForgetPassword</title>

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
			<span>To reset your password</span>
		
		</div>

		<div class="loginbody">
			
			<div class="loginbox">
				<form name="form1"  method="post">
							<input type="hidden" id="messageInfo"
								value="${requestScope.messageInfo}" />
					<ul>
						<li>
							<input name="email" id="email" type="text" class="useremail"  
								onclick="JavaScript:this.value=''"  />
						</li>
						
						<li>
							<input name="" type="button" class="loginbtn" value="Submit"
								onclick="submit();"/>			 
						</li>
						
				 	 </ul>
				</form>
			</div>
		</div>
	</body>
</html>
<script>
function submit() {

	if ($("#email").val() == "") {
		$.messager.alert('Warning', 'Input the email！', 'warning');
		return;
	}
	document.forms[0].action = "<%=path%>/SubmitAction";
	document.forms[0].submit();

}
</script>