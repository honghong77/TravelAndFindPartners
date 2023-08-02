<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<style>
#dropdown-menu[data-bs-popper] {
    top: 100%;
    left: -50px;
    margin-top: var(--bs-dropdown-spacer);
}
</style>

<html lang="en">
<head>
  <title>Blog</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  
  <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
  
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
			<div class="collapse navbar-collapse" id="navbarNavDropdown" style="justify-content: flex-end;">
				<ul class="navbar-nav">
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> 작성하기
					</a>
						<ul id="dropdown-menu" class="dropdown-menu">
							<li><a class="dropdown-item" href="#">동행 모집하기</a></li>
							<li><a class="dropdown-item" href="#">여행일정 만들기</a></li>
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
					<li class="nav-item"><a class="nav-link" href="#">동행</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="#">일정</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	<br>
<!-- 네브바 끝 -->