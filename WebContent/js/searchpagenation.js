$(document).ready(function(){
	
	
	var searchCategoryValue = $('#search-category-selectbox');
	var searchNameValue = $('#search-name-value');
	var searchHashTagValue = $('#search-hashtag-value');
	var searchResult = $('#search-result');
	var searchReplayBtn = $('#search-btn-replay');
	var searchbar = $('#search-bar');
	
	$('#search-btn').click(function(){
		$('#search-form').submit();
		searchbar.hide();
	});
	searchReplayBtn.click(function(){
		$('#search-bar').show();
		searchReplayBtn.hide();

	});
	
});