package dbutil;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/schedule2")
public class Schedule2Servlet extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	resp.setCharacterEncoding("UTF-8");
    	
    	System.out.println(req.getParameter("id"));
    	
    	String id =  req.getParameter("id");
    	
    	req.setAttribute("dayId", id);
    	req.setAttribute("dyddl", "dyddl");
    	
        req.getRequestDispatcher("/WEB-INF/view/schedule/schedule2.jsp").forward(req, resp);
    } 

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // TODO Auto-generated method stub
        super.doPost(req, resp);
    }
}
