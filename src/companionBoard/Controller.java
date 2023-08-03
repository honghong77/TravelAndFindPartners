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
import javax.servlet.http.Part;

import org.apache.tomcat.util.http.fileupload.IOUtils;

@MultipartConfig(fileSizeThreshold = 1024 * 1024, location = "d:\\logs")
@WebServlet("/write")
public class Controller extends HttpServlet {
	private final static CompanionBoardDAO dao = new CompanionBoardDAO();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("companionBoardForm.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String location = req.getParameter("radiobtn"); // null
		Integer personnel = Integer.valueOf(req.getParameter("number"));
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String startDate = req.getParameter("startdate");
		String endDate = req.getParameter("enddate");
		Part part = req.getPart("image"); 
		InputStream image = part.getInputStream(); // 빈칸
		
		String[] concepts = req.getParameterValues("check");
		String concept1 = "";
		String concept2 = "";
		String concept3 = "";
		
		switch (concepts.length) {
		case 3: concept3 = concepts[2];
		case 2: concept2 = concepts[1];
		case 1: concept1 = concepts[0];
		
		}
		
		
//		if (concepts.length == 1) {
//			concept1 = concepts[0];
//		} else if (concepts.length == 2) {
//			concept2 = concepts[]
//		}
		

		System.out.println(location);
		System.out.println(personnel);
		System.out.println(title);
		System.out.println(content);
		System.out.println(startDate);
		System.out.println(endDate);
		System.out.println(part.getSubmittedFileName());
		System.out.println(concept1);
		System.out.println(concept2);
		System.out.println(concept3);
		
		try {
			
				dao.insertData(startDate, endDate, location, image, title, content, personnel);
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
}
