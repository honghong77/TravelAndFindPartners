package dbutil;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/saveSchedule")
public class DBSave extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String memberId = "hi";
        String startDate = request.getParameter("start_date");
        String endDate = request.getParameter("end_date");
        String destination = request.getParameter("location");
        String latitude = request.getParameter("lat"); // 위도 받기
        String longitude = request.getParameter("lng"); // 경도 받기

        // JDBC를 사용하여 데이터베이스 연결 및 저장
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/trip", "root", "root");
            String query = "INSERT INTO travel (member_id, start_date, end_date, location, latitude, longitude) VALUES (?, ?, ?, ?, ?, ?)";
            stmt = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);  // 여기에 RETURN_GENERATED_KEYS를 추가

            stmt.setString(1, memberId);
            stmt.setString(2, startDate);
            stmt.setString(3, endDate);
            stmt.setString(4, destination);
            stmt.setFloat(5, Float.parseFloat(latitude));
            stmt.setFloat(6, Float.parseFloat(longitude));

            int affectedRows = stmt.executeUpdate();

            if (affectedRows == 0) {
                throw new SQLException("Creating travel failed, no rows affected.");
            }

            int generatedTravelId = -1;  // 초기화
            try (ResultSet generatedKeys = stmt.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    generatedTravelId = generatedKeys.getInt(1);
                } else {
                    throw new SQLException("Creating travel failed, no ID obtained.");
                }
            }

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write("{\"success\": true, \"message\":\"일정이 저장되었습니다.\", \"travel_id\":" + generatedTravelId + "}");


        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("오류 발생");
        } finally {
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
