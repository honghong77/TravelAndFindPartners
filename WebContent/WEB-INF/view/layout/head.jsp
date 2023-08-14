<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="./css/header.css">
</head>
<body>
<div id="wrap">
        <header>
            <div>
                <ul class="gnb">
                    <li class="logo">
                        <a href="#"><img src="images/logo.gif" alt="로고"></a> 
                    </li>
                    <li><a href="#">홈</a></li>
                    <li><a href="#">동행</a></li>
                    <li><a href="#">일정</a></li>
                </ul>
                <ul class="gnb">
                    <li><a href="#">로그인</a></li>
                    <li><a href="#">회원가입</a></li>
                    <li class="dropdown-head">
                        <a href="#">작성하기</a>
                        <ul id="dropdown-menu" class="dropdown-menu menu-off">
                            <li><a class="dropdown-item" href="write">동행 모집하기</a></li>
                            <li><a class="dropdown-item" data-bs-toggle="modal"
                                data-bs-target="#scheduleModal">여행 일정 만들기</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </header>
    </div>
    <script src="./js/header.js"></script>
</body>
</html>