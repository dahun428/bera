<%@page import="javafx.scene.control.Pagination"%>
<%@page import="com.br.vo.Review"%>
<%@page import="java.util.List"%>
<%@page import="com.br.dto.ReviewDto"%>
<%@page import="com.br.dao.ReviewDao"%>
<%@page import="com.br.utils.NumberUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<style>
#images-1 {
   width: 250px;
   height: 250px;
}

#imageSize {
   width: 500px;
   height: 500px;
}

</style>
<!-- reivew start -->
<div class="col-12 text-center">
   <div class="row content-header text-center">
      <div class="col-12">
         <h4 class="font-italic">Reviews</h4>
         <!-- hashtag -->
         <p class="font-italic">
            <a href="#" class="custom-hashtag">#뉴욕치즈케이크</a> <a href="#"
               class="custom-hashtag">#배스킨라빈스</a>
         </p>
         <!-- hashtag -->
      </div>
   </div>
   <!-- review content -->
   <% 
   
         ReviewDao reviewDao = new ReviewDao();
         // 리뷰 번호에 해당하는 게시글을 조회한다.
         List<ReviewDto> reviews = reviewDao.getReviewsByProductNo(productNo);
         Review review = new Review();         
         
   %>

   

   <div class="row">
      <!-- list -->
      <div class="col-12">
         <div class="row custom-content-box" id="review-list" ></div>
      </div>
      <!-- list -->
      <div class="col-12 text-right">

      </div>
      <div class="col-12 list-box" id="plus-btn" style="margin: 60px auto;">
         <input type=hidden value="1" id="plus-number" />
      </div>
   </div>
   <!-- review content -->
</div>
<!-- modal -->

<div class="modal fade" tabindex="-1" role="dialog"
   id="review-column-01">
   <div class="modal-dialog modal-xl">
      <div class="modal-content">
         <div class="row no-gutters">
                        <div class="col-md-6" id="imageSize">
                           <img src="../image/REVIEW/" id="images-2" class="card-img"
                              alt="..." style="width: 100%; height: 100%;">
                        </div>
            <div class="col-md-6">
               <div class="row custom-box">
                  <div class="col-12 custom-modal-x">
                     <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                     </button>
                  </div>
                  <div class="col-12">
                     <div class="card-body custom-modal-body">
                        <p class="custom-modal-p">
                        <!-- review id -->
                        <span id="id"></span>
                        <!-- review id -->
                        <!-- review date -->
                        <p>
                           <small class="text-muted">등록일 <span id="date"></span> </small>
                        </p>
                        <!-- review date -->
                        <!-- review title -->
                        <h5 class="card-title">제목 : <span id="title"></span></h5>
                        <!-- review title -->
                        <!-- review content -->
                        <p class="card-text">내용 : <span id="content"></span></p>
                        <!-- review content -->
                     </div>
                  </div>
            <div class="col-12">
                     <div class="modal-footer">
                        <a href="javascript:;"><i class="far fa-heart" id="heart"></i></a>
                        <!-- likes count -->
                        <span class="badge badge-primary text-wrap" id="likes"></span>
                        <p style="color: blue; font-weight: bold; font-family: inherit;"> 좋아요!</p>

                     </div>
                     
                     <div class="modal-footer text-right" id="modify-button">
                        <a class="btn btn-primary" id="modify-link">수정</a>
                        <a class="btn btn-primary" id="del-btn">삭제</a>
                     </div>
                     
                  </div>
               </div>
            </div>
            <!-- review content -->
         </div>
      </div>
   </div>
</div>
<!-- modal end -->
<!-- reivew end -->
<script type="text/javascript" src="../js/reviewPagination.js"> 
</script>
<script type="text/javascript">
function openPopup(no, event, productNo){
   var loginedUserId = "<%=session.getAttribute("LOGINED_USER_ID") %>"
    var loginedAdmin = "<%=session.getAttribute("LOGINED_ADMIN") %>"
    console.log(loginedUserId, loginedAdmin);
    
   event.preventDefault();
   console.log("start ajax")
   $.ajax({
      type:'get',
      url:'../review/data.jsp?reviewNo='+no,
      success:function(data){
      var review = JSON.parse(data);
         
         console.log(review)
         console.log(review.picture);
         document.querySelector("#title").textContent=review.title;
         document.querySelector("#images-2").src="../image/REVIEW/"+review.picture;
         document.querySelector("#id").textContent=review.userId;
         document.querySelector("#date").textContent=review.regDate;
         document.querySelector("#content").textContent=review.content;
         document.querySelector("#modify-link").setAttribute("href", "../review/modifyform.jsp?reviewNo=" + no)
         document.querySelector("#likes").textContent = review.liked;
         document.querySelector("#heart").onclick = likes.bind(event, review.no);
         
         document.querySelector("#del-btn").setAttribute("href" , "../review/deletereview.jsp?productNo="+productNo+"&reviewNo=" + no)
         	var modbutton = document.querySelector("#modify-button")
            var btnDispCheck = '0' == loginedAdmin || review.userId == loginedUserId
            modbutton.style.display = btnDispCheck ? "block" : "none"
      }
      
   });
}
function likes(no,event){
	$.ajax({
		type:'get',
		url:'../review/likes.jsp?reviewNo=' +no,
		success:function(likes){
		var review = JSON.parse(likes);
		document.querySelector("#likes").textContent = review.liked;
		
		}
		
	})
	
}
</script>