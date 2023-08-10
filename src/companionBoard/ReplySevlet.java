package companionBoard;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/reply")
public class ReplySevlet extends HttpServlet{
	final static ReplyDAO dao = new ReplyDAO();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 	
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("user");
		String content = req.getParameter("content"); 		
		// int no = Integer.parseInt(req.getParameter("recipeNo"));
		String no = req.getParameter("recipeNo");
		
		System.out.println(id);
		System.out.println(content);
		System.out.println(no);
		
		// Reply reply = new Reply(no, id, content);	
		 		
//		int result = 0;
//		try {
//			result = dao.insertData(reply);
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}	
//		
//		resp.getWriter().print(result); 	
	}
	
}
