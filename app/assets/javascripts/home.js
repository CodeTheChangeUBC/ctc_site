// For heading styling. Highlight tab of current page. 
$( document ).ready( function () { 
	$('.nav li').on('click', function() {
		$('.nav li').each(function() {
			$(this).removeClass('active');
		});
		$(this).addClass('active');
	});
});

// Unhightlight all other tabs when logo is clicked
$( document ).ready( function () {
	$('.header .navbar-brand').on('click', function() {
		$('.nav li').each( function() {
			$(this).removeClass('active');	
		});
	});
});

