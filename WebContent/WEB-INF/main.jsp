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
	    	<div class="row row-cols-1 row-cols-md-3 g-4">
			  <div class="col">
			    <div class="card h-100">
			      <img src="..." class="card-img-top" alt="...">
			      <div class="card-body">
			        <h5 class="card-title">Card title</h5>
			        <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
			      </div>
			    </div>
			  </div>
			  <div class="col">
			    <div class="card h-100">
			      <img src="..." class="card-img-top" alt="...">
			      <div class="card-body">
			        <h5 class="card-title">Card title</h5>
			        <p class="card-text">This is a short card.</p>
			      </div>
			    </div>
			  </div>
			  <div class="col">
			    <div class="card h-100">
			      <img src="..." class="card-img-top" alt="...">
			      <div class="card-body">
			        <h5 class="card-title">Card title</h5>
			        <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content.</p>
			      </div>
			    </div>
			  </div>
			  <div class="col">
			    <div class="card h-100">
			      <img src="..." class="card-img-top" alt="...">
			      <div class="card-body">
			        <h5 class="card-title">Card title</h5>
			        <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
			      </div>
			    </div>
			  </div>
			  <div class="col">
			    <div class="card h-100">
			      <img src="..." class="card-img-top" alt="...">
			      <div class="card-body">
			        <h5 class="card-title">Card title</h5>
			        <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
			      </div>
			    </div>
			  </div>
			  <div class="col">
			    <div class="card h-100">
			      <img src="..." class="card-img-top" alt="...">
			      <div class="card-body">
			        <h5 class="card-title">Card title</h5>
			        <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
			      </div>
			    </div>
			  </div>
			</div>
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
