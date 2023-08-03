package companionBoard;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import dbutil.DBUtil;

public class CompanionBoardDAO {
	
	public int insertData(String start, String end, String location, InputStream image, String title, String content, int personnel) throws SQLException {
		String sql = "INSERT INTO companionboard(start, end, location, image, title, content, personnel) VALUES (?, ?, ?, ?, ?, ?, ?)";
		Connection conn = null;
		PreparedStatement stmt = null;

		try {
			conn = DBUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			
			stmt.setString(1, start);
			stmt.setString(2, end);
			stmt.setString(3, location);
			stmt.setBinaryStream(4, image);
			stmt.setString(5, title);
			stmt.setString(6, content);
			stmt.setInt(7, personnel);
			
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
