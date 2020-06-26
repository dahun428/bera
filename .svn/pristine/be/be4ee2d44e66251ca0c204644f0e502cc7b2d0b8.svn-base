$(document).ready(function(){

   var request = new Request();
   var productNo = request.getParameter("productNo");
   
   var pageNo = 1;
   
   $.ajax({
      type:"post",
      url:"../reviewPagination",
      dataType:"json",
      data:{
         'productNo' : productNo,
         'pageNo' : pageNo
      },
      success:function(data){
         var list = JSON.parse(data.list);
         var totalPage = data.totalPage;
         
         for(var i = 0; i < list.length; i++){

            var no = list[i].no;
            var imagePath = list[i].imagePath;
            var deleted = list[i].deleted;
            var reviewId = 'review-'+no;

            var innerhtml = '<div class="col-3 custom-review-img-box" id='+reviewId+' style="margin:10px 0 10px 0;">'
               +'<div><a onclick="openPopup('+no+',event,'+productNo+')" href="#" data-toggle="modal" data-target="#review-column-01">'
               +'<img src="../image/REVIEW/'+imagePath+'" id="images-1" class="img-thumbnail"/>'
               +'</a></div>'
               +'</div>'


            var target = $('#review-list');

            target.append(innerhtml);

         }
         
         
         var btnTarget = $('#plus-btn');
         var button = 
            '<button id="plus" type="button" class="btn btn-outline-primary btn-lg" onclick="plusPage()">'
            +'더보기<span><i class="fas fa-plus"></i></span></button>';
         
         if(pageNo < totalPage){
            btnTarget.append(button);
         }
         
         
         
      }
   });
});

function plusPage(){
	
   // Request 객체 생성
   var request = new Request();
   // test 라는 파라메터 값을 얻기
   var pageNo = $('#plus-number').val(); // 쿼리셀렉트.value;
   pageNo++;
   $('#plus-number').val(pageNo); //value = value(pageNo)

   var productNo = request.getParameter("productNo");
   
   $.ajax({
      type:"post",
      url:"../reviewPagination",
      dataType:"json",
      data:{
         'productNo' : productNo,
         'pageNo' : pageNo
      },
      success:function(data){
    	  var list = JSON.parse(data.list);
    	  console.log(list);
    	  console.log(productNo);
         var totalPage = data.totalPage;
         
         for(var i = 0; i < list.length; i++){

            var no = list[i].no;
            var imagePath = list[i].imagePath;
            var noImagePath = '../image/no_detail_img.jpg';
            var deleted = list[i].deleted;
            var reviewId = 'review-'+no;
            var innerhtml = '<div class="col-3 custom-review-img-box" id='+reviewId+' style="margin:10px 0 10px 0;">'
            +'<div><a onclick="openPopup('+no+',event,'+productNo+')" href="#" data-toggle="modal" data-target="#review-column-01">'
            +'<img src="../image/REVIEW/'+imagePath+'" style="float: left;" id="images-1" class="img-thumbnail"/>'
            +'</a></div>'
            +'</div>'


            var target = $('#review-list');
            target.append(innerhtml);
         }
         var btnTarget = $('#plus-btn');
         if(pageNo == totalPage){
            btnTarget.remove();
         }
         
         
      }
   });
};



function Request(){
   var requestParam ="";

   //getParameter 펑션
   this.getParameter = function(param){
      //현재 주소를 decoding
      var url = unescape(location.href);
      //파라미터만 자르고, 다시 &그분자를 잘라서 배열에 넣는다. 
      var paramArr = (url.substring(url.indexOf("?")+1,url.length)).split("&"); 

      for(var i = 0 ; i < paramArr.length ; i++){
         var temp = paramArr[i].split("="); //파라미터 변수명을 담음

         if(temp[0].toUpperCase() == param.toUpperCase()){
            // 변수명과 일치할 경우 데이터 삽입
            requestParam = paramArr[i].split("=")[1]; 
            break;
         }
      }
      return requestParam;
   }
}

