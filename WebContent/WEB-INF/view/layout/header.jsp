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
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAbBV-mR71MB1Oc8kwqjn0bcIG7BEFDGuE&callback=initMap&v=weekly"
	defer></script>

</head>
<body>
	<script>
		// id만 적을 수 있다(개인정보는 적으면 안됨)
		// 자바스크립트로 변형이 불가능
		// 자바스크립트로 유효성 검사를 완벽하게 할 수 있는 방법은 없다
	</script>

	<!-- 네브바 시작 -->
	<nav class="navbar navbar-expand-lg bg-light">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">트립소다</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
				aria-controls="navbarNavDropdown" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
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
		<div class="container-fluid">
			<div class="collapse navbar-collapse" id="navbarNavDropdown">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="#">홈</a></li>
					<li class="nav-item"><a class="nav-link" href="#">동행</a></li>
					<li class="nav-item"><a class="nav-link" href="hello">일정</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<br>

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
					<form>
						<div class="mb-3">
							<label for="destination" class="form-label">여행지</label> <select
								class="form-select" id="destination">
								<option selected>여행지를 선택해주세요</option>
								<option value="seoul">서울특별시</option>
								<option value="busan">부산광역시</option>
								<option value="incheon">인천광역시</option>
								<option value="daegu">대구광역시</option>
								<option value="gwangju">광주광역시</option>
								<option value="daejeon">대전광역시</option>
								<option value="ulsan">울산광역시</option>
								<option value="sejong">세종특별자치시</option>
								<option value="gyeonggi">경기도</option>
								<option value="gangwon">강원도</option>
								<option value="chungbuk">충청북도</option>
								<option value="chungnam">충청남도</option>
								<option value="jeonbuk">전라북도</option>
								<option value="jeonnam">전라남도</option>
								<option value="gyeongbuk">경상북도</option>
								<option value="gyeongnam">경상남도</option>
								<option value="jeju">제주특별자치도</option>
							</select>
						</div>
						<div class="mb-3">
							<label for="startDate" class="form-label">여행 시작 날짜</label> <input
								type="date" class="form-control" id="startDate">
						</div>
						<div class="mb-3">
							<label for="endDate" class="form-label">여행 종료 날짜</label> <input
								type="date" class="form-control" id="endDate">
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">닫기</button>
					<a href="${pageContext.request.contextPath}/schedule2"
						type="button" class="btn btn-primary">다음</a>


				</div>
			</div>
		</div>
	</div>
	<!-- 네브바 끝 -->


</body>

<script>
document.querySelector(".btn.btn-primary").addEventListener("click", function(event) {
    const destination = document.getElementById("destination").value;
    const startDate = document.getElementById("startDate").value;
    const endDate = document.getElementById("endDate").value;

    // Check if destination, startDate or endDate is empty
    if (destination === "여행지를 선택해주세요" || startDate === "" || endDate === "") {
        alert("모든 필드를 입력해주세요.");
        event.preventDefault();
        return;
    }

    if (startDate > endDate) {
        alert("여행 시작 날짜는 종료 날짜보다 빠를 수 없습니다.");
        event.preventDefault();
        return;
    }

    // Send the dates to the server
    fetch('/your-server-endpoint', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({ destination, startDate, endDate }),
    })
    .then(response => response.json())
    .then(data => {
        console.log('Success:', data);
    })
    .catch((error) => {
        console.error('Error:', error);
    });
});

</script>


</html>
