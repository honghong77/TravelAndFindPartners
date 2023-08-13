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


@WebServlet("/reply")
public class ReplySevlet extends HttpServlet{
	final static ReplyDAO dao = new ReplyDAO();

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 ObjectMapper objectMapper = new ObjectMapper();
	     JsonNode jsonNode = objectMapper.readTree(req.getReader());

	     String content = jsonNode.get("content").asText();
	     int no = Integer.valueOf(jsonNode.get("boardNo").asText());
	     String id = jsonNode.get("user").asText();

	     System.out.println("Content: " + content);
	     System.out.println("boardNo: " + no);
	     System.out.println("User: " + id);
	     
	     Reply reply = new Reply(no, id, content);	
	 		
	     int result = 0;
	     try {
	    	 result = dao.insertData(reply);
	     } catch (SQLException e) {
	    	 e.printStackTrace();
	     }	
			
	     resp.getWriter().print(result); 
	}
	
}
