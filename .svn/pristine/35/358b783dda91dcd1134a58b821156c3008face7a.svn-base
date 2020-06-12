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
	var count = 1;
	$('#count-plus').click(function(){
		var totalPrice = 0;
		var price = $('#product-price').text();
		
		count++;
		$('#count').val(count);
		
		totalPrice = count * price;
		$('#product-total-price').text(totalPrice);
	});
	$('#count-minus').click(function(){
		var totalPrice = 0;
		var price = $('#product-price').text();

		if(!(count == 0)){
			count--;
			$('#count').val(count);
		}

		totalPrice = count * price;
		$('#product-total-price').text(totalPrice);
		
	});
});

