package companionBoard;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/save")
public class UpdateSaveServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("겟방식");
		
		System.out.println( "넘버"+ req.getParameter("no"));
		
		String start = req.getParameter("startdate");
		String end = req.getParameter("enddate");
		String location = req.getParameter("radiobtn"); // null

		System.out.println(location);
		System.out.println(start);
		System.out.println(end);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		HttpSession session = req.getSession(false); 
//		String id = (String) session.getAttribute("id");
		String id = "id";
		
		System.out.println("포스트방식");
	
		System.out.println( "넘버"+ req.getParameter("no"));
		
		String start = req.getParameter("startdate");
		String end = req.getParameter("enddate");
		String location = req.getParameter("radiobtn"); // null

		System.out.println(location);
		System.out.println(start);
		System.out.println(end);
	}
	
}
