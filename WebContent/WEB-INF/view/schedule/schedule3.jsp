<%@page import="java.util.Calendar"%>				
<%@page import="java.util.Date"%>					
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/js/bootstrap.min.js"></script>
							<%-- 저장된 헤더를 추가합니다 --%>
							<%@ include file="/WEB-INF/view/layout/header.jsp"%>
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
        <div style="display: flex; justify-content: center; align-items: center; height: 10vh;">
          <div style="margin-top: 30px;">
            <div style="margin-bottom: 10px;">
              <i class="fa-solid fa-plane fa-beat fa-xl" style="color: #1e00ff;"></i>
              day${status.count} ${item}<br>
              <a href="/TravelAndFindPartners/schedule2">
                <button type="button" class="btn btn-primary btn-lg" style="margin-right: 30px;">장소 추가</button>
              </a>
              <button type="button" class="btn btn-secondary btn-lg" data-toggle="modal" data-target="#memoModal">메모 추가</button>
              <div id="memoContent" style="margin-top: 10px;">
                <p id="memoText">장소와 일정 추가</p>
              </div>
            </div>
          </div>
        </div>
      </c:forEach>
    </div>
  </div>

  <!-- 메모 추가 모달 -->
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

  <script>
    function saveMemo() {
      var memo = document.getElementById("memo").value;
      console.log('메모:', memo);
      document.getElementById("memoText").innerText = memo;
      var memoModal = new bootstrap.Modal(document.getElementById('memoModal'));
      memoModal.hide();
    }
  </script>
  

  
</body>

</html>

