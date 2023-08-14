<%@page import="companionBoard.Companion2"%>
<%@page import="java.util.List"%>
<%@page import="java.time.LocalDate"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link href="companion-css/boardStyle.css" rel="stylesheet" type="text/css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>

</head>
<%@ include file="/WEB-INF/view/layout/header.jsp"%>
<body>
<%
	List<Companion2> list = (List<Companion2>) request.getAttribute("list");
	Companion2 c = list.get(0);
%>


<div class="p-5 text-center bg-body-tertiary" style="background-image: url(images/trip.jpg);">
    <div class="container py-5">
      <h1 class="text-body-emphasis">동행 구하기</h1>
      <p class="col-lg-8 mx-auto lead">마음 맞는 친구와 여행을 떠나보세요!</p>
    </div>
</div>

<div id="main">
	<form action="save" method="post" name="form" enctype="multipart/form-data" onSubmit="return checkform();">
	<div class="choice">
	
	<div class="location" id="locations">
			<input type="radio" class="rb" name="radiobtn" id="radiobtn1" value="서울"><label for="radiobtn1">서울</label>
			<input type="radio" class="rb" name="radiobtn" id="radiobtn2" value="부산"><label for="radiobtn2">부산</label>
			<input type="radio" class="rb" name="radiobtn" id="radiobtn3" value="대구"><label for="radiobtn3">대구</label>
			<input type="radio" class="rb" name="radiobtn" id="radiobtn4" value="인천"><label for="radiobtn4">인천</label>
			<input type="radio" class="rb" name="radiobtn" id="radiobtn5" value="광주"><label for="radiobtn5">광주</label>
			<input type="radio" class="rb" name="radiobtn" id="radiobtn6" value="대전"><label for="radiobtn6">대전</label>
			<input type="radio" class="rb" name="radiobtn" id="radiobtn7" value="울산"><label for="radiobtn7">울산</label>
			<input type="radio" class="rb" name="radiobtn" id="radiobtn8" value="세종"><label for="radiobtn8">세종</label>
			<input type="radio" class="rb" name="radiobtn" id="radiobtn9" value="경기"><label for="radiobtn9">경기</label>
			<input type="radio" class="rb" name="radiobtn" id="radiobtn10" value="강원"><label for="radiobtn10">강원</label>
			<input type="radio" class="rb" name="radiobtn" id="radiobtn11" value="충북"><label for="radiobtn11">충북</label>
			<input type="radio" class="rb" name="radiobtn" id="radiobtn12" value="충남"><label for="radiobtn12">충남</label>
			<input type="radio" class="rb" name="radiobtn" id="radiobtn13" value="전북"><label for="radiobtn13">전북</label>
			<input type="radio" class="rb" name="radiobtn" id="radiobtn14" value="전남"><label for="radiobtn14">전남</label>
			<input type="radio" class="rb" name="radiobtn" id="radiobtn15" value="경북"><label for="radiobtn15">경북</label>
			<input type="radio" class="rb" name="radiobtn" id="radiobtn16" value="경남"><label for="radiobtn16">경남</label>
			<input type="radio" class="rb" name="radiobtn" id="radiobtn17" value="제주"><label for="radiobtn17">제주</label>
	</div>
	
		<input type="hidden" id="no" name="no" value="<%= c.getNo() %>">
		
	
		<div class="personnel">
			<label>인원</label>
		  <input type="range" id="number" name="number" min="1" max="10" step="1" value="1" oninput="document.getElementById('value1').innerHTML=this.value;">
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
		
		<div class="mb-3">
  			<label for="formFile" class="form-label">배경사진을 선택해주세요</label>
  			<input class="form-control" type="file" id="image" name="image" accept="image/*" onchange="setThumbnail(event);"/>
  			<div id="image_container">
  				<img id="selectedImage" alt="...">
  			</div>
		</div>
		
		<div class="mb-3">
  			<label for="exampleFormControlTextarea1" class="form-label">제목</label>
  			<textarea class="form-control" id="title" name="title" rows="1" placeholder="ex) 8월 해운대 같이 갈 동행  3명 구해요!" ></textarea>
		</div>
		
		<div class="mb-3">
  			<label for="exampleFormControlTextarea1" class="form-label">내용</label>
  			<textarea class="form-control" id="content" name="content" rows="15" placeholder="1. 현재 동행이 있나요?
ex) 혼자에요 / 동행 1명이 있어요

2. 어떤 동행을 찾고 있나요?
ex) 사진 찍는 걸 좋아하는 20대 남자면 좋겠어요

3. 원하는 여행코스가 있나요?
ex) 해운대 바다에서 놀다가 저녁으로 조개구이 먹고싶어요"></textarea>
		</div>
		
		
		<div id="board_button">
			<input class="btn btn-primary" type="submit" value="저장하기" id="btn1">
			<button type="button" class="btn btn-light" id="btn2" onclick="location.href='http://localhost:8080/TravelAndFindPartners/view?no=' + <%= c.getNo() %>;">수정취소</button>
		</div>
		</form>
	</div>
	
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>

	
 </body>
 
 <script>
 const companionList = <%= request.getAttribute("json") %>;
 const companion = companionList[0];
 const frame = document.getElementById("image");

   const base64Image = companion.image;
 		console.log(base64Image);
 		
   document.getElementById("selectedImage").src = 'data:image/png;base64,' + companion.image;
   
   const loca = companion.location;
   
   switch(loca) {
  	case '서울':  
		document.getElementById("radiobtn1").checked = true;
    	break;
  	case '부산':  
	  	document.getElementById("radiobtn2").checked = true;
    	break;
	case '대구':  
	  	document.getElementById("radiobtn3").checked = true;
    	break;
	case '인천':  
	  	document.getElementById("radiobtn4").checked = true;
    	break;
	case '광주':  
	  	document.getElementById("radiobtn5").checked = true;
    	break;
	case '대전':  
	  	document.getElementById("radiobtn6").checked = true;
    	break;
	case '울산':  
	  	document.getElementById("radiobtn7").checked = true;
    	break;
	case '세종':  
	  	document.getElementById("radiobtn8").checked = true;
    	break;
	case '경기':  
	  	document.getElementById("radiobtn9").checked = true;
    	break;
	case '강원':  
	  	document.getElementById("radiobtn10").checked = true;
    	break;
	case '충북':  
	  	document.getElementById("radiobtn11").checked = true;
    	break;
	case '충남':  
	  	document.getElementById("radiobtn12").checked = true;
    	break;
	case '전북':  
	  	document.getElementById("radiobtn13").checked = true;
    	break;
	case '전남':  
	  	document.getElementById("radiobtn14").checked = true;
    	break;
	case '경북':  
	  	document.getElementById("radiobtn15").checked = true;
    	break;
	case '경남':  
	  	document.getElementById("radiobtn16").checked = true;
    	break;
	case '제주':  
	  	document.getElementById("radiobtn17").checked = true;
    	break;
	}
   
   	document.getElementById("number").value = companion.personnel;
   	document.getElementById("value1").innerText = companion.personnel;
   	document.getElementById("startdate").value = companion.start;
	document.getElementById("enddate").value = companion.end;
	
	[companion.concept1, companion.concept2, companion.concept3].forEach ( 
		    function(concept) {
		        switch(concept) {
		  	case '무계획':  
				document.getElementById("checkBox1").checked = true;
		    	break;
		  	case '바다':  
			  	document.getElementById("checkBox2").checked = true;
		    	break;
			case '등산':  
			  	document.getElementById("checkBox3").checked = true;
		    	break;
			case '맛집/카페 탐방':  
			  	document.getElementById("checkBox4").checked = true;
		    	break;
			case '핫플레이스 탐방':  
			  	document.getElementById("checkBox5").checked = true;
		    	break;
			case '쇼핑':  
			  	document.getElementById("checkBox6").checked = true;
		    	break;
			case '드라이브':  
			  	document.getElementById("checkBox7").checked = true;
		    	break;
			case '전시회/공연 관람':  
			  	document.getElementById("checkBox8").checked = true;
		    	break;
			case '스포츠 경기 직관':  
			  	document.getElementById("checkBox9").checked = true;
		    	break;
			case '글램핑':  
			  	document.getElementById("checkBox10").checked = true;
		    	break;
			case '서핑':  
			  	document.getElementById("checkBox11").checked = true;
		    	break;
			}
		})
		
	document.getElementById("title").innerHTML = companion.title;
	document.getElementById("content").innerHTML = companion.content;
   

   
	var imageElement = document.getElementById("selectedImage"); // 이미지 요소 선택
	var imageUrl = imageElement.src; // 이미지 요소의 src 속성 값 가져오기

	if (imageUrl) {
	    console.log("이미지가 있는 상태입니다.");
	} else {
	    console.log("이미지가 없는 상태입니다.");
	}

 
 	// 유효성 검사
 	function checkform() {
		var fileCheck = document.getElementById("selectedImage").src;
 		
 		if(!fileCheck){
 		alert("파일을 첨부해 주세요");
 		return false;
 		}
 		
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