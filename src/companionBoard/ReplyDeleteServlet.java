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


@WebServlet("/replydelete")
public class ReplyDeleteServlet extends HttpServlet{
	final static ReplyDAO dao = new ReplyDAO();

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ObjectMapper objectMapper = new ObjectMapper();
	    JsonNode jsonNode = objectMapper.readTree(req.getReader());
	    
	    int pk = Integer.valueOf(jsonNode.get("pk").asText());
	    
	    int result = 0;
	    try {
	    	result = dao.deleteData(pk);
	    } catch (SQLException e) {
	    	e.printStackTrace();
	    }

	    System.out.println("pk: " + pk);
	    
	    resp.getWriter().print(result); 
	}
}