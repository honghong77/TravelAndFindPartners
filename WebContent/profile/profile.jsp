<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로필 선택</title>
<link rel="stylesheet" href="profileStyle.css">
</head>
<body>
	<div class="container">
        <h1>프로필 선택</h1>
        <div class="profile-container">
            <div class="profile">
                <input type="file" id="file-input" name="selectedProfileImageSrc" accept="image/*">
                <label for="file-input">
                    <img src="basic.jpg" alt="프로필 사진">
                </label>
            </div>
            <div class="default-profiles">
                <img src="춘식15.png" alt="프로필 사진">
                <img src="춘식16.png" alt="프로필 사진">
                <img src="춘식17.png" alt="프로필 사진">
            </div>
        </div>
    </div>
    <span class="btn_ok" onclick="goToLoginPage()">완료</span>
    <script src="profileJs.js"></script>
</body>
</html>