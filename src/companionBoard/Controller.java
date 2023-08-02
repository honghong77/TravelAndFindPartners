package companionBoard;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/write")
public class Controller extends HttpServlet {
	private final static CompanionBoardDAO dao = new CompanionBoardDAO();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("companionBoard.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String location = req.getParameter("radiobtn");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String startDate = req.getParameter("startdate");
		String endDate = req.getParameter("enddate");
		System.out.println(location);
		System.out.println(title);
		System.out.println(content);
		System.out.println(startDate);
		System.out.println(endDate);
		
		try {
			dao.insertData(title, content);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
}
