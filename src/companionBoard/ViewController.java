package companionBoard;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
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
	private final static TravelDAO travelDao = new TravelDAO();
	
	private final static Jackson jackson = new Jackson();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int no = Integer.valueOf(req.getParameter("no"));
		List<Companion2> list = null;
		
		System.out.println(no);
		
		try {
			list = dao.getViewList(no);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		req.setAttribute("list", list);
		
		HttpSession session = req.getSession(false); 
		String sessionId = (String) session.getAttribute("id");
		
		String id = list.get(0).getId();
		
		boolean idCheck = false;
		if (sessionId != null && id.equals(sessionId)) {
			idCheck = true;
		}
		System.out.println(idCheck);
		
		String json = jackson.convertListToJson(list);
		
		
		List<Travel> travelList = null;
		try {
			travelList = travelDao.getList(sessionId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		String travelJson = jackson.convertSchListToJson(travelList);
		
		
		req.setAttribute("json", json);
		req.setAttribute("idCheck", idCheck);
		req.setAttribute("travelJson", travelJson);
		
		req.getRequestDispatcher("/WEB-INF/accompany/viewForm.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}
}
