$(document).ready(function() {
    $('.fade-in-delayed').each( function(){
        
        /* Get number of miliseconds to delay from rel attribute */
        var delay = parseInt($(this).attr('rel'));
        $(this).delay(delay).animate({'opacity':'1'}, 500);
    });
});


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

