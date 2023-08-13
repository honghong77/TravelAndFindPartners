package companionBoard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dbutil.DBUtil;

public class ScheduleDAO {
	public List<Schedule> getList(String inputId) throws SQLException {
		String sql = "SELECT no, id, title FROM schedule WHERE id = ?";
		List<Schedule> list = new ArrayList<Schedule>();
		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		try {
			conn = DBUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, inputId);
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				
				int no = rs.getInt("no");
				String id = rs.getString("id");
				String title = rs.getString("title");
				
				Schedule schedule = new Schedule(no, id, title);
				
				list.add(schedule);
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
