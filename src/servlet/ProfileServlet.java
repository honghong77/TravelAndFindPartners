package servlet;

import java.io.ByteArrayOutputStream;


import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.net.URLDecoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;


import profile.ProfileDAO;

@MultipartConfig
@WebServlet("/profile")
public class ProfileServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
        String userId = (String) session.getAttribute("id");
		if (userId != null) {
			resp.sendRedirect("./profile/profile.jsp");
			System.out.println("아이디 :" + userId);
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    HttpSession session = req.getSession();
	    String userId = (String) session.getAttribute("id");
	    System.out.println(userId);

	    String imagePath = req.getParameter("imgsrc");
	    imagePath = URLDecoder.decode(imagePath, "UTF-8"); // URL 디코딩
	    System.out.println(imagePath);

	    InputStream input;
	    Part part = req.getPart("profileImage");
	    System.out.println(part.getSize());

	    if (part == null || part.getSize() == 0) {
	        // 이미지 URL에서 이미지를 다운로드하고 바이트 배열로 변환
	        URL url = new URL(imagePath);
	        input = url.openStream();
	    } else {
	        input = part.getInputStream();
	    }

	    ByteArrayOutputStream os = new ByteArrayOutputStream();
	    byte[] buffer = new byte[1024 * 1024 * 100]; 
	    int len;

	    while ((len = input.read(buffer)) != -1) {
	        os.write(buffer, 0, len);
	    }

	    byte[] img = os.toByteArray();

	    ProfileDAO.updateProfileSelection(img, userId);
	}
}
