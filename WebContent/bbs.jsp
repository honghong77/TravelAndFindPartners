<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">

<title>여행 동행 사이트</title>
<style type="text/css">  
	color: #000000;
	text-decoration: none;
	}
</style>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");	
		}
		int pageNumber = 1;
		if (request.getParameter("pageNumber") != null){
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
		
		 int boardID = 0;
			if (request.getParameter("boardID") != null){
				boardID = Integer.parseInt(request.getParameter("boardID"));
			}
	%>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="true">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="logo-wrap" href="main.jsp">
				<img src="images/로고.jpg" alt="Logo Image">
			</a>
		</div>
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="true">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">홈</a></li>
				
				<li class="active"><a href="bbs.jsp">동행 모집하기</a></li>
				<li><a href="bbs.jsp">여행 일정 만들기</a></li>
			</ul>
			<%
				if(userID == null){		//로그인이 되어있지 않은 경우
			%>
			<ul class="nav navbar-nav navbar-right">
         		<li class="dropdown">
           			<a href="#" class="dropdown-toggle" 
            		data-toggle="dropdown" role="button" aria-haspopup="true" 
            		aria-expanded="false">접속하기<span class="caret"></span></a>
        		<ul class="dropdown-menu">
              		<li><a href="login.jsp">로그인</a></li>
              		<li><a href="join.jsp">회원가입</a></li>
            	</ul>    
         		</li>
       		</ul>
			<% 
				} else {
			%>
			<ul class="nav navbar-nav navbar-right">
         		<li class="dropdown">
           			<a href="#" class="dropdown-toggle" 
            		data-toggle="dropdown" role="button" aria-haspopup="true" 
            		aria-expanded="false">회원관리<span class="caret"></span></a>
        		<ul class="dropdown-menu">
              		
              		<li><a href="logoutAction.jsp">로그아웃</a></li>
              		<li><a href="mypage2.jsp">마이페이지</a></li>
            	</ul>   
         		</li>
       		</ul>
			<%
				}
			%>
		</div>
		
	</nav>
	
	<div class="container">
	<%
		if(boardID == 1){
	%>
			<h1>동행게시판<br></h1>
			<p>동행게시판입니다. 함께 여행해요~<br><br></p>
	<% }
		else if(boardID == 2){
	%>
			<h1>일정게시판<br></h1>
			<p>내가 가고 싶은 일정을 세워봐요~<br><br></p>
	<% }%>
	
	</div>
	
	 <div class="container">
	 	<div class="row">
	 		<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
	 			<thead>
	 				<tr>
	 					<th style="background-color: #eeeeee; text-align: center;">번호</th>
	 					<th style="background-color: #eeeeee; text-align: center;">제목</th>
	 					<th style="background-color: #eeeeee; text-align: center;">작성자</th>
	 					<th style="background-color: #eeeeee; text-align: center;">작성일</th>
	 				</tr>
	 			</thead>
	 			<tbody>
	 			<%
	 				BbsDAO bbsDAO = new BbsDAO();
	 				ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
	 				for(int i = 0; i < list.size(); i++) {
	 					%> 
	 				<tr>
	 					<td><%= list.get(i).getBbsID() %></td>
	 					<td><a href="view.jsp?bbsID=<%= list.get(i).getBbsID() %>"> <%= list.get(i).getBbsTitle() %></a></td>
	 					<td><%= list.get(i).getUserID() %></td>
	 					<td><%= list.get(i).getBbsDate().substring(0, 11) + list.get(i).getBbsDate().substring(11, 13) + "시" + list.get(i).getBbsDate().substring(14, 16) + "분" %></td>
	 					
	 				</tr>
	 					
	 			<% 
	 				}
	 			%>
	 			</tbody>
	 			
	 		</table>
	 		
	 		<%
	 			if(pageNumber != 1) {
	 		%>
	 			<a href="bbs.jsp?pageNumber=<%= pageNumber - 1 %>" class="btn btn-success btn-arraw-left">이전</a>
	 		<%
	 			} if(bbsDAO.nextPage(pageNumber)) {
	 		%>
	 			<a href="bbs.jsp?pageNumber=<%= pageNumber + 1 %>" class="btn btn-success btn-arraw-left">다음</a>
	 		<%
	 			}
	 		%>
	 		
	 		<a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a>
	 	</div>
	 </div>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script> 
</body>
</html>