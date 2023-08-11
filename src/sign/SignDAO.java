package sign;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;



public class SignDAO {
	private static String url = "jdbc:mysql://localhost:3306/trip";
	private static String username = "root";
	private static String pw = "root";
	
	public static boolean insert(String id, String password, String name, String nickname, String gender, String birth) {
		Connection conn = null;
		PreparedStatement stmt = null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			e1.printStackTrace();
		}
		try {
			
			conn = DriverManager.getConnection(url, username, pw);
			stmt = conn.prepareStatement("INSERT INTO member (id, pw, name, nickname, gender, birthday) VALUES (?, ?, ?, ?, ?, ?)");
			
			stmt.setString(1, id);
	        stmt.setString(2, password);
            stmt.setString(3, name);
            stmt.setString(4, nickname);
            stmt.setString(5, gender);
            stmt.setString(6, birth.substring(0, 4) + "-" + birth.substring(4, 6) + "-" + birth.substring(6, 8));
            
            int result = stmt.executeUpdate();
            
            return result > 0;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (stmt != null) {
				try {
					stmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return false;
	}
	
	public static boolean selectNickname(String nickname) {
	    Connection conn = null;
	    PreparedStatement stmt = null;
	    ResultSet rs = null;
	    boolean isDuplicated = false;

	    try {
	        Class.forName("com.mysql.cj.jdbc.Driver");
	    } catch (ClassNotFoundException e1) {
	        e1.printStackTrace();
	    }

	    try {
	        conn = DriverManager.getConnection(url, username, pw);
	        stmt = conn.prepareStatement("select nickname from member where nickname = ?");
	        stmt.setString(1, nickname);

	        rs = stmt.executeQuery();
	        if (rs.next()) {
	            // 닉네임이 이미 DB에 존재하는 경우
	            isDuplicated = true;
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        if (rs != null) {
	            try {
	                rs.close();
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }
	        if (stmt != null) {
	            try {
	                stmt.close();
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }
	        if (conn != null) {
	            try {
	                conn.close();
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }
	    }

	    return isDuplicated;
	}
	
	public static boolean selectId(String id) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		boolean isDuplicated = false;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			e1.printStackTrace();
		}
		
		try {
			conn = DriverManager.getConnection(url, username, pw);
			stmt = conn.prepareStatement("select id from member where id = ?");
			stmt.setString(1, id);
			
			rs = stmt.executeQuery();
			if (rs.next()) {
				// 닉네임이 이미 DB에 존재하는 경우
				isDuplicated = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (stmt != null) {
				try {
					stmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		
		return isDuplicated;
	}
	
}
