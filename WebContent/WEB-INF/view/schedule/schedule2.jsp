<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="true"%>
<%@ include file="../layout/header.jsp"%>

<div class="container">
	<div class="row">
		<div class="col-md-6">
			<div id="map" style="width: 100%; height: 1400px;"></div>
		</div>
		<div class="col-md-6">

			<div class="input-group mb-3">

				<%
					String destinationString = request.getParameter("destination");
				if (destination != null && !destination.equals("")) {
				%>
				<input type="text" id="search" class="form-control"
					placeholder="<%=destination %>" aria-label="장소 검색"
					aria-describedby="button-addon2" value="<%=destination%>">
				<%
					} else {
				%>
				<input type="text" id="search" class="form-control"
					placeholder="장소 검색" aria-label="장소 검색"
					aria-describedby="button-addon2">
				<%
					}
				%>

				<div class="input-group-append">
					<button class="btn btn-outline-secondary" type="button"
						id="searchButton">검색</button>
				</div>
			</div>

			<div style="display: flex; justify-content: center;">
			
						<a class="btn btn-primary" href="#" role="button"
					style="margin: 10px; width: 100px;" data-bs-toggle="modal"
					data-bs-target="#memoModal">메모 추가</a>
					
				<a class="btn btn-primary" href="#" role="button"
					style="margin: 10px; width: 100px;" onclick="showSelects()">장소
					추가</a> 
					
					
					<a class="btn btn-primary" href="#" role="button"
					style="margin: 10px; width: 100px;" data-bs-toggle="modal"
					data-bs-target="#memoModal">메모 추가</a>

				<!-- The Modal -->
				<div class="modal fade" id="memoModal" tabindex="-1"
					aria-labelledby="memoModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="memoModalLabel">메모 추가</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<textarea id="memo" style="width: 100%; height: 100%;"></textarea>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">닫기</button>
								<button type="button" class="btn btn-primary"
									onclick="saveMemo()">저장</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 광역시/특별시/도 선택 -->
			<select id="provinces" class="form-control" onchange="updateCities()"
				style="display: none; margin: 10px">
				<option value="">광역시/특별시/도 선택</option>
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



			<!-- 시/군/구 선택 -->
			<select id="cities" class="form-control" onchange="updateMarker()"
				style="display: none; margin: 10px">
				<option value="">시/군/구 선택</option>
			</select>
			<div id="recomand" class="p-2 text-bg-primary" style="display: none;">추천장소
				(선택하신 지역 근처 관광지를 추천합니다)</div>
			<div id="result-section" class="list-group"></div>
			<button onclick="saveResults()">결과 저장하기</button>
			<div id="selected-result"
				style="height: 100px; overflow-y: scroll; width: 300px;"></div>




		</div>
	</div>
</div>

<%@ include file="../layout/footer.jsp"%>

<script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAbBV-mR71MB1Oc8kwqjn0bcIG7BEFDGuE&callback=initMap"
	async defer></script>

<script src="schedule2.js">
	
</script>

<script>
	function showSelects() {
		let provincesDiv = document.getElementById("provinces");
		let citiesDiv = document.getElementById("cities");
		let recomandDiv = document.getElementById("recomand");
		let resultSectionDiv = document.getElementById("result-section");

		if (provincesDiv.style.display === "none") {
			provincesDiv.style.display = "block";
			citiesDiv.style.display = "block";
			recomandDiv.style.display = "block";
		} else {
			provincesDiv.style.display = "none";
			citiesDiv.style.display = "none";
			recomandDiv.style.display = "none";
			resultSectionDiv.style.display = "none";
		}
	}
</script>


<script>
	function saveMemo() {
		var memoText = document.getElementById('memo').value;
		console.log(memoText);
		// 이곳에서 원하는 곳에 메모를 저장할 수 있습니다.
		// localStorage.setItem('memo', memoText);
	}
</script>

<script>
	function saveResults() {
		var resultElements = document.getElementById('selected-result').children;
		var resultsArray = [];

		for (var i = 0; i < resultElements.length; i++) {
			resultsArray.push(resultElements[i].innerText);
		}

		console.log(resultsArray);
		// 여기서 원하는 곳에 결과를 저장할 수 있습니다.
		// 예를 들어, localStorage에 저장하는 경우:
		// localStorage.setItem('results', JSON.stringify(resultsArray));
	}
</script>




