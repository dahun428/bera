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
			<p class="font-italic">
			</p>
			<!-- hashtag -->
		<% for(String tag : product.getTags()) {%>
				<a href="search.jsp?tag=<%=tag.substring(1) %>" class="custom-hashtag"><%=tag %></a>
		<%} %> 
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
			<div class="row custom-content-box" id="review-list"></div>
		</div>
		<!-- list -->
		<div class="col-12 text-right"></div>
		<div class="col-12 list-box" id="plus-btn" style="margin: 60px auto;">
			<input type="hidden" value="1" id="plus-number" />
		</div>
	</div>
	<!-- review content -->
</div>
<!-- modal -->
<%@ include file ="reviewdetailmodal.jsp" %>
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
   console.log("no : " , no);
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
         document.querySelector("#content").innerHTML= review.content.replace(/\r\n/g,'<br />');
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