package tendency;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class TendencyDAO {
	private static String url = "jdbc:mysql://localhost:3306/trip";
	private static String username = "root";
	private static String pw = "root";
	
	public static void insertTendency(Tendency userTendency) {
		 Connection conn = null;
	     PreparedStatement stmt = null;
	     
	     try {
				Class.forName("com.mysql.cj.jdbc.Driver");
			} catch (ClassNotFoundException e1) {
				e1.printStackTrace();
			}
	     
	     try {
			conn = DriverManager.getConnection(url, username, pw);
			
			 String query = "INSERT INTO triptendency (id, triptendency1, triptendency2, triptendency3, "
	                    + "mytendency1, mytendency2, mytendency3, mytendency4, mytendency5, mytendency6) "
	                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			 
			 stmt = conn.prepareStatement(query);
          stmt.setString(1, Tendency.getId());
          stmt.setString(2, Tendency.getTriptendency1());
          stmt.setString(3, Tendency.getTriptendency2());
          stmt.setString(4, Tendency.getTriptendency3());
          stmt.setString(5, Tendency.getMytendency1());
          stmt.setString(6, Tendency.getMytendency2());
          stmt.setString(7, Tendency.getMytendency3());
          stmt.setString(8, Tendency.getMytendency4());
          stmt.setString(9, Tendency.getMytendency5());
          stmt.setString(10, Tendency.getMytendency6());

	            stmt.executeUpdate();
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
