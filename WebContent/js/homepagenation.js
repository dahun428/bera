//ajax pagenation function
//로드되었을때 나타나는 페이지
var rowsPerPage = 4;
var pagesPerBlock = 5;

$(document).ready(function(){
	var progressEventTarget = $('#progress-event');
	var progressEventPagenationTarget = $('#progress-event-pagenation');
	var rankProductTarget = $('#ranking-ice');
	var rankProductPagenationTaget = $('#ranking-ice-pagenation');
	
	var pageNo = 1;
	
	$.ajax({
		type:"POST",
		url:"homeBodyPagenation",
		dataType:"json",
		data:{
			'pageNo': pageNo,
			'rowsPerPage': rowsPerPage,
			'pagesPerBlock': pagesPerBlock
		},
		success:function(result){
			console.log('success');
			console.log(result);
			var progressEvent = JSON.parse(result.progressEventList);
			var progressEventTotalRows = result.progressEventTotalRows;
			var rankProducts = JSON.parse(result.rankingProductList);
			var rankProductsTotalRows = result.rankingProductListTotalRows;

			
			//진행중 이벤트리스트
			eventLoop(progressEventTarget, progressEvent);
			progressEventPagenationTarget.pagenation(rowsPerPage,pagesPerBlock,pageNo,progressEventTotalRows);
		
			eventLoopProduct(rankProductTarget, rankProducts);
			rankProductPagenationTaget.pagenation(rowsPerPage,pagesPerBlock,pageNo,rankProductsTotalRows);
			
		}
	});

});

// pagenation 버튼 클릭시 나타나는 list
function changePageNo(no){
	//event.target 함수를 이용해서 타겟된 id 값을 읽어온다.
	
	var targetParent = event.target.id.split('-')[0] + '-' + event.target.id.split('-')[1];
	var targetParentId = '#' + targetParent;
	var targetPagenationNameId = targetParentId + '-pagenation';

	//기존에 있던 데이터를 지운다.
	$(targetParentId).empty();
	$(targetPagenationNameId).empty();
	var target = $(targetParentId);
	var eventType = event.target.id.split('-')[0] + event.target.id.split('-')[1];
	//no 값에 해당하는 데이터를 서버에서 받아와서 ajax로 불러온다.
	var pageNo = no;
	var rowsPerPage = 4;
	var pagesPerBlock = 5;
	
	$.ajax({
		type:"POST",
		url:"homeBodyPagenation",
		dataType:"json",
		data:{
			'type':eventType,
			'pageNo': pageNo,
			'rowsPerPage': rowsPerPage,
			'pagesPerBlock': pagesPerBlock
		},
		success:function(result){
			
			//target이된 list를 json으로 받아와서 갱신한다.
			var eventList = JSON.parse(result.list);
			var totalRows = result.totalRows;
			console.log(target);
			if(targetParent == 'ranking-ice'){
				eventLoopProduct(target, eventList);
				$(targetPagenationNameId).pagenation(rowsPerPage,pagesPerBlock,pageNo,totalRows);
			} else {
				
				eventLoop(target, eventList);
				$(targetPagenationNameId).pagenation(rowsPerPage,pagesPerBlock,pageNo,totalRows);
				
			}
		}
	});
	
};

//String Date 값을  ISO TYPE 날짜 형식으로 바꾸는 함수
function getDate(date){
	var year = date.split(',')[1];
	var month =  date.split('월')[0];
	var day = date.split('월')[1].split(',')[0];
	
	var setDate = year+'년'+month+'월'+day+'일';
	
	return setDate;
};
//pagenation 계산 함수
$.fn.pagenation = function(rowsPerPage, pagesPerBlock, pageNo, totalRows){
	//pagenation 에 해당하는 id 값을 따로 주기 위해서 this 에 해당하는 id 값을 읽어오고, 해당 이름을 pagenation 요소 id 에 전달한다.
	var target = this;
	var targetName = target.attr('id');
	
	var totalPages = Math.ceil(totalRows/rowsPerPage);
	if(pageNo < 0 || pageNo > totalPages){
		pageNo = 1;
	}
	var beginIndex = (pageNo - 1) * rowsPerPage + 1;
	var endIndex = pageNo * rowsPerPage;
	var totalBlock = Math.ceil(totalPages/pagesPerBlock);
	var currentBlock = Math.ceil(pageNo / pagesPerBlock);
	var beginPage = (currentBlock - 1)*pagesPerBlock + 1;
	var endPage = currentBlock * pagesPerBlock;
	if(currentBlock == totalBlock){
		endPage = totalPages;
	}
	
	var pages = "";
	for(var num = beginPage; num <= endPage; num++){
		var active = (pageNo == num) ? "active" : "";
		pages += '<li class="page-item"><a href="#" class="page-link '+active+'" onclick="changePageNo('+num+')" id="'+targetName+'-'+num+'" ">'+num+'</a></li>'
	}
	var beforePage = "";
	if(pageNo > 1){
		var num = pageNo - 1;
		beforePage = '<li class="page-item"><a href="#" class="page-link" onclick="changePageNo('+num+')" id="'+targetName+'-before" >이전</a></li>';
	}
	var afterPage = "";
	if(pageNo < totalPages){
		var num = pageNo + 1;
		afterPage = '<li class="page-item"><a href="#" class="page-link"  onclick="changePageNo('+num+')" id="'+targetName+'-event-next">다음</a></li>';
	}
	var innerHtml = '<ul class="pagination justify-content-center" style="margin: 20px 0;">'
					+ beforePage
					+ pages
					+ afterPage 
					+'</ul>';
	
	
	target.append(innerHtml);
};
function eventLoop(target, list){
	for(var i in list){
		
		var no = list[i].no;
		var title = list[i].title;
		var content = list[i].content;
		var startDate = getDate(list[i].startDate);
		var endDate = getDate(list[i].endDate);
		var isEnd = list[i].ended;
		var eventType = list[i].eventType;
		var isBanner = list[i].isBanner;
		var imagePath = list[i].imagePath;
		if(!imagePath){
			imagePath = 'image/no_detail_img.jpg';
		} else {
			imagePath = 'image/EVENT/'+imagePath;
		}
		var fullDate = startDate + '~' + endDate;
		if(!content){
			content = "";
		}

		var id = target.attr('id') +'-'+ no;
		var btnClass = "";
		if(target.attr('id').split('-')[0] == 'progress'){
			btnClass = target.attr('id') + '-end-btn btn btn-danger';
		} else {
			btnClass = target.attr('id') + '-start-btn btn btn-info';
		}
	
		var Date = startDate+'~'+endDate
		if(endDate.substring(1,5) == "2099"){
			Date = '상시진행'
		}
		var innerhtml = '<div class="col-3" id="'+id+'" >'

			+'<div class="card" style="height:450px; max-hegiht:450px;">'
			+'<div class="card-img">'
			+'<a href="event/detail.jsp?no='+no+'"><img src="'+imagePath+'" alt="" class="card-img-top" />'
			+'</a></div>'
			+'<div class="card-body text-center">'
			+'<div class="card-title" style="margin: auto 0;height:80px; max-height:80px;"><h5 class="color-pink">'+title+'</h5></div>'
			+'<div><div class="card-text text-center">이벤트 일자</div></div>'
			+'<div class="text-info"><div><small>'+Date+'</small></div></div>'
			+'</div></div></div>';
		
		target.append(innerhtml);
		
		$('.progress-event-end-btn').text('종료');
		$('.progress-banner-end-btn').text('종료');
		$('.end-event-start-btn').text('시작');
		$('.end-banner-start-btn').text('시작');
		
	};
};
function eventLoopProduct(target, list){
	for(var i in list){
		console.log(list);
		var no = list[i].no;
		var name = list[i].name;
		var imagePath = list[i].imagePath;

		var innerhtml = '<div class="col-3" >'

			+'<div class="card">'
			+'<div class="card-body text-center">'
			+'<div class="card-title " style="margin: auto 0;height:80px; max-height:80px;"><h5 class="color-pink font-weight-bold">'+name+'</h5></div>'
			+'<div class="card-img">'
			+'<a href="product/detail.jsp?productNo='+no+'"><img src="image/ICECREAM/'+imagePath+'" alt="" class="card-img-top" />'
			+'</a></div>'
			+'</div></div></div>';
		
		target.append(innerhtml);
		
	};
};