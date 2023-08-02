<%@page import="country.CountryDAOMySQL"%>
<%@page import="country.CountryDAO"%>
<%@page import="country.Country"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	try {
		String pageStr = request.getParameter("page");
		Integer pageNum = pageStr == null ? 1 : Integer.valueOf(pageStr);
		CountryDAO dao = new CountryDAOMySQL();
		final int pagePer = 10;
		
		int count = dao.countAll();
		
		int totalPage = count / pagePer;
		totalPage += count % pagePer == 0 ? 0 : 1; 
		
		List<Country> list = dao.getByPage(pageNum, pagePer);
		
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/WEB-INF/countryView.jsp").forward(request, response);
	} catch (Exception e) {
		response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
		out.println("요청 처리 중 에러 발생. 관리자에게 문의하세요");
	}
%>