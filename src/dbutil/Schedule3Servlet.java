package dbutil;

import java.io.Console;
import java.io.IOException;
import java.io.PrintWriter;

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

        // Get the form parameters from the request
        String destination = request.getParameter("destination");
        System.out.println("Destination received: " + destination);
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");

        // Set the data in request attribute
        request.setAttribute("destination", destination);
        request.setAttribute("startDate", startDate);
        request.setAttribute("endDate", endDate);

        request.getRequestDispatcher("/WEB-INF/view/schedule/schedule3.jsp").forward(request, response);
        
        // Create a response and send it back to the client
//        String jsonResponse = "Data received successfully.";
//        PrintWriter out = response.getWriter();
//        out.write(jsonResponse);
//        out.close();
    }

}
