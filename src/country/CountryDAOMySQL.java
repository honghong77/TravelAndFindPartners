package country;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dbutil.DBUtil;

public class CountryDAOMySQL implements CountryDAO {
	@Override
	public int countAll() {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;

		try {
			conn = DBUtil.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery("SELECT Count(*) AS cnt FROM country");

			while (rs.next()) {
				return rs.getInt("cnt");
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		} finally {
			DBUtil.close(rs);
			DBUtil.close(stmt);
			DBUtil.close(conn);
		}
		return -1;
	}

	@Override
	public List<Country> getByPage(int page, int pagePer) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		List<Country> list = new ArrayList<>();

		try {
			String query = "SELECT Name, Population FROM country LIMIT ? OFFSET ?";
			conn = DBUtil.getConnection();
			stmt = conn.prepareStatement(query);
			
			int offset = (page - 1) * pagePer;
			stmt.setInt(1, pagePer);
			stmt.setInt(2, offset);
			
			rs = stmt.executeQuery();

			while (rs.next()) {
				String name = rs.getString("Name");
				int population = rs.getInt("Population");
				
				list.add(new Country(name, population));
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		} finally {
			DBUtil.close(rs);
			DBUtil.close(stmt);
			DBUtil.close(conn);
		}
		
		return list;
	}

	@Override
	public List<Country> getAll() {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		List<Country> list = new ArrayList<>();

		try {
			conn = DBUtil.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery("SELECT Name, Population FROM country");

			while (rs.next()) {
				String name = rs.getString("Name");
				int population = rs.getInt("Population");
				
				list.add(new Country(name, population));
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		} finally {
			DBUtil.close(rs);
			DBUtil.close(stmt);
			DBUtil.close(conn);
		}
		
		return list;
	}

	@Override
	public List<Country> getByContinent(String continent) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		List<Country> list = new ArrayList<>();

		try {
			String query = "SELECT Name, Population FROM country WHERE Continent = ?";
			conn = DBUtil.getConnection();
			stmt = conn.prepareStatement(query);
			
			stmt.setString(1, continent);
			
			rs = stmt.executeQuery();

			while (rs.next()) {
				String name = rs.getString("Name");
				int population = rs.getInt("Population");
				
				list.add(new Country(name, population));
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		} finally {
			DBUtil.close(rs);
			DBUtil.close(stmt);
			DBUtil.close(conn);
		}
		
		return list;
	}
}