<%@page import="dbutil.DBUtil"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="companionBoard.Companion2"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>여행 동행 사이트</title>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous"> 
    <style>
        .banner-container {
            width: 1200px;
            height: 500px;
            margin: 0 auto;
            position: relative;
            overflow: hidden;
        }
        .swiper-container {
            width: 1500px;
            height: 100%;
        }
        .swiper-slide {
            display: flex;
            justify-content: center;
        }
        .swiper-slide img {
            margin-top: 25px;
            width: 100%;
            height: 500px;
            object-fit: contain;
        }
        
        /* 헤더와의 마진을 추가 */
        .banner-container {
		    position: relative;
		    display: flex;
		    align-items: flex-end;
		}
		.accompany-text {
			position: relative;
			
		}
	</style>
</head>
<body>

    <%-- 헤더 --%>
    <%@ include file="/WEB-INF/view/layout/header.jsp"%>

    <%-- 배너 --%>
    <div class="banner-container" style="width: 100%; max-width: 1600px; margin: 0 auto;">
        <div class="swiper-container">
            <div class="swiper-wrapper">
                <div class="swiper-slide">
                    <a href="https://www.hsg.go.kr/tour/contents.do?key=1375" target="_blank">
                        <img src="./images/1.jpg" alt="이미지 1" style="width: 100%; max-width: 1500px;">
                    </a>
                </div>
                <div class="swiper-slide">
                    <a href="https://culture.seoul.go.kr/culture/culture/cultureEvent/view.do?cultcode=142223&menuNo=200008" target="_blank">
                        <img src="./images/2.jpg" alt="이미지 2" style="width: 100%; max-width: 1500px;">
                    </a>
                </div>
                <div class="swiper-slide">
                    <a href="https://korean.visitkorea.or.kr/kfes/detail/fstvlDetail.do?fstvlCntntsId=61868dbd-e352-418c-a6f3-9cd0684c5cf7" target="_blank">
                        <img src="./images/3.jpg" alt="이미지 3" style="width: 100%; max-width: 1500px;">
                    </a>
                </div>
            </div>
            <!-- 네비게이션 및 페이징 버튼을 감싸는 추가적인 div 요소를 추가 -->
            <div class="swiper-button-next"></div>
            <div class="swiper-button-prev"></div>
            <div class="swiper-pagination"></div>
        </div>
    </div>
    
      
    <%-- 내용 --%>
    <div class="container" style="margin-left: 420px; margin-top: 30px">
	    <session>
	        <div class="accompany-text" style="display: flex; justify-content: space-between; align-items: center;">
	        	<h2>동행</h2>
	    	</div>
        	<span style="float: right;"><a href="companion">동행 더보기</a></span>
	    	<div class="row row-cols-1 row-cols-md-3 g-4">
			  <div class="col">
			    <div class="card h-100">
			      <img src="..." class="card-img-top" alt="..." id="companion-image1">
			      <div class="card-body">
			        <h5 class="card-title" id="companion-title1">Card title</h5>
			        <p class="card-text" id="companion-content1">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
			      </div>
			    </div>
			  </div>
			  <div class="col">
			    <div class="card h-100">
			      <img src="..." class="card-img-top" alt="..." id="companion-image2">
			      <div class="card-body">
			        <h5 class="card-title" id="companion-title2">Card title</h5>
			        <p class="card-text" id="companion-content2">This is a short card.</p>
			      </div>
			    </div>
			  </div>
			  <div class="col">
			    <div class="card h-100">
			      <img src="..." class="card-img-top" alt="..." id="companion-image3">
			      <div class="card-body">
			        <h5 class="card-title" id="companion-title3">Card title</h5>
			        <p class="card-text" id="companion-content3">This is a longer card with supporting text below as a natural lead-in to additional content.</p>
			      </div>
			    </div>
			  </div>
			  <div class="col">
			    <div class="card h-100">
			      <img src="..." class="card-img-top" alt="..." id="companion-image4">
			      <div class="card-body">
			        <h5 class="card-title" id="companion-title4">Card title</h5>
			        <p class="card-text" id="companion-content4">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
			      </div>
			    </div>
			  </div>
			  <div class="col">
			    <div class="card h-100">
			      <img src="..." class="card-img-top" alt="..." id="companion-image5">
			      <div class="card-body">
			        <h5 class="card-title"  id="companion-title5">Card title</h5>
			        <p class="card-text" id="companion-content5">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
			      </div>
			    </div>
			  </div>
			  <div class="col">
			    <div class="card h-100">
			      <img src="..." class="card-img-top" alt="..." id="companion-image6">
			      <div class="card-body">
			        <h5 class="card-title"  id="companion-title6">Card title</h5>
			        <p class="card-text" id="companion-content6">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
			      </div>
			    </div>
			  </div>
			</div>
	    </session>
	    
	    <session>
	        <div class="accompany-text" style="display: flex; justify-content: space-between; align-items: center;">
	        	<h2 style="margin-top: 30px">일정</h2>
	    	</div>
	    	<span style="float: right;"><a href="hello">일정 더보기</a></span>
	    <%-- 일정게시판의 동적 페이지 넘기기 DB 기능입니다 --%>
	<%
		String pageStr = request.getParameter("page");
	int currentPage = (pageStr == null || pageStr.equals("")) ? 1 : Integer.parseInt(pageStr);

	Connection conn = DBUtil.getConnection();
	Statement st = null;
	ResultSet rs = null;

	int recordsPerPage = 6;
	int offset = (currentPage - 1) * recordsPerPage;
	String sql = "SELECT * FROM travel LIMIT " + recordsPerPage + " OFFSET " + offset; // 테이블 이름과 컬럼 이름 수정
	st = conn.createStatement();
	rs = st.executeQuery(sql);

	int totalRecords = 0;
	Statement countSt = conn.createStatement();
	try {
		String countSql = "SELECT COUNT(*) FROM travel"; // 테이블 이름 수정
		ResultSet countRs = countSt.executeQuery(countSql);
		if (countRs.next()) {
			totalRecords = countRs.getInt(1);
		}
		countRs.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
	countSt.close();
	%>

	<%-- 일정게시판의 카드 틀입니다 --%>
	<div class="row row-cols-1 row-cols-md-3 g-4">
		<%
			while (rs.next()) {
			int travelId = rs.getInt("travel_id");
		%>
		<div class="col">
			<div class="card h-100">
				<iframe id="mapView<%=travelId%>" frameborder="0" style="border: 0; width: 100%; height: 100%;" src="https://www.google.com/maps/embed/v1/place?key=AIzaSyAbBV-mR71MB1Oc8kwqjn0bcIG7BEFDGuE&q=<%=rs.getString("location")%>&center=<%=rs.getDouble("latitude")%>,<%=rs.getDouble("longitude")%>" allowfullscreen> </iframe>

				<div class="card-body"><%=rs.getString("memo")%>
					<h5 class="card-title"></h5>
					<p class="card-text"></p><%=rs.getString("location")%>
					<p class="card-text">
						<small class="text-muted"><%=rs.getString("member_id")%>님의 여행 일정</small>
					</p>
					<a href="#" class="btn btn-primary mr-4" data-toggle="modal" data-target="#modal<%=travelId%>">일정 간략히 보기</a> 
					<a href="#" class="btn btn-primary" onclick="travelIdAlert(<%=travelId%>);">일정 상세 보기</a>
				</div>

				<div class="card-footer">
					<small class="text-body-secondary"><%=rs.getString("start_date")%>부터
						<%=rs.getString("end_date")%>까지</small>
				</div>
			</div>
		</div>

		<%-- 일정 간략히 보기를 클릭했을 때 생성되는 모달입니다 --%>
		<div class="modal fade" id="modal<%=travelId%>" tabindex="-1" role="dialog" aria-labelledby="modalLabel<%=travelId%>" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered modal-lg" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="modalLabel<%=travelId%>">날짜별 일정 계획</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<%-- travel_location 정보 표시 --%>
						<%
							String locationQuery = "SELECT * FROM travel_location WHERE travel_id = " + travelId;
						Statement locationSt = conn.createStatement();
						ResultSet locationRs = locationSt.executeQuery(locationQuery);

						while (locationRs.next()) {
							String locationName = locationRs.getString("location_name");
							String date = locationRs.getString("date");
							String memo = locationRs.getString("memo");
						%>
						<div class="border-top pt-2">
							<p>
								<strong><%=date%></strong>
							</p>
							<p><%=locationName%></p>
							<p><%=memo%></p>
						</div>
						<%
							}
						locationRs.close();
						locationSt.close();
						%>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
		<%
			}
		%>
	</div>
	<%
		DBUtil.close(conn);
	DBUtil.close(rs);
	DBUtil.close(st);
	%>
	    </session>
	</div>

    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
    <script>
        var swiper = new Swiper('.swiper-container', {
            loop: true,
            autoplay: {
                delay: 5000,
            },
            navigation: {
                nextEl: '.swiper-button-next',
                prevEl: '.swiper-button-prev',
            },
            pagination: {
                el: '.swiper-pagination',
            },
        });
        
        const companionList = <%= request.getAttribute("json") %>;
        
        for (let i = 0; i < companionList.length; i++) {

          	const companion = companionList[i];
          	const title = document.getElementById("companion-title" + (i + 1));
          	const content = document.getElementById("companion-content" + (i + 1));
          	const image = document.getElementById("companion-image" + (i + 1));
          	title.innerText = companion.title;
          	content.innerText = companion.content;
          	
          	const base64Image = companion.image;
        	console.log(base64Image);
        		
            const byteCharacters = atob(base64Image);
            const byteArrays = [];
            
            for (let i = 0; i < byteCharacters.length; i++) {
                byteArrays.push(byteCharacters.charCodeAt(i));
            }
            console.log(byteArrays);
            
            const blob = new Blob([new Uint8Array(byteArrays)], { type: 'image/png' });
            console.log(blob);

            const imageUrl = URL.createObjectURL(blob);
            console.log(imageUrl);

            image.src = imageUrl;
        }
        
        
    </script>
    
    <%-- 푸터 --%>
    <%@ include file="/WEB-INF/view/layout/footer.jsp"%>
</body>
</html>
