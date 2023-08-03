<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="../layout/header.jsp" %>

<div class="container">
  <div class="row">
    <div class="col-md-6">
      <div id="map" style="width: 100%; height: 1400px;"></div>
    </div>
    <div class="col-md-6">
      <select id="places" class="form-control" onchange="updateMarker()">
        <option value="">장소를 선택해주세요</option>
        <!-- 장소 목록을 추가하실 수 있습니다. -->
        <option value="37.5665,126.9780">서울</option>
        <option value="35.1796,129.0756">부산</option>
        <option value="37.4563,126.7052">인천</option>
        <option value="35.8714,128.6014">대구</option>
        <option value="35.1595,126.8526">광주</option>
        <option value="36.3504,127.3845">대전</option>
        <option value="35.5384,129.3114">울산</option>
        <option value="36.4800,127.2887">세종</option>
        <option value="37.4138,127.5183">경기</option>
        <option value="37.8228,128.1555">강원</option>
        <option value="36.6356,127.4914">충북</option>
        <option value="36.6584,126.6723">충남</option>
        <option value="35.7175,127.1530">전북</option>
        <option value="34.8679,126.9910">전남</option>
        <option value="36.4919,128.8889">경북</option>
        <option value="35.2383,128.6919">경남</option>
        <option value="33.4890,126.4983">제주</option>
      </select>
      <div id="result-section"></div>
    </div>
  </div>
</div>

<%@ include file="../layout/footer.jsp" %>

<script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAbBV-mR71MB1Oc8kwqjn0bcIG7BEFDGuE&callback=initMap" async defer></script>

<script>
  let map;
  let marker;

  const OPEN_KEY = 'ppXvYpsy1tlJDUysjG0/rhjFKnX7MRe2efWvkt5rP1Tmmpv4Tbn6UFpPp8SNviAcrWYhkI++KtLhGDOW5cmh4Q==';

  function initMap() {
    map = new google.maps.Map(document.getElementById('map'), {
      center: {lat: 37.5665, lng: 126.9780},
      zoom: 8
    });

    marker = new google.maps.Marker({
      position: {lat: 37.5665, lng: 126.9780},
      map: map
    });
  }

  function updateMarker() {
    const selectedPlace = document.getElementById('places').value;

    if (selectedPlace) {
      const [lat, lng] = selectedPlace.split(',');
      const location = { lat: parseFloat(lat), lng: parseFloat(lng) };

      map.setCenter(location);
      marker.setPosition(location);
	
      fetchData();
    }
  }


  
  async function fetchData() {
	    try {
	    	
	    	let places = document.getElementById("places");
	    	places = places.value.split(",");
	    	
	        const SERVICE_KEY = "ppXvYpsy1tlJDUysjG0%2FrhjFKnX7MRe2efWvkt5rP1Tmmpv4Tbn6UFpPp8SNviAcrWYhkI%2B%2BKtLhGDOW5cmh4Q%3D%3D";
	        const URL = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/locationBasedList?ServiceKey=" + SERVICE_KEY + "&contentTypeId=12&mapX="+places[1]+"&mapY="+places[0]+"&radius=10000&listYN=Y&arrange=A&MobileOS=ETC&MobileApp=AppTest&_type=json";

	        let response = await fetch(URL);
	        console.log(response);
	        let data = await response.json();

	        
	        if (response.ok) {
	            console.log(data);
	            // 추후 데이터 처리 로직을 이 위치에 추가합니다.
	            
	            
	            const item = data.response.body.items.item;
	            console.log(item);
	            for (var i = 0; i < item.length; i++) {
	            	let div = document.createElement("div");
	            	div.textContent = item[i].addr1;
	            	document.getElementById("result-section").append(div);
				}
	        } else {
	            throw new Error("API request error");
	        }

	    } catch (error) {
	        console.error("Failed to fetch data: ", error);
	    }
	}

  window.onload = initMap;
</script>
