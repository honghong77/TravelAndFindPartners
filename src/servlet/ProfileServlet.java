package servlet;

import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import profile.Profile;
import profile.ProfileDAO;

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
		String userId = (String) req.getSession().getAttribute("id");
		System.out.println("userId: " + userId);
	    String selectedProfileImageSrc = req.getParameter("selectedProfileImageSrc");
	    
	    // 이미지 파일 경로를 바탕으로 byte[]로 변환
	    byte[] imageBytes = convertImageToByteArray(selectedProfileImageSrc);
	    System.out.println("imageBytes length: " + imageBytes.length);
	    
	    ProfileDAO profileDAO = new ProfileDAO();

	    boolean success = profileDAO.updateProfileSelection(imageBytes, userId);

	    if (success) {
	        System.out.println("프로필 저장 완료");
	        // 프로필 정보를 세션에 업데이트
	        HttpSession session = req.getSession();
	        Profile profile = new Profile(userId, imageBytes);
	        session.setAttribute("profile", profile);
	    } else {
	        // 프로필 선택 실패 처리 (예: 에러 페이지로 이동)
	        resp.sendRedirect("./profile/profile.jsp");
	        return;
	    }
	    resp.sendRedirect("./login/loginform.jsp"); // 프로필 선택 완료 후 로그인 페이지로 리다이렉트
	}

	private byte[] convertImageToByteArray(String imagePath) throws IOException {
	    FileInputStream fis = null;
	    ByteArrayOutputStream bos = null;

	    try {
	        fis = new FileInputStream(imagePath);
	        bos = new ByteArrayOutputStream();

	        byte[] buffer = new byte[1024];
	        int bytesRead;

	        while ((bytesRead = fis.read(buffer)) != -1) {
	            bos.write(buffer, 0, bytesRead);
	        }

	        return bos.toByteArray();
	    } finally {
	        if (fis != null) {
	            fis.close();
	        }
	        if (bos != null) {
	            bos.close();
	        }
	    }
	}
}
