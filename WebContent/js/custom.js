$(document).ready(function(){
	
	
	$('#custom-nav').bind({
		mouseenter: function() {
			var $btn=$('.nav-sub');
			if(!$btn.is(':animated')) $btn.slideDown(400);
		},
		mouseleave: function() {
			$('.nav-sub').slideUp(400);
		}
	});
});

