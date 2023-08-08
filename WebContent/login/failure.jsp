<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>Login Failure</h2>
    <% String error = request.getParameter("error");
       if (error != null) {
           if (error.equals("password")) {
               out.println("<p>비밀번호가 일치하지 않습니다.</p>");
           } else if (error.equals("notfound")) {
               out.println("<p>해당 아이디가 존재하지 않습니다.</p>");
           } else if (error.equals("database")) {
               out.println("<p>데이터베이스 오류가 발생했습니다.</p>");
           }
       }
    %>
    <p><a href="loginform.jsp">돌아가기</a></p>
</body>
</html>