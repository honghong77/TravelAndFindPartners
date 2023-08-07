package dbutil;

import java.io.Console;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/schedule3")
public class Schedule3Servlet extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/view/schedule/schedule3.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Set the response type to plain text
        response.setContentType("text/plain");
        request.setCharacterEncoding("UTF-8");
        
        // Get the form parameters from the request
        String destination = request.getParameter("destination") ;
        System.out.println(destination);
        String startDateString = request.getParameter("startDate");
        String endDateString = request.getParameter("endDate");
		
		Date startDate = null;
		Date endDate = null;
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		try {
			startDate = sdf.parse(startDateString);
			endDate = sdf.parse(endDateString);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		List<String> resultList = new ArrayList<>();
		
		Calendar cmpStartDate = Calendar.getInstance();
		Calendar cmpEndDate = Calendar.getInstance();
		cmpStartDate.setTime(startDate); //특정 일자
		cmpEndDate.setTime(endDate); //특정 일자
		
		long diffSec = (cmpEndDate.getTimeInMillis() - cmpStartDate.getTimeInMillis()) / 1000;
		int diffDays = (int) (diffSec / (24*60*60)); //일자수 차이
		
		System.out.println(diffSec + "초 차이");
		System.out.println(diffDays + "일 차이");
        
		
		for (int i = 0; i < diffDays + 1; i++) {
			//Calendar days = Calendar.getInstance();
			//days.setTime(startDate);
			
			if(i != 0) {
				cmpStartDate.add(Calendar.DATE, 1);
			}
			
			Date date = cmpStartDate.getTime();
			resultList.add(sdf.format(date));
		};
		
		System.out.println(resultList.toString());
		
        // Set the data in request attribute
        request.setAttribute("destination", destination);
        request.setAttribute("startDate", startDateString);
        request.setAttribute("endDate", endDateString);
        request.setAttribute("diffDays", diffDays);
        request.setAttribute("resultList", resultList);

        request.getRequestDispatcher("/WEB-INF/view/schedule/schedule3.jsp").forward(request, response);
        
        // Create a response and send it back to the client
//        String jsonResponse = "Data received successfully.";
//        PrintWriter out = response.getWriter();
//        out.write(jsonResponse);
//        out.close();
    }

}
