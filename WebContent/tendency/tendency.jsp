<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>성향 고르기</title>
<link rel="stylesheet" href="tendencyStyle.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
	<div class="container">
        <p><h1>관심사와 취향을 선택해주세요</h1></p>     
        <p><h2>내 관심사에 딱 맞는 동행과 여행을 추천해 드려요</h2></p>
        
        <form action="/TravelAndFindPartners/tendency" class="toggle" id="ct_frm" method="post">
            <p><h1>나는 어떤 여행을 좋아하나요?</h1></p>
            <p><h2>(최대 3개까지 선택)</h2></p>
            <input type="checkbox" class="btn-check" id="btn-check" name="tripTendency" value="1" autocomplete="off">
            <label class="btn btn-primary" for="btn-check">&#128279; 무계획</label>

            <input type="checkbox" class="btn-check" id="btn-check2" name="tripTendency" value="2" autocomplete="off">
            <label class="btn btn-primary" for="btn-check2">🗽 관광</label>
    
            <input type="checkbox" class="btn-check" id="btn-check3" name="tripTendency" value="3" autocomplete="off">
            <label class="btn btn-primary" for="btn-check3">🏖️ 바다</label>
    
            <input type="checkbox" class="btn-check" id="btn-check4" name="tripTendency" value="4" autocomplete="off">
            <label class="btn btn-primary" for="btn-check4">🌄 등산</label>
    
            <input type="checkbox" class="btn-check" id="btn-check5" name="tripTendency" value="5" autocomplete="off">
            <label class="btn btn-primary" for="btn-check5">&#127857; 맛집/카페 탐방</label>
    
            <input type="checkbox" class="btn-check" id="btn-check6" name="tripTendency" value="6" autocomplete="off">
            <label class="btn btn-primary" for="btn-check6">💎 핫플레이스 탐방</label>
    
            <input type="checkbox" class="btn-check" id="btn-check7" name="tripTendency" value="7" autocomplete="off">
            <label class="btn btn-primary" for="btn-check7">🛍️ 쇼핑</label>
    
            <input type="checkbox" class="btn-check" id="btn-check8" name="tripTendency" value="8" autocomplete="off">
            <label class="btn btn-primary" for="btn-check8">&#128663; 드라이브</label>
    
            <input type="checkbox" class="btn-check" id="btn-check9" name="tripTendency" value="9" autocomplete="off">
            <label class="btn btn-primary" for="btn-check9">🎭 전시회/공연 관람</label>
    
            <input type="checkbox" class="btn-check" id="btn-check10" name="tripTendency" value="10" autocomplete="off">
            <label class="btn btn-primary" for="btn-check10">⛺ 글램핑</label>
    
            <input type="checkbox" class="btn-check" id="btn-check11" name="tripTendency" value="11" autocomplete="off">
            <label class="btn btn-primary" for="btn-check11">⚽ 스포츠 경기 직관</label>
    
            <input type="checkbox" class="btn-check" id="btn-check12" name="tripTendency" value="12" autocomplete="off">
            <label class="btn btn-primary" for="btn-check12">&#127940; 서핑</label>
        
      
            <p><h1>나는 어떤 여행자인가요?</h1></p>
            <p><h2>(최대 6개까지 선택)</h2></p>
            <div class="container2">
               
                <input type="checkbox" class="btn-check2" id="my" name="myTendency" value="13" autocomplete="off">
                <label class="btn btn-primary" for="my">💡 즉흥적인</label>
        
                <input type="checkbox" class="btn-check2" id="my2" name="myTendency" value="14" autocomplete="off">
                <label class="btn btn-primary" for="my2">📝 계획적인</label>
        
                <input type="checkbox" class="btn-check2" id="my3" name="myTendency" value="15" autocomplete="off">
                <label class="btn btn-primary" for="my3">😎 여행고수</label>
        
                <input type="checkbox" class="btn-check2" id="my4" name="myTendency" value="16" autocomplete="off">
                <label class="btn btn-primary" for="my4">😢 여행초보</label>
                
                <input type="checkbox" class="btn-check2" id="my5" name="myTendency" value="17" autocomplete="off">
                <label class="btn btn-primary" for="my5">&#128694; 뚜벅이</label>
                
                <input type="checkbox" class="btn-check2" id="my6" name="myTendency" value="18" autocomplete="off">
                <label class="btn btn-primary" for="my6">&#128526; 드라이버</label>
        
                <input type="checkbox" class="btn-check2" id="my7" name="myTendency" value="19" autocomplete="off">
                <label class="btn btn-primary" for="my7">🙋 적극적인</label>
        
                <input type="checkbox" class="btn-check2" id="my8" name="myTendency" value="20" autocomplete="off">
                <label class="btn btn-primary" for="my8">🥱 느긋한</label>
        
                <input type="checkbox" class="btn-check2" id="my9" name="myTendency" value="21" autocomplete="off">
                <label class="btn btn-primary" for="my9">🔠 외국어 가능</label>
        
                <input type="checkbox" class="btn-check2" id="my10" name="myTendency" value="22" autocomplete="off">
                <label class="btn btn-primary" for="my10">😁 친화력 좋은</label>
        
                <input type="checkbox" class="btn-check2" id="my11" name="myTendency" value="23" autocomplete="off">
                <label class="btn btn-primary" for="my11">📷 사진 찍는</label>
        
                <input type="checkbox" class="btn-check2" id="my12" name="myTendency" value="24" autocomplete="off">
                <label class="btn btn-primary" for="my12">🍺 음주 선호</label>  
                
            </form>
            <span class="btn_ok" onclick="goToProfileSelection()">다음</span>
</body>
<script src="tendencyJs.js"></script>
</html>