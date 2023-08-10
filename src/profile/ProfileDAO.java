package profile;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;



public class ProfileDAO {
	private static String url = "jdbc:mysql://localhost:3306/trip";
	private static String username = "root";
	private static String pw = "root";
	
	public static boolean updateProfileSelection(byte[] img, String id) {
		Connection conn = null;
		PreparedStatement stmt = null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			e1.printStackTrace();
		}
		
		try {
			conn = DriverManager.getConnection(url, username, pw);
			stmt = conn.prepareStatement("UPDATE member SET profile = ? WHERE id = ?");
			
			stmt.setBytes(1, img);
			stmt.setString(2, id);
			
			int result = stmt.executeUpdate();

            return result > 0;
            
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
		return false;
	}
}
