<%@page import="java.time.LocalDate"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="boardStyle.css" rel="stylesheet" type="text/css">
</head>
<body>
<%-- 여행지 선택
모집인원
날짜선택
사진선택
제목
내용
취소 / 작성완료 --%>

<% LocalDate today = LocalDate.now();

	LocalDate thisDay = today.plusDays(13);%>

<div id="main">
	<form action="" method="post" name="myForm">
	
	<div id="location">
		<div>
			<input type="radio" class="btn" name="radiobtn" id="radiobtn1" value="서울"><label for="radiobtn1">서울</label>
			<input type="radio" class="btn" name="radiobtn" id="radiobtn2" value="부산"><label for="radiobtn2">부산</label>
			<input type="radio" class="btn" name="radiobtn" id="radiobtn3" value="대구"><label for="radiobtn3">대구</label>
			<input type="radio" class="btn" name="radiobtn" id="radiobtn4" value="인천"><label for="radiobtn4">인천</label>
			<input type="radio" class="btn" name="radiobtn" id="radiobtn5" value="광주"><label for="radiobtn5">광주</label>
			<input type="radio" class="btn" name="radiobtn" id="radiobtn6" value="대전"><label for="radiobtn6">대전</label>
			<input type="radio" class="btn" name="radiobtn" id="radiobtn7" value="울산"><label for="radiobtn7">울산</label>
			<input type="radio" class="btn" name="radiobtn" id="radiobtn8" value="세종"><label for="radiobtn8">세종</label>
			<input type="radio" class="btn" name="radiobtn" id="radiobtn9" value="경기"><label for="radiobtn9">경기</label>
			<input type="radio" class="btn" name="radiobtn" id="radiobtn10" value="강원"><label for="radiobtn10">강원</label>
			<input type="radio" class="btn" name="radiobtn" id="radiobtn11" value="충북"><label for="radiobtn11">충북</label>
			<input type="radio" class="btn" name="radiobtn" id="radiobtn12" value="충남"><label for="radiobtn12">충남</label>
			<input type="radio" class="btn" name="radiobtn" id="radiobtn13" value="전북"><label for="radiobtn13">전북</label>
			<input type="radio" class="btn" name="radiobtn" id="radiobtn14" value="전남"><label for="radiobtn14">전남</label>
			<input type="radio" class="btn" name="radiobtn" id="radiobtn15" value="경북"><label for="radiobtn15">경북</label>
			<input type="radio" class="btn" name="radiobtn" id="radiobtn16" value="경남"><label for="radiobtn16">경남</label>
			<input type="radio" class="btn" name="radiobtn" id="radiobtn17" value="제주"><label for="radiobtn17">제주</label>
		</div>
		
		<div id="모집인원">
			<label>인원</label>
		  <input type="range" name="number" min="1" max="10" step="1" value="1" oninput="document.getElementById('value1').innerHTML=this.value;">
        	<span id="value1"></span>
		</div>
		
		<div id="날짜선택">
		<label for="date">출발 날짜를 선택하세요:
		  <input type="date"
		         name="startdate"
		         max="2023-12-31"
		         min=<%= today %>
		         value=<%= today %>></label>
		         
		  <script>
		  	let thisDate = document.getElementId("startdate");
		  </script>
		
		  <label for="date">도착 날짜를 선택하세요:
		  <input type="date"
		         name="enddate"
		         max="2023-12-31"
		         min=<%= today %>
		         value=<%= today %>></label>
		</div>
		
		<div id="board_point">
			<dl>
				<dt>제목</dt>
				<dd>
				<textarea rows="12" cols="63" name="title" class="boxTA"></textarea>
				</dd>
			</dl>
		</div>
		
		<div id="board_point">
			<dl>
				<dt>내용</dt>
				<dd>
				<textarea rows="12" cols="63" name="content" class="boxTA"></textarea>
				</dd>
			</dl>
		</div>
		
		<div id="board_button">
			<input type="submit" value="등록하기 " id="btn1"/>
			<input type="button" value=" 작성취소 " id="btn2" 
			onclick="location.href='companionBoard.jsp';"/>
		</div>
		
		</form>
	</div>
 </body>
 
 <script>
 	const dateControl = document.querySelector('input[type="date"]')
 	dateControl.value = '2017-06-01'
 	
	function sendIt(){
		
		var f = document.main;
		
		str = f.subject.value;
		str = str.trim();
		if(!str){
			alert("\n제목을 입력하세요.");
			f.subject.focus();
			return;
		}
		
		f.subject.value = str;
		
		
		str = f.content.value;
		str = str.trim();
		if(!str){
			alert("\n내용을 입력하세요.");
			f.content.focus();
			return;
		}
		f.content.value = str;	
		
	}
</script>
  
</html>
