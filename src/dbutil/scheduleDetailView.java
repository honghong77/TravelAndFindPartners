package dbutil;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

@WebServlet("/scheduleDetailView")
public class scheduleDetailView extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String travelId = request.getParameter("travelId");
        JSONObject resultObject = new JSONObject();
        JSONObject result = new JSONObject();
        JSONArray jArray = new JSONArray();
        
        if (travelId != null) {
            try {
                // 데이터베이스 연결 설정
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/trip", "root", "root");
                PreparedStatement stmt = conn.prepareStatement("SELECT * FROM travel WHERE travel_id = ?");
                stmt.setInt(1, Integer.parseInt(travelId));

                ResultSet rs = stmt.executeQuery();
                if (rs.next()) {
                    result.put("travel_id", rs.getInt("travel_id"));
                    result.put("start_date", rs.getString("start_date"));
                    result.put("end_date", rs.getString("end_date"));
                    result.put("location", rs.getString("location"));
                    // 다른 필드들도 여기에 추가하세요.
                }

                stmt = conn.prepareStatement("SELECT * FROM travel_location travel WHERE travel_id = ?");
                stmt.setInt(1, Integer.parseInt(travelId));

                rs = stmt.executeQuery();
                
//                ResultSetMetaData md = rs.getMetaData();
//                int columns = md.getColumnCount();
                
                while (rs.next()) {
                	JSONObject result2 = new JSONObject();
                	result2.put("location_name", rs.getString("location_name"));
                	result2.put("date", rs.getString("date"));
                	result2.put("latitude", rs.getString("latitude"));
                	result2.put("longitude", rs.getString("longitude"));
                	result2.put("memo", rs.getString("memo"));
                	
                	
                	
                	jArray.put(result2);
                }

                rs.close();
                stmt.close();
                conn.close();
            } catch (SQLException | ClassNotFoundException e) {
                e.printStackTrace();
            }
        }

        resultObject.put("detail", result);
        resultObject.put("travel_location", jArray);
        
        System.out.println(result.toString());
        System.out.println(jArray.toString());
        
        response.setHeader("Content-Type", "text/plain;charset=utf-8");
        response.setContentType("application/json");
        response.getWriter().write(resultObject.toString());
    }
}
