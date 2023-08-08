<%@page import="java.util.Calendar"%>				
<%@page import="java.util.Date"%>					
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
							<%-- 저장된 헤더를 추가합니다 --%>
							<%@ include file="/WEB-INF/view/layout/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 이름은 윤성용</title>
							<%-- 저장된 헤더를 추가합니다 --%>
							<script defer src="schedule/schedule3.js"></script>
<script defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAbBV-mR71MB1Oc8kwqjn0bcIG7BEFDGuE&callback=initMap">
	
</script>

</head>
<body>

<div class="row">
	<div class="col-xl-6 ml-6">
		<div id="map" class="p-4" style="height: 600px; width: 100%; margin-right: 100px;"></div>
	</div>
	<div class="col-md-6">
		<div class="row justify-content-center">
			<div style="text-align: center; margin-bottom: 20px">
				<h4>??? 님의 여행일정</h4>
			</div>
			<div class="form-control mb-4"  style="height: 50px; width: 400px;"><i class="fa-solid fa-calendar-days fa-beat fa-xl" style="color: #005eff;     margin-right: 60px;"></i> ${requestScope.startDate} ~ ${requestScope.endDate}</div>
		</div>
	<i class="fa-solid fa-location-dot fa-beat fa-xl mr-4" style="color: #005eff; margin-right: 40px;"></i>${requestScope.destination}
	
	<c:forEach var="item" items="${resultList}" varStatus="status">
    	<div style="margin-top: 30px;">
			day${status.count} ${item}<br>
			<button type="button" class="btn btn-primary btn-lg">Large button</button>
			<button type="button" class="btn btn-secondary btn-lg">Large button</button>
   		</div>
	</c:forEach>



</div>

<%-- 	<div style="display: flex; margin-top: 20px; margin-left: 100px; margin-right: 100px;">
		<div id="map" style="height: 600px; width: 50%; margin-right: 100px;"></div>
		<div id="other" class="d-flex justify-content-center" style="width: 50%;">
			<div>
				<div style="text-align: center; margin-bottom: 20px">
					<h4>??? 님의 여행일정</h4>
				</div>

				<input class="form-control mb-4" type="text" value="${requestScope.startDate} ~ ${requestScope.endDate}" aria-label="Disabled input example" disabled readonly style="height: 50px; width: 400px; text-align: center;">
			
    		<div>${requestScope.destination} </div>
				
			</div>
		</div>
	</div> --%>





</body>

</html>


<%-- 저장된 푸터를 추가합니다 --%>
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>

<script>

</script>