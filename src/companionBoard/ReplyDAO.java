package companionBoard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import dbutil.DBUtil;

public class ReplyDAO {
	public int insertData(Reply reply) throws SQLException {
		String sql = "INSERT INTO reply(no, id, content) VALUES (?, ?, ?);";
		Connection conn = null;
		PreparedStatement stmt = null;

		try {
			conn = DBUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			
			stmt.setInt(1, reply.getNo());
			stmt.setString(2, reply.getId());
			stmt.setString(3, reply.getContent());

			return stmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(stmt);
			DBUtil.close(conn);
		}
		return -1;
	}
	
	
	public List<BoardReply> getList(int number) throws SQLException {
		String sql = "SELECT A.no, A.id, A.content, A.time, B.profile FROM reply as A JOIN member as B on A.id = B.id WHERE no = ?";
		List<BoardReply> list = new ArrayList<BoardReply>();
		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		try {
			conn = DBUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, number);
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				String id = rs.getString("id");
				String content = rs.getString("content");
				String time = rs.getString("time");
				
				byte[] imageBytes = rs.getBytes("profile");

	            String image = Base64.getEncoder().encodeToString(imageBytes);

	            BoardReply reply = new BoardReply(id, content, image, time);
				
				list.add(reply);
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
