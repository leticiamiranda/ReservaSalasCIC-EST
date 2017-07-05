jQuery(document).ready(function ($){
    $(window).scroll(function () {
        if ($(document).scrollTop() <= 40) {
            $('#header-full').removeClass('small');
            $('.tabs-blur').removeClass('no-blur');
            $('#main-header').removeClass('small');
        } else {
            $('#header-full').addClass('small');
            $('.tabs-blur').addClass('no-blur');
            $('#main-header').addClass('small');
        }
    });
	$(".open-menu").click(function(){
	    $("body").addClass("no-move");
	});
	$(".close-menu, .close-menu-big").click(function(){
	    $("body").removeClass("no-move");
	});
});
