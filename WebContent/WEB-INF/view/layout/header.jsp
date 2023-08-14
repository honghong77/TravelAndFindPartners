<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<style>
#dropdown-menu[data-bs-popper] {
	top: 100%;
	left: -50px;
	margin-top: var(- -bs-dropdown-spacer);
}

</style>

<html lang="en">
<head>
<title>Blog</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
<script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
<script src="https://kit.fontawesome.com/d0a7af3fd0.js" crossorigin="anonymous"></script>
</head>
<body class="bodies">

	<!-- 네브바 시작 -->
	<nav class="navbar navbar-expand-lg bg-light">
		<div class="container-fluid">
			<a class="navbar-brand" href="http://localhost:8080/TravelAndFindPartners/home"><img src="./images/logo.gif" alt="로고"></a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
				aria-controls="navbarNavDropdown" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNavDropdown" style="justify-content: flex-end;">
				<ul class="navbar-nav">
				    <!-- 로그인 및 회원가입 링크 -->
				    <% if (session.getAttribute("id") == null) { %>
				        <li class="nav-item login-signup"><a class="nav-link" href="login/loginform.jsp">로그인</a></li>
				        <li class="nav-item login-signup"><a class="nav-link" href="sign/signUp.jsp">회원가입</a></li>
				    <% } else { %>
				        <!-- 사용자별 링크 및 로그아웃 옵션 -->
				        <li class="nav-item"><a class="nav-link" href="myPage">마이페이지</a></li>
				        <li class="nav-item"><a class="nav-link" href="logout">로그아웃</a></li>
				    <% } %>
				    
				    <!-- 작성하기 드롭다운 -->
				    <li class="nav-item dropdown">
				        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false" id="scheduleLink">작성하기</a>
				        <ul id="dropdown-menu" class="dropdown-menu">
				            <li><a class="dropdown-item" href="write">동행 모집하기</a></li>
				            <li><a class="dropdown-item" data-bs-toggle="modal" data-bs-target="#scheduleModal">여행일정 만들기</a></li>
				        </ul>
				    </li>				    
				</ul>
			</div>
		</div>
	</nav>
	<nav class="navbar navbar-expand-lg bg-light">
		<div class="container-fluid">
			<div class="collapse navbar-collapse" id="navbarNavDropdown">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="home">홈</a></li>
					<li class="nav-item"><a class="nav-link" href="companion">동행</a></li>
					<li class="nav-item"><a class="nav-link" href="hello">일정</a></li>
				</ul>
			</div>
		</div>
	</nav>
	
	<!-- 여행일정 만들기 모달 -->
	<div class="modal fade" id="scheduleModal" tabindex="-1"
		aria-labelledby="scheduleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="scheduleModalLabel">여행일정 만들기</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form action="/TravelAndFindPartners/schedule3" method="POST">
						<div class="mb-3">
							<label for="destination" class="form-label" id="destination">여행지</label> <select
								class="form-select" id="destination" name="destination">
								<option selected>여행지를 선택해주세요</option>
								<option value="서울">서울특별시</option>
								<option value="부산">부산광역시</option>
								<option value="인천">인천광역시</option>
								<option value="대구">대구광역시</option>
								<option value="광주">광주광역시</option>
								<option value="대전">대전광역시</option>
								<option value="울산">울산광역시</option>
								<option value="세종">세종특별자치시</option>
								<option value="경기">경기도</option>
								<option value="강원">강원도</option>
								<option value="충북">충청북도</option>
								<option value="충남">충청남도</option>
								<option value="전북">전라북도</option>
								<option value="전남">전라남도</option>
								<option value="경북">경상북도</option>
								<option value="경남">경상남도</option>
								<option value="제주">제주특별자치도</option>
							</select>
						</div>
						<div class="mb-3">
							<label for="startDate" class="form-label">여행 시작 날짜</label> <input
								type="date" class="form-control" id="startDate" name="startDate">
						</div>
						<div class="mb-3">
							<label for="endDate" class="form-label">여행 종료 날짜</label> <input
								type="date" class="form-control" id="endDate" name="endDate">
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"data-bs-dismiss="modal">닫기</button>
						<input type="submit" class="btn btn-primary" value="다음">
						</div>
					</form>
				</div>
				
				
				


			</div>
		</div>
	</div>
	<!-- 네브바 끝 -->

<script src="js/header.js"></script>
</body>





    <!-- Set destination, startDate, endDate in the request -->
    <%
        String destination = request.getParameter("destination");
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        request.setAttribute("destination", destination);
        request.setAttribute("startDate", startDate);
        request.setAttribute("endDate", endDate);
    %>
</html>

