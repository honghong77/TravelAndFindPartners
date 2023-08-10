<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%-- 달력, 날짜, 달력을 문자열로 변환 하기 위한 라이브러리입니다 --%>
<%@page import="java.util.Calendar"%>				
<%@page import="java.util.Date"%>					
<%@page import="java.text.SimpleDateFormat"%>

<%-- 저장된 헤더를 추가합니다 --%>
<%@ include file="/WEB-INF/view/layout/header.jsp"%>

<%-- 구글맵 API키를 불러옵니다--%>
<script defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAbBV-mR71MB1Oc8kwqjn0bcIG7BEFDGuE&callback=initMap"></script>

<%-- 메모 모달 기능을 사용하기 위한 부트스트랩 외부 라이브러리를 추가합니다 --%>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


<%-- 구글 지도를 화면에 띄우는 스크립트입니다 --%>
<script>
var map; // 전역 변수로 선언

function initMap() {
    map = new google.maps.Map(document.getElementById('map'), {
        center: {lat: 37.7749, lng: -122.4194}, // 초기 위치
        zoom: 10
    });
}

</script>

<script defer src="schedule/schedule3.js"></script>


<html>
<body>

<div class="row" style="margin-left: 100px; margin-right: 100px">
  
  	<%-- 왼쪽 화면(지도) div입니다 --%>
  	<div class="col-xl-6 ml-6">
    	<div id="map" class="p-4" style="height: 1500px; width: 100%; margin-right: 100px;"></div>
    </div>
    
    <%-- 오른쪽 화면(일정) div입니다 --%>
    <div class="col-md-6">
    	<div style="margin-bottom:20px">
	    	<div class="row justify-content-center">
				<div style="text-align: center; margin-bottom: 20px">
		          <h4>??? 님의 여행일정</h4>
		        </div>
		        
		        <div class="form-control mb-4" style="height: 50px; width: 400px;">
		          <i class="fa-solid fa-calendar-days fa-beat fa-xl" style="color: #005eff; margin-right: 60px;"></i> ${requestScope.startDate} ~ ${requestScope.endDate}
		        </div>
	      	</div>
		      	<i class="fa-solid fa-location-dot fa-beat fa-xl mr-4" style="color: #005eff; margin-right: 40px;"></i>${requestScope.destination}
      	</div>
      	
			<div style="max-height: 1330px; overflow-y: auto;">
			     	<c:forEach var="item" items="${resultList}" varStatus="status">
				      <div id="day${status.count}" class="dayItem" style="display: flex; justify-content: left; align-items: center; height: 200px; margin-top: 30px; margin-bottom: 30px;"> <!-- 여기에 마진 추가 -->
					        <div style="margin-top: 30px;">
					            <div style="margin-bottom: 50px; margin-top: 50px;">
				              		  <i class="fa-solid fa-plane fa-beat fa-xl" style="color: #1e00ff;"></i>
				              		  day${status.count} ${item}<br>
				             		  <%-- 장소 추가 버튼입니다 --%>
				             		  <a href="${pageContext.request.contextPath}/schedule2?id=day${status.count}">
				             	     		 <button type="button" class="btn btn-primary btn-lg" style="margin-right: 30px;">장소 추가</button>
				            		  </a>
				            		  <%-- 메모 추가 버튼입니다 --%>
				               		  <button type="button" class="btn btn-secondary btn-lg" data-toggle="modal" data-target="#memoModal" data-day="${status.count}">메모 추가</button>
				             			 	<div id="memoContent" style="margin-top: 10px;">
				             			 		<%-- 장소가 추가되는 텍스트입니다 --%>
				             			 		<div>
						              		  		<p id="memoText" style="max-height: 100px; overflow-y: auto; border: 1px solid #000;">장소 추가${status.count}</p>
												</div>
						              		  	<%-- 메모가 추가되는 텍스트입니다 --%>
						              		  	<div>
						                			<p id="memopowerman${status.count}" style="max-height: 100px; overflow-y: auto; border: 1px solid #000;">메모 작성하는 곳</p> <!-- 고유한 ID 지정 -->
								             	</div>
								             </div>
				          		 </div>
				             </div>
				       	 </div>
			      	 </c:forEach>
      			</div>
			      		<%-- 일정에 추가하기 버튼입니다(DB에 저장하는 버튼) --%>
		 <div style="display: flex; justify-content: center; align-items: center; height: 200px;">
				<button type="button" class="btn btn-primary btn-lg" onclick="saveSchedule()">일정에 추가하기</button>
		 </div>
    </div>
</div>
				
<%-- 메모 모달입니다 --%>
<div class="modal fade" id="memoModal" tabindex="-1" aria-labelledby="memoModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="memoModalLabel">메모 추가</h5>
        <button type="button" class="btn-close" data-dismiss="modal" aria-label="닫기"></button>
      </div>
      <div class="modal-body">
        <textarea id="memo" class="form-control" rows="4" placeholder="여기에 메모를 작성하세요."></textarea>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-primary" onclick="saveMemo()">저장</button>
      </div>
    </div>
  </div>
</div>

 <%-- 저장된 푸터를 추가합니다 --%>
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>

<%-- 메모를 추가하는 스크립트입니다 --%>
<script>
console.log("함수 실행");
// 메모 모달이 표시되면 현재 선택된 날짜를 저장
$('#memoModal').on('show.bs.modal', function(event) {
  var button = $(event.relatedTarget); // 메모 추가 버튼
  var day = button.data('day'); // data-day 값
  $(this).data('day', day); // 모달에 날짜 저장

  // 이전에 저장된 메모를 가져와서 텍스트 영역에 설정
  var savedMemo = $('#memopowerman' + day).text();
  $('#memo').val(savedMemo);
});

// 메모 저장 함수
function saveMemo() {
	console.log("함수 실행");
  var memo = $('#memo').val(); // 입력된 메모
  var day = $('#memoModal').data('day'); // 선택된 날짜
  $('#memopowerman' + day).text(memo); // 해당 날짜의 메모 텍스트 영역에 메모 저장
  $('#memoModal').modal('hide'); // 모달 닫기
	console.log("저장 완료");
}
</script>

						  
<%-- 메모를 DB에 저장하기위해 서블릿으로 보내는 스크립트입니다 --%>
<%-- DBSave 서블릿으로 이동합니다--%>
<script>
  function saveSchedule() {
    var memberId = "hi";
    var startDate = "${requestScope.startDate}";
    var endDate = "${requestScope.endDate}";
    var destination = "${requestScope.destination}";
    var latitude = "${requestScope.latitude}"; // 위도
    var longitude = "${requestScope.longitude}"; // 경도

    $.post('/TravelAndFindPartners/saveSchedule', {
      member_id: memberId,
      start_date: startDate,
      end_date: endDate,
      location: destination,
      lat: latitude, 
      lng: longitude
    }, function(response) {
      // 응답 처리 (예: 알림 표시)
      alert(response.message);
      window.location.href = '/TravelAndFindPartners/hello';
    });
   
  }
</script>
							
<%-- (미완성)메모를 DB에 저장하기위해 서블릿으로 보내는 스크립트입니다 --%>
<%-- DBSave2 서블릿으로 이동합니다--%>
<script>
		var locationDates = [];
		var locationNames = [];
		var memos = [];

		for (var i = 1; i <= totalDays; i++) {
		  locationDates.push(document.getElementById("day" + i).innerText);
		  locationNames.push(document.getElementById("memoText" + i).innerText);
		  memos.push(document.getElementById("memopowerman" + i).innerText);
		}

		$.post('/TravelAndFindPartners/saveScheduleDetails', {
		  locationDates: locationDates,
		  locationNames: locationNames,
		  memos: memos
		}, function(response) {
		  // 응답 처리
		});

	</script>

<%-- 세션 스토리지에서 저장된 값을 읽어 해당 요소의 텍스트 내용을 업데이트 하는 스크립트입니다 --%>  
<script>
var markers = {};

document.querySelectorAll(".dayItem").forEach(function(item) {
    // 세션 스토리지에서 선택한 결과를 가져옵니다.
    const selectedResultsJSON = sessionStorage.getItem(item.id);

    // 선택한 결과가 있으면 해당 요소에 설정합니다.
    if (selectedResultsJSON) {
        const selectedResults = JSON.parse(selectedResultsJSON);
        let content = "";

        // 장소, 위도, 경도 값을 하나씩 읽어서 content에 추가합니다.
        selectedResults.forEach(function(place) {
            content += "<span class='place-name' data-lat='" + place.latitude + "' data-lng='" + place.longitude + "'>" +
                       place.name + "</span>" +
                       "<span style='display: none;'>위도: " + place.latitude + ", 경도: " + place.longitude + "</span><br>";
        });

        const memoContent = document.querySelector("#" + item.id + " div div #memoContent p");
        memoContent.innerHTML = content;

        // 클릭 이벤트를 각 장소 텍스트에 추가합니다.
        memoContent.querySelectorAll(".place-name").forEach(function(placeElement, index) {
            placeElement.style.cursor = "pointer"; // 손가락 모양 커서 설정
            placeElement.addEventListener('click', function() {
                const latitude = parseFloat(this.dataset.lat);
                const longitude = parseFloat(this.dataset.lng);
                toggleMarker(latitude, longitude, index);
            });
        });
    }
});

function toggleMarker(latitude, longitude, index) {
    const location = { lat: latitude, lng: longitude };

    // 이미 마커가 있다면 제거합니다.
    if (markers[index]) {
        markers[index].setMap(null);
        delete markers[index];
        return;
    }

    // 새로운 마커를 생성하고 지도에 표시합니다.
    markers[index] = new google.maps.Marker({
        position: location,
        map: map
    });

    // 지도의 중심을 해당 위치로 변경합니다.
    map.setCenter(location);
}






</script>


<%-- 세션 스토리지에서 저장된 값을 읽어 해당 요소의 텍스트 내용을 업데이트 하는 스크립트입니다 --%> 
<script>
window.addEventListener('DOMContentLoaded', function(event) {
	  // "장소와 일정 추가" 부분에 저장된 주소를 표시합니다.
	  var memoContent = document.getElementById('memoContent');
	  var selectedAddress = sessionStorage.getItem('selectedAddress');

	  // 저장된 주소가 있으면 표시합니다.
	  if (selectedAddress) {
	    var paragraph = document.createElement('p');
	    paragraph.innerText = selectedAddress;
	    memoContent.appendChild(paragraph);
	  }
	});
</script>


<%-- 장소를 클릭했을 때 지도에 표시되게 하는 스크립트입니다 --%>
<script>
function showLocationOnMap(latitude, longitude) {
    const location = { lat: latitude, lng: longitude };

    // 지도의 중심을 해당 위치로 변경합니다.
    map.setCenter(location);

    // 마커를 생성하여 지도에 표시합니다.
    new google.maps.Marker({
        position: location,
        map: map
    });
}
</script>


</body>
</html>

