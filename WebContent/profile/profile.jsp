<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로필 선택</title>
<link rel="stylesheet" href="profileStyle.css">
</head>
<body>
    <form action="/TravelAndFindPartners/profile" method="post" enctype="multipart/form-data">
        <div class="container">
            <h1>프로필 선택</h1>
            <div class="profile-container">
                <div class="profile">
                    <input type="file" id="file-input" name="profileImage" accept="image/*">
                    <label for="file-input">
                        <img src="basic.jpg" alt="프로필 사진" name="img" value="img" id="preview-image">
                        <input type="hidden" name="imgsrc" class="imgsrc" value="http://localhost:8080/TravelAndFindPartners/profile/basic.jpg">
                    </label>
                </div>
                <div class="default-profiles">
                    <img src="c15.png" alt="프로필 사진" onclick="selectDefaultProfile('c15.png')">
                    <img src="c16.png" alt="프로필 사진" onclick="selectDefaultProfile('c16.png')">
                    <img src="c17.png" alt="프로필 사진" onclick="selectDefaultProfile('c17.png')">
                </div>
            </div>
        </div>
        <span class="btn_ok">완료</span>
    </form>
    <script src="profileJs.js?a=d"></script>
</body>
</html>
