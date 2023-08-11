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
	    
	    if (selectedTripTendencies != null && selectedTripTendencies.length == 1) {
	        userTendency.setTriptendency1(selectedTripTendencies[0]);
	    } else if (selectedTripTendencies != null && selectedTripTendencies.length == 2) {
	    	userTendency.setTriptendency1(selectedTripTendencies[0]);
	        userTendency.setTriptendency2(selectedTripTendencies[1]);
	    } else if (selectedTripTendencies != null && selectedTripTendencies.length == 3) {
	    	userTendency.setTriptendency1(selectedTripTendencies[0]);
	        userTendency.setTriptendency2(selectedTripTendencies[1]);
	        userTendency.setTriptendency3(selectedTripTendencies[2]);
	    } 
	    
	    if (selectedMyTendencies != null && selectedMyTendencies.length == 1) {
	        userTendency.setMytendency1(selectedMyTendencies[0]);
	    } else if (selectedMyTendencies != null && selectedMyTendencies.length == 2) {
	    	userTendency.setMytendency1(selectedMyTendencies[0]);
	        userTendency.setMytendency2(selectedMyTendencies[1]);
	    } else if (selectedMyTendencies != null && selectedMyTendencies.length == 3) {
	    	userTendency.setMytendency1(selectedMyTendencies[0]);
	        userTendency.setMytendency2(selectedMyTendencies[1]);
	        userTendency.setMytendency3(selectedMyTendencies[2]);
	    } else if (selectedMyTendencies != null && selectedMyTendencies.length == 4) {
	    	userTendency.setMytendency1(selectedMyTendencies[0]);
	        userTendency.setMytendency2(selectedMyTendencies[1]);
	        userTendency.setMytendency3(selectedMyTendencies[2]);
	        userTendency.setMytendency4(selectedMyTendencies[3]);
	    } else if (selectedMyTendencies != null && selectedMyTendencies.length == 5) {
	    	userTendency.setMytendency1(selectedMyTendencies[0]);
	        userTendency.setMytendency2(selectedMyTendencies[1]);
	        userTendency.setMytendency3(selectedMyTendencies[2]);
	        userTendency.setMytendency4(selectedMyTendencies[3]);
	        userTendency.setMytendency5(selectedMyTendencies[4]);
	    } else if (selectedMyTendencies != null && selectedMyTendencies.length == 6) {
	    	userTendency.setMytendency1(selectedMyTendencies[0]);
	        userTendency.setMytendency2(selectedMyTendencies[1]);
	        userTendency.setMytendency3(selectedMyTendencies[2]);
	        userTendency.setMytendency4(selectedMyTendencies[3]);
	        userTendency.setMytendency5(selectedMyTendencies[4]);
	        userTendency.setMytendency6(selectedMyTendencies[5]);
	    }
	           
	    TendencyDAO.insertTendency(userTendency);
	    
	    resp.sendRedirect("./profile/profile.jsp");
	}
}
