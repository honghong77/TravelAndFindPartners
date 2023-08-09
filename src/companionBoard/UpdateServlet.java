package companionBoard;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/update")
public class UpdateServlet extends HttpServlet{
	final static CompanionBoardDAO dao = new CompanionBoardDAO();
	final static Jackson jackson = new Jackson();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		HttpSession session = req.getSession(false); 
//		String id = (String) session.getAttribute("id");
		String id = "id";
	
		int paramNo = Integer.valueOf(req.getParameter("num"));
		String start = req.getParameter("startdate");
		String end = req.getParameter("enddate");
		String location = req.getParameter("radiobtn"); // null
		
		System.out.println(id);
		System.out.println(location);
//		System.out.println(personnel);
//		System.out.println(title);
//		System.out.println(content);
		System.out.println(start);
		System.out.println(end);
//		System.out.println(image);
//		System.out.println(concept1);
//		System.out.println(concept2);
//		System.out.println(concept3);
		
		
		
		

		Part part = req.getPart("image");
		InputStream input = part.getInputStream(); // 빈칸
		
        ByteArrayOutputStream os = new ByteArrayOutputStream();
        
        byte[] buffer = new byte[1024];
        int len;
 
        // 입력 스트림에서 바이트를 읽고 버퍼에 저장
        while ((len = input.read(buffer)) != -1)
        {
            // 버퍼에서 출력 스트림으로 바이트 쓰기
            os.write(buffer, 0, len);
        }
 
        byte[] image = os.toByteArray();
		
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

		

		try {
			if ((id != null && !id.trim().isEmpty()) && (start != null && !start.trim().isEmpty())
					&& (end != null && !end.trim().isEmpty()) && (location != null && !location.trim().isEmpty())
					&& (title != null && !title.trim().isEmpty()) && (content != null && !content.trim().isEmpty()) && (image != null && image.length != 0)
					&& (concept1 != null || !concept1.trim().isEmpty() || concept2 != null || !concept2.trim().isEmpty()
							|| concept3 != null || !concept3.trim().isEmpty())) {
				Companion cb = new Companion(start, end, location, image, title, content, personnel,
						concept1, concept2, concept3);
				dao.update(cb, paramNo);
			} else {
				resp.sendRedirect("http://localhost:8080/TravelAndFindPartners/view?no=" + paramNo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} 	
		resp.sendRedirect("http://localhost:8080/TravelAndFindPartners/view?no=" + paramNo);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		HttpSession session = req.getSession(false); 
//		String id = (String) session.getAttribute("id");
		String id = "id";
		
		int no = Integer.valueOf(req.getParameter("no"));
		String paramId = req.getParameter("id");
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
