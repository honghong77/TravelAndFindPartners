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
    <style>
        .banner-container {
            width: 1200px;
            height: 500px;
            margin: 0 auto;
            position: relative;
            overflow: hidden;
        }
        .swiper-container {
            width: 100%;
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
		
	</style>
</head>
<body>
    <%-- 헤더 --%>
    <%@ include file="/WEB-INF/view/layout/header.jsp"%>

    
    <%-- 배너 --%>
    <div class="banner-container">
        <div class="swiper-container">
            <div class="swiper-wrapper">
                <div class="swiper-slide">
                    <a href="https://www.hsg.go.kr/tour/contents.do?key=1375" target="_blank">
                        <img src="./images/1.jpg" alt="이미지 1">
                    </a>
                </div>
                <div class="swiper-slide">
                    <a href="https://culture.seoul.go.kr/culture/culture/cultureEvent/view.do?cultcode=142223&menuNo=200008" target="_blank">
                        <img src="./images/2.jpg" alt="이미지 2">
                    </a>
                </div>
                <div class="swiper-slide">
                    <a href="https://korean.visitkorea.or.kr/kfes/detail/fstvlDetail.do?fstvlCntntsId=61868dbd-e352-418c-a6f3-9cd0684c5cf7" target="_blank">
                        <img src="./images/3.jpg" alt="이미지 3">
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
    <div class="content">
    <session>
        <div class="accompany-text">
        	<h2>동행</h2>
    	</div>
    	<div class="card-container">
                <!-- 카드 레이아웃 및 내용... -->
            </div>
    </session>
</div>

    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
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
    </script>
    <%-- 푸터 --%>
    <%@ include file="/WEB-INF/view/layout/footer.jsp"%>
</body>
</html>
