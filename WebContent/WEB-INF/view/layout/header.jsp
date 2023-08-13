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

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

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
<body>

	<!-- 네브바 시작 -->
	<nav class="navbar navbar-expand-lg bg-light">
		<div class="container" >
			<a class="navbar-brand" href="#">트립소다</a>
			<div>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
				aria-controls="navbarNavDropdown" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			</div>
			<div class="collapse navbar-collapse" id="navbarNavDropdown"
				style="justify-content: flex-end;">
				<ul class="navbar-nav">
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> 작성하기 </a>
						<ul id="dropdown-menu" class="dropdown-menu">
							<li><a class="dropdown-item" href="#">동행 모집하기</a></li>
							<li><a class="dropdown-item" data-bs-toggle="modal"
								data-bs-target="#scheduleModal">여행일정 만들기</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
	</nav>
	<nav class="navbar navbar-expand-lg bg-light">
		<div class="container">
			<div class="collapse navbar-collapse" id="navbarNavDropdown">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="#">홈</a></li>
					<li class="nav-item"><a class="nav-link" href="#">동행</a></li>
					<li class="nav-item"><a class="nav-link" href="/">일정</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<br>

	<%-- 여행일정 만들기 모달입니다  --%>
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
					<form action="/schedule3" method="POST" onsubmit="return validateForm()">
						<div class="mb-3">
							<label for="destinationSelect" class="form-label">여행지</label>
							<select class="form-select" id="destinationSelect" name="destination" onchange="setCoordinates()">
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
						<input type="hidden" name="latitude" id="latitude" value="0">
				<input type="hidden" name="longitude" id="longitude" value="0">
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
	
<%-- 여행 일정 만들기 할 때 유효성 검사를 하는 스크립트입니다 --%>
<script>
function validateForm() {
	const destination = document.getElementById('destinationSelect').value;
	const startDate = document.getElementById('startDate').value;
	const endDate = document.getElementById('endDate').value;

	if (destination === '여행지를 선택해주세요' || startDate === '' || endDate === '') {
		alert('모든 필드를 입력해주세요.');
		return false; 
	}

	// 날짜 형식으로 변환
	const start = new Date(startDate);
	const end = new Date(endDate);

	if (start > end) {
		alert('여행 종료 날짜가 시작 날짜보다 빠를 수 없습니다.');
		return false; 
	}

	return true; 
}
</script>

</body>
<%--  여행지를 선택했을 때 위도와 경도를 정의하고 파라미터로 넘겨줄 수 있도록 설정하는 스크립트 입니다--%> 
<script>
var coordinates = {
    "서울": { lat: 37.5665, lng: 126.9780 },
    "부산": { lat: 35.1796, lng: 129.0756 },
    "인천": { lat: 37.4563, lng: 126.7052 },
    "대구": { lat: 35.8714, lng: 128.6014 },
    "광주": { lat: 35.1601, lng: 126.8526 },
    "대전": { lat: 36.3504, lng: 127.3845 },
    "울산": { lat: 35.5384, lng: 129.3114 },
    "세종": { lat: 36.4801, lng: 127.2890 },
    "경기": { lat: 37.4138, lng: 127.5183 },
    "강원": { lat: 37.8228, lng: 128.1555 },
    "충북": { lat: 36.8000, lng: 127.7000 },
    "충남": { lat: 36.5184, lng: 126.8000 },
    "전북": { lat: 35.7175, lng: 127.1530 },
    "전남": { lat: 34.8161, lng: 126.4629 },
    "경북": { lat: 36.4919, lng: 128.8889 },
    "경남": { lat: 35.4606, lng: 128.2132 },
    "제주": { lat: 33.4996, lng: 126.5312 }
};

   var selectedLat = 0; // 위도
   var selectedLng = 0; // 경도

   // 여행지가 선택되면 위도와 경도를 설정
function setCoordinates() {
    console.log("함수 실행")
    var destination = document.getElementById("destinationSelect").value; // ID 값이 "destinationSelect"
    if (coordinates[destination]) {
        selectedLat = coordinates[destination].lat;
        selectedLng = coordinates[destination].lng;

        // 숨겨진 입력 필드에 위도와 경도 값을 설정
        document.getElementById("latitude").value = selectedLat;
        document.getElementById("longitude").value = selectedLng;
    }
}

</script>

<%-- 목적지, 여행시작시간, 여행종료시간, 위도, 경도의 정보를 파라미터로 넘겨주는 구간입니다 --%> 
<%
    String destination = request.getParameter("destination");
    String startDate = request.getParameter("startDate");
    String endDate = request.getParameter("endDate");
    String latitude = request.getParameter("latitude");
    String longitude = request.getParameter("longitude");
    request.setAttribute("destination", destination);
    request.setAttribute("startDate", startDate);
    request.setAttribute("endDate", endDate);
    request.setAttribute("latitude", latitude); // 위도 저장
    request.setAttribute("longitude", longitude); // 경도 저장
%>
								    
								    
</html>

