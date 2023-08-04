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
	
	public int insertData(CompanionBoard companionBoard) throws SQLException {
		String sql = "INSERT INTO companionboard(id, start, end, location, image, title, content, personnel, concept1, concept2, concept3) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		Connection conn = null;
		PreparedStatement stmt = null;

		try {
			conn = DBUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			
			stmt.setString(1, companionBoard.getId());
			stmt.setString(2, companionBoard.getStart());
			stmt.setString(3, companionBoard.getEnd());
			stmt.setString(4, companionBoard.getLocation());
			stmt.setBinaryStream(5, companionBoard.getImage());
			stmt.setString(6, companionBoard.getTitle());
			stmt.setString(7, companionBoard.getContent());
			stmt.setInt(8, companionBoard.getPersonnel());
			stmt.setString(9, companionBoard.getConcept1());
			stmt.setString(10, companionBoard.getConcept2());
			stmt.setString(11, companionBoard.getConcept3());
			
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
