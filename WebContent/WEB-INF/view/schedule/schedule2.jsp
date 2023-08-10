<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 저장된 헤더를 추가합니다 -->
<%@ include file="../layout/header.jsp"%>

<!--  최신 JavaScript 기능을 사용하기 위해  Polyfill.io 외부 라이브러리를 가져옵니다-->
<script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>

<!--  구글맵을 사용하기 위한 구글맵 API 키를 가져옵니다 -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAbBV-mR71MB1Oc8kwqjn0bcIG7BEFDGuE&callback=initMap" async defer></script>

<!-- 아이콘을 사용하기 위해 fontawesome 외부 라이브러리를 가져옵니다-->
<script src="https://kit.fontawesome.com/d0a7af3fd0.js" crossorigin="anonymous"></script>



<div class="container">
	<div class="row">
		<div class="col-md-6">
			<div id="map" style="width: 100%; height: 1400px;"></div>
		</div>
		
		<div class="col-md-6">
		
			<div>내가 직접 지도에서 장소를 찍어 정하기</div>
			
			<div class="input-group mb-2">
				<input id="addressInput" class="form-control" type="text" value="지도에서 클릭하여 주소를 확인하세요" aria-label="readonly input example" readonly>
			</div>
			
			<div class="input-group mb-2">
				<input type="text" id="hi" class="form-control" placeholder="장소 이름을 입력하세요" aria-label="장소 입력" aria-describedby="button-addon2">
			</div>
			
			<div class="input-group mb-5">
				<input class="btn btn-primary" type="button" value="추가하기" id="addButton" onclick="addButton" style="margin-left: auto; display: block;"> 
				<input type="hidden" name="latitude" id="hiddenLatitude" value="">
				<input type="hidden" name="longitude" id="hiddenLongitude" value="">
			</div>

<!-- 추가하기 버튼을 눌렀을 때 장소 적는 칸에 아무것도 안 적혀 있을 때 경고문을 띄우는 기능입니다 -->
<!-- 필드에 값이 있다면 주소, 장소이름, 현재 마커의 위도와 경도를 히든 필드에 나타내고 selected-result에 넘기는 기능입니다-->
<script>
				document.getElementById('addButton')
						.addEventListener(
								'click',
								function() {
									const placeName = document
											.getElementById('hi').value.trim();
									if (placeName.length === 0) {
										alert('장소를 입력하세요');
									} else {
										// 장소가 입력되었으므로 setHiddenValues 함수를 호출합니다.
										setHiddenValues();

									}
								});
				function setHiddenValues() {
					
					// 마커의 위도와 경도를 가져옵니다.
					console.log("Getting marker's latitude and longitude...");
					var markerLat = marker.getPosition().lat(); // 마커의 위도
					var markerLng = marker.getPosition().lng(); // 마커의 경도

					// 가져온 위도와 경도를 콘솔에 출력합니다.
					console.log("Marker's Latitude: " + markerLat);
					console.log("Marker's Longitude: " + markerLng);

					// 히든 필드에 값을 설정합니다.
					document.getElementById("hiddenLatitude").value = markerLat;
					document.getElementById("hiddenLongitude").value = markerLng;

					// 장소 이름과 주소를 가져옵니다.
					var placeName = document.getElementById('hi').value;
					var address = document.getElementById('addressInput').value;

					// 선택된 결과를 div에 추가합니다.
					var selectedResultDiv = document.getElementById('selected-result');
					var placeContainer = document.createElement("div"); // 새 div 생성
					placeContainer.className = "place-item"; // 클래스 이름 설정
						var contentToAdd = placeName
							+ '<input type="hidden" name="address" value="' + address + '">'
							+ '<input type="hidden" name="latitude" value="' + markerLat + '">'
							+ '<input type="hidden" name="longitude" value="' + markerLng + '"><br>';

							placeContainer.innerHTML = contentToAdd; // 새 div에 내용 추가
							selectedResultDiv.appendChild(placeContainer); // 새 div를 selectedResultDiv에 추
					
					alert("추가된 결과:\n장소명: " + placeName + "\n주소: " + address + "\n위도: " + markerLat + "\n경도: " + markerLng);

				}
			</script>

			<div class="input-group">검색하여 직접 장소를 정하기</div>

			<div class="input-group mb-2">
				<input type="text" id="search" class="form-control" placeholder="구체적인 장소를 검색하세요!" aria-label="장소 검색" aria-describedby="button-addon2">
				<div class="input-group-append">
					<button class="btn btn-outline-secondary" type="button" id="searchButton">검색</button>
				</div>
			</div>

			<div class="input-group mb-5">
				<input class="btn btn-primary" type="button" value="추가하기" id="addButton2" onclick="setHiddenValues2()" style="margin-left: auto; display: block;" disabled> 
				<input type="hidden" name="latitude2" id="hiddenLatitude2" value="">
				<input type="hidden" name="longitude2" id="hiddenLongitude2" value="">
			</div>


<!-- 검색 버튼을 클릭했을 때 지도에서 위치를 찾는 기능입니다-->
<script>
				document.getElementById('searchButton').addEventListener(
						'click', searchLocation);

				function searchLocation() {
					console.log("Search function called");
					const searchQuery = document.getElementById('search').value
							.trim();
					console.log("Search query is:", searchQuery);

					if (searchQuery.length > 0) {
						const geocoder = new google.maps.Geocoder();

						geocoder
								.geocode(
										{
											'address' : searchQuery
										},
										function(results, status) {
											if (status === 'OK') {
												const location = results[0].geometry.location;
												map.setCenter(location);

												if (marker) {
													marker.setMap(null);
												}

												marker = new google.maps.Marker(
														{
															position : location,
															map : map
														});

												// 검색이 성공하면 "추가하기" 버튼 활성화
												document
														.getElementById('addButton2').disabled = false;
											} else {
												alert('오류 내용을 확인하세요: ' + status);
												// 오류 발생 시 "추가하기" 버튼 비활성화
												document
														.getElementById('addButton2').disabled = true;
											}
										});
					} else {
						alert('검색어를 입력하세요.');
						// 검색어가 없을 시 "추가하기" 버튼 비활성화
						document.getElementById('addButton2').disabled = true;
					}
				}
			</script>

<!-- 추가하기 버튼을 클릭했을 때 주소, 장소이름, 현재 마커의 위도와 경도를 히든 필드에 나타내고 selected-result에 넘기는 기능입니다-->
<script>
				function setHiddenValues2() {
					// 마커의 위도와 경도를 가져옵니다.
					console.log("Getting marker's latitude and longitude...");
					var markerLat = marker.getPosition().lat(); // 마커의 위도
					var markerLng = marker.getPosition().lng(); // 마커의 경도

					// 가져온 위도와 경도를 콘솔에 출력합니다.
					console.log("Marker's Latitude: " + markerLat);
					console.log("Marker's Longitude: " + markerLng);

					// 히든 필드에 값을 설정합니다.
					document.getElementById("hiddenLatitude2").value = markerLat;
					document.getElementById("hiddenLongitude2").value = markerLng;

					// 장소 이름과 주소를 가져옵니다.
					var placeName = document.getElementById('search').value;

					// 선택된 결과를 div에 추가합니다.
					var selectedResultDiv = document.getElementById('selected-result');
					var placeContainer = document.createElement("div");
					placeContainer.className = "place-item";
					var contentToAdd = placeName
							+ '<input type="hidden" name="latitude2" value="' + markerLat + '">'
							+ '<input type="hidden" name="longitude2" value="' + markerLng + '"><br>';

							placeContainer.innerHTML = contentToAdd;
							selectedResultDiv.appendChild(placeContainer);
					
					alert("추가된 결과:\n장소명: " + placeName + "\n위도: " + markerLat + "\n경도: " + markerLng);

				}
			</script>

<!-- 검색창에 키보드 입력이 발생하면 "추가하기" 버튼을 비활성화합니다 -->
<script>
				// 검색창에 키보드 입력이 발생하면 "추가하기" 버튼을 비활성화
				document
						.getElementById('search')
						.addEventListener(
								'keyup',
								function() {
									document.getElementById('addButton2').disabled = true;
								});
			</script>


			<!-- 광역시/특별시/도 선택 -->
			<div class="mb-6">
			
				<div>추천장소를 찾아서 정하기</div>
				
				<select id="provinces" class="form-control" onchange="updateCities()" style="margin: 10px">
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
			<select id="cities" class="form-control" onchange="updateMarker()" style="margin: 10px">
				<option value="">시/군/구 선택</option>
			</select>
			
			<div id="recomand" class="p-2 text-bg-primary" style="display: block;">추천장소 (선택하신 지역 근처 관광지를 추천합니다)</div>
			
			<div id="result-section" class="list-group"></div>

			<div class="row" style="margin-top: 30px;">
			
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

<%-- 저장된 푸터를 추가합니다 --%>
<%@ include file="../layout/footer.jsp"%>


<!--  지도 관련 스크립트입니다 -->
<script>
	let map;
	let marker;

	const OPEN_KEY = 'ppXvYpsy1tlJDUysjG0/rhjFKnX7MRe2efWvkt5rP1Tmmpv4Tbn6UFpPp8SNviAcrWYhkI++KtLhGDOW5cmh4Q==';
	window.onload = initMap;
	function initMap() {
		map = new google.maps.Map(document.getElementById('map'), {
			center : {
				lat : 37.5665,
				lng : 126.9780
			},
			zoom : 8
		});

		marker = new google.maps.Marker({
			position : {
				lat : 37.5665,
				lng : 126.9780
			},
			map : map
		});

		const geocoder = new google.maps.Geocoder();

		map
				.addListener(
						'click',
						function(event) {
							const location = event.latLng;

							if (marker) {
								marker.setMap(null);
							}

							marker = new google.maps.Marker({
								position : location,
								map : map
							});

							map.panTo(location);

							geocoder
									.geocode(
											{
												'location' : location
											},
											function(results, status) {
												if (status === 'OK') {
													if (results[0]) {
														document
																.getElementById('addressInput').value = results[0].formatted_address;
													} else {
														console
																.log('No results found');
													}
												} else {
													console
															.log('Geocoder failed due to: '
																	+ status);
												}
											});
						});

		document.getElementById('confirmButton').addEventListener('click', function() {
					const location = map.getCenter();

					// 선택한 주소를 가져옵니다.
					const selectedAddress = document
							.getElementById('addressInput').value.trim();

					// 선택한 주소를 세션 스토리지에 저장합니다.
					sessionStorage.setItem('selectedAddress', selectedAddress);

					// 이후의 기존 코드...
				});

		const location = map.getCenter();

		// Add a marker to the map
		marker = new google.maps.Marker({
			position : location,
			map : map
		});

		// Add a route between the markers
		const route = new google.maps.DirectionsRenderer({
			map : map
		});

		const request = {
			origin : location,
			destination : location,
			travelMode : google.maps.DirectionsTravelMode.WALKING
		};

		directionsService.route(request, function(response, status) {
			if (status === google.maps.DirectionsStatus.OK) {
				route.setDirections(response);
			}
		});
	}
</script>

<!-- 광역시/특별시/도 선택하는 드롭박스를 실행했을 때 작동되는 스크립트입니다 -->
<!-- 선택한 지역의 시 군 구 정보를 시/군/구 선택 드롭박스 목록에 생기도록 해주는 스크립트입니다-->
<script>
	function updateCities() {
		const selectedProvince = document.getElementById('provinces').value;
		const cities = provincesData[selectedProvince];
		console.log('Selected province:', selectedProvince);
		console.log('Cities:', cities);
		const citiesSelect = document.getElementById('cities');
		citiesSelect.innerHTML = '<option value="">시/군/구 선택</option>';
		cities.forEach(function(city) {
			citiesSelect.innerHTML += '<option value="' + city + '">' + city
					+ '</option>';
		});
	}
</script>

<!--  시/군/구 의 목록을 나타내는 스크립트입니다 -->
<script>
	const provincesData = {
		'서울' : [ '강남구', '강동구', '강북구', '강서구', '관악구', '광진구', '구로구', '금천구', '노원구',
				'도봉구', '동대문구', '동작구', '마포구', '서대문구', '서초구', '성동구', '성북구',
				'송파구', '양천구', '영등포구', '용산구', '은평구', '종로구', '중구', '중랑구' ],
		'부산' : [ '강서구', '금정구', '남구', '동구', '동래구', '부산진구', '북구', '사상구', '사하구',
				'서구', '수영구', '연제구', '영도구', '중구', '해운대구' ],
		'대구' : [ '남구', '달서구', '동구', '북구', '서구', '수성구', '중구' ],
		'인천' : [ '강화군', '계양구', '남동구', '동구', '미추홀구', '부평구', '서구', '연수구', '옹진군',
				'중구' ],
		'광주' : [ '광산구', '남구', '동구', '북구', '서구' ],
		'대전' : [ '대덕구', '동구', '서구', '유성구', '중구' ],
		'울산' : [ '남구', '동구', '북구', '울주군', '중구' ],
		'세종' : [ '세종시' ],
		'경기' : [ '가평군', '고양시', '과천시', '광명시', '광주시', '구리시', '군포시', '김포시',
				'남양주시', '동두천시', '부천시', '성남시', '수원시', '시흥시', '안산시', '안성시',
				'안양시', '양주시', '양평군', '여주시', '연천군', '오산시', '용인시', '의왕시', '의정부시',
				'이천시', '파주시', '평택시', '포천시', '하남시', '화성시' ],
		'강원' : [ '강릉시', '고성군', '동해시', '삼척시', '속초시', '양구군', '양양군', '영월군', '원주시',
				'인제군', '정선군', '철원군', '춘천시', '태백시', '평창군', '홍천군', '화천군', '횡성군' ],
		'충북' : [ '괴산군', '단양군', '보은군', '영동군', '옥천군', '음성군', '제천시', '증평군', '진천군',
				'청주시', '충주시' ],
		'충남' : [ '계룡시', '공주시', '금산군', '논산시', '당진시', '보령시', '부여군', '서산시', '서천군',
				'아산시', '예산군', '천안시', '청양군', '태안군', '홍성군' ],
		'전북' : [ '고창군', '군산시', '김제시', '남원시', '무주군', '부안군', '순창군', '완주군', '익산시',
				'임실군', '장수군', '전주시', '정읍시', '진안군' ],
		'전남' : [ '강진군', '고흥군', '곡성군', '광양시', '구례군', '나주시', '담양군', '목포시', '무안군',
				'보성군', '순천시', '신안군', '여수시', '영광군', '영암군', '완도군', '장성군', '장흥군',
				'진도군', '함평군', '해남군', '화순군' ],
		'경북' : [ '경산시', '경주시', '고령군', '구미시', '군위군', '김천시', '문경시', '봉화군', '상주시',
				'성주군', '안동시', '영덕군', '영양군', '영주시', '영천시', '예천군', '울릉군', '울진군',
				'의성군', '청도군', '청송군', '칠곡군', '포항시' ],
		'경남' : [ '거제시', '거창군', '고성군', '김해시', '남해군', '밀양시', '사천시', '산청군', '양산시',
				'의령군', '진주시', '창녕군', '창원시', '통영시', '하동군', '함안군', '함양군', '합천군' ],
		'제주' : [ '서귀포시', '제주시' ]
	};
</script>

<!--  시/군/구를 선택했을 때 지도에 위치를 표시하는 스크립트입니다 -->
<script type="text/javascript">
	function updateMarker() {
		const selectedCity = document.getElementById('cities').value;
		const selectedProvince = document.getElementById('provinces').value;
		const fullAddress = selectedProvince + " " + selectedCity;

		const geocoder = new google.maps.Geocoder();
		geocoder.geocode({
			'address' : fullAddress
		}, function(results, status) {
			if (status == 'OK') {
				const location = results[0].geometry.location;
				map.setCenter(location);
				marker.setPosition(location);

				// Fetch data for the selected city
				fetchData(location.lat(), location.lng());
			} else {
				alert('Geocode was not successful for the following reason: '
						+ status);
			}
		});
	}
</script>

<!-- 추천 장소가 나오게 해주는 스크립트입니다  -->
<script type="text/javascript">
	async function fetchData(lat, lng) {
		console.log("함수 실행")
		try {
			const SERVICE_KEY = "ppXvYpsy1tlJDUysjG0%2FrhjFKnX7MRe2efWvkt5rP1Tmmpv4Tbn6UFpPp8SNviAcrWYhkI%2B%2BKtLhGDOW5cmh4Q%3D%3D";
			const URL = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/locationBasedList?ServiceKey=" + SERVICE_KEY +
			"&contentTypeId=12&mapX=" + lng + "&mapY=" + lat +
			"&radius=5000&listYN=Y&arrange=A&MobileOS=ETC&MobileApp=AppTest&_type=json";

			let response = await fetch(URL);
			console.log(response);
			let data = await response.json();

			if (response.ok) {
				console.log(data);
 
				const item = data.response.body.items.item;
				console.log(item);

				// result-section의 내용을 초기화
				const resultSection = document.getElementById("result-section");
				resultSection.innerHTML = "";

				for (var i = 0; i < item.length; i++) {
					let parentDiv = document.createElement("div");
					parentDiv.className = 'list-group-item';
					parentDiv.style.display = 'flex';
					parentDiv.style.justifyContent = 'space-between';
					parentDiv.style.alignItems = 'center';

					let infoDiv = document.createElement("div");

					let titleDiv = document.createElement("div");
					let titleStrong = document.createElement("strong");
					titleStrong.textContent = item[i].title;
					titleStrong.style.cursor = "pointer"; // 마우스 커서를 포인터로 변경

					let addrDiv = document.createElement("div");
					addrDiv.textContent = item[i].addr1; // 주소를 가져와서 표시합니다.

					// titleStrong에 클릭 이벤트 리스너 추가
					titleStrong.addEventListener('click',
							(function(mapX, mapY) {
								return function() {
									const location = {
										lat : parseFloat(mapY),
										lng : parseFloat(mapX)
									};
									map.setCenter(location);
									marker.setPosition(location);
								};
							})(item[i].mapx, item[i].mapy));

					titleDiv.appendChild(titleStrong);
					infoDiv.appendChild(titleDiv); // 제목을 infoDiv에 추가
					infoDiv.appendChild(addrDiv); // 주소를 infoDiv에 추가, 제목 바로 아래에 위치

					parentDiv.appendChild(infoDiv);

					// Add image
					if (item[i].firstimage) {
						let imageDiv = document.createElement("div");

						if (item[i].firstimage
								&& item[i].firstimage.trim() !== "") {
							let image = document.createElement("img");
							image.src = item[i].firstimage;
							image.style.width = '100px'; // or any other size
							imageDiv.appendChild(image);
						} else {
							let image = document.createElement("img");
							//대체 이미지 현재 안 뜸(오류)
							image.src = "https://tripsoda.com/images/common/logo.svg"; // 대체 이미지 URL
							image.style.width = '100px'; // or any other size
							imageDiv.appendChild(image);
						}

						parentDiv.appendChild(imageDiv);
					}

					let confirmButton = document.createElement("button");
					confirmButton.textContent = "추가";

					// Assign the title data to the button
					confirmButton.dataset.title = item[i].title;
					confirmButton.dataset.mapx = item[i].mapx;
					confirmButton.dataset.mapy = item[i].mapy;

					confirmButton.onclick = function(e) {
						const btn = e.target;
						const location = {
							lat : parseFloat(btn.dataset.mapy),
							lng : parseFloat(btn.dataset.mapx)
						};
						map.setCenter(location);
						marker.setPosition(location);

						// Call selectedItem function with the title and coordinates of the selected item
						selectedItem(btn.dataset.title, location.lat, location.lng); // 위도와 경도를 추가로 전달합니다.
					};

					parentDiv.appendChild(confirmButton);

					resultSection.append(parentDiv);
				}
			} else {
				throw new Error("API request error");
			}
		} catch (error) {
			console.error("Failed to fetch data: ", error);
		}
	}
</script>

<!-- 추천 장소에서  추가 버튼을 눌렀을 때 selected-result에다가 넣어주는 기능입니다-->
<script>
function selectedItem(title, latitude, longitude) { // 위도와 경도 매개변수 추가
	let selectedDiv = document.getElementById("selected-result");
	let titleDiv = document.createElement("div");
    titleDiv.className = "place-item"; // 클래스 이름을 "place-item"으로 지정
	let titleStrong = document.createElement("strong");
	titleStrong.textContent = title;

	// Create hidden input elements for latitude and longitude
	let latInput = document.createElement("input");
	latInput.type = "hidden";
	latInput.name = "latitude";
	latInput.value = latitude;
	let lngInput = document.createElement("input");
	lngInput.type = "hidden";
	lngInput.name = "longitude";
	lngInput.value = longitude;

	// Append the title, latitude, and longitude to the new div
	titleDiv.append(titleStrong);
	titleDiv.append(latInput); // 위도 hidden input 추가
	titleDiv.append(lngInput); // 경도 hidden input 추가

	// Apply block display to each div
	titleDiv.style.display = "block";

	// Append the new div to the selectedDiv
	selectedDiv.append(titleDiv);

	// Alert the information to verify
	alert("장소 이름: " + title + "\n위도: " + latitude + "\n경도: " + longitude);
}

</script>

<!--   결정 완료 버튼을 눌렀을 때 모든 정보가 세션 저장소에 저장이 되도록 하는 기능입니다 -->
<script>
function saveSelectedResults(dayId) {
    console.log("함수실행");

    const selectedResultDiv = document.getElementById("selected-result");
    const placeItems = selectedResultDiv.getElementsByClassName("place-item");
    const places = [];

    for (const placeItem of placeItems) {
        const placeName = placeItem.textContent.trim();
        const latitude = placeItem.querySelector('input[name="latitude"], input[name="latitude2"]').value;
        const longitude = placeItem.querySelector('input[name="longitude"], input[name="longitude2"]').value;

        const place = {
            name: placeName,
            latitude: latitude,
            longitude: longitude
        };

        places.push(place);
        alert("Name: " + placeName + ", Latitude: " + latitude + ", Longitude: " + longitude);
    }

    sessionStorage.setItem(dayId, JSON.stringify(places));
    window.history.back();
}


</script>


