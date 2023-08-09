<%@page import="companionBoard.Companion2"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="viewStyle.css" rel="stylesheet" type="text/css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<title>Insert title here</title>
</head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<%@ include file="/WEB-INF/view/layout/header.jsp"%>
<body>
<%
	List<Companion2> companionList = (List<Companion2>) request.getAttribute("list");
	Companion2 companion = companionList.get(0);
	int no = companion.getNo();
	System.out.println(no);
	
	request.setAttribute("json", request.getAttribute("json"));
%>

<div>
<img src="trip.jpg" class="rounded mx-auto d-block" id="image" alt="...">
</div>

<form action="update" method="POST" id="update">
<div class="main">
	<div id="title" name="title">제목</div>
	
	<div id="id" name="id">작성자</div>
	
	<div>
		<div id="location" name="location">지역</div>
		<div id="personnel" name="personnel">인원</div>
		<div id="date">날짜</div>
	</div>
	
	<p><span id="concept" style="border-bottom: 12px solid #dcf1fb; padding: 0 0 0 0.2em;">테스트트트트트트트트트</span></p>
	
	<div id="content">내용</div>	
	

	<div id="view_button">
		<input type="hidden" id="no" name="no" value="<%= no %>">
		<input class="btn btn-primary" type="submit" value="수정하기" id="update">
		<button type="button" class="btn btn-light" id="delete">삭제하기</button>
	</div>
</div>
</form>	

<div class="modal" id="myModal" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">확인</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <p>삭제하시겠습니까?</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
        <form action="delete" method="POST">
        <input type="hidden" id="no" name="no" value="<%= no %>">
        <button type="submit" class="btn btn-primary">삭제</button>
        </form>
      </div>
    </div>
  </div>
</div>

<script>
$(document).ready(function(){
    $("#delete").click(function(){
        $("#myModal").modal("show"); // 모달을 보이도록 변경
    });
});
</script>






<div id="disqus_thread"></div>
<script>
    /**
    *  RECOMMENDED CONFIGURATION VARIABLES: EDIT AND UNCOMMENT THE SECTION BELOW TO INSERT DYNAMIC VALUES FROM YOUR PLATFORM OR CMS.
    *  LEARN WHY DEFINING THESE VARIABLES IS IMPORTANT: https://disqus.com/admin/universalcode/#configuration-variables    */
    /*
    var disqus_config = function () {
    this.page.url = PAGE_URL;  // Replace PAGE_URL with your page's canonical URL variable
    this.page.identifier = PAGE_IDENTIFIER; // Replace PAGE_IDENTIFIER with your page's unique identifier variable
    };
    */
    (function() { // DON'T EDIT BELOW THIS LINE
    var d = document, s = d.createElement('script');
    s.src = 'https://trip-with.disqus.com/embed.js';
    s.setAttribute('data-timestamp', +new Date());
    (d.head || d.body).appendChild(s);
    })();
</script>
<noscript>Please enable JavaScript to view the <a href="https://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>


</body>
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>

<script>
const companionList = <%= request.getAttribute("json") %>;
const companion = companionList[0];
const frame = document.getElementById("image");

  const base64Image = companion.image;
		console.log(base64Image);
		
  const byteCharacters = atob(base64Image);
  const byteArrays = [];
  for (let i = 0; i < byteCharacters.length; i++) {
      byteArrays.push(byteCharacters.charCodeAt(i));
  }
  console.log(byteArrays);
  
  const blob = new Blob([new Uint8Array(byteArrays)], { type: 'image/png' });
  console.log(blob);

  const imageUrl = URL.createObjectURL(blob);
  console.log(imageUrl);

  frame.src = imageUrl;
  
  // URL.revokeObjectURL(imageUrl);
  

const concept1 = companion.concept1;
const concept2 = companion.concept2;
const concept3 = companion.concept3;
console.log(concept1);
console.log(concept2);
console.log(concept3);


if (concept1) {
	c = '#' + concept1;
} 

if (concept2) {
	c = c + ' # ' + concept2;
} 

if (concept3) {
	c = c + ' # ' + concept3;
} 


document.getElementById("concept").innerText = c;
document.getElementById("title").innerText= companion.title;
document.getElementById("content").innerText = companion.content;
document.getElementById("id").innerText = companion.id;
document.getElementById("date").innerText = companion.start + " ~ " + companion.end;
document.getElementById("location").innerText = companion.location;
document.getElementById("personnel").innerText = companion.personnel;

const idCheck = <%= request.getAttribute("idCheck")%>

if (idCheck === false) {
	 $("#delete").hide()
	 $("#update").hide()
}


</script>
</html>