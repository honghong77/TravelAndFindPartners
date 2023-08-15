package companionBoard;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;


@WebServlet("/choicetravel")
public class TravelServlet extends HttpServlet{
	final static TravelDAO dao = new TravelDAO();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int boardNo = Integer.valueOf(req.getParameter("boardNo"));
		System.out.println("보드 넘버" +boardNo);
		
		int result = 0;
		try {
			result = dao.insertData(boardNo, 0);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		resp.getWriter().print(result); 
	}



	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 ObjectMapper objectMapper = new ObjectMapper();
	     JsonNode jsonNode = objectMapper.readTree(req.getReader());

	     int boardNo = Integer.valueOf(jsonNode.get("boardNo").asText());
	     int travel_id = Integer.valueOf(jsonNode.get("travel_id").asText());

	     System.out.println("boardNo: " + boardNo);
	     System.out.println("travel_id: " + travel_id);
	     
	     int result = 0;
	     try {
	    	 result = dao.insertData(boardNo, travel_id);
	     } catch (SQLException e) {
	    	 e.printStackTrace();
	     }	
			
	     resp.getWriter().print(result); 
	}
	
}