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

<%-- LocalDate today = LocalDate.now();--%>




<section class="back">
	<div class="title" id="title">
	동행 찾기
	</div>
</section>

<div id="main">
	<form action="" method="post" name="form" enctype="multipart/form-data" onSubmit="return checkform();">
	
	<div class="location" id="locations">
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
        	<span id="value1">1</span>
		</div>
		
		<div id="날짜선택">
		<label for="date">출발 날짜를 선택하세요:
		  <input type="date"
		  		 id="startdate"
		         name="startdate"
		         max="2024-12-31"
		         min=""
		         value=""></label>
		        
		  <label for="date">도착 날짜를 선택하세요:
		  <input type="date"
		  		 id="enddate"
		         name="enddate"
		         max="2024-12-31"
		         min=""
		         value=""></label>
		</div>
		
		<script>
		// 시작 날짜 변경
		let today = new Date();
		let day = today.getDate();
	    let month = today.getMonth() + 1; // 1월이 0부터 시작하여 1을 더해준다.
	    let year = today.getFullYear();
	    if (day < 10) day = '0' + day;
	    if (month < 10) month = '0' + month;
	    today = year + '-' + month + '-' + day;

		document.getElementById("startdate").setAttribute("value", today);
		document.getElementById("startdate").setAttribute("min", today);
		document.getElementById("enddate").setAttribute("value", today);
		document.getElementById("enddate").setAttribute("min", today);
		
		
		function changeReturn() {
			  // 가는 날 선택에 따라 오는 날 초기 날짜 변경
			let start = document.getElementById("startdate").value;
			document.getElementById("enddate").setAttribute("value", start);
			document.getElementById("enddate").setAttribute("min", start);
			}
		
			document.getElementById("startdate").onchange = () => {
			  changeReturn();
			}
			
		</script>
		
		<div>
			<input type="file" id="image" name="image" accept="image/*" onchange="setThumbnail(event);"/>
    		<div id="image_container"></div>

		</div>
		
		<div id="concept">
			<input type="checkbox" class="checkboxes" name="check" id="checkBox1" value="무계획" onClick="getCheckedCount(this)"><label for="checkBox1">무계획</label>
			<input type="checkbox" class="checkboxes" name="check" id="checkBox2" value="바다" onClick="getCheckedCount(this)"><label for="checkBox2">바다</label>
			<input type="checkbox" class="checkboxes" name="check" id="checkBox3" value="등산" onClick="getCheckedCount(this)"><label for="checkBox3">등산</label>
			<input type="checkbox" class="checkboxes" name="check" id="checkBox4" value="맛집/카페 탐방" onClick="getCheckedCount(this)"><label for="checkBox4">맛집/카페 탐방</label>
			<input type="checkbox" class="checkboxes" name="check" id="checkBox5" value="핫플레이스 탐방" onClick="getCheckedCount(this)"><label for="checkBox5">핫플레이스 탐방</label>
			<input type="checkbox" class="checkboxes" name="check" id="checkBox6" value="쇼핑" onclick="getCheckedCount(this)"><label for="checkBox6">쇼핑</label>
			<input type="checkbox" class="checkboxes" name="check" id="checkBox7" value="드라이브" onClick="getCheckedCount(this)"><label for="checkBox7">드라이브</label>
			<input type="checkbox" class="checkboxes" name="check" id="checkBox8" value="전시회/공연 관람" onClick="getCheckedCount(this)"><label for="checkBox8">전시회/공연 관람</label>
			<input type="checkbox" class="checkboxes" name="check" id="checkBox9" value="스포츠 경기 직관" onClick="getCheckedCount(this)"><label for="checkBox9">스포츠 경기 직관</label>
			<input type="checkbox" class="checkboxes" name="check" id="checkBox10" value="글램핑" onClick="getCheckedCount(this)"><label for="checkBox10">글램핑</label>
			<input type="checkbox" class="checkboxes" name="check" id="checkBox11" value="서핑" onClick="getCheckedCount(this)"><label for="checkBox11">서핑</label>
		</div>
		
		
		<div>
			<dl>
				<dt>제목</dt>
				<dd>
				<textarea rows="12" cols="63" id="title" name="title" class="boxTA" placeholder="ex) 12월 3박4일 제주 바다 보러갈 동행 3명 구해요" maxlength="100"></textarea>
				</dd>
			</dl>
		</div>
		
		<div>
			<dl>
				<dt>내용</dt>
				<dd>
				<textarea rows="12" cols="63" id="content" name="content" class="boxTA"></textarea>
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
 	// 유효성 검사
 	function checkform() {
 		// 날짜 비교
 		let startdate = new Date(document.getElementById("startdate").value);
 		let enddate = new Date(document.getElementById("enddate").value);
        if (startdate > enddate) {
            alert("날짜를 확인해주세요");
            return false;
        }
 		
 		
		if( !form.radiobtn.value ) {
			alert("지역을 선택해주세요");
			return false;
		}
		
	 	let checkboxes = document.getElementsByName("check");
     	let checkCount = 0;

     	checkboxes.forEach((checkbox) => {
        	 if (checkbox.checked) {
            	 checkCount++;
        	 }
     	});
     
     if (checkCount == 0) {
     	alert("여행 테마를 1개 이상 선택해주세요");
         return false;
     }
		
		if(form.title.value.length == 0){ 
			alert("제목을 입력해주세요");
			return false;
		}
		
		if(form.content.value.length == 0){ 
			alert("내용을 입력해주세요");
			return false;
		}
	}
 	
 	// 사진
	function setThumbnail(event) {
		var reader = new FileReader();
	
	    reader.onload = function(event) {
	    var img = document.createElement("img");
	    img.setAttribute("src", event.target.result);
	       
	    var imageContainer = document.querySelector("div#image_container");
	     
	    while (imageContainer.firstChild) {
	    	imageContainer.removeChild(imageContainer.firstChild);
	    }
	
	    imageContainer.appendChild(img);
	    };
	
	    reader.readAsDataURL(event.target.files[0]);
	}
	
 	// 체크박스 3개까지
	function getCheckedCount(obj) {
        let checkboxes = document.getElementsByName("check");
        let checkCount = 0;

        checkboxes.forEach((checkbox) => {
            if (checkbox.checked) {
                checkCount++;
            }
        });
        
        if (checkCount > 3) {
        	alert("3개까지 선택할 수 있습니다")
            obj.checked = false;
            return false;
        }
    }
</script> 

</html>