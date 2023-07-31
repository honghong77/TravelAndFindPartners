package kr.co.greenart.coffee;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class CoffeeDAO {
	public CoffeeDAO() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	private Coffee mapRow(ResultSet rs) throws SQLException {
		int no = rs.getInt("no");
		String name = rs.getString("name");
		int price = rs.getInt("price");

		return new Coffee(no, name, price);
	}

	public Coffee getByNo(int no) throws SQLException {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/my_db", "root", "root");
			stmt = conn.prepareStatement("SELECT * FROM coffee WHERE no = ?");
			stmt.setInt(1, no);
			rs = stmt.executeQuery();

			if (rs.next()) {
				return mapRow(rs);
			}
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (stmt != null) {
				stmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		}
		return null;
	}

	public List<Coffee> getAll() throws SQLException {
		List<Coffee> list = new ArrayList<Coffee>();
		try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/my_db", "root", "root");
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery("SELECT * FROM coffee")) {
			while (rs.next()) {
				Coffee c = mapRow(rs);
				list.add(c);
			}
		}
		return list;
	}

}