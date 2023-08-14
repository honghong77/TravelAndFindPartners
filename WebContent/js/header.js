
$(function(){
    $('.dropdown-head').on("click",function(){
        $("#dropdown-menu").toggleClass('menu-off');
    });
});

var scheduleLink = document.getElementById("scheduleLink");
        var dropdownMenu = document.getElementById("dropdown-menu");

        scheduleLink.addEventListener("click", function(e) {
            e.preventDefault();
            dropdownMenu.classList.toggle("menu-off");
        });

