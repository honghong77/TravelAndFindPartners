package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import profile.Profile;
import profile.ProfileDAO;

@WebServlet("/profile")
public class ProfileServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.sendRedirect("./profile/profile.jsp");
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		String userId = (String) req.getSession().getAttribute("tendencyUserId");
//		System.out.println(userId);
		Profile profile = new Profile();
		String selectedProfileImageSrc = req.getParameter("selectedProfileImageSrc");
		ProfileDAO profileDAO = new ProfileDAO();
		
//		profile.setId(userId);
//		boolean success = profileDAO.updateProfileSelection(userId, selectedProfileImageSrc);
//        
//        if (success) {
//        } else {
//            // 프로필 선택 실패 처리 (예: 에러 페이지로 이동)
//            resp.sendRedirect("./profile/profile.jsp");
//        }
        resp.sendRedirect("./login/loginform.jsp"); // 프로필 선택 완료 후 로그인 페이지로 리다이렉트
	}
	
}
