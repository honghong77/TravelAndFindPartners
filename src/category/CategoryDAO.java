package category;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class CategoryDAO {
	private static String url = "jdbc:mysql://localhost:3306/trip";
	private static String username = "root";
	private static String pw = "root";
	
	public void selectCt() {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "";
		try {
			conn = DriverManager.getConnection(url, username, pw);
			stmt = conn.createStatement();
			sql = "select * from category_triptendency;";
			rs = stmt.executeQuery(sql);
			
			while (rs.next()) {}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (stmt != null) {
				try {
					stmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}		
	}
}
