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
	// 최신순
	public List<Companion2> getList(int offset) throws SQLException {
		String sql = "SELECT no, A.id, start, end, location, image, title, content, personnel,\r\n" + 
				"concept1, concept2, concept3, time, nickname\r\n" + 
				"FROM companionboard as A JOIN member as B ON A.id = B.id ORDER BY no DESC LIMIT 9 offset ?";
		List<Companion2> list = new ArrayList<Companion2>();
		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		try {
			conn = DBUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, offset);
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
				String nickname = rs.getString("nickname");
				
				byte[] imageBytes = rs.getBytes("image");

	            // Convert the BLOB data to a Base64-encoded string
	            String image = Base64.getEncoder().encodeToString(imageBytes);
				
				Companion2 c = new Companion2(no, id, start, end, location, image, title, content, personnel, concept1, concept2, concept3, nickname);
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
	
	
	// 최신순 + 검색
	public List<Companion2> getSearchList(int offset, String search) throws SQLException {
		String sql = "SELECT no, A.id, start, end, location, image, title, content, personnel,\r\n" + 
				"concept1, concept2, concept3, time, nickname\r\n" + 
				"FROM companionboard as A JOIN member as B ON A.id = B.id\r\n" + 
				"Where location = ? or title LIKE ? or content LIKE ? \r\n" + 
				"ORDER BY no DESC LIMIT 9 OFFSET ?;";
		List<Companion2> list = new ArrayList<Companion2>();
		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		try {
			conn = DBUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, search);
			stmt.setString(2, "%" + search + "%");
			stmt.setString(3, "%" + search + "%");
			stmt.setInt(4, offset);
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
				String nickname = rs.getString("nickname");
				
				byte[] imageBytes = rs.getBytes("image");

	            // Convert the BLOB data to a Base64-encoded string
	            String image = Base64.getEncoder().encodeToString(imageBytes);

				Companion2 c = new Companion2(no, id, start, end, location, image, title, content, personnel, concept1, concept2, concept3, nickname);
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
	
	public int getSearchCount(String search) {
		String sql = "SELECT COUNT(*) FROM companionboard Where location = ? or title LIKE ? or content LIKE ?";
		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		try {
			conn = DBUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, search);
			stmt.setString(2, "%" + search + "%");
			stmt.setString(3, "%" + search + "%");
			
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
	
	// 컨셉
	public List<Companion2> getConceptList(int offset, String concept) throws SQLException {
		String sql = "SELECT no, A.id, start, end, location, image, title, content, personnel,\r\n" + 
				"concept1, concept2, concept3, time, nickname\r\n" + 
				"FROM companionboard as A JOIN member as B ON A.id = B.id WHERE concept1 = ? OR concept2 = ? OR concept3 = ? ORDER BY no DESC LIMIT 9 OFFSET ?";
		List<Companion2> list = new ArrayList<Companion2>();
		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		try {
			conn = DBUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, concept);
			stmt.setString(2, concept);
			stmt.setString(3, concept);
			stmt.setInt(4, offset);
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
				String nickname = rs.getString("nickname");
				
				byte[] imageBytes = rs.getBytes("image");

	            // Convert the BLOB data to a Base64-encoded string
	            String image = Base64.getEncoder().encodeToString(imageBytes);

				Companion2 c = new Companion2(no, id, start, end, location, image, title, content, personnel, concept1, concept2, concept3, nickname);
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
	
	public int getConceptCount(String concept) {
		String sql = "SELECT COUNT(*) FROM companionboard WHERE concept1 = ? OR concept2 = ? OR concept3 = ?";
		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		try {
			conn = DBUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, concept);
			stmt.setString(2, concept);
			stmt.setString(3, concept);
			
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
	
	// 조건 & 컨셉
	public List<Companion2> getSearchConceptList(int offset, String concept, String search) throws SQLException {
		String sql = "SELECT no, A.id, start, end, location, image, title, content, personnel,\r\n" + 
				"concept1, concept2, concept3, time, nickname\r\n" + 
				"FROM companionboard as A JOIN member as B ON A.id = B.id WHERE (concept1 = ? OR concept2 = ? OR concept3 = ?) AND (location = ? OR content LIKE ? OR title LIKE ?) ORDER BY no DESC LIMIT 9 OFFSET ?" ;
		List<Companion2> list = new ArrayList<Companion2>();
		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		try {
			conn = DBUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, concept);
			stmt.setString(2, concept);
			stmt.setString(3, concept);
			stmt.setString(4, search);
			stmt.setString(5, "%" + search + "%");
			stmt.setString(6, "%" + search + "%");
			stmt.setInt(7, offset);
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
				String nickname = rs.getString("nickname");
				
				byte[] imageBytes = rs.getBytes("image");

	            // Convert the BLOB data to a Base64-encoded string
	            String image = Base64.getEncoder().encodeToString(imageBytes);

				Companion2 c = new Companion2(no, id, start, end, location, image, title, content, personnel, concept1, concept2, concept3, nickname);
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
	
	public int getSearchConceptCount(String concept, String search) {
		String sql = "SELECT COUNT(*) FROM companionboard WHERE (concept1 = ? OR concept2 = ? OR concept3 = ?) AND (location = ? OR content LIKE ? OR title LIKE ?)";
		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		try {
			conn = DBUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, concept);
			stmt.setString(2, concept);
			stmt.setString(3, concept);
			stmt.setString(4, search);
			stmt.setString(5, "%" + search + "%");
			stmt.setString(6, "%" + search + "%");
			
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
