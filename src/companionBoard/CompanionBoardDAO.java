package companionBoard;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import dbutil.DBUtil;

public class CompanionBoardDAO {
	
	public int insertData(String title, String content) throws SQLException {
		String sql = "INSERT INTO companionboard(title, content) VALUES (?, ?)";
		Connection conn = null;
		PreparedStatement stmt = null;

		try {
			conn = DBUtil.getConnection();
			stmt = conn.prepareStatement(sql);

			stmt.setString(1, title);
			stmt.setNString(2, content);
			
			return stmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(stmt);
			DBUtil.close(conn);
		}
		return -1;
	}
}
