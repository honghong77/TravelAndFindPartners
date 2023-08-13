$(document).ready(function() {
    // 자동 슬라이드 시작
    setInterval(function() {
        $(".banner img").animate({marginLeft: "-100%"}, 1000, function() {
            $(this).css("margin-left", 0).appendTo(".banner");
        });
    }, 5000); // 5초마다 슬라이드
});