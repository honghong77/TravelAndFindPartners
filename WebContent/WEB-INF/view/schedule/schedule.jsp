<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
				<button class="btn btn-outline-secondary" type="button"
					id="button-addon2">검색</button>
			</div>
		</div>
		<div class="col-md-6 d-flex justify-content-end">
			<button id="HongButton" class="btn btn-primary mb-4" type="button" data-bs-toggle="modal" data-bs-target="#dateModal" style="margin-right: 30px;">기간 조회</button>
			<button id="regionSearchButton" class="btn btn-primary mb-4" type="button" data-bs-toggle="modal" data-bs-target="#regionModal">지역별 검색</button>
		</div>
	</div>
	<div id="location-list-div" style="display: none">
		<ol class="list-group list-group-numbered" id="location-list">
		</ol>
	</div>




<%-- 지역별 검색 모달입니다 --%>
<div class="modal fade" id="regionModal" tabindex="-1"
		aria-labelledby="regionModalLabel" aria-hidden="true">
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
					<button id="regionSearchButton2"  type="button" class="btn btn-primary" data-bs-dismiss="modal">검색</button>
				</div>
			</div>
		</div>
	</div>

<%-- 기간 조회 검색 모달입니다 --%>
<div class="modal fade" id="dateModal" tabindex="-1" aria-labelledby="dateModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="dateModalLabel">기간 조회</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <label for="startDate">시작 날짜:</label>
        <input type="date" id="startDateValue" value="">
        <label for="endDate">종료 날짜:</label>
        <input type="date" id="endDateValue" value="">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-primary" id="applyDateFilter">적용</button>
      </div>
    </div>
  </div>
</div>




	<%-- 일정게시판의 동적 페이지 넘기기 DB 기능입니다 --%>
	<%
		String pageStr = request.getParameter("page");
	int currentPage = (pageStr == null || pageStr.equals("")) ? 1 : Integer.parseInt(pageStr);

	Connection conn = DBUtil.getConnection();
	Statement st = null;
	ResultSet rs = null;

	int recordsPerPage = 9;
	int offset = (currentPage - 1) * recordsPerPage;
	String sql = "SELECT * FROM travel LIMIT " + recordsPerPage + " OFFSET " + offset; // 테이블 이름과 컬럼 이름 수정
	st = conn.createStatement();
	rs = st.executeQuery(sql);

	int totalRecords = 0;
	Statement countSt = conn.createStatement();
	try {
		String countSql = "SELECT COUNT(*) FROM travel"; // 테이블 이름 수정
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
			int travelId = rs.getInt("travel_id");
		%>
		<div class="col">
			<div class="card h-100">
				<iframe id="mapView<%=travelId%>" frameborder="0" style="border: 0; width: 100%; height: 100%;" src="https://www.google.com/maps/embed/v1/place?key=AIzaSyAbBV-mR71MB1Oc8kwqjn0bcIG7BEFDGuE&q=<%=rs.getString("location")%>&center=<%=rs.getDouble("latitude")%>,<%=rs.getDouble("longitude")%>" allowfullscreen> </iframe>

				<div class="card-body"><%=rs.getString("memo")%>
					<h5 class="card-title"></h5>
					<p class="card-text"></p><%=rs.getString("location")%>
					<p class="card-text">
						<small class="text-muted"><%=rs.getString("member_id")%>님의 여행 일정</small>
					</p>
					<a href="#" class="btn btn-primary mr-4" data-toggle="modal" data-target="#modal<%=travelId%>">일정 간략히 보기</a> 
					<a href="#" class="btn btn-primary" onclick="travelIdAlert(<%=travelId%>);">일정 상세 보기</a>
				</div>

				<div class="card-footer">
					<small class="text-body-secondary"><%=rs.getString("start_date")%>부터
						<%=rs.getString("end_date")%>까지</small>
				</div>
			</div>
		</div>

		<%-- 일정 간략히 보기를 클릭했을 때 생성되는 모달입니다 --%>
		<div class="modal fade" id="modal<%=travelId%>" tabindex="-1" role="dialog" aria-labelledby="modalLabel<%=travelId%>" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered modal-lg" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="modalLabel<%=travelId%>">날짜별 일정 계획</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<%-- travel_location 정보 표시 --%>
						<%
							String locationQuery = "SELECT * FROM travel_location WHERE travel_id = " + travelId;
						Statement locationSt = conn.createStatement();
						ResultSet locationRs = locationSt.executeQuery(locationQuery);

						while (locationRs.next()) {
							String locationName = locationRs.getString("location_name");
							String date = locationRs.getString("date");
							String memo = locationRs.getString("memo");
						%>
						<div class="border-top pt-2">
							<p>
								<strong><%=date%></strong>
							</p>
							<p><%=locationName%></p>
							<p><%=memo%></p>
						</div>
						<%
							}
						locationRs.close();
						locationSt.close();
						%>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
					</div>
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
				<a class="page-link" href="<%=currentPage == 1 ? "#" : "?page=" + (currentPage - 1)%>">Previous</a>
			</li>
			<%
				for (int i = 1; i <= (totalRecords + recordsPerPage - 1) / recordsPerPage; i++) {
				if (i == currentPage) {
			%>
			<li class="page-item active" aria-current="page">
				<a class="page-link" href="#"><%=i%></a></li>
			<%
				} else {
			%>
			<li class="page-item">
				<a class="page-link" href="?page=<%=i%>"><%=i%></a>
			</li>
			<%
				}
			}
			%>
			<li class="page-item <%=currentPage == (totalRecords + recordsPerPage - 1) / recordsPerPage ? "disabled" : ""%>">
				<a class="page-link" href="<%=currentPage == (totalRecords + recordsPerPage - 1) / recordsPerPage ? "#" : "?page=" + (currentPage + 1)%>">Next</a>
			</li>
		</ul>
	</nav>
</div>

<%-- 저장된 푸터를 추가합니다 --%>
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>

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
		}
	};

	window.onload = function() {
		sessionStorage.clear();
	}
</script>

<%-- 검색창에 엔터키를 입력시 동작하게하는 스크립트입니다 --%>
<script>
document.getElementById('button-addon2').addEventListener('click', searchFunction);
document.getElementById('searchInput').addEventListener('keyup', function(event) {
    if (event.keyCode === 13) { // Enter 키
        searchFunction();
    }
});

function searchFunction() {
    const searchTerm = document.getElementById('searchInput').value.toLowerCase(); // 검색어
    const cards = document.querySelectorAll('.card'); // 모든 카드 가져오기

    cards.forEach(card => {
        const cardContent = card.innerText.toLowerCase(); // 카드 내용
        if (searchTerm === '' || cardContent.includes(searchTerm)) { // 검색어가 없거나 검색어 포함 여부 확인
            card.parentElement.style.display = 'block'; // 카드 표시
        } else {
            card.parentElement.style.display = 'none'; // 카드 숨기기
        }
    });
}
</script>

<%-- 지역별 검색 모달에서 지역 선택시 버튼의 텍스트에 해당 지역이 나오게 하는 스크립트입니다 --%>
<script>
		document
				.addEventListener(
						'DOMContentLoaded',
						function() { // 페이지가 완전히 로드된 후에 코드 실행
							document
									.querySelector(
											'#regionModal .modal-footer .btn.btn-primary')
									.addEventListener(
											'click',
											function() {
												const selectedRegion = document
														.getElementById('regionSelect').value;
												if (selectedRegion !== '지역 선택') {
													const regionText = document
															.getElementById('regionSelect').options[document
															.getElementById('regionSelect').selectedIndex].text;
													document
															.getElementById('regionSearchButton').innerText = regionText;
												}
											});
						});
	</script>

<%-- 지역별 검색 모달에서 지역 선택하고 검색 버튼을 누르면 해당 페이지에서 필터링 되어 나오게 하는 스크립트입니다 --%>
<script>
    // 지역별로 카드를 필터링하는 함수
    function filterCardsByRegion(region) {
        // 지역 이름을 변환합니다 (예: '서울특별시' -> '서울').
        region = region.replace('특별시', '').replace('광역시', '').trim();

        // 모든 카드를 숨깁니다.
        const cards = document.querySelectorAll('.card');
        cards.forEach(card => {
            card.parentElement.style.display = 'none'; // 카드의 상위 요소를 숨깁니다.
        });

        // 선택된 지역에 해당하는 카드만 표시합니다.
        cards.forEach(card => {
            if (card.innerHTML.includes(region)) {
                card.parentElement.style.display = 'block'; // 카드의 상위 요소를 표시합니다.
            }
        });
    }

    // 지역별 검색 모달의 "검색" 버튼 클릭 이벤트 리스너
    document.getElementById('regionSearchButton2').addEventListener('click', function() {
        const selectedRegion = document.getElementById('regionSelect').value;
        filterCardsByRegion(selectedRegion);
    });
</script>

<%-- 기간 조회 선택 시 여행 시작/종료 날짜를 입력하고 적용을 누르면 버튼 텍스트필드가 변경되고 필터해서 검색해주는 스크립트입니다 --%>
<script>
document.getElementById('applyDateFilter').addEventListener('click', function() {
    const startDateValue = document.getElementById('startDateValue').value;
    const endDateValue = document.getElementById('endDateValue').value;

    alert("startDateValue: " + startDateValue);
    alert("endDateValue: " + endDateValue);

    // 버튼의 텍스트를 변경합니다.
    document.getElementById('HongButton').textContent = startDateValue + " ~ " + endDateValue;

    // Date 객체로 변환
    const startDate = new Date(startDateValue);
    const endDate = new Date(endDateValue);

    // 카드를 필터링합니다.
    const cards = document.querySelectorAll('.card');
    cards.forEach(card => {
        const dateText = card.querySelector('.card-footer .text-body-secondary').textContent;
        const cardStartDate = new Date(dateText.split('부터')[0].trim());
        const cardEndDate = new Date(dateText.split('까지')[0].split('부터')[1].trim());

        // 카드의 시작 및 종료 날짜가 선택된 범위 내에 있는지 확인합니다.
        if (cardStartDate <= endDate && cardEndDate >= startDate) {
            card.style.visibility = 'visible';
            card.style.height = 'auto';  // 원래 높이로 설정
        } else {
            card.style.visibility = 'hidden';
            card.style.height = '0';  // 높이를 0으로 설정해 공간을 차지하지 않도록 함
        }
    });

    // 모달을 닫습니다.
    const modal = bootstrap.Modal.getInstance(document.getElementById('dateModal'));
    modal.hide();
});

</script>

<%-- 일정 상세 보기 클릭 시 schedule3.jsp로 이동하는 스크립트입니다 --%>
<script>
function travelIdAlert(travelId) {
    // travelId를 파라미터로 추가하여 URL로 이동
    window.location.href = "/schedule3?travelId=" + travelId;
}
</script>

