<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <style>
header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 20px;
	width: 90%;
	z-index: 9999;
}

body {
	padding-top: 2px;
	margin: 0;
	padding: 0;
}

button {
	margin: 0 10px;
	padding: 10px;
}

.left {
	display: flex;
	align-items: center;
}

img {
	margin-right: 20px;
}

main {
	display: grid;
	grid-template-rows: 1fr auto;
	grid-template-columns: repeat(4, 1fr);
	gap: 30px;
	padding: 20px 100px 20px 100px;
	height: calc(100vh - 120px);
	margin-top: 40px;
	padding-top: 60px;
}

.content {
	display: grid;
	grid-template-columns: repeat(4, 1fr);
}

.pagination {
	grid-row: 2;
	grid-column: span 4;
	display: flex;
	justify-content: center;
	padding: 20px 0;
}

.box {
	border-color: #000000;
	border-radius: 14px;
	border-style: solid;
	border-width: 1px;
	box-shadow: #191919 0px 6px 10px 0px;
	font-size: 14px;
	line-height: 16.1px;
	margin: 0px 0px 24px;
	padding: 20px;
	width: 200px;
	min-height: 25vh;
	display: flex;
	justify-content: center;
	align-items: center;
	text-align: center;
}

#search-area {
	grid-column: span 4;
	display: flex;
	justify-content: flex-end;
	align-items: center;
}

footer {
	padding: 20px;
	text-align: center;
	background-color: #f2f2f2;
}
.modal {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: rgba(0, 0, 0, 0.5);
        display: flex;
        justify-content: center;
        align-items: center;
        z-index: 9999;
        display: none;  /* 초기에는 숨김 */
    }
    
    .modal-content {
        background: white;
        padding: 20px;
        border-radius: 20px;
        width: 50%;  /* 적절한 크기로 조정해야 함 */
    }
</style>
</head>














<body>
    <header>
        <div class="left">
            <img src="https://tripsoda.com/images/common/logo.svg" alt="A description of the image">
            <button id="home">홈</button>
            <button id="companion">동행</button>
            <a href="schedule.jsp"><button id="schedule">일정</button></a>
        </div>
        <div class="right" id="right-side">
        <button id="write">작성하기</button>
        <button id="login">로그인</button>
        <button id="signup">회원가입</button>
    </div>
    </header>
    <!-- HTML 수정: 모달 div 추가 -->
    <div id="modal" class="modal">
        <div class="modal-content">
          
        </div>
    </div>
    <div id="search-area">
        <input type="text" id="search-input" placeholder="여행 계획 검색...">
        <button id="search-button">검색</button>
    </div>
    <main id="main-content">
 
    </main>
    <div class="pagination">
        <!-- Pagination은 JavaScript에 의해 채워질 것입니다 -->
    </div>
    <footer>
        This is a company description. We plan great travels!
    </footer>
    
    
    
    
    
    
    
    
    
    
    
    
   <script>
const travelPlans = [
    "Travel Plan 1", "Travel Plan 2", "Travel Plan 3", "Travel Plan 4",
    "Travel Plan 5", "Travel Plan 6", "Travel Plan 7", "Travel Plan 8",
    "Travel Plan 9", "Travel Plan 10", "Travel Plan 11", "Travel Plan 12",
    "Travel Plan 13", "Travel Plan 14", "Travel Plan 15", "Travel Plan 16",
    "Travel Plan 17", "Travel Plan 18", "Travel Plan 19", "Travel Plan 20"
];

const plansPerPage = 16; 
let currentPage = 1;

function showPage(page, plans = travelPlans) {
    const mainContent = document.querySelector('main');
    mainContent.innerHTML = '';

    const startIndex = (page - 1) * plansPerPage;
    const endIndex = startIndex + plansPerPage;
    const plansToShow = plans.slice(startIndex, endIndex);

    for (let plan of plansToShow) {
        const div = document.createElement('div');
        div.classList.add('box');
        div.textContent = plan;
        mainContent.appendChild(div);
    }
}

function setupPagination(plans = travelPlans) {
    const paginationDiv = document.querySelector('.pagination');
    paginationDiv.innerHTML = '';

    const numberOfPages = Math.ceil(plans.length / plansPerPage);
    for (let i = 1; i <= numberOfPages; i++) {
        const button = document.createElement('button');
        button.textContent = i;
        button.addEventListener('click', function() {
            currentPage = i;
            showPage(i, plans);
        });
        paginationDiv.appendChild(button);
    }
}

showPage(currentPage);
setupPagination();

let newDiv = null;

document.getElementById('write').addEventListener('click', function() {
    if (newDiv) {
        newDiv.remove();
        newDiv = null; 
    } else {
        newDiv = document.createElement('div');
        newDiv.style.backgroundColor = '#ffffff';
        newDiv.style.borderColor = '#e9e9e9';
        newDiv.style.borderRadius = '10px';
        newDiv.style.borderStyle = 'solid';
        newDiv.style.borderWidth = '1px';
        newDiv.style.fontSize = '14px';
        newDiv.style.lineHeight = '16.1px';
        newDiv.style.margin = '0px 23px 0px 0px';

        const button1 = document.createElement('button');
        button1.textContent = '동행 모집하기';
        button1.style.alignItems = 'center';
        button1.style.backgroundColor = '#f8f8f8';
        button1.style.display = 'flex';
        button1.style.fontFamily = 'NotoSansKR';
        button1.style.fontSize = '14px';
        button1.style.justifyContent = 'center';
        button1.style.lineHeight = '16.1px';
        button1.style.textAlign = 'center';

        const button2 = document.createElement('button');
        button2.textContent = '여행 일정 만들기';
        button2.style.alignItems = 'center';
        button2.style.backgroundColor = '#f8f8f8';
        button2.style.display = 'flex';
        button2.style.fontFamily = 'NotoSansKR';
        button2.style.fontSize = '14px';
        button2.style.justifyContent = 'center';
        button2.style.lineHeight = '16.1px';
        button2.style.textAlign = 'center';

        newDiv.appendChild(button1);
        newDiv.appendChild(button2);
        document.getElementById('right-side').appendChild(newDiv);

        button2.addEventListener('click', function() {
            document.getElementById('modal').style.display = 'flex';
        });
    }ㄷㄹ

    window.onclick = function(event) {
        const modal = document.getElementById('modal');
        if (event.target === modal) {
            modal.style.display = 'none';
        }
    };

    button2.addEventListener('click', function() {
        document.getElementById('modal').style.display = 'flex';

        const modalContent = document.querySelector('.modal-content');
        modalContent.innerHTML = '';

        const div1 = document.createElement('div');
        div1.style.alignItems = 'center';
        div1.style.display = 'flex';
        div1.style.fontSize = '14px';
        div1.
        div2.style.lineHeight = '16.1px';
        modalContent.appendChild(div2);
style.justifyContent = 'center';
        div1.style.lineHeight = '16.1px';
        div1.textContent = '대륙(필수)';
        modalContent.appendChild(div1);

        const h2 = document.createElement('h2');
        h2.style.fontFamily = 'NotoSansKR';
        h2.style.fontSize = '28px';
        h2.style.fontWeight = '500';
        h2.style.lineHeight = '41px';
        h2.style.padding = '24px 0px 30px';
        h2.textContent = '어디로 떠나시나요?';
        modalContent.appendChild(h2);

        const div2 = document.createElement('div');
        div2.style.fontSize = '14px';
        const cities = ['서울', '부산', '대구', '광주', '대전', '울산', '인천', '세종', '경기', '강원', '충북', '충남', '경북', '경남', '전북', '전남', '제주'];

        for (let city of cities) {
            const button = document.createElement('button');
            button.style.alignItems = 'flex-start';
            button.style.backgroundColor = '#f8f8f8';
            button.style.borderRadius = '10px';
            button.style.color = '#252525';
            button.style.display = 'inline-block';
            button.style.fontFamily = 'NotoSansKR';
            button.style.fontSize = '14px';
            button.style.lineHeight = '16.1px';
            button.style.margin = '0px 9.26562px 14px';
            button.style.textAlign = 'center';
            button.textContent = city;
            div2.appendChild(button);
        }
    });
});
</script>

</body>
</html>








