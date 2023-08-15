<%@page import="companionBoard.Companion2"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
<link href="companion-css/viewStyle.css" rel="stylesheet" type="text/css">
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
	
	<img src="" class="rounded mx-auto d-block" id="profile" alt="..." width="50px" height="50px">
	<div id="nickname" name="nickname">작성자</div>
	
	<div>
		<div id="location" name="location">지역</div>
		<div id="personnel" name="personnel">인원</div>
		<div id="date">날짜</div>
	</div>
	
	<p><span id="concept" style="border-bottom: 12px solid #dcf1fb; padding: 0 0 0 0.2em;">테스트트트트트트트트트</span></p>
	
	<div id="content">내용</div>	
	<div id="time">작성시간</div>
	
	<div id="addSchedule">
		<button type="button" class="btn btn-success" id="add">여행 일정 추가</button>
	</div>
	

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


<div class="reply-template" style="display: none;">
  <br>
	<td>
	  <div class="box" style="background: WHITE";>
	    <img class="profile" src="" alt="" width="50" height="50">
	  </div>
	</td>

	<td>
	  <b>
	  	<div class="reply-nickname">
	  	닉네임
	  	</div>
	  </b>
	</td>

	<td>
	  <div class="reply-time">
	  	작성시간
	  </div>
	</td>
	
	<br>
	<tr class="reply-deatil-content">
	<td colspan="3">
	  <div class="reply-content">
	  	내용
	  </div>
	</td>
	</tr>
	<br>
	
  	<td style="color: gray;">
	  <button class="update-reply-btn" id="reply-update" data-index="" >수정</button>
	  <button class="delete-reply-btn" id="reply-delete" data-index="" >삭제</button>
	</td>
	
	<div class="update-form-group" style="width: 80%;">
	<label for="update-usr"></label>
	<input type="hidden" class="pk-number">
	<input type="text" class="update-form-control" id="update-usr" placeholder="댓글을 남겨주세요 :) " style="height: 30px;">
	<button class="update-save-btn" id="update-save-btn">등록</button>
	</div>
</div>



<script>

window.onload = selectReplyList();

const replyBtn = document.getElementById("reply-bnt");
replyBtn.addEventListener("click", function() {

    const content = document.getElementById("usr").value;
    const user = "<%= loginUser %>";
    console.log(typeof user);
    console.log("로그인 유저" +  user);
    
   	if ("<%= loginUser %>" === "null") {
   		alert("로그인 해주세요");
   	} else {
   		if (content.trim() === "") {
   	    	alert("댓글을 입력해주세요");
   	    }  else {
   	    	const boardNo = "<%= no%>";
   	        

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
   	            const msg = (parseInt(result) !== 0) ? "댓글 등록 되었습니다." : "댓글 등록 실패하였습니다.";
   	            alert(msg);
   	    		
   	            selectReplyList();
   	            document.getElementById("usr").value = "";
   	        });
   	    }
   	}
    
    
});


function selectReplyList() {
	 const boardNo = "<%= no%>";
	 const reply = {
		boardNo: boardNo
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
			 const replyContainer = document.getElementById('reply-list-area');
			 replyContainer.innerHTML = '';
		 for (let i = 0; i < list.length; i++) {
			 const replyTemplate = document.querySelector('.reply-template');
			 const template = replyTemplate.cloneNode(true); // 템플릿 복사

			 // 원하는 정보를 동적으로 설정
			 const reply = list[i];
			 template.querySelector('.reply-nickname').innerText = reply.nickname;
			 template.querySelector('.reply-time').innerText = reply.time;
			 template.querySelector('.reply-content').innerText = reply.content;
			 template.querySelector('.pk-number').value = reply.pk;
			 
			 
			 const profileFrame = template.querySelector('.profile');
				
			 function setBase64AsProfile(jsonData) {
				
			    const base64Image = jsonData.profile;
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

			    profileFrame.src = imageUrl;
			    
			    // URL.revokeObjectURL(imageUrl);
				}

			 setBase64AsProfile(reply);
			 
			 template.querySelector('.pk-number').index = i;
			 template.querySelector('.update-form-control').index = i;
			 
			 const updateSaveButton = template.querySelector('.update-save-btn');
			 updateSaveButton.index = i;
			 updateSaveButton.addEventListener('click', update_save_click);
			 
			 const updateButton = template.querySelector('.update-reply-btn');
			 updateButton.index = i;
			 updateButton.addEventListener('click', update_click);

			 const deleteButton = template.querySelector('.delete-reply-btn');
			 deleteButton.index = i;
			 deleteButton.addEventListener('click', delete_click);
			 
			 const updateFormGroup = template.querySelector('.update-form-group');
			 updateFormGroup.index = i;
			 
			 const id = reply.id;
			 console.log("댓글 입력 아이디" + id);
			 console.log("로그인 : <%= loginUser %>");
			 console.log(id === "<%= loginUser %>");
			 console.log(id !== "<%= loginUser %>");
			 console.log(String(id) === "<%= loginUser %>"); // 데이터 형식을 맞춘 비교
			 console.log(String(id) !== "<%= loginUser %>"); // 데이터 형식을 맞춘 비교

			 
			 if (id !== "<%= loginUser %>") {
				 console.log("버튼 안보이게 할거임")
				 updateButton.style.display = 'none';
				 deleteButton.style.display = 'none';
			 } else {
				 console.log("버튼아 보여라");
				 updateButton.style.display = '';
				 deleteButton.style.display = '';
			 }
			 
			 template.querySelector('.update-form-group').style.display = 'none';
			 template.style.display = 'block'; // 보이도록 설정
			 replyContainer.appendChild(template);
			}

	      
	    });
	}
	
function update_click(event) {
	  console.log("수정");
	  const index = event.target.index;
	  console.log(index);
	  const updateFormGroups = document.querySelectorAll('.update-form-group');
	  updateFormGroups[index].style.display = 'block';
	}
	
function update_save_click(event) {
	
	console.log("저장");
	const index = event.target.index;
	console.log(index);
	
	const boardNo = "<%= no%>";
	
	const contents = document.querySelectorAll('.update-form-control');
	const content = contents[index].value;
	console.log(content);
	
	const pks = document.querySelectorAll('.pk-number');
	const pk = pks[index].value;
	console.log(pk);
	
	if (content.trim() === "") {
    	alert("댓글을 입력해주세요");
    }  else {

        const reply = {
            content: content,
            pk: pk,
            boardNo: boardNo
        }

        console.log(reply);

        fetch("replyupdate", {
            method: "post",
            body: JSON.stringify(reply),
            headers: {
                "Content-Type": "application/json"
            }
        }).then(response => response.text())
        .then(result => {
            const msg = (parseInt(result) === 1) ? "댓글 수정 되었습니다." : "댓글 수정 실패하였습니다.";
            alert(msg);
    		
            selectReplyList();

        });
    }
}

function delete_click() {
	console.log("삭제");
	const index = event.target.index;
	console.log(index);
	
	const boardNo = "<%= no%>";
	
	const pks = document.querySelectorAll('.pk-number');
	const pk = pks[index].value;
	console.log(pk);
	
	const reply = {
            pk: pk,
            boardNo: boardNo
        }

        console.log(reply);

        fetch("replydelete", {
            method: "post",
            body: JSON.stringify(reply),
            headers: {
                "Content-Type": "application/json"
            }
        }).then(response => response.text())
        .then(result => {
            const msg = (parseInt(result) === 1) ? "댓글 삭제 되었습니다." : "댓글 삭제 실패하였습니다.";
            alert(msg);
    		
            selectReplyList();
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

<div class="modal fade" id="addModal" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">여행 일정 추가</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" id="travelContainer">
        <p>여행 일정을 선택해주세요</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary" id="addBtn">추가</button>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="noModal" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">여행 일정 추가</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <p>여행 일정이 없습니다. 여행 일정을 만들어주세요!</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
        <a href="schedule3" class="btn btn-primary">만들기</a>
        </form>
      </div>
    </div>
  </div>
</div>

<script>

const jsonList = <%= request.getAttribute("json") %>;
const travelId = jsonList[0].travelId;
console.log("트래벌 넘버" + travelId);

const idChecks = <%= request.getAttribute("idCheck")%>
const add = document.getElementById("add");

if (travelId !== null && travelId !== "0") {
	window.onload = makeLinkBtn(travelId);	
} else {
	if (idChecks === false) {
		add.style.display = "none";
	}
}


const travelList = <%= request.getAttribute("travelJson") %>;

$(document).ready(function(){
    $("#delete").click(function(){
        $("#myModal").modal("show");
    });
});


$(document).ready(function(){
    $("#add").click(function(){
    	if (travelList.length !== 0) {
        	$("#addModal").modal("show");
    	} else {
    		$("#noModal").modal("show");
    	}
    });
});




const travelContainer = document.getElementById("travelContainer");
travelContainer.innerHTML = "";

for (i = 0; i < travelList.length; i++) {
	createRadioButton(travelList[i].no, travelList[i].title, i === 0);
	
}


function createRadioButton(value, label, check) {
	  const radioLabel = document.createElement('label');
	  const radioInput = document.createElement('input');
	  radioInput.type = 'radio';
	  radioInput.name = 'travelType';
	  radioInput.value = value;
	  radioInput.checked = check; 
	  radioLabel.appendChild(radioInput);
	  radioLabel.appendChild(document.createTextNode(label));
	  radioLabel.style.display = "block";
	  radioLabel.style.marginBottom = '20px';
	  travelContainer.appendChild(radioLabel);
}


const addBtn = document.getElementById("addBtn");

addBtn.addEventListener("click", function(event) {
	$("#addModal").modal("hide");
	

    console.log("추가");
    const radioButtons = document.getElementsByName("travelType");

    let selectedValue;
    for (const radioButton of radioButtons) {
        if (radioButton.checked) {
            selectedValue = radioButton.value;
            break;
        }
    }
    console.log(selectedValue);
    
	const boardNo = "<%= no%>";
    
    const travel = {
	    boardNo: boardNo,
    	travel_id: selectedValue
	};

	console.log(travel);

	fetch("choicetravel", {
		method: "post",
		body: JSON.stringify(travel),
		headers: {
		"Content-Type": "application/json"
		}
	}).then(response => response.text())
	.then(result => {
		if (parseInt(result) !== 0) {
			makeLinkBtn(selectedValue);
		} else {
			alert("일정 추가 실패하였습니다.")
		}
	 });
	 
}); 


function makeLinkBtn(travelId) {
    console.log("링크 " + travelId);

    if (travelId !== null) {
        var linkBtn = document.createElement("a");

        linkBtn.href = "/schedule3?travelId=" + travelId;
        linkBtn.className = "btn btn-warning";
        linkBtn.textContent = "여행 일정 보기";

        var deleteBtn = document.createElement("button");

        deleteBtn.type = "button";
        deleteBtn.className = "btn btn-light";
        deleteBtn.textContent = "일정 삭제";

        const add = document.getElementById("add");

        add.style.display = "none";
        add.parentNode.insertBefore(deleteBtn, add.nextSibling);
        add.parentNode.insertBefore(linkBtn, add.nextSibling);
        
        const idCheck = <%= request.getAttribute("idCheck")%>

        if (idCheck === false) {
        	 deleteBtn.style.display= "none";
        }

        deleteBtn.addEventListener("click", function(event) {
            
        	const boardNo = "<%= no%>";

            fetch("choicetravel?boardNo=" + boardNo, {
                method: "get",
                headers: {
                    "Content-Type": "text/plain"
                }
            }).then(response => response.text())
            .then(result => {
                if (parseInt(result) !== 0) {
                    add.style.display = "";
                    linkBtn.style.display = "none";
                    deleteBtn.style.display = "none";
                    console.log("삭제");
                } else {
                    alert("일정 삭제 실패하였습니다.");
                }
            });
        });
    }
}




</script>

<%@ include file="/WEB-INF/view/layout/footer.jsp"%>

</body>

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
document.getElementById("nickname").innerText = companion.nickname;
document.getElementById("date").innerText = companion.start + " ~ " + companion.end;
document.getElementById("location").innerText = companion.location;
document.getElementById("personnel").innerText = companion.personnel;
document.getElementById("time").innerText = companion.time;


const idCheck = <%= request.getAttribute("idCheck")%>

if (idCheck === false) {
	 $("#view_button").hide()

}


//프로필
const profileFrame = document.getElementById("profile");

const profileBase64Image = companion.profile;
		console.log(profileBase64Image);
		
const profileByteCharacters = atob(profileBase64Image);
const profileByteArrays = [];
for (let i = 0; i < profileByteCharacters.length; i++) {
	  profileByteArrays.push(profileByteCharacters.charCodeAt(i));
}
console.log(profileByteArrays);

const profileBlob = new Blob([new Uint8Array(profileByteArrays)], { type: 'image/png' });
console.log(profileBlob);

const profileUrl = URL.createObjectURL(profileBlob);
console.log(profileUrl);

profileFrame.src = profileUrl;

</script>
</html>