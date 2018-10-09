<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link href="<%=path %>/ncss/css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="<%=path %>/ncss/js/jquery.js"></script>
<title>Bibliosoft</title>
<script language=JavaScript>
function logout(){
	if (confirm("Are you sure you want to exit Bibliosoft?"))
	top.location = "loginout.jsp";
	return false;
}
</script>

</head> 
<body style="background:url(<%=path %>/ncss/images/topbg.gif) repeat-x;">

    <div class="topleft">
    <a href="<%=path %>/index.jsp" target="_parent"><img src="<%=path %>/ncss/images/logo.png" title="index" /></a>
    </div>
    
            
    <div class="topright">    
    <ul>
    
    <li><a href="#" target="_self" onClick="logout();">Exit</a></li>
    </ul>
     
    <div class="user">
    <span>${user}(${type})</span>
     
    </div>    
    
    </div>

</html>

