<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%-- 달력, 날짜, 달력을 문자열로 변환 하기 위한 라이브러리입니다 --%>
<%@page import="java.util.Calendar"%>				
<%@page import="java.util.Date"%>					
<%@page import="java.text.SimpleDateFormat"%>




<%-- 저장된 헤더를 추가합니다 --%>
<%@ include file="/WEB-INF/view/layout/header.jsp"%>

<%-- 구글맵 API키를 불러옵니다--%>
<script defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAbBV-mR71MB1Oc8kwqjn0bcIG7BEFDGuE&libraries=geometry&callback=initMap"></script>

<%-- 일정을 데이터 베이스에 추가하기 위한 jquery 외부 라이브러리를 불러옵니다 --%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<%-- 메모 모달 기능을 사용하기 위한 부트스트랩 외부 라이브러리를 추가합니다 --%>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


<%-- 구글 지도를 화면에 띄우는 스크립트입니다 --%>
<script>
var map; // 전역 변수로 선언

function initMap() {
    map = new google.maps.Map(document.getElementById('map'), {
        center: {lat: 36.7749, lng: 127.4194}, // 초기 위치
        zoom: 14
    });
    
  
}

</script>

<html>
<body>

<div class="row" style="margin-left: 100px; margin-right: 100px">
  
  	<%-- 왼쪽 화면(지도) div입니다 --%>
  	<div class="col-xl-6 ml-6">
    	<div id="map" class="p-4" style="height: 1500px; width: 100%; margin-right: 100px;"></div>
    </div>
    
    <%-- 오른쪽 화면(일정) div입니다 --%>
    <div class="col-md-6">
    	<div style="margin-bottom:20px">
	    	<div class="row justify-content-center">
				<div style="text-align: center; margin-bottom: 20px">
		          <h4>??? 님의 여행일정</h4>
		        </div>
		        
		        <div class="form-control mb-4" style="height: 50px; width: 400px;">
		          <i class="fa-solid fa-calendar-days fa-beat fa-xl" style="color: #005eff; margin-right: 60px;"></i> ${requestScope.startDate} ~ ${requestScope.endDate}
		        </div>
	      	</div>
		      	<i class="fa-solid fa-location-dot fa-beat fa-xl mr-4" style="color: #005eff; margin-right: 40px;"></i>${requestScope.destination}
      	</div>
      	
			<div style="max-height: 1330px; overflow-y: auto;">
			     	<c:forEach var="item" items="${resultList}" varStatus="status">
					    <div id="day${status.count}" class="dayItem" style="display: flex; justify-content: left; align-items: center; height: 200px; margin-top: 30px; margin-bottom: 30px;">
					        <div style="margin-top: 30px;">
					            <div style="margin-bottom: 50px; margin-top: 50px;">
					                <i class="fa-solid fa-plane fa-beat fa-xl" style="color: #1e00ff;"></i>
					                day${status.count} ${item}<br>
					                <a href="${pageContext.request.contextPath}/schedule2?id=day${status.count}">
					                    <button type="button" class="btn btn-primary btn-lg" style="margin-right: 30px;">장소 추가</button>
					                </a>
					                <button type="button" class="btn btn-secondary btn-lg" data-toggle="modal" data-target="#memoModal" data-day="${status.count}">메모 추가</button>
					                <button type="button" class="btn btn-outline-primary" style="margin-left: 30px;" data-day="${status.count}">경로 확인</button>
					                <button type="button" class="btn btn-outline-primary" id="optimizeRouteButton" data-day="${status.count}">동선 최적화</button>

					                <div id="memoContent" style="margin-top: 10px;">
					                    <!-- 장소가 추가되는 목록입니다 -->
					                    <ul id="memoText" style="max-height: 100px; overflow-y: auto; border: 1px solid #000;">
					                        		장소를 추가하세요
					                    </ul>
					                    <!-- 메모가 추가되는 텍스트입니다 -->
					                    <div>
					                        <p id="memopowerman${status.count}" style="max-height: 100px; overflow-y: auto; border: 1px solid #000;">메모 작성하는 곳</p>
					                    </div>
					                </div>
					            </div>
					        </div>
					    </div>
					</c:forEach>

      			</div>
			      		<%-- 일정에 추가하기 버튼입니다(DB에 저장하는 버튼) --%>
		 <div style="display: flex; justify-content: center; align-items: center; height: 200px;">
				<button type="button" class="btn btn-primary btn-lg" onclick="saveSchedule()">일정에 추가하기</button>
		 </div>
    </div>
</div>
				
<%-- 메모 모달입니다 --%>
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

<%-- 메모를 추가하는 스크립트입니다 --%>
<script>
console.log("함수 실행");
// 메모 모달이 표시되면 현재 선택된 날짜를 저장
$('#memoModal').on('show.bs.modal', function(event) {
  var button = $(event.relatedTarget); // 메모 추가 버튼
  var day = button.data('day'); // data-day 값
  $(this).data('day', day); // 모달에 날짜 저장

  // 이전에 저장된 메모를 가져와서 텍스트 영역에 설정
  var savedMemo = $('#memopowerman' + day).text();
  $('#memo').val(savedMemo);
});

// 메모 저장 함수
function saveMemo() {
	console.log("함수 실행");
  var memo = $('#memo').val(); // 입력된 메모
  var day = $('#memoModal').data('day'); // 선택된 날짜
  $('#memopowerman' + day).text(memo); // 해당 날짜의 메모 텍스트 영역에 메모 저장
  $('#memoModal').modal('hide'); // 모달 닫기
	console.log("저장 완료");
}
</script>

						  
<%-- 메모를 DB에 저장하기위해 서블릿으로 보내는 스크립트입니다 --%>
<%-- DBSave 서블릿으로 이동합니다--%>
<script>
function saveSchedule() {
    var memberId = "hi";
    var startDate = "${requestScope.startDate}";
    var endDate = "${requestScope.endDate}";
    var destination = "${requestScope.destination}";
    var latitude = "${requestScope.latitude}"; // 위도
    var longitude = "${requestScope.longitude}"; // 경도

    $.post('/TravelAndFindPartners/saveSchedule', {
      member_id: memberId,
      start_date: startDate,
      end_date: endDate,
      location: destination,
      lat: latitude, 
      lng: longitude
    }, function(response) {
      // 응답 처리 (예: 알림 표시)
      alert(response.message);

      // 이제 여기서 추가적인 데이터를 수집하여 travel_location 테이블에 넣습니다.
      var days = document.querySelectorAll(".dayItem");
      var dataToSend = [];

      days.forEach(function(dayElement) {
          var dayCount = dayElement.querySelector(".fa-plane").nextElementSibling.textContent.trim().split(' ')[1];
          var date = dayElement.querySelector(".fa-plane").nextElementSibling.textContent.trim().split(' ')[2];

          var locations = dayElement.querySelectorAll("#memoText .place-name");
          locations.forEach(function(location) {
              var locationData = {
                  travel_id: memberId, // 이 부분은 정확한 값을 지정해야 합니다.
                  date: date,
                  location_name: location.textContent,
                  latitude: location.getAttribute('data-lat'),
                  longitude: location.getAttribute('data-lng'),
                  memo: dayElement.querySelector("#memopowerman" + dayCount).textContent
              };
              dataToSend.push(locationData);
          });
      });

      // 추가적인 데이터를 서버에 전송
      $.post('/TravelAndFindPartners/saveTravelLocation', dataToSend, function(response) {
          // 여기서 travel_location에 데이터 저장에 대한 응답 처리
          if (response.success) {
              window.location.href = '/TravelAndFindPartners/hello';
          } else {
              alert("travel_location 저장 중 오류 발생: " + response.message);
          }
      });
    });
}
</script>
							
<%-- (미완성)메모를 DB에 저장하기위해 서블릿으로 보내는 스크립트입니다 --%>
<%-- DBSave2 서블릿으로 이동합니다--%>
<script>
		var locationDates = [];
		var locationNames = [];
		var memos = [];

		for (var i = 1; i <= totalDays; i++) {
		  locationDates.push(document.getElementById("day" + i).innerText);
		  locationNames.push(document.getElementById("memoText" + i).innerText);
		  memos.push(document.getElementById("memopowerman" + i).innerText);
		}

		$.post('/TravelAndFindPartners/saveScheduleDetails', {
		  locationDates: locationDates,
		  locationNames: locationNames,
		  memos: memos
		}, function(response) {
		  // 응답 처리
		});

	</script>

<%-- 세션 스토리지에서 저장된 값을 읽어 해당 요소의 텍스트 내용을 업데이트 하는 스크립트입니다 --%>  
<%-- 그리고 장소를 클릭할 수 있도록 포인터로 만들어줍니다 --%>
<script>
var markers = {};

document.querySelectorAll(".dayItem").forEach(function(item) {
    // 세션 스토리지에서 선택한 결과를 가져옵니다.
    const selectedResultsJSON = sessionStorage.getItem(item.id);

    // 선택한 결과가 있으면 해당 요소에 설정합니다.
    if (selectedResultsJSON) {
        const selectedResults = JSON.parse(selectedResultsJSON);
        let content = "";

        // 장소, 위도, 경도 값을 하나씩 읽어서 content에 추가합니다.
        selectedResults.forEach(function(place) {
            content += "<li><span class='place-name' data-lat='" + place.latitude + "' data-lng='" + place.longitude + "'>" +
                       place.name + "</span>" +
                       "<span style='display: none;'>위도: " + place.latitude + ", 경도: " + place.longitude + "</span></li>";
        });

        const memoContent = document.querySelector("#" + item.id + " div div #memoContent ul");
        memoContent.innerHTML = content;

        // 클릭 이벤트를 각 장소 텍스트에 추가합니다.
        memoContent.querySelectorAll(".place-name").forEach(function(placeElement, index) {
            placeElement.style.cursor = "pointer"; // 손가락 모양 커서 설정
            placeElement.addEventListener('click', function() {
                const latitude = parseFloat(this.dataset.lat);
                const longitude = parseFloat(this.dataset.lng);
                toggleMarker(latitude, longitude, index);
            });
        });
    }
});
</script>

<%-- 세션 스토리지에서 저장된 값을 읽어 해당 요소의 텍스트 내용을 업데이트 하는 스크립트입니다 --%> 
<script>
window.addEventListener('DOMContentLoaded', function(event) {
	  // "장소와 일정 추가" 부분에 저장된 주소를 표시합니다.
	  var memoContent = document.getElementById('memoContent');
	  var selectedAddress = sessionStorage.getItem('selectedAddress');

	  // 저장된 주소가 있으면 표시합니다.
	  if (selectedAddress) {
	    var paragraph = document.createElement('p');
	    paragraph.innerText = selectedAddress;
	    memoContent.appendChild(paragraph);
	  }
	});
</script>

<%-- 장소를 클릭했을 때 지도에 마커로 표시되게 하고 마커를 클릭하면 해당 주소 위도 경도 정보가 나옵니다 --%>
<script>
function toggleMarker(latitude, longitude, index) {
    const location = { lat: latitude, lng: longitude };

    // 이미 마커가 있다면 제거합니다.
    if (markers[index]) {
        markers[index].setMap(null);
        delete markers[index];
        return;
    }

    // 새로운 마커를 생성하고 지도에 표시합니다.
    var marker = new google.maps.Marker({
        position: location,
        map: map
    });

    // 마커 클릭 이벤트 리스너를 추가합니다.
    var infowindow = new google.maps.InfoWindow();
    marker.addListener('click', function() {
        var geocoder = new google.maps.Geocoder();
        geocoder.geocode({'location': location}, function(results, status) {
            if (status === 'OK' && results[0]) {
                var address = results[0].formatted_address;

                var contentString = '주소: ' + address +
                                    '<br>위도: ' + latitude +
                                    '<br>경도: ' + longitude;

                infowindow.setContent(contentString);
                infowindow.open(map, marker);
            } else {
                console.error('Geocode failed due to: ' + status);
            }
        });
    });

    markers[index] = marker;

    // 지도의 중심을 해당 위치로 변경합니다.
    map.setCenter(location);
}

</script>

<%-- 경로 확인 버튼을 클릭했을 때 각 장소들의 거리와 지도에 선을 그어주고 순서가 있는 마커를 추가해주고 스크립트입니다 --%>
<%-- 경로 최적화 스크립트도 있습니다 --%>
<script>
var path = [];

var polyline; // 선을 저장할 변수
var distanceInfoWindows = []; // 각 거리를 표시할 InfoWindows
var markerArray = []; // 마커를 저장할 배열

// 페이지가 로드될 때 모든 "경로 확인" 버튼에 이벤트 리스너를 추가합니다.
document.addEventListener('DOMContentLoaded', function() {
    // 모든 "경로 확인" 버튼을 선택합니다.
    var buttons = document.querySelectorAll('.btn.btn-outline-primary');

    // 각 버튼에 클릭 이벤트 리스너를 추가합니다.
    buttons.forEach(function(button) {
        button.addEventListener('click', function() {
            // 여기서 'this'는 현재 클릭된 버튼을 가리킵니다.
            var day = this.dataset.day;
            var memoTextElement = document.querySelector("#day" + day + " #memoText");
            if (!memoTextElement) {
                console.error("#day" + day + " #memoText element not found!");
                return;
            }
            var placeElements = memoTextElement.querySelectorAll(".place-name");

            
            path = Array.from(placeElements).map(placeElement => {
                return {
                    lat: parseFloat(placeElement.getAttribute('data-lat')), 
                    lng: parseFloat(placeElement.getAttribute('data-lng'))
                };
            });

            // 이전에 그린 선이 있다면 지웁니다.
            if (polyline) {
                polyline.setMap(null);
            }

            // 이전에 추가한 마커를 모두 지웁니다.
            markerArray.forEach(function(marker) {
                marker.setMap(null);
            });
            markerArray = [];

            // 각 위치에 마커를 추가합니다.
            path.forEach(function(position, index) {
			    var marker = new google.maps.Marker({
			        position: position,
			        map: map,
			        label: (index + 1).toString() // 마커에 표시할 레이블. index는 0부터 시작하므로 1을 더해줍니다.
			    });
			    markerArray.push(marker);
			});

            // 이전에 표시한 거리 InfoWindows를 닫습니다.
            distanceInfoWindows.forEach(function(infoWindow) {
                infoWindow.close();
            });
            distanceInfoWindows = [];

            // 선을 지도에 그립니다.
            polyline = new google.maps.Polyline({
                path: path,
                geodesic: true,
                strokeColor: '#FF0000',
                strokeOpacity: 1.0,
                strokeWeight: 2
            });
            polyline.setMap(map);

            // 전체 거리 및 각 두 점 사이의 거리를 계산합니다.
            var totalDistance = 0;
            for (let i = 0; i < path.length - 1; i++) {
                const distance = google.maps.geometry.spherical.computeDistanceBetween(
                    new google.maps.LatLng(path[i]), 
                    new google.maps.LatLng(path[i + 1])
                );
                totalDistance += distance;

                // 각 두 점 사이의 거리를 지도에 표시합니다.
                const midPoint = google.maps.geometry.spherical.interpolate(
                    new google.maps.LatLng(path[i]),
                    new google.maps.LatLng(path[i + 1]),
                    0.5
                );
                const distanceInfoWindow = new google.maps.InfoWindow({
                    position: midPoint,
                    content: distance.toFixed(2) + " meters"
                });
                distanceInfoWindow.open(map);
                distanceInfoWindows.push(distanceInfoWindow);
            }

            // 전체 거리를 지도에 표시합니다.
            const totalDistanceInfoWindow = new google.maps.InfoWindow({
                position: path[0],
                content: "전체 거리: " + totalDistance.toFixed(2) + " meters"
            });
            totalDistanceInfoWindow.open(map);
            distanceInfoWindows.push(totalDistanceInfoWindow);
        });
    });
    
    <%-- 동선을 최적화하는 스크립트입니다 --%>
    document.querySelector('#optimizeRouteButton').addEventListener('click', function() {
    	if (path.length === 0) {
    	    console.error("Path is empty or not defined.");
    	    return;
    	}
    	if (path[0].lat === path[path.length - 1].lat && path[0].lng === path[path.length - 1].lng) {
    	    console.error("Start and end points are the same.");
    	    return;
    	}

        // 현재의 경로 (path)를 사용하여 Directions API 요청을 생성합니다.
        var directionsService = new google.maps.DirectionsService();

        var waypoints = path.slice(1, -1).map(function(location) {
            return {
                location: location,
                stopover: true
            };
        });
        
        var request = {
                origin: path[0],
                destination: path[path.length - 1],
                waypoints: waypoints,
                optimizeWaypoints: true,
                travelMode: 'DRIVING'
            };
            console.log("Directions API request:", request);

        
            directionsService.route(request, function(response, status) {
            	 console.log("Directions API Response:", response);
            	 console.log("Optimized waypoint order:", response.routes[0].waypoint_order);
                if (status === 'OK') {
                    // DirectionsResult 객체에서 경로 정보를 가져와 지도에 표시합니다.
                    var directionsDisplay = new google.maps.DirectionsRenderer();
                    directionsDisplay.setMap(map);
                    directionsDisplay.setDirections(response);

                    // 최적화된 경로 순서를 얻습니다.
                    var optimizedOrder = response.routes[0].waypoint_order;

                    // 마커 배열을 최적화된 순서대로 재배열합니다.
                    var orderedMarkers = optimizedOrder.map(index => markerArray[index]);
                    markerArray = orderedMarkers;

                    // 마커의 레이블을 업데이트합니다.
                    for (let i = 0; i < markerArray.length; i++) {
                        markerArray[i].setLabel((i + 1).toString());
                    }

                    // 목록의 순서를 업데이트합니다.
                    var memoTextElement = document.querySelector("#day" + day + " #memoText");
                    var items = Array.from(memoTextElement.querySelectorAll(".place-name"));
                    var orderedItems = optimizedOrder.map(index => items[index]);
                    memoTextElement.innerHTML = ''; // 목록을 초기화합니다.
                    orderedItems.forEach(item => {
                        memoTextElement.appendChild(item); // 최적화된 순서대로 목록에 추가합니다.
                    });
                    console.log("Updated memoTextElement:", memoTextElement.innerHTML);

                    // 기존의 polyline, markers, infoWindows를 지웁니다.
                    if (polyline) {
                        polyline.setMap(null);
                    }
                    markerArray.forEach(function(marker) {
                        marker.setMap(null);
                    });
                    distanceInfoWindows.forEach(function(infoWindow) {
                        infoWindow.close();
                    });
                } else {
                    console.error('Directions request failed due to ' + status);
                }
            });
    });
});


</script>

<%-- 추가한 장소 목록들을 드래그 하면 순서를 바꿀 수 있는 기능입니다 --%>
<script>
document.addEventListener('DOMContentLoaded', function() {
    let dragged;

    // draggable 속성을 모든 <li> 요소에 추가합니다.
    document.querySelectorAll('#memoContent li').forEach(function(listItem) {
        listItem.setAttribute('draggable', true);

        // 드래그 시작 시 처리할 내용
        listItem.addEventListener('dragstart', function(e) {
            dragged = this;
            e.dataTransfer.setData('text/plain', this.outerHTML);
        });

        // 드래그 중인 요소 위에 다른 요소가 있을 때의 처리
        listItem.addEventListener('dragover', function(e) {
            e.preventDefault();
        });

        // 드롭 시 처리할 내용
        listItem.addEventListener('drop', function(e) {
            e.preventDefault();
            e.stopPropagation();

            // 드롭 대상 요소의 위치에 드래그 중인 요소를 삽입합니다.
            this.parentNode.insertBefore(dragged, this.nextSibling);

            // "경로 확인" 버튼의 click 이벤트를 강제로 발생시킵니다.
            var parentDayItem = this.closest('.dayItem'); // 현재 <li> 요소의 부모 .dayItem 요소를 찾습니다.
            if (parentDayItem) {
                var routeButton = parentDayItem.querySelector('.btn.btn-outline-primary');
                if (routeButton) {
                    routeButton.click(); // "경로 확인" 버튼의 click 이벤트를 발생시킵니다.
                }
            }
        });
    });
});
</script>

<%-- 동선 최적화 버튼의 활성화 조건이 있는 스크립트입니다--%>
<script>


</script>



</body>
</html>

