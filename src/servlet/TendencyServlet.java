package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tendency.Tendency;
import tendency.TendencyDAO;

@WebServlet("/tendency")
public class TendencyServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String userId = (String) req.getSession().getAttribute("id");
	    
	    if (userId != null) {
	        System.out.println("회원가입 아이디: " + userId);
	        // 여기서 해당 아이디를 이용하여 필요한 작업을 수행할 수 있습니다.
	    }
	    resp.sendRedirect("./tendency/tendency.jsp");
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {        
	    String userId = (String) req.getSession().getAttribute("id");
	    
	    Tendency userTendency = new Tendency();
	    String[] selectedTripTendencies = req.getParameterValues("tripTendency");
	    String[] selectedMyTendencies = req.getParameterValues("myTendency");    
	   
	    userTendency.setId(userId);
	    
	    if (selectedTripTendencies != null && selectedTripTendencies.length >= 1) {
	        userTendency.setTriptendency1(selectedTripTendencies[0]);
	    }
	    
	    if (selectedMyTendencies != null && selectedMyTendencies.length >= 1) {
	        userTendency.setMytendency1(selectedMyTendencies[0]);
	    }
	           
	    TendencyDAO.insertTendency(userTendency);
	    
	    resp.sendRedirect("./profile/profile.jsp");
	}
}
