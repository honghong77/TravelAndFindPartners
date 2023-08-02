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
	out.println(today);%>

<div id="main">
	<form action="" method="post" name="myForm">
	
	<div id="location">
		<div>
			<input type="radio" class="btn" id="radio1" value="서울"><label for="radio1">서울</label>
			<input type="radio" class="btn" id="radio2" value="부산"><label for="radio2">부산</label>
			<input type="radio" class="btn" id="radio3" value="대구"><label for="radio3">대구</label>
			<input type="radio" class="btn" id="radio4" value="인천"><label for="radio4">인천</label>
			<input type="radio" class="btn" id="radio5" value="광주"><label for="radio5">광주</label>
			<input type="radio" class="btn" id="radio6" value="대전"><label for="radio6">대전</label>
			<input type="radio" class="btn" id="radio7" value="울산"><label for="radio7">울산</label>
			<input type="radio" class="btn" id="radio8" value="세종"><label for="radio8">세종</label>
			<input type="radio" class="btn" id="radio9" value="경기"><label for="radio9">경기</label>
			<input type="radio" class="btn" id="radio10" value="강원"><label for="radio10">강원</label>
			<input type="radio" class="btn" id="radio11" value="충북"><label for="radio11">충북</label>
			<input type="radio" class="btn" id="radio11" value="충남"><label for="radio12">충남</label>
			<input type="radio" class="btn" id="radio11" value="전북"><label for="radio13">전북</label>
			<input type="radio" class="btn" id="radio11" value="전남"><label for="radio14">전남</label>
			<input type="radio" class="btn" id="radio11" value="경북"><label for="radio15">경북</label>
			<input type="radio" class="btn" id="radio11" value="경남"><label for="radio16">경남</label>
			<input type="radio" class="btn" id="radio11" value="제주"><label for="radio17">제주</label>
		</div>
		
		<div id="모집인원"></div>
		<div id="날짜선택">
		<label for="date">출발 날짜를 선택하세요:
		  <input type="date"
		         id="startdate"
		         max="2023-12-31"
		         min=<%= today %>
		         value=<%= today %>></label>
		  <label for="date">도착 날짜를 선택하세요:
		  <input type="date"
		         id="enddate"
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
