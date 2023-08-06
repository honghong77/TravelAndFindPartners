

/*
	window.initMap = function () {
  const map = new google.maps.Map(document.getElementById("map"), {
    center: { lat: 37.5400456, lng: 126.9921017 },
    zoom: 10,
  });
};
*/




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


<!-- Here is the newly added script for location list -->
	$(document).ready(function() {
		var locationList = ["서울", "부산", "인천", "대구", "광주", "대전", "울산", "세종", "경기", "강원", "충북", "충남", "전북", "전남", "경북", "경남", "제주"];
		var locationButton = $('.btn-primary[type="submit"]');
		
		locationButton.click(function(e) {
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
		});
	});