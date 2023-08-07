<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- 저장된 헤더를 추가합니다 --%>
<%@ include file="/WEB-INF/view/layout/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 이름은 윤성용</title>

<script defer src="schedule3.js"></script>
<script defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAbBV-mR71MB1Oc8kwqjn0bcIG7BEFDGuE&callback=initMap">
	
</script>

</head>
<body>


	<div
		style="display: flex; margin-top: 20px; margin-left: 100px; margin-right: 100px;">
		<div id="map" style="height: 600px; width: 50%; margin-right: 20px;"></div>
		<div id="other" style="width: 50%;">
			<div>
				<div style="text-align: center; margin-bottom: 20px">
					<h4>??? 님의 여행일정</h4>
				</div>

				<input class="form-control" type="text" value="Disabled readonly input" aria-label="Disabled input example" disabled readonly; style="height: 50px;">
			
    <p>Destination: ${requestScope.destination}</p>
    <p>Start Date: ${requestScope.startDate}</p>
    <p>End Date: ${requestScope.endDate}</p>
				
			</div>

		</div>
	</div>




</body>

</html>


<%-- 저장된 푸터를 추가합니다 --%>
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>

<script>

</script>