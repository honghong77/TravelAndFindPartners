<%@page import="companionBoard.Companion2"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
<link href="viewStyle.css" rel="stylesheet" type="text/css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<title>Insert title here</title>
</head>
<%@ include file="/WEB-INF/view/layout/header.jsp"%>

<body>
<%
	// 이게 맞나
	session = request.getSession(false); 
	String loginUser = (String) session.getAttribute("id");

	List<Companion2> companionList = (List<Companion2>) request.getAttribute("list");
	Companion2 companion = companionList.get(0);
	int no = companion.getNo();
	String id = companion.getId();
	
	request.setAttribute("json", request.getAttribute("json"));
%>

<div>
<img src="" class="rounded mx-auto d-block" id="image" alt="trip.jpg">
</div>

<form action="update" method="POST" id="update">
<div class="main">
	<div id="title" name="title">제목</div>
	<input type="hidden" id="paramId" name="paramId" value="<%= id %>">
	
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




<div class="form-group" style="width: 80%;">
<label for="usr"></label>
<input type="text" class="form-control" id="usr" placeholder="댓글을 남겨주세요 :) " style="height: 30px;">
<button class="btn btn-sm btn-success" id="reply-bnt">등록</button>
</div>

<div id="reply-list-area"> 
<!--댓글 한개의 div 영역 --> 
<div class="reply-detail" align="center" id="reply-content-area"> 
<table style="width: 500px;"> 
<tbody> 			 
</tbody> 
</table> 
</div> 
</div>




<script>

window.onload = selectReplyList();

const replyBtn = document.getElementById("reply-bnt");
replyBtn.addEventListener("click", function() {

    const content = document.getElementById("usr").value;
    
    if (content.trim() === "") {
        alert("댓글을 입력해주세요");
    } else {
    	const boardNo = "<%= no%>";
        const user = "<%= loginUser %>";

        const reply = {
            content: content,
            boardNo: boardNo,
            user: user
        };

        console.log(reply);

        fetch("reply", {
            method: "post",
            body: JSON.stringify(reply),
            headers: {
                "Content-Type": "application/json"
            }
        }).then(response => response.text())
        .then(result => {
            const msg = (parseInt(result) !== 0) ? "댓글이 등록 되었습니다." : "댓글 등록 실패..!";
            alert(msg);
    		
            selectReplyList();
            document.getElementById("usr").value = "";
        });
    }
});


function selectReplyList() {
	 const boardNo = "<%= no%>";
	 const reply = {
		boardNo: boardNo,
	 }; 
	 
	 fetch("replyview", {
	    method: "post",
	    body: JSON.stringify(reply),
	    headers: {
	      "Content-Type": "application/json"
	    }
	 })
	 .then(response => response.json())
	 .then(list => {
		 console.log(list);
	    var result = "";

	    for (var i in list) {
	    	const base64Image = list[i].image;
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
	    	
	        result +=
	          "<br>" +
	          "<td>" +
	          "<div class='box' style='background: WHITE;'>" +
	          "<img class='profile' src='" + imageUrl + "'width='50' height='50'>" +
	          "</div>" +
	          "</td>" +
	          "<td>" +
	          "<b>" +
	          list[i].id +
	          "</b>" +
	          "</td>" +
	          "<td>" +
	          list[i].time +
	          "</td>" +
	          "<td style='color: gray;'>" +
	          "<button class='edit-reply-btn' data-index='" + i + "'>수정</button>" +
	          "<button class='delete-reply-btn' data-index='" + i + "'>삭제</button>" +
	          "</td>" +
	          "<br>" +
	          "<tr class='reply-deatil-content'>" +
	          "<td colspan='3'>" +
	          list[i].content +
	          "</td>" +
	          "</tr>" +
	          "<br>";
	      }

	      document.querySelector("#reply-content-area tbody").innerHTML = result;
	    });
	}
</script>




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

</body>
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>

<script>
const companionList = <%= request.getAttribute("json") %>;

console.log(companionList);

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
	 $("#view_button").hide()

}

</script>
</html>