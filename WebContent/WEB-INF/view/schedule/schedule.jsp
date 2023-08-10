<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%-- DBUtil을 사용하기 위해 임포트합니다 --%>
<%@ page import="java.sql.*"%>
<%@ page import="dbutil.DBUtil"%>

<%-- 지역별 검색 버튼 클릭시 모달이 나타나도록 해주는 부트스트랩 외부 라이브러리입니다 --%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<%-- 저장된 헤더를 추가합니다 --%>
<%@ include file="/WEB-INF/view/layout/header.jsp"%>


<%-- 날짜 선택하는 기능을 사용하기 위한 부트스트랩 외부 라이브러리입니다--%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.min.css">




<div class="container">
	<div class="row">
	
		<div class="col-md-6">
			<div class="input-group mb-3">
				<input id=searchInput type="text" class="form-control" placeholder="검색어를 입력하세요" aria-label="Recipient's username" aria-describedby="button-addon2">
				<button class="btn btn-outline-secondary" type="button" id="button-addon2">검색</button>
			</div>
		</div>
		
		<div class="col-md-6 d-flex justify-content-end">
			<button id="HongButton" class="btn btn-primary mb-4" type="button" data-bs-toggle="modal" data-bs-target="#dateModal">기간 조회</button>
			<button id="regionSearchButton" class="btn btn-primary mb-4" type="button" data-bs-toggle="modal" data-bs-target="#regionModal">지역별 검색</button>

		</div>
		
	</div>
	
	<div id="location-list-div" style="display: none">
		<ol class="list-group list-group-numbered" id="location-list">
</ol>
	</div>
	
	
	

<%-- 지역별 검색 모달입니다 --%>
<div class="modal fade" id="regionModal" tabindex="-1" aria-labelledby="regionModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="regionModalLabel">지역별 검색</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <select class="form-select" id="regionSelect">
            <option selected>지역 선택</option>
            <option value="서울">서울특별시</option>
			<option value="부산">부산광역시</option>
			<option value="인천">인천광역시</option>
			<option value="대구">대구광역시</option>
			<option value="광주">광주광역시</option>
			<option value="대전">대전광역시</option>
			<option value="울산">울산광역시</option>
			<option value="세종">세종특별자치시</option>
			<option value="경기">경기도</option>
			<option value="강원">강원도</option>
			<option value="충북">충청북도</option>
			<option value="충남">충청남도</option>
			<option value="전북">전라북도</option>
			<option value="전남">전라남도</option>
			<option value="경북">경상북도</option>
			<option value="경남">경상남도</option>
			<option value="제주">제주특별자치도</option>
        </select>
      </div>
     <div class="modal-footer">
	  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
	  <button type="button" class="btn btn-primary" data-bs-dismiss="modal">검색</button> <!-- data-bs-dismiss 추가 -->
	</div>

    </div>
  </div>
</div>

<%-- 지역별 검색 모달에서 지역 선택시 버튼의 텍스트에 해당 지역이 나오게 하는 스크립트입니다 --%>
<script>
document.addEventListener('DOMContentLoaded', function() { // 페이지가 완전히 로드된 후에 코드 실행
  document.querySelector('#regionModal .modal-footer .btn.btn-primary').addEventListener('click', function () {
    const selectedRegion = document.getElementById('regionSelect').value;
    if (selectedRegion !== '지역 선택') {
      const regionText = document.getElementById('regionSelect').options[document.getElementById('regionSelect').selectedIndex].text;
      document.getElementById('regionSearchButton').innerText = regionText;
    }
    // regionModal.hide(); 부분 제거
  });
});
</script>





	<%-- 일정게시판의 동적 페이지 넘기기 DB 기능입니다 --%>
	<%
		String pageStr = request.getParameter("page");
	int currentPage = (pageStr == null || pageStr.equals("")) ? 1 : Integer.parseInt(pageStr);
	%>

	<%
		Connection conn = DBUtil.getConnection();
	Statement st = null;
	ResultSet rs = null;

	int recordsPerPage = 9;
	int offset = (currentPage - 1) * recordsPerPage;
	String sql = "SELECT * FROM scheduleboard LIMIT " + recordsPerPage + " OFFSET " + offset;
	st = conn.createStatement();
	rs = st.executeQuery(sql);

	int totalRecords = 0;
	Statement countSt = conn.createStatement();
	try {
		String countSql = "SELECT COUNT(*) FROM scheduleboard";
		ResultSet countRs = countSt.executeQuery(countSql);
		if (countRs.next()) {
			totalRecords = countRs.getInt(1);
		}
		countRs.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
	countSt.close();
	%>


	<%-- 일정게시판의 카드 틀입니다 --%>
	<div class="row row-cols-1 row-cols-md-3 g-4">
		<%
			while (rs.next()) {
		%>
		<div class="col">
			<div class="card h-100">
				<iframe id="mapView" frameborder="0"
					style="border: 0; width: 100%; height: 100%;"
					src="https://www.google.com/maps/embed/v1/place?key=AIzaSyAbBV-mR71MB1Oc8kwqjn0bcIG7BEFDGuE&q=<%=rs.getString("location")%>&center=<%=rs.getDouble("wido")%>,<%=rs.getDouble("gyeongdo")%>"
					allowfullscreen> </iframe>

				<div class="card-body">
					<h5 class="card-title"><%=rs.getString("location")%></h5>
					<p class="card-text"><%=rs.getString("memo")%></p>
					<p class="card-text">
						<small class="text-muted"></small>
					</p>
					<a href="#" class="btn btn-primary">일정 상세보기</a>

				</div>
				<div class="card-footer">
					<small class="text-body-secondary"><%=rs.getString("startwhen")%>부터
						<%=rs.getString("endwhen")%>까지</small>
				</div>
			</div>
		</div>
		<%
			}
		%>
	</div>

	<%
		DBUtil.close(conn);
	DBUtil.close(rs);
	DBUtil.close(st);
	%>





	<%-- 일정게시판의 동적 페이지 넘기기 기능입니다 --%>
	<nav aria-label="...">
		<ul class="pagination"
			style="justify-content: center; margin-top: 50px;">
			<li class="page-item <%=currentPage == 1 ? "disabled" : ""%>">
				<a class="page-link"
				href="<%=currentPage == 1 ? "#" : "?page=" + (currentPage - 1)%>">Previous</a>
			</li>
			<%
				for (int i = 1; i <= (totalRecords + recordsPerPage - 1) / recordsPerPage; i++) {
				if (i == currentPage) {
			%>
			<li class="page-item active" aria-current="page"><a
				class="page-link" href="#"><%=i%></a></li>
			<%
				} else {
			%>
			<li class="page-item"><a class="page-link" href="?page=<%=i%>"><%=i%></a>
			</li>
			<%
				}
			}
			%>
			<li
				class="page-item <%=currentPage == (totalRecords + recordsPerPage - 1) / recordsPerPage ? "disabled" : ""%>">
				<a class="page-link"
				href="<%=currentPage == (totalRecords + recordsPerPage - 1) / recordsPerPage ? "#" : "?page=" + (currentPage + 1)%>">Next</a>
			</li>
		</ul>
	</nav>
</div>

<%-- 저장된 푸터를 추가합니다 --%>
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>
<%-- 저장된 "schedule.js"을 불러옵니다 --%>
<script src="schedule/schedule.js"></script>




<%-- 일정게시판의 각각의 카드에 구글맵을 띄우는 기능입니다 --%>
<script>
	function initAllMaps() {

		var maps = document.querySelectorAll('[id^="map"]');

		maps.forEach(function(mapElement) {

			const lat = parseFloat(mapElement.dataset.lat);
			const lng = parseFloat(mapElement.dataset.lng);
			const mapDivId = mapElement.id;

			console.log("lat : " + typeof lat);
			console.log(typeof 37);
			console.log(lng);

			const centerTest = {
				lat : parseFloat(mapElement.dataset.lat),
				lng : parseFloat(mapElement.dataset.lng)
			};

			const map = new google.maps.Map(document.getElementById(mapDivId),
					{
						zoom : 10,
						center : {
							"lat" : lat,
							"lng" : lng
						}
					});

			const marker = new google.maps.Marker({
				position : {
					lat : lat,
					lng : lng
				},
				map : map
			});

		})

	};
</script>

<%-- 세션을 초기화하는 스크립트입니다 --%>
<script>
window.onpageshow = function(event) {
    if (event.persisted) {
        sessionStorage.clear();
        alert("세션 저장소가 초기화되었습니다!");
    }
};

window.onload = function() {
    sessionStorage.clear();
    alert("세션 저장소가 초기화되었습니다!");
}

</script>





<!-- <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAbBV-mR71MB1Oc8kwqjn0bcIG7BEFDGuE&callback=initAllMaps"></script> -->