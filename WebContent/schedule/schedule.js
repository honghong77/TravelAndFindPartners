document.addEventListener("DOMContentLoaded", function() {
    var searchInput = document.getElementById('searchInput');

    // 엔터키 입력 이벤트
    searchInput.addEventListener('keydown', function(event) {
        if (event.key === "Enter") {
            performSearch(searchInput.value);
        }
    });
});

function performSearch(query) {
    if (query) {
        // 여기에 검색 로직을 추가하십시오.
        console.log("검색어:", query); // 현재는 콘솔에 검색어를 출력합니다.
    }
}







	$(document).ready(
			function() {
				var dateRangeInput = $('.input-daterange');

				dateRangeInput.datepicker({
					format : 'yyyy-mm-dd',
					startDate : '0d',
					endDate : '+1y',
					autoclose : true,
				});

				$('#dateButton').click(function(e) {
					e.preventDefault();
					dateRangeInput.show();
					$(this).hide();
				});

				dateRangeInput.on('changeDate', function() {
					if ($('input[name="end"]').val()) {
						$('#dateButton').text(
								$('input[name="start"]').val() + ' - '
										+ $('input[name="end"]').val());
						dateRangeInput.hide();
						$('#dateButton').show();
					}
				});
			});



	$(document).ready(function() {
		var locationList = ["서울", "부산", "인천", "대구", "광주", "대전", "울산", "세종", "경기", "강원", "충북", "충남", "전북", "전남", "경북", "경남", "제주"];
		var locationButton = $('.btn-primary[type="submit"]');
		
		/*locationButton.click(function(e) {
			e.preventDefault();
			$('#location-list-div').show();
			$('.container *').prop('disabled', true);
			locationList.forEach(function(location) {
				$('#location-list').append('<li class="list-group-item">' + location + '</li>');
			});
			$('#location-list .list-group-item').click(function() {
				locationButton.text($(this).text());
				$('#location-list-div').hide();
				$('#location-list').empty();
				$('.container *').prop('disabled', false);
			});
		});*/
	});