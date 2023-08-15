package companionBoard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dbutil.DBUtil;

public class TravelDAO {
	public List<Travel> getList(String inputId) throws SQLException {
		String sql = "SELECT travel_id, member_id, memo FROM travel WHERE member_id = ? ORDER BY travel_id DESC ";
		List<Travel> list = new ArrayList<Travel>();
		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		try {
			conn = DBUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, inputId);
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				
				int no = rs.getInt("travel_id");
				String id = rs.getString("member_id");
				String title = rs.getString("memo");
				
				Travel travel = new Travel(no, id, title);
				
				list.add(travel);
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
	
	public int insertData(int no, int travel_id) throws SQLException {
		String sql = "UPDATE companionboard SET travel_id = ? WHERE no = ?";
		Connection conn = null;
		PreparedStatement stmt = null;

		try {
			conn = DBUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			
			stmt.setInt(1, travel_id);
			stmt.setInt(2, no);
			
			return stmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(stmt);
			DBUtil.close(conn);
		}
		return 0;
	}
}
