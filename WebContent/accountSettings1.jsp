
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
<link
	rel="stylesheet" href="https: //fonts.googleapis.com/css2? family= 나눔+고딕:wght@700 
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

<title>마이페이지</title>
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
				<h2 class="iyhFrz">계정관리</h2>
				<div class="gATMte"></div>
				<div class="jjCxFW">
					<div height="70px" width="70px" class="ezmYtc">
						<img
							src="https://tripsoda.s3.ap-northeast-2.amazonaws.com/prod/member/1691473288120-1469"
							alt="미리보기" height="70px" width="70px" class="ikghZb">
						<div class="tKUIf">
							<img src="images/icon_camera.svg" alt="카메라 이미지">
						</div>
					</div>
					<input type="file" name="file"
						accept="image/bmp,image/gif,image/jpg,image/jpeg,image/png,image/raw,image/tif,image/heif,image/heic,image/mp4,image/avi,image/mov,image/wmv,image/mkv,image/mpg,image/rm,image/asf,image/m4v,image/mpeg,image/mpg"
						style="display: none; margin: 0px; padding: 0px;">
					<div class="ldikjO"></div>
				</div>
			
				<div class="iRAjnv">
					<div class="eDzsDw">
						<input type="text" placeholder="닉네임을 입력해주세요.(6자 이내)" maxlength="6"
						class="placeholder">
						<a class="btn btn-primary" id="cHFekt" href="#" role="button">수정</a>
					</div>
				</div>
				<div class="eprmtQ">
					<h3 class="fCtkvh">소개글</h3>
					<div class="giHZRD">
						<input type="text" placeholder="소개글을 입력해주세요.(2000자 이내)" maxlength="2000"
							class="placeholder1">
						<a class="btn btn-primary" id="Wkbpk" href="#" role="button">수정</a>
					</div>
				</div>
				<div class="jxBpbf">
					<div class="gATMte"></div>
					<ul class="cErYsA">
						<li class="hjNVBQ">
							<button class="eQPohI">비밀번호 변경</button>
						</li>
						<li class="falYDJ">
							<button class="eQPohI">여행취향 테스트</button>
						</li>
					</ul>
				</div>
			</div>
			<div class="gLjhXe">
				<!-- 오른쪽 전체 -->
				<div class="jEvmcH">
				<div class="container" id="right-menu">
			<div id="sub-right-menu">
			<a href="accountSettings1.jsp">
				 <img src="images/account.svg" alt="계정설정"> <span
					class="account" id="account">계정설정</span>
			</div>
			<div id="sub-right-menu">
			<a href="mypage2.jsp">
				<img src="images/plan.svg" alt="내 일정"> <span class="plan"
					id="account">내 일정</span>
			</div>
			<div id="sub-right-menu">
			 <a href="myCompanion2.jsp">
				<img src="images/companion_board.svg" alt="내 동행 게시글"> <span
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