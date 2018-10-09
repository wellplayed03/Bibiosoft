<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib
    prefix="c"
    uri="http://java.sun.com/jsp/jstl/core" 
%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>LeftFrame</title>
	<link href="<%=path%>/ncss/css/style.css" rel="stylesheet"
		type="text/css" />
	<script language="JavaScript" src="<%=path%>/ncss/js/jquery.js">
	</script>

<script type="text/javascript">
$(function() {
	//导航切换
	$(".menuson li").click(function() {
		$(".menuson li.active").removeClass("active")
		$(this).addClass("active");
	});

	$('.title').click(function() {
		var $ul = $(this).next('ul');
		$('dd').find('ul').slideUp();
		if ($ul.is(':visible')) {
			$(this).next('ul').slideUp();
		} else {
			$(this).next('ul').slideDown();
		}
	});
})
</script>


</head>

<body style="background: #f0f9fd;">
	<div class="lefttop">
		<span></span>
	</div>

	<dl class="leftmenu">
		<c:if test="${type=='reader'}">
			<dd>
				<div class="title">
					<span><img src="<%=path%>/ncss/images/leftico01.png" /> </span>Personal information
				</div>
				<ul class="menuson">
					<li>
						<cite></cite><a href="<%=path%>/reader/modMyReader.jsp"
							target="rightFrame">Modify information</a><i></i>
					</li>

				</ul>
			</dd>
			<dd>
				<div class="title">
					<span><img src="<%=path%>/ncss/images/leftico01.png" /> </span>Borrowing books
				</div>
				<ul class="menuson">
					<li>
						<cite></cite><a href="<%=path%>/book/borrowinglist.jsp"
							target="rightFrame">Borrowing books</a><i></i>
					</li>

				</ul>
			</dd>
			
		</c:if>

		<c:if test="${type=='librarian'}">
			<dd>
				<div class="title">
					<span><img src="<%=path%>/ncss/images/leftico01.png" /> </span>Personal information
				</div>
				<ul class="menuson">
					<li>
						<cite></cite><a href="<%=path%>/librarian/modMyLibrarian.jsp"
							target="rightFrame">Modify information</a><i></i>
					</li>

				</ul>
			</dd>

			<dd>
				<div class="title">
					<span><img src="<%=path%>/ncss/images/leftico01.png" /> </span>Book information
				</div>
				<ul class="menuson">
					<li>
						<cite></cite><a href="<%=path%>/book/list.jsp"
							target="rightFrame">Book management</a><i></i>
					</li>
					<li>
						<cite></cite><a href="<%=path%>/book/lendinglist.jsp"
							target="rightFrame">Lending information</a><i></i>
					</li>
					<li>
						<cite></cite><a href="<%=path%>/book/returnbooklist.jsp"
							target="rightFrame">return Book</a><i></i>
					</li>
				</ul>
			</dd>	
		</c:if>

		<c:if test="${type=='admin'}">
			<dd>
				<div class="title">
					<span><img src="<%=path%>/ncss/images/leftico01.png" /> </span>Personal information
				</div>
				<ul class="menuson">
					<li>
						<cite></cite><a href="<%=path%>/admin/modMyAdmin.jsp"
							target="rightFrame">Modify information</a><i></i>
					</li>

				</ul>
			</dd>
			<dd>
				<div class="title">
					<span><img src="<%=path%>/ncss/images/leftico01.png" /> </span>Admin management
				</div>
				<ul class="menuson">
					<li>
						<cite></cite><a href="<%=path%>/admin/list.jsp"
							target="rightFrame">Manage information</a><i></i>
					</li>

				</ul>
			</dd>
			<dd>
				<div class="title">
					<span><img src="<%=path%>/ncss/images/leftico01.png" /> </span>Reader management
				</div>
				<ul class="menuson">
					<li>
						<cite></cite><a href="<%=path%>/reader/list.jsp" 
							target="rightFrame">Manage information</a><i></i>
					</li>

				</ul>
			</dd>
			
			<dd>
				<div class="title">
					<span><img src="<%=path%>/ncss/images/leftico01.png" /> </span>Librarian management
				</div>
				<ul class="menuson">
					<li>
						<cite></cite><a href="<%=path%>/librarian/list.jsp"
							target="rightFrame">Manage information</a><i></i>
					</li>

				</ul>
			</dd>
		</c:if>
	</dl>

	<div style="display: none">

	</div>
</body>
</html>
