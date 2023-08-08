package companionBoard;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;


import dbutil.DBUtil;

public class CompanionListDAO {
	public List<Companion2> getList(int offset) throws SQLException {
		String sql = "SELECT * FROM companionboard ORDER BY no DESC LIMIT 9 OFFSET " + offset;
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

	            // Convert the BLOB data to a Base64-encoded string
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
	
	public List<Companion2> getNewestList(int offset, String search) throws SQLException {
		String sql = "SELECT * FROM companionboard WHERE location = ? or title = ? or content = ? ORDER BY no DESC LIMIT 9 OFFSET " + offset;
		List<Companion2> list = new ArrayList<Companion2>();
		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		try {
			conn = DBUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, search);
			stmt.setString(2, search);
			stmt.setString(3, search);
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

	            // Convert the BLOB data to a Base64-encoded string
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
	
	// 검색
	
	
	
	public int getCount() {
		String sql = "SELECT COUNT(*) FROM companionboard";
		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		try {
			conn = DBUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			if (rs.next()) {
				return rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(stmt);
			DBUtil.close(conn);
			DBUtil.close(rs);
		}
		return -1;
	}
}
