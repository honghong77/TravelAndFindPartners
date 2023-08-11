package companionBoard;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig(fileSizeThreshold = 1024 * 1024, location = "d:\\logs")
@WebServlet("/update")
public class UpdateServlet extends HttpServlet{
	final static CompanionBoardDAO dao = new CompanionBoardDAO();
	final static Jackson jackson = new Jackson();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession(false); 
		String id = (String) session.getAttribute("id");

		
		int no = Integer.valueOf(req.getParameter("no"));
		String paramId = req.getParameter("paramId");
		System.out.println("받아온 값" + no);
		System.out.println("받아온 값" + paramId);
		List<Companion2> list = null;
		
		if (id.equals(paramId)) {
			try {
				list = dao.getList(no);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else {
			resp.sendRedirect("/WEB-INF/accompany/errorForm.html");
		}
		
		req.setAttribute("list", list);
		
		String json = jackson.convertListToJson(list);
		// System.out.println("json : " + json);
		
		req.setAttribute("json", json);
		
		req.getRequestDispatcher("/WEB-INF/accompany/updateForm.jsp").forward(req, resp);
	}
	
}
