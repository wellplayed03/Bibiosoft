<%@include file="/common/sub_header.jsp"%>
<%@ page contentType="text/html;charset=UTF-8"
	import="java.util.*,java.sql.*,db.*" pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");

	String password = request.getParameter("password");
	String sex = request.getParameter("sex");
	String age = request.getParameter("age");
	String tel = request.getParameter("tel");
	String card = request.getParameter("card");
	String info = request.getParameter("info");

	DBManager dbm = new DBManager();
	String sql = "update librarian set password='" + password + "',sex='" + sex+ "',age='" + age
			+ "',tel='" + tel + "',card='" + card + "',info='"
			+ info + "' where id=" + id;
	System.out.println(sql);

	Statement stat = null;
	Connection conn = null;
	try {
		conn = dbm.getConnection();
		stat = conn.createStatement();
		stat.execute(sql);
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} finally {
		try {
			if (stat != null)
				stat.close();
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	response.sendRedirect("modMyLibrarian.jsp");
%>
