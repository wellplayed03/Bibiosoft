package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

/**
 * 数据库管理类
 *
 */

public class DBManager {

	public static final String DEFAULT_DRIVER_NAME = "com.mysql.jdbc.Driver";
	public static final String DEFAULT_DB_URL = "jdbc:mysql://localhost:3306/tsgglxt?useUnicode=true&characterEncoding=UTF-8";

	public static String DB_URL = null;

	public static Properties prop = null;

	// 获取数据连接
	public Connection getConnection() {

		Connection coon = null;
		try {
			Class.forName(DEFAULT_DRIVER_NAME);
			coon = DriverManager.getConnection(DEFAULT_DB_URL, "root", "123456");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return coon;
	}

	public static void main(String[] args) {
		DBManager manager = new DBManager();
		manager.getConnection();
	}

	public String loginAdmin(String username, String pwd) {

		Connection con = getConnection();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		try {
			pstmt = con
					.prepareStatement("select * from admin where username='"
							+ username + "' and password='" + pwd + "'");

			rs = pstmt.executeQuery();
			while (rs.next()) {
				return rs.getString("type");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return null;
	}
	
	public String loginReader(String username, String pwd) {

		Connection con = getConnection();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		try {
			pstmt = con
					.prepareStatement("select * from reader where username='"
							+ username + "' and password='" + pwd + "'");

			rs = pstmt.executeQuery();
			while (rs.next()) {
				return rs.getString("type");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return null;
	}
	
	public String loginLibrarian(String username, String pwd) {

		Connection con = getConnection();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		try {
			pstmt = con
					.prepareStatement("select * from librarian where username='"
							+ username + "' and password='" + pwd + "'");

			rs = pstmt.executeQuery();
			while (rs.next()) {
				return rs.getString("type");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return null;
	}

	public boolean hasId(String goodsid) {

		Connection coon = getConnection();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		try {
			pstmt = coon.prepareStatement("select * from kucun where goodsid='"
					+ goodsid + "'");

			rs = pstmt.executeQuery();
			while (rs.next()) {
				return true;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (coon != null)
					coon.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return false;
	}

	public static String TextToHtml(String sourcestr) {
		int strlen;
		String restring = "", destr = "";
		strlen = sourcestr.length();
		for (int i = 0; i < strlen; i++) {
			char ch = sourcestr.charAt(i);
			switch (ch) {
			case '<':
				destr = "<";
				break;
			case '>':
				destr = ">";
				break;
			case '\"':
				destr = "\"";
				break;
			case '&':
				destr = "&";
				break;
			case 13:
				destr = "<br>";
				break;
			case 32:
				destr = "&nbsp;";
				break;
			default:
				destr = "" + ch;
				break;
			}
			restring = restring + destr;
		}
		return "" + restring;
	}
}
