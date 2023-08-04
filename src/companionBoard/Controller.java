package companionBoard;

import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.tomcat.util.http.fileupload.IOUtils;

@MultipartConfig(fileSizeThreshold = 1024 * 1024, location = "d:\\logs")
@WebServlet("/write")
public class Controller extends HttpServlet {
	private final static CompanionBoardDAO dao = new CompanionBoardDAO();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 로그인 했을 때만 접근 할 수 있게 수정
		req.getRequestDispatcher("companionBoardForm.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

//		HttpSession session = req.getSession(false); 
//		String id = (String) session.getAttribute("id");

		String id = "id";
		String start = req.getParameter("startdate");
		String end = req.getParameter("enddate");
		String location = req.getParameter("radiobtn"); // null

		Part part = req.getPart("image");
		InputStream image = part.getInputStream(); // 빈칸

		String title = req.getParameter("title");
		String content = req.getParameter("content");
		Integer personnel = Integer.valueOf(req.getParameter("number"));

		String[] concepts = req.getParameterValues("check");
		String concept1 = "";
		String concept2 = "";
		String concept3 = "";

		switch (concepts.length) {
		case 3:
			concept3 = concepts[2];
		case 2:
			concept2 = concepts[1];
		case 1:
			concept1 = concepts[0];
		}

		System.out.println(id);
		System.out.println(location);
		System.out.println(personnel);
		System.out.println(title);
		System.out.println(content);
		System.out.println(start);
		System.out.println(end);
		System.out.println(image.read());
		System.out.println(concept1);
		System.out.println(concept2);
		System.out.println(concept3);

		try {
			if ((id != null && !id.trim().isEmpty()) && (start != null && !start.trim().isEmpty())
					&& (end != null && !end.trim().isEmpty()) && (location != null && !location.trim().isEmpty())
					&& (title != null && !title.trim().isEmpty()) && (content != null && !content.trim().isEmpty()) && (image.read() != -1)
					&& (concept1 != null || !concept1.trim().isEmpty() || concept2 != null || !concept2.trim().isEmpty()
							|| concept3 != null || !concept3.trim().isEmpty())) {
				CompanionBoard cb = new CompanionBoard(id, start, end, location, image, title, content, personnel,
						concept1, concept2, concept3);
				dao.insertData(cb);
			} else {
				req.getRequestDispatcher("companionBoardForm.jsp").forward(req, resp);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
