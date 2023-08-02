<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../layout/header.jsp" %>

<div class="container">
	<input class="form-control mb-4" placeholder="어디로 여행가시나요?">

	<div class="row row-cols-1 row-cols-md-3 g-4">
        <% for(int i = 0; i < 8; i++) { %>
		<div class="col">
			<div class="card h-100">
				<div id="map<%= i %>" style="height: 200px;"></div>
				<div class="card-body">
					<h5 class="card-title">Card title</h5>
					<p class="card-text">This card has supporting text below as a
						natural lead-in to additional content.</p>
						<a class="btn btn-primary" href="#" role="button">Link</a>
				</div>
				<div class="card-footer">
					<small class="text-muted">Last updated 3 mins ago</small>
				</div>
			</div>
		</div>
        <% } %>
	</div>
</div>

<script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAbBV-mR71MB1Oc8kwqjn0bcIG7BEFDGuE&callback=initMap&v=weekly" defer></script>

<script>
    function initMap() {
        for(let i = 0; i < 8; i++) {
            let map = new google.maps.Map(document.getElementById("map" + i), {
                zoom: 5,
                center: { lat: 37, lng: 128 },
                mapTypeControl: false,
            });
        }
    }
</script>

<%@ include file="../layout/footer.jsp" %>
