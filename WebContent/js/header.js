<<<<<<< HEAD
$(function(){
    $('.dropdown-head').on("click",function(){
        $("#dropdown-menu").toggleClass('menu-off');
    });
});
=======
var scheduleLink = document.getElementById("scheduleLink");
        var dropdownMenu = document.getElementById("dropdown-menu");

        scheduleLink.addEventListener("click", function(e) {
            e.preventDefault();
            dropdownMenu.classList.toggle("menu-off");
        });

window.onload = function() {
        var loginButton = document.getElementById("loginButton");
        var sessionID = '<%= session.getAttribute("id") %>'; // 세션에 저장된 id 가져오기

        if (sessionID) {
            loginButton.innerHTML = '<a href="#">마이페이지</a> | <a href="logout">로그아웃</a>';
        } else {
            loginButton.innerHTML = '<a href="login">로그인</a> | <a href="sign">회원가입</a>';
        }
    };
>>>>>>> branch 'myoung' of https://github.com/YunSeongYong/TravelAndFindPartners.git
