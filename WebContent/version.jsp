<%@ page language="java" import="java.util.*,db.*,java.sql.*"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>

		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<link rel="stylesheet" href="css/common.css" type="text/css" />
		<title>Administrative areas</title>
	</head>
	<body>
		<div id="man_zone">

			<table width="95%" border="0" align="center" cellpadding="3"
				cellspacing="1" class="table_style">
				<tr>
					<td colspan="2">
						&nbsp;Copyright information
					</td>
				</tr>
				<tr>
					<td width="18%" class="left_title_2">
						<span class="left-title">Systematic name</span>
					</td>
					<td width="82%">
						&nbsp;Bibliosoft
					</td>
				</tr>
				<tr>
					<td class="left_title_2">
						Current version
					</td>
					<td>
						&nbsp;Version1.0
					</td>
				</tr>

				<tr>
					<td class="left_title_2">
						Author
					</td>
					<td>
						&nbsp;<a href="http://www.biyeseng.cn" target="_blank">Npuers</a>
					</td>
				</tr>
				<tr>
					<td class="left_title_2">
						E-mail
					</td>
					<td>
						&nbsp;2016303***@nwpu.edu.cn
					</td>
				</tr>

			</table>
			<br />

			<%
				String type = session.getAttribute("type") + "";
				if (type.equals("reader")) {
			%>


			<table width="95%" border="0" align="center" cellpadding="3"
				cellspacing="1" class="table_style">
				<tr>
					<td colspan="12">
						&nbsp;Unreturned book
					</td>
				</tr>
				<tr>
					<td width="30%" class="left_title_1">
						<span class="left-title">Book</span>
					</td>
					<td width="35%" class="left_title_1">
						<span class="left-title">Borrow Date</span>
					</td>
					<td width="35%" class="left_title_1">
						<span class="left-title">Return Date</span>
					</td>
				</tr>
				<%
					DBManager dbm = new DBManager();
						Connection conn = dbm.getConnection();

						String sql = "select * from book b,borrowing br where b.id=br.bookid and br.username='"+session.getAttribute("username")+"' ";

						PreparedStatement pstmt = conn.prepareStatement(sql);
						ResultSet rs = pstmt.executeQuery();

						while (rs.next()) {
							String id = rs.getString("id");
				%>
				<tr>
					<td width="30%" align="right">
						<span class="left-title"><%=rs.getString("name") %>(<%=rs.getString("press") %>)</span>
					</td>
					<td width="35%" align="right">
						<span class="left-title"><%=rs.getString("borrowdate") %></span>
					</td>
					<td width="35%" align="right">
						<span class="left-title"><%=rs.getString("returndate") %></span>
					</td>
				</tr>
				<%
					}
						if (rs != null)
							rs.close();
						if (pstmt != null)
							pstmt.close();
						if (conn != null)
							conn.close();
				%>

			</table>
			<%
				}
			%>

		</div>
	</body>
</html>
