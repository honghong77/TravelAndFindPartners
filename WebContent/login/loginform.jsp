<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="style.css">
</head>
<body>
	<section class="login-form">
		<form action="/TravelAndFindPartners/login" method="post">
			<h1>로그인</h1>
			<div class="int-area">
				<input type="email" name="id" id="id" autocomplete="off" required>
				<label for="id">아이디</label>
			</div>
			<div class="int-area">
				<input type="password" name="pw" id="pw"
				autocomplete="off" required>
				<label for="pw">비밀번호</label>
			</div>
			<div class="btn-area">
				<button type="submit">로그인</button>
			</div>
			<div class="sign_area">
				<span>아이디가 없으시다면 회원가입을 누르세요 </span>
				<span id="btn_sign" onclick="page_sign()">회원가입</span>
			</div>
		</form>	
	</section>
	
	<script>
		function page_sign(){
			console.log("test");
			document.location.href="../sign/signUp.jsp";
		}
	
		/*$(document).ready(function() {
		    let id = $('#id');
		    let pw = $('#pw');
		    let btn = $('button[type="submit"]');
		 
		    $(btn).on('click', function(e) {
		        e.preventDefault(); // 폼 전송을 막음
		        
		        if (!id.get(0).checkValidity() || !isValidEmail(id.val())) {
		            id.next('label').addClass('warning');
		            setTimeout(function() {
		                $('label').removeClass('warning');
		            }, 1500);
		        } else if (pw.val() == "") {
		            pw.next('label').addClass('warning');
		            setTimeout(function() {
		                $('label').removeClass('warning');
		            }, 1500);
		        }
		    });
		});		*/
	</script>
</body>
</html>

