import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import companionBoard.Companion2;
import companionBoard.CompanionListDAO;
import companionBoard.Jackson;

@WebServlet("/home")
public class Main extends HttpServlet{
	final static CompanionListDAO dao = new CompanionListDAO();
	private final static Jackson jackson = new Jackson();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Companion2> list = null;
		try {
			list = dao.getMainList();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String json = jackson.convertListToJson(list);
		
		req.setAttribute("json", json);
		
		req.getRequestDispatcher("./WEB-INF/main.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}
}
