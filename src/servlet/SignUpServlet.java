package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sign.SignDAO;
import tendency.Tendency;
import tendency.TendencyDAO;

@WebServlet("/sign")
public class SignUpServlet extends HttpServlet {	

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.sendRedirect("./sign/signUp.jsp");
		System.out.println(req.getRequestURI());
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");
        PrintWriter out = resp.getWriter();
    
        String id = req.getParameter("id");
        String password = req.getParameter("password");
        String name = req.getParameter("name");
        String nickname = req.getParameter("nickname");
        String gender = req.getParameter("gender");
        String birth = req.getParameter("birth");
		
        if (SignDAO.selectNickname(nickname)) {
            out.println("<script>alert('이미 사용 중인 닉네임입니다.'); history.back();</script>");
            return;
        }
        if (SignDAO.selectId(id)) {
        	out.println("<script>alert('이미 사용 중인 아이디입니다.'); history.back();</script>");
        	return;
        }
        
        boolean isSuccess = SignDAO.insert(id, password, name, nickname, gender, birth);      
        
        if (isSuccess) {
        	req.getSession().setAttribute("id", id);
            resp.sendRedirect("./tendency/tendency.jsp");
        } else {
            out.println("<script>alert('회원가입에 실패했습니다.');</script>");
            resp.sendRedirect("./sign/signUp.jsp");
        }
        
        System.out.println(id+"/"+password+"/"+name+"/"+nickname+"/"+gender+"/"+birth);
        
        
	}	
}
