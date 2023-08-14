<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="./css/header.css">
</head>
<body class="body">
<div class="wrap">
        <header>
            <div>
                <ul class="gnb">
                    <li class="logo">
                        <a href="home"><img src="./images/logoname.jpg" alt="로고"></a> 
                    </li>
                    <li><a href="home">홈</a></li>
                    <li><a href="#">동행</a></li>
                    <li><a href="#">일정</a></li>
                </ul>
                <ul class="gnb">
                    <li><a href="login">로그인</a></li>
                    <li><a href="sign">회원가입</a></li>
                    <li class="dropdown-head">
                        <a href="#" id="scheduleLink">작성하기</a>
                        <ul id="dropdown-menu" class="dropdown-menu menu-off">
                            <li><a class="dropdown-item" href="write">동행 모집하기</a></li>
                            <li><a class="dropdown-item" href="#" >여행 일정 만들기</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </header>
    </div>
    <script src="./js/header.js"></script>
</body>
</html>
