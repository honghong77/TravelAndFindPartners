<%@page import="java.util.Calendar"%>				
<%@page import="java.util.Date"%>					
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

							
  
							<%-- 저장된 헤더를 추가합니다 --%>
							<%@ include file="/WEB-INF/view/layout/header.jsp"%>
							
							<%-- 메모 부트스트랩 추가입니다 --%>
							<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
							<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
							<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<html lang="ko">			
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
							<%-- 저장된 헤더를 추가합니다 --%>
							<script defer src="schedule/schedule3.js"></script>
							<%-- 구글맵 API키를 불러옵니다--%>
							<script defer
								src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAbBV-mR71MB1Oc8kwqjn0bcIG7BEFDGuE&callback=initMap">
							</script>

</head>
<body>


 
</head>
<body>
  <div class="row" style="margin-left: 100px; margin-right: 100px">
    <div class="col-xl-6 ml-6">
        <div id="map" class="p-4" style="height: 1500px; width: 100%; margin-right: 100px;"></div>
    </div>
    <div class="col-md-6">
      <div class="row justify-content-center">
      
        <div style="text-align: center; margin-bottom: 20px">
          <h4>??? 님의 여행일정</h4>
        </div>
        
        <div class="form-control mb-4" style="height: 50px; width: 400px;">
          <i class="fa-solid fa-calendar-days fa-beat fa-xl" style="color: #005eff; margin-right: 60px;"></i> ${requestScope.startDate} ~ ${requestScope.endDate}
        </div>
        
      </div>
      
      
      <i class="fa-solid fa-location-dot fa-beat fa-xl mr-4" style="color: #005eff; margin-right: 40px;"></i>${requestScope.destination}
      <c:forEach var="item" items="${resultList}" varStatus="status">
        <div  id="day${status.count}" class="dayItem" style="display: flex; justify-content: center; align-items: center; height: 10vh;">
          <div style="margin-top: 30px;">
            <div style="margin-bottom: 10px;">
              <i class="fa-solid fa-plane fa-beat fa-xl" style="color: #1e00ff;"></i>
              day${status.count} ${item}<br>
              <a href="${pageContext.request.contextPath}/schedule2?id=day${status.count}">
                <button type="button" class="btn btn-primary btn-lg" style="margin-right: 30px;">장소 추가</button>
              </a>
                <button type="button" class="btn btn-secondary btn-lg" data-toggle="modal" data-target="#memoModal" data-day="${status.count}">메모 추가</button>
             
             				
				              
				              <div id="memoContent" style="margin-top: 10px;">
		              			<%-- 장소를 추가합니다--%>
		              		  	<p id="memoText">장소 추가${status.count}</p>
		                
				                <%-- 메모를 추가합니다 --%>
				                 <p id="memopowerman${status.count}">안녕하세용</p> <!-- 고유한 ID 지정 -->
				              </div>
            </div>
          </div>
        </div>
      </c:forEach>
      
			      		<%-- DB에 모든 정보를 저장하는 버튼입니다 --%>
			    	 	<div style="display: flex; justify-content: center; align-items: center; height: 200px;">
					 		<button type="button" class="btn btn-primary btn-lg" onclick="saveSchedule()">일정에 추가하기</button>
					 		
						</div>

    </div>
  </div>
				
						  <%-- 메모를 추가하는 모달입니다 --%>
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
						//메모 모달이 표시되면 현재 선택된 날짜를 저장
						  $('#memoModal').on('show.bs.modal', function(event) {
						    var button = $(event.relatedTarget); // 메모 추가 버튼
						    var day = button.data('day'); // data-day 값
						    $(this).data('day', day); // 모달에 날짜 저장
						  });
						
						  // 메모 저장 함수
						  function saveMemo() {
						    var memo = $('#memo').val(); // 입력된 메모
						    var day = $('#memoModal').data('day'); // 선택된 날짜
						    $('#memopowerman' + day).text(memo); // 해당 날짜의 메모 텍스트 영역에 메모 저장
						    $('#memoModal').modal('hide'); // 모달 닫기
						  }
						  </script>
						  
						  
						  <%-- 메모를 DB에 저장하기위해 서블릿으로 보내는 코드입니다 --%>
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
							
							<%-- (미완성)메모를 DB에 저장하기위해 서블릿으로 보내는 코드입니다 --%>
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

						  

  
</body>

</html>
							<%-- 세션을 모두 삭제합니다 --%>
							<script>
							sessionStorage.clear();
							</script>
