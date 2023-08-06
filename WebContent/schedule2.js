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

  document.getElementById('confirmButton').addEventListener('click', function() {
    const location = map.getCenter();

		  // Add a marker to the map
		marker = new google.maps.Marker({
		  position: location,
		  map: map
		});
		
		// Add a route between the markers
		const route = new google.maps.DirectionsRenderer({
		  map: map
		});
		
		const request = {
		  origin: location,
		  destination: location,
		  travelMode: google.maps.DirectionsTravelMode.WALKING
		};
		
		directionsService.route(request, function(response, status) {
		  if (status === google.maps.DirectionsStatus.OK) {
		    route.setDirections(response);
		  }
		});
});
}


window.onload = initMap;

  
  function searchLocation() {
	    const searchQuery = document.getElementById('search').value;
	    const geocoder = new google.maps.Geocoder();

				   geocoder.geocode({ 'address': searchQuery }, function(results, status) {
			if (status == 'OK') {
			map.setCenter(results[0].geometry.location);
			marker.setPosition(results[0].geometry.location);
			} else {
			alert('Geocode was not successful for the following reason: ' + status);
			}
		});
}
  
  document.getElementById('searchButton').addEventListener('click', searchLocation);

  function updateMarker() {
	  const selectedCity = document.getElementById('cities').value;
	  const selectedProvince = document.getElementById('provinces').value;
	  const fullAddress = `${selectedProvince} ${selectedCity}`;

	  const geocoder = new google.maps.Geocoder();
	  geocoder.geocode({ 'address': fullAddress }, function(results, status) {
	    if (status == 'OK') {
	      const location = results[0].geometry.location;
	      map.setCenter(location);
	      marker.setPosition(location);

	      // Fetch data for the selected city
	      fetchData(location.lat(), location.lng());
	    } else {
	      alert('Geocode was not successful for the following reason: ' + status);
	    }
	  });
	}

  
  const provincesData = {
		    '서울': ['강남구', '강동구', '강북구', '강서구', '관악구', '광진구', '구로구', '금천구', '노원구', '도봉구', '동대문구', '동작구', '마포구', '서대문구', '서초구', '성동구', '성북구', '송파구', '양천구', '영등포구', '용산구', '은평구', '종로구', '중구', '중랑구'],
		    '부산': ['강서구', '금정구', '남구', '동구', '동래구', '부산진구', '북구', '사상구', '사하구', '서구', '수영구', '연제구', '영도구', '중구', '해운대구'],
		    '대구': ['남구', '달서구', '동구', '북구', '서구', '수성구', '중구'],
		    '인천': ['강화군', '계양구', '남동구', '동구', '미추홀구', '부평구', '서구', '연수구', '옹진군', '중구'],
		    '광주': ['광산구', '남구', '동구', '북구', '서구'],
		    '대전': ['대덕구', '동구', '서구', '유성구', '중구'],
		    '울산': ['남구', '동구', '북구', '울주군', '중구'],
		    '세종': ['세종시'],
		    '경기': ['가평군', '고양시', '과천시', '광명시', '광주시', '구리시', '군포시', '김포시', '남양주시', '동두천시', '부천시', '성남시', '수원시', '시흥시', '안산시', '안성시', '안양시', '양주시', '양평군', '여주시', '연천군', '오산시', '용인시', '의왕시', '의정부시', '이천시', '파주시', '평택시', '포천시', '하남시', '화성시'],
		    '강원': ['강릉시', '고성군', '동해시', '삼척시', '속초시', '양구군', '양양군', '영월군', '원주시', '인제군', '정선군', '철원군', '춘천시', '태백시', '평창군', '홍천군', '화천군', '횡성군'],
		    '충북': ['괴산군', '단양군', '보은군', '영동군', '옥천군', '음성군', '제천시', '증평군', '진천군', '청주시', '충주시'],
		    '충남': ['계룡시', '공주시', '금산군', '논산시', '당진시', '보령시', '부여군', '서산시', '서천군', '아산시', '예산군', '천안시', '청양군', '태안군', '홍성군'],
		    '전북': ['고창군', '군산시', '김제시', '남원시', '무주군', '부안군', '순창군', '완주군', '익산시', '임실군', '장수군', '전주시', '정읍시', '진안군'],
		    '전남': ['강진군', '고흥군', '곡성군', '광양시', '구례군', '나주시', '담양군', '목포시', '무안군', '보성군', '순천시', '신안군', '여수시', '영광군', '영암군', '완도군', '장성군', '장흥군', '진도군', '함평군', '해남군', '화순군'],
		    '경북': ['경산시', '경주시', '고령군', '구미시', '군위군', '김천시', '문경시', '봉화군', '상주시', '성주군', '안동시', '영덕군', '영양군', '영주시', '영천시', '예천군', '울릉군', '울진군', '의성군', '청도군', '청송군', '칠곡군', '포항시'],
		    '경남': ['거제시', '거창군', '고성군', '김해시', '남해군', '밀양시', '사천시', '산청군', '양산시', '의령군', '진주시', '창녕군', '창원시', '통영시', '하동군', '함안군', '함양군', '합천군'],
		    '제주': ['서귀포시', '제주시']
		};


  function updateCities() {
	  const selectedProvince = document.getElementById('provinces').value;
	  const cities = provincesData[selectedProvince];
	  console.log('Selected province:', selectedProvince); 
	  console.log('Cities:', cities); 
	  const citiesSelect = document.getElementById('cities');
	  citiesSelect.innerHTML = '<option value="">시/군/구 선택</option>';
	  cities.forEach(city => {
	    citiesSelect.innerHTML += `<option value="${city}">${city}</option>`;
	  });
	}

	document.getElementById('cities').addEventListener('change', function() {
	  const selectedCity = this.value;
	  const selectedProvince = document.getElementById('provinces').value;
	  const fullAddress = `${selectedProvince} ${selectedCity}`;

	  const geocoder = new google.maps.Geocoder();
	  geocoder.geocode({ 'address': fullAddress }, function(results, status) {
	    if (status == 'OK') {
	      const location = results[0].geometry.location;
	      map.setCenter(location);
	      marker.setPosition(location);
	    } else {
	      alert('Geocode was not successful for the following reason: ' + status);
	    }
	  });
	});

	function selectedItem(title) {
    let selectedDiv = document.getElementById("selected-result");
    let titleDiv = document.createElement("div");  // create new div
    let titleStrong = document.createElement("strong");
    titleStrong.textContent = title;
    
    // Append the title to the new div
    titleDiv.append(titleStrong);
    
    // Apply block display to each div
    titleDiv.style.display = "block";
    
    // Append the new div to the selectedDiv
    selectedDiv.append(titleDiv);


}

  
	async function fetchData(lat, lng) {
    try {
        const SERVICE_KEY = "ppXvYpsy1tlJDUysjG0%2FrhjFKnX7MRe2efWvkt5rP1Tmmpv4Tbn6UFpPp8SNviAcrWYhkI%2B%2BKtLhGDOW5cmh4Q%3D%3D";
        const URL = `http://api.visitkorea.or.kr/openapi/service/rest/KorService/locationBasedList?ServiceKey=${SERVICE_KEY}&contentTypeId=12&mapX=${lng}&mapY=${lat}&radius=5000&listYN=Y&arrange=A&MobileOS=ETC&MobileApp=AppTest&_type=json`;

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
	                titleDiv.appendChild(titleStrong);
	                infoDiv.appendChild(titleDiv);

	                let addrDiv = document.createElement("div");
	                addrDiv.textContent = item[i].addr1;
	                infoDiv.appendChild(addrDiv);

	                parentDiv.appendChild(infoDiv);

	                // Add image
	                if (item[i].firstimage) {
	                    let imageDiv = document.createElement("div");
	                    let image = document.createElement("img");
	                    image.src = item[i].firstimage;
	                    image.style.width = '100px'; // or any other size
	                    imageDiv.appendChild(image);
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
	                        lat: parseFloat(btn.dataset.mapy), 
	                        lng: parseFloat(btn.dataset.mapx) 
	                    };
	                    map.setCenter(location);
	                    marker.setPosition(location);

	                    // Call selectedItem function with the title of the selected item
	                    selectedItem(btn.dataset.title);
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





  window.onload = initMap;