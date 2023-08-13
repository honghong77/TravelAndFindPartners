package companionBoard;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;


@WebServlet("/replyupdate")
public class ReplyUpdateServlet extends HttpServlet{
	final static ReplyDAO dao = new ReplyDAO();
	private final static Jackson jackson = new Jackson();

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ObjectMapper objectMapper = new ObjectMapper();
	    JsonNode jsonNode = objectMapper.readTree(req.getReader());
	    
	    String content = jsonNode.get("content").asText();
	    int pk = Integer.valueOf(jsonNode.get("pk").asText());
	    
	    int result = 0;
	    try {
	    	result = dao.updateData(content, pk);
	    } catch (SQLException e) {
	    	e.printStackTrace();
	    }

	    System.out.println("content: " + content);
	    System.out.println("pk: " + pk);
	    
	    resp.getWriter().print(result); 
	}
}

