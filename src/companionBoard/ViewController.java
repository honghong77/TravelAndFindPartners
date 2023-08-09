package companionBoard;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/view")
public class ViewController extends HttpServlet{
	private final static CompanionBoardDAO dao = new CompanionBoardDAO();
	private final static Jackson jackson = new Jackson();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int no = Integer.valueOf(req.getParameter("no"));
		List<Companion2> list = null;
		
		System.out.println(no);
		
		try {
			list = dao.getList(no);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		req.setAttribute("list", list);
		
//		HttpSession session = req.getSession(false); 
//		String id = (String) session.getAttribute("id");
		String id = "id";
		
		boolean idCheck = false;
		if (id.equals(list.get(0).getId())) {
			idCheck = true;
		}
		System.out.println(idCheck);
		
		String json = jackson.convertListToJson(list);
		System.out.println("json : " + json);
		
		req.setAttribute("json", json);
		req.setAttribute("idCheck", idCheck);
		
		
		req.getRequestDispatcher("/WEB-INF/accompany/viewForm.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}
}
