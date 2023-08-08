<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAbBV-mR71MB1Oc8kwqjn0bcIG7BEFDGuE&callback=initMap" async defer></script>
<script src="https://kit.fontawesome.com/d0a7af3fd0.js" crossorigin="anonymous"></script>

<div class="container">
	<div class="row">
		
		<div class="col-md-6">
			<div id="map" style="width: 100%; height: 1400px;"></div>
		</div>
		<div class="col-md-6">


			<%-- 내 위치 기반 검색 기능 --%>
			<div>
				내가 직접 지도에서 장소를 찍어 정하기
			</div>
			
			<div class="input-group mb-2">
				<input id="addressInput" class="form-control" type="text" value="지도에서 클릭하여 주소를 확인하세요" aria-label="readonly input example" readonly>
			</div>
			
			<div class="input-group mb-2">
				<input type="text" id="hi" class="form-control" placeholder="장소 이름을 입력하세요" aria-label="장소 입력" aria-describedby="button-addon2">
			</div>
			
			<div class="input-group mb-5">
			    <input class="btn btn-primary" type="submit" value="추가하기" id="addButton" style="margin-left: auto; display: block;">
			</div>




				
			<div class="input-group">
				검색하여 직접 장소를 정하기
			</div>
			
			<div class="input-group mb-5">
				<input type="text" id="search" class="form-control"placeholder="구체적인 장소를 검색하세요!" aria-label="장소 검색"aria-describedby="button-addon2">
				<div class="input-group-append">
					<button class="btn btn-outline-secondary" type="button"id="searchButton">검색</button>
				</div>
			</div>

			<!-- 광역시/특별시/도 선택 -->
			
			<div class ="mb-6";>
			<div>
			추천장소를 찾아서 정하기
			</div>
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
			</div>


			<!-- 시/군/구 선택 -->
			<select id="cities" class="form-control" onchange="updateMarker()"
				style="display: none; margin: 10px">
				<option value="">시/군/구 선택</option>
			</select>
			<div id="recomand" class="p-2 text-bg-primary" style="display: block;">추천장소
				(선택하신 지역 근처 관광지를 추천합니다)</div>
			<div id="result-section" class="list-group"></div>
			
			
			<div class="row" style="margin-top: 30px;
">
			  <div class="col-md-8">
			    <div id="selected-result" style="height: 100px; overflow-y: scroll; width: 100%;"></div>
			  </div>
			  <div class="col-md-4">
			    <button class="btn btn-primary" onclick="saveSelectedResults('${dayId}')" type="submit" style="width: 100%;">결정 완료</button>

			  </div>
			</div>

		</div>
	</div>
</div>

<%@ include file="../layout/footer.jsp"%>



<script src="schedule/schedule2.js"></script>

<script>
  window.onload = function() {
    showSelects();
  };

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

<script>
	document.getElementById('addButton').addEventListener('click', function() {
		  const placeName = document.getElementById('hi').value.trim();
		  if (placeName.length === 0) {
		    alert('장소를 입력하세요');
		  } else {
		    // 여기에 장소를 추가하는 로직을 작성할 수 있습니다.
		}
	});
</script>



