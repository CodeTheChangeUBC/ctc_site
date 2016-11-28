/* Fade in on scroll function. */
$(window).scroll( function(){

    /* Check the location of each desired element */
    $('.fade-in').each( function(){

        var bottom_of_object = $(this).offset().top + $(this).outerHeight();
        var bottom_of_window = $(window).scrollTop() + $(window).height();

        /* If the object is completely visible in the window, fade it in */
        if( bottom_of_window > bottom_of_object ){
            $(this).animate({'opacity':'1'}, 500);
        }
    });
});

/* Fade in on delay function. */
$(document).ready(function() {
    $('.fade-in-delayed').each( function(){

        /* Get number of miliseconds to delay from rel attribute */
        var delay = parseInt($(this).attr('rel'));
        $(this).delay(delay).queue(function() {

            $(this).animate({'opacity':'1'}, 500);
            $(this).dequeue();

        });
    });
});

// var mouse_position;
// var animating = false;
// //GET MOUSE POSITION
// $(document).mousemove(function (e) {
//     mouse_position = e.clientX;
//     if (animating) {
//         return;
//     }
//
//     if (mouse_position < 200 || $('#intro-sidebar').is(':hover')) {
//         //SLIDE IN MENU
//         animating = true;
//         $('#intro-sidebar').animate({
//             left: 0,
//             opacity: 1
//         }, 200, function () {
//             animating = false;
//         });
//     } else if (mouse_position > 200) {
//         animating = true;
//         $('#intro-sidebar').animate({
//             left: -1200,
//             opacity: 0
//         }, 500, function () {
//             animating = false;
//         });
//     }
// });
