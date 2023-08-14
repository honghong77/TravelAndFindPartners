package servlet;

import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import login.LoginDAO;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.sendRedirect("./login/loginform.jsp");
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
        String pw = req.getParameter("pw");
        
        LoginDAO loginDAO = new LoginDAO();
        int loginResult = loginDAO.login(id, pw);
        System.out.println(loginResult);
        if (loginResult == 2) {
            // 로그인 성공 처리

        HttpSession session = req.getSession(true); // 세션 생성 또는 기존 세션 가져오기
        session.setAttribute("id", id);

            resp.sendRedirect("/TravelAndFindPartners/home"); // 로그인 성공 페이지로 리다이렉트
        } else if (loginResult == 1) {
            // 비밀번호 불일치 처리
            resp.sendRedirect("./login/failure.jsp?error=password"); // 비밀번호 불일치 페이지로 리다이렉트
        } else if (loginResult == 0) {
            // 아이디가 없음 처리
            resp.sendRedirect("./login/failure.jsp?error=notfound"); // 아이디가 없음 페이지로 리다이렉트
        } else {
            // 데이터베이스 오류 처리
            resp.sendRedirect("./login/failure.jsp?error=database"); // 데이터베이스 오류 페이지로 리다이렉트
        }
        
        
        
    }
}
