<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/layout/header.jsp"%>

<style>
    .form-control-date {
        width: 100px;
        height: 50px;
    }
    .pagination {
        justify-content: center;
        margin-top: 50px;
    }
</style>

<link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.min.css">

<div class="container">
    <div class="row">
        <div class="col-12">
            <div class="input-group">
                <div class="input-group-prepend">
                    <span class="input-group-text" id="basic-addon1">날짜</span>
                </div>
                <input type="text" class="form-control form-control-date" id="datepicker" name="date" aria-describedby="basic-addon1">
            </div>
        </div>
    </div>

    <%@ page import="java.sql.*" %>
    <%@ page import="dbutil.DBUtil" %>
    <%
        Connection conn = DBUtil.getConnection();
        Statement st = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM scheduleboard";
        st = conn.createStatement();
        rs = st.executeQuery(sql);
    %>

    <div class="row row-cols-1 row-cols-md-3 g-4">
        <% while(rs.next()) { %>
            <div class="col">
                <div class="card h-100">
<%--                     <div id="map<%= rs.getInt("no") %>" style="height: 200px;"
                        data-lat="<%= rs.getDouble("wido") %>" data-lng="<%= rs.getDouble("gyeongdo") %>"></div> --%>
                        
                        <iframe id="mapView" frameborder="0" style="border:0; width:100%; height:100%;"
            			src="https://www.google.com/maps/embed/v1/place?key=AIzaSyAbBV-mR71MB1Oc8kwqjn0bcIG7BEFDGuE&q=<%= rs.getString("location") %>&center=<%= rs.getDouble("wido")%>,<%= rs.getDouble("gyeongdo")%>"  allowfullscreen>
    				</iframe>
                        
                    <div class="card-body">
                        <h5 class="card-title"><%= rs.getDouble("wido") %>,<%= rs.getDouble("gyeongdo") %></h5>
                        <h5 class="card-title"><%= rs.getString("location") %></h5>
                        <p class="card-text"><%= rs.getString("memo") %></p>
                        <p class="card-text"><small class="text-muted"><%= rs.getString("startwhen") %></small></p>
                    </div>
                </div>
            </div>
        <% } %>
    </div>

    <%
        DBUtil.close(conn);
        DBUtil.close(rs);
        DBUtil.close(st);
    
    %>

<nav aria-label="...">
  <ul class="pagination">
    <li class="page-item disabled">
      <a class="page-link">Previous</a>
    </li>
    <li class="page-item"><a class="page-link" href="#">1</a></li>
    <li class="page-item active" aria-current="page">
      <a class="page-link" href="#">2</a>
    </li>
    <li class="page-item"><a class="page-link" href="#">3</a></li>
    <li class="page-item">
      <a class="page-link" href="#">Next</a>
    </li>
  </ul>

<%@ include file="/WEB-INF/view/layout/footer.jsp"%>

<script src="schedule.js"></script>

<script>

function initAllMaps () {

	var maps = document.querySelectorAll('[id^="map"]');
	
	maps.forEach(function(mapElement) {
		
		const lat = parseFloat(mapElement.dataset.lat);
		const lng = parseFloat(mapElement.dataset.lng);
	    const mapDivId = mapElement.id;
		
		console.log("lat : " + typeof lat);
		console.log(typeof 37);
		console.log(lng);

		const centerTest = { lat: parseFloat(mapElement.dataset.lat), lng:  parseFloat(mapElement.dataset.lng) };
		
	    const map = new google.maps.Map(document.getElementById(mapDivId), {
	        zoom: 10,
	        center: {"lat" : lat, "lng" : lng}
	    });
	    
 	    const marker = new google.maps.Marker({
	        position: {lat: lat, lng:  lng},
	        map: map
	      }); 
	    
	})
	
};

/* var maps = document.querySelectorAll('[id^="map"]');
console.log(maps);
maps.forEach(function(mapElement) {
	console.log(mapElement.id);
	
	let map = new google.maps.Map(mapElement.id, {
	    center: { lat: 37.5400456, lng: 126.9921017 },
	    zoom: 10,
	  });

}) */

</script>

<!-- <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAbBV-mR71MB1Oc8kwqjn0bcIG7BEFDGuE&callback=initAllMaps"></script> -->

