package dbutil;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

@WebServlet("/saveTravelLocation")
public class DBSaveTravelLocation extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
        String jsonData = request.getParameter("locations");
        System.out.println("Received JSON data: " + jsonData);
        JSONArray locationsArray = new JSONArray(jsonData);

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
        	Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/trip", "root", "root");
            String query = "INSERT INTO travel_location (travel_id, date, location_name, latitude, longitude, memo) VALUES (?, ?, ?, ?, ?, ?)";

            stmt = conn.prepareStatement(query);

            for (int i = 0; i < locationsArray.length(); i++) {
                JSONObject locationObject = locationsArray.getJSONObject(i);
                stmt.setInt(1, locationObject.getInt("travel_id"));
                stmt.setString(2, locationObject.getString("date"));
                stmt.setString(3, locationObject.getString("location_name"));
                stmt.setFloat(4, Float.parseFloat(locationObject.getString("latitude")));
                stmt.setFloat(5, Float.parseFloat(locationObject.getString("longitude")));
                stmt.setString(6, locationObject.getString("memo"));
                stmt.addBatch();  // Add to batch
            }

            stmt.executeBatch();  // Execute the batch

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write("{\"success\": true, \"message\":\"Location data has been saved.\"}");

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("{\"success\": false, \"message\":\"" + e.getMessage() + "\"}");  // Return the actual error message
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
