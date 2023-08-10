package companionBoard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

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
}
