package login;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginDAO {
	private static String url = "jdbc:mysql://localhost:3306/trip";
	private static String username = "root";
	private static String pw2 = "root";
	
	public int login(String id, String pw) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e1) {
            e1.printStackTrace();
        }
        
        try {
            conn = DriverManager.getConnection(url, username, pw2);
            stmt = conn.prepareStatement("SELECT pw FROM member WHERE id = ?");
            stmt.setString(1, id);    
            
            rs = stmt.executeQuery();
            if (rs.next()) {
                if (rs.getString(1).equals(pw))
                    return 2; // 로그인 성공
                else
                    return 1; // 비밀번호 불일치
            }
            return 0; //아이디가 없음             
            
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
        return -1; // 데이터베이스 오류
    }
}
