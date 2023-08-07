<%@page import="companionBoard.Companion"%>
<%@page import="java.util.List"%>
<%@page import="companionBoard.CompanionListDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="listStyle.css" rel="stylesheet" type="text/css">
<title>Insert title here</title>
</head>
<body>
<%

	int startPage = (Integer) request.getAttribute("startPage");
	int endPage = (Integer) request.getAttribute("endPage");
	int totalPages = (Integer) request.getAttribute("totalPages");
	List<Companion> list = (List<Companion>) request.getAttribute("list");
%>

<span id="listSize" style="display: none;"> <%= list.size() %> </span>




<div  class="card-template" style="display: none;">
<a class="link" href=""> <!-- 클릭 시 링크 설정 -->
	<div class="card" >
		<!-- 카드 헤더 -->
		<div class="card-header" style="background-image: url(trip.jpg);">
			<div class = "card-header-is_closed" > 
                <div class = "card-header-text"> 모집중 </div > 
                <div class = "card-header-number"> 2 / 5 </div > 
            </div >
		</div>
		<!--  카드 바디 -->
		<div class="card-body">
			<!--  카드 바디 헤더 -->
			<div class="card-body-header">
				<h1>4월 15일 순천만 동행구해요!</h1>
				<p class="card-body-hashtag">#여수 #순천 #광양</p>
				 <p class = "card-body-nickname"> 
                                 작성자: ENDORPHIN0710</p>

			</div>
			<p class="card-body-description">
				안녕하세요!
				4월 15일 순천만 동행구합니다!
			</p>

			<!--  카드 바디 본문 -->
			<!--  카드 바디 푸터 -->
			<div class="card-body-footer">
				<hr style="margin-bottom: 8px; opacity: 0.5; border-color: #EF5A31">
				<i class="icon icon-view_count"></i>
				<i class="icon icon-comments_count"></i>
				<i class="reg_date"> 2018/04/12 </i>
			</div>
		</div>
	</div>
	</a>
</div>



<div class="card-container">

</div>



<div class="paging">
<nav aria-label="Page navigation example">
  <ul class="pagination justify-content-center">
      <% 
      System.out.println(startPage);
      if (startPage == 1) {%>
      <li class="page-item disabled"><a class="page-link" href="#"
          tabindex="-1" aria-disabled="true">이전</a></li>
      <% } else {%>
      <li class="page-item"><a class="page-link"
          href="accompany?page=<%=startPage - 1%>" tabindex="-1"
          aria-disabled="true">이전</a></li>
      <% }%>
      <% for (int i = startPage; i <= endPage; i++) {%>
      <li class="page-item">
      <a class="page-link" href="accompany?page=<%=i %>"><%=i%></a></li>
      <% }%>
      <%
          // 마지막 페이지 숫자와 startPage에서 pageLength 더해준 값이 일치할 때
          // (즉 마지막 페이지 블럭일 때)
          if (totalPages == endPage) {
      %>
      <li class="page-item disabled"><a class="page-link" href="#">다음</a></li>
      <% } else {%>
  	  <li class="page-item">
      	<a class="page-link" href="accompany?page=<%=endPage + 1%>">다음</a>
      </li>
      <% }%>
  </ul>
</nav>
</div>



</body>

<script>
const numberOfCards = parseInt(document.getElementById("listSize").textContent); // 원하는 카드의 갯수
const companionList = <%= request.getAttribute("json") %>;

const cardContainer = document.querySelector('.card-container');



// 반복문을 사용하여 원하는 갯수만큼 카드를 생성하여 페이지에 추가

for (let i = 0; i < numberOfCards && i < companionList.length; i++) {
  const cardTemplate = document.querySelector('.card-template');
  const newCard = cardTemplate.cloneNode(true); // 템플릿 복사

  // 원하는 정보를 동적으로 설정
  const companion = companionList[i];
  newCard.querySelector('.card-body-header h1').innerText = companion.title;
  newCard.querySelector('.card-body-hashtag').innerText = "#" + companion.concept1 + " #" + companion.concept2 + " #" + companion.concept3;
  newCard.querySelector('.card-body-nickname').innerText = '작성자: ' + companion.id;
  newCard.querySelector('.card-body-description').innerText = companion.content;
  newCard.querySelector('.reg_date').innerText = companion.start + " ~ " + companion.end;
  newCard.querySelector('.card-header-is_closed').innerText = companion.location;
  
  newCard.querySelector('.link').href = 'http://localhost:8080/TravelAndFindPartners/view?no=' + companion.no;
  
  // newCard.querySelector('.icon-view_count').innerText = companion.start;
  // newCard.querySelector('.icon-comments_count').innerText = companion.end;
  
const header = newCard.querySelector('.card-header')

//Function to convert Base64 to URL and set it as background image
function setBase64AsBackground(jsonData) {
	
    // Get the Base64 image string from the JSON object
    const base64Image = jsonData.image;
		console.log(base64Image);
		
    // Convert Base64 to Blob
    const byteCharacters = atob(base64Image);
    const byteArrays = [];
    for (let i = 0; i < byteCharacters.length; i++) {
        byteArrays.push(byteCharacters.charCodeAt(i));
    }
    console.log(byteArrays);
    
    const blob = new Blob([new Uint8Array(byteArrays)], { type: 'image/png' });
    console.log(blob);

    // Create URL from the Blob
    const imageUrl = URL.createObjectURL(blob);
    console.log(imageUrl);

    header.style.backgroundImage = `url(${imageUrl})`;
    
    // URL.revokeObjectURL(imageUrl);
	}


setBase64AsBackground(companion);
	
newCard.style.display = 'block'; // 보이도록 설정
cardContainer.appendChild(newCard);


}

	
</script>

</html>