package companionBoard;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import dbutil.DBUtil;

public class CompanionBoardDAO {
	
	public int insertData(Companion companionBoard) throws SQLException {
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
			stmt.setBytes(5, companionBoard.getImage());
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
	
	
	public List<Companion2> getList(int number) throws SQLException {
		String sql = "SELECT * FROM companionboard WHERE no = " + number;
		List<Companion2> list = new ArrayList<Companion2>();
		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		try {
			conn = DBUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				int no = rs.getInt("no");
				String id = rs.getString("id");
				String start = rs.getString("start");
				String end = rs.getString("end");
				String location = rs.getString("location");

				String title = rs.getString("title");
				String content = rs.getString("content");
				int personnel = rs.getInt("personnel");
				String concept1 = rs.getString("concept1");
				String concept2 = rs.getString("concept2");
				String concept3 = rs.getString("concept3");
				
				byte[] imageBytes = rs.getBytes("image");

	            String image = Base64.getEncoder().encodeToString(imageBytes);

				Companion2 c = new Companion2(no, id, start, end, location, image, title, content, personnel, concept1, concept2, concept3);
				list.add(c);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(stmt);
			DBUtil.close(conn);
			DBUtil.close(rs);
		}
		return list;
	}
	
	
}
