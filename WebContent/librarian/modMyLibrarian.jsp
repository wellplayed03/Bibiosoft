<%@include file="/common/sub_header.jsp"%>
<%@ page contentType="text/html;charset=UTF-8"
	import="java.util.*,java.sql.*,db.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

		<link href="<%=path%>/css/list.css" rel="stylesheet" type="text/css" />

	</head>
	<body leftMargin=0 topMargin=0 marginwidth="0" marginheight="0">

		<br />
		<form id="form1" name="form1" method="post" action="">

			<table cellpadding='3' cellspacing='1' border='0' class='tableBorder'
				align=center>
				<tr>
					<th class='tableHeaderText' colspan=2 height=25>
						Personal information modification
					</th>
					<%
				DBManager dbm = new DBManager();
				Connection conn = dbm.getConnection();
				
				String sql = "select * from librarian where username='" + session.getAttribute("user") + "'";
				PreparedStatement stat = conn.prepareStatement(sql);
				ResultSet rs = stat.executeQuery();
				rs.next();
			%>
			        <input name="id" type="hidden" id="name" value='<%=rs.getInt("id")%>'>
						<tr>
							<td class='forumRowHighLight' height=23>
								Username
							</td>
							<td class='forumRowHighLight'>
								<input id="username" name="username" type='text'
									value='<%=rs.getString("username")%>' readonly="readonly" size='70'>
									&nbsp; 
							</td>
						</tr>

						<tr>
							<td class='forumRowHighLight' height=23>
								Password
							</td>
							<td class='forumRowHighLight'>
								<input id="password" name="password" type='text'
									value='<%=rs.getString("password")%>' size='70'>
									&nbsp; 
							</td>
						</tr>

						<tr>
							<td class='forumRowHighLight' height=23>
								Sex
							</td>
							<td class='forumRowHighLight'>
								<input id="sex" name="sex" type='text'
									value='<%=rs.getString("sex")%>' size='70'>
									&nbsp; 
							</td>
						</tr>

						<tr>
							<td class='forumRowHighLight' height=23>
								Age
							</td>
							<td class='forumRowHighLight'>
								<input id="age" name="age" type='text'
									value='<%=rs.getString("age")%>' size='70'>
									&nbsp; 
							</td>
						</tr>

						<tr>
							<td class='forumRowHighLight' height=23>
								Tel
							</td>
							<td class='forumRowHighLight'>
								<input id="tel" name="tel" type='text'
									value='<%=rs.getString("tel")%>' size='70'>
									&nbsp; 
							</td>
						</tr>

						<tr>
							<td class='forumRowHighLight' height=23>
								ID card
							</td>
							<td class='forumRowHighLight'>
								<input id="card" name="card" type='text'
									value='<%=rs.getString("card")%>' size='70'>
									&nbsp; 
							</td>
						</tr>

						 
						<tr>
							<td class='forumRowHighLight' height=23>
								Info 
							</td>
							<td class='forumRowHighLight'>
								<input id="info" name="info" type='text'
									value='<%=rs.getString("info")%>' size='70'>
									&nbsp; 
							</td>
						</tr>
						<%
							if (rs != null)
								rs.close();
							if (stat != null)
								stat.close();
							if (conn != null)
								conn.close();
						%>


						<tr>
							<td height="50" colspan=2 class='forumRow'>
								<div align="center">
									<input type="button" name="Submit" value="Save" class="button"
										onclick="save();" />

									<input type="button" name="Submit2" value="Return" class="button"
										onclick="window.history.go(-1);" />
								</div>
							</td>
						</tr>
			</table>
		</form>
	</body>
</html>
<script>

function save() {
	if ($("#name").val() == "") {
		$.messager.alert('Warning', 'Input the username！', 'warning');
		return;
	}
	if ($("#pwd").val() == "") {
		$.messager.alert('Warning', 'Input the password！', 'warning');
		return;
	}
	document.forms[0].action = "<%=path%>/librarian/updatemy.jsp";
	document.forms[0].submit();

}
</script>
