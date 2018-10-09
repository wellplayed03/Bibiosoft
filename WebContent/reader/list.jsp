<%@include file="/common/sub_header.jsp"%>
<%@ page language="java" import="java.util.*,db.*,java.sql.*" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<link href="<%=path%>/css/list.css" rel="stylesheet" type="text/css" />
	</head>
	<BODY leftMargin=0 topMargin=0 marginwidth="0" marginheight="0">

		<br />


		<table cellpadding='3' cellspacing='1' border='0' class='tableBorder'
			align=center>
			<tr>
				<th width="100%" height=25 class='tableHeaderText'>
					Reader list
				</th>

				<tr>
					<td height="400" valign="top" class='forumRow'>
						<br>
						<table width="95%" border="0" align="center" cellpadding="0"
							cellspacing="0">
							<tr>
								<td height="25" class='forumRowHighLight'>
									&nbsp;|
									<a href="<%=path %>/admin/addAdmin.jsp">Add reader</a>
								</td>
							</tr>
							<tr>
								<td height="30"></td>
							</tr>
						</table>


						<table width="95%" border="0" align="center" cellpadding="0"
							cellspacing="2">
							<tr>
								<td width="10%" height="30" class="TitleHighlight">
									<div align="center" style="font-weight: bold; color: #ffffff">
										Username
									</div>
								</td>
								<td width="10%" height="30" class="TitleHighlight">
									<div align="center" style="font-weight: bold; color: #ffffff">
										Password
									</div>
								</td>
								
								<td width="10%" height="30" class="TitleHighlight">
									<div align="center" style="font-weight: bold; color: #ffffff">
										Sex
									</div>
								</td>
								<td width="10%" height="30" class="TitleHighlight">
									<div align="center" style="font-weight: bold; color: #ffffff">
										Age
									</div>
								</td>
								
								<td width="10%" height="30" class="TitleHighlight">
									<div align="center" style="font-weight: bold; color: #ffffff">
										Tel
									</div>
								</td>
								<td width="10%" height="30" class="TitleHighlight">
									<div align="center" style="font-weight: bold; color: #ffffff">
										ID card
									</div>
								</td>
								<td width="10%" height="30" class="TitleHighlight">
									<div align="center" style="font-weight: bold; color: #ffffff">
										Info
									</div>
								</td>
								
								<td width="9%" class="TitleHighlight">
									<div align="center" style="font-weight: bold; color: #ffffff">
										Operation
									</div>
								</td>
							</tr>
							
							<%
						DBManager dbm = new DBManager();
						Connection conn = dbm.getConnection();
						String queryName = request.getParameter("queryName");
						String sql = "select * from reader";
						if (queryName != null) {
							sql = "select * from reader where username like '%" + queryName
									+ "%'";
						}
						PreparedStatement pstmt = conn.prepareStatement(sql);
						ResultSet rs = pstmt.executeQuery();

						while (rs.next()) {
							String id = rs.getString("id");
					%>




							<tr>
								<td height="40" class='forumRow'>
									<div align="center">
										<%=rs.getString("username")%>
									</div>
								</td>
								<td class='forumRow'>
									<div align="center">
										<%=rs.getString("password")%>
									</div>
								</td>
								
								<td class='forumRow'>
									<div align="center">
										<%=rs.getString("sex")%>
									</div>
								</td>
								<td class='forumRow'>
									<div align="center">
										<%=rs.getString("age")%>
									</div>
								</td>
								
								<td class='forumRow'>
									<div align="center">
										<%=rs.getString("tel")%>
									</div>
								</td>
								<td class='forumRow'>
									<div align="center">
										<%=rs.getString("card")%>
									</div>
								</td>
								<td class='forumRow'>
									<div align="center">
										<%=rs.getString("info")%>
									</div>
								</td>
								 
								<td class='forumRow'>
									<div align="center">
									<a href="<%=path %>/reader/modReader.jsp?id=<%=id %>">Edit</a> |
									<a href="<%=path %>/DelReaderAction?id=<%=id %>">Delete</a> 
									</div>
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


							<tr>
								<td height="35" colspan="8">
									<div align="center">
										<table width='100%'>
											<tr>
												<td align='center' height=25>
													
												</td>
											</tr>
										</table>
									</div>
								</td>
							</tr>
						</table>
						<table width="95%" border="0" align="center" cellpadding="0"
							cellspacing="0">
							<tr>
								<td height="20" class='forumRow'>
									&nbsp;
								</td>
							</tr>
							<tr>
								<td height="25" class='forumRowHighLight'>
									&nbsp;| Search
								</td>
							</tr>
							<tr>
								<td height="70">
								<form action="<%=path %>/reader/list.jsp" method="post">
										<div align="center">
											&nbsp;
											<label>
											</label>
											<label>
												Please input reader name:<input type='text' name='queryName' value=''
										style='width: 150px' />
											</label>
											<label>
												&nbsp;
												<input type="submit"  type="button"	
											 value="Check" />	
											</label>
										</div>
									</form>
								</td>
							</tr>
						</table>
						<br>
					</td>
				</tr>
		</table>