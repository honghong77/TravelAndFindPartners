
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<link rel="stylesheet" href="css/mypage.css">
<link rel="stylesheet" href="css/accountSettings2.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" 크로스오리진>
<link rel="stylesheet"
	href="https: //fonts.googleapis.com/css2? family= 나눔+고딕:wght@700 
& 가족= Playfair+Display:ital,wght@1,500 & display=swap">

<!-- CSS only -->
<!-- <link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous"> -->

<style type="text/css">
a, a:hover {
	color: #000000;
	text-decoration: none;
}
</style>

<title>여행 동행 사이트</title>
</head>
<body>
	<%
		String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	%>
	
	<main width="100%" class="ckeXMd">
		<div class="rWysc">
			<!-- 전체  -->
			<div class="iAzNbF">
				<!-- 왼쪽 내용 -->
				<h2 class="iyhFrz">내 동행 게시글</h2>

				<div class="gATMte"></div>
				<!-- 내 일정 밑 라인  -->
				<div class="jjCxFW">
					<div class="var">
						<h4 id="sub-title">
							동행 모집 이력이 없어요 <br> 동행을 구해보세요.
						</h4>
						<a class="btn btn-primary" href="bbs.jsp?pageNumber=1" role="button">일정 생성</a>
					</div>
				</div>
				<div class="eprmtQ">
					<div class="giHZRD"></div>
				</div>
				<div class="gATMte"></div>
			</div>
			<div class="gLjhXe">
				<!-- 오른쪽 전체 -->
				<div class="jEvmcH">
					<div class="container" id="right-menu">
						<div id="sub-right-menu">
							<a href="accountSettings1.jsp"> <img src="images/account.svg"
								alt="계정설정"> <span class="account" id="account">계정설정</span>
						</div>
						<div id="sub-right-menu">
							<a href="mypage2.jsp"> <img src="images/plan.svg" alt="내 일정">
								<span class="plan" id="account">내 일정</span>
						</div>
						<div id="sub-right-menu">
							<a href="myCompanion2.jsp"> <img
								src="images/companion_board.svg" alt="내 동행 게시글"> <span
								class="companion_board" id="account">내 동행 게시글</span>
						</div>

						<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
						<script src="js/bootstrap.js"></script>
						<!-- JavaScript Bundle with Popper -->
						<!-- <script
										src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
										integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
										crossorigin="anonymous"></script> -->
</body>
</html>