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

	<div class="row custom-review-content-box">
		<%
		for(ReviewDto reviewDto : reviews){
			if("1".equals(reviewDto.getDeleted())){
				System.out.println(reviewDto.getDeleted());
		%>
		<div class="col-3 custom-review-img-box">
			<!-- review-content-img -->
			<div>
				<a onclick="openPopup(<%=reviewDto.getNo() %>, event, <%=reviewDto.getProductNo() %>)" href="#"
					data-toggle="modal" data-target="#review-column-01"> <img
					src="../image/REVIEW/<%=reviewDto.getImagePath() %>" id="images-1"
					alt="" class="img-thumbnail" />
				</a>
			</div>
			<!-- review-content-img -->
		</div>
		<%
			}
		}
		
		%>

		<div class="col-12 text-right">
			<a
				href="/semi-project/review/reviewform.jsp?productNo=<%=productNo %>"
				class="btn btn-primary">리뷰남기기</a>
			<hr />
		</div>

		<div class="col-12 list-box">
			<button type="button" class="btn btn-outline-secondary btn-lg">
				더보기 <span><i class="fas fa-plus"></i></span>
			</button>
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
								<a href="#"><i class="far fa-heart"></i></a>
								<!-- likes count -->
								<span class="badge badge-primary text-wrap">17</span>

							</div>
							
							<div class="modal-footer" id="modify-button">
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
            document.querySelector("#del-btn").setAttribute("href" , "../review/deletereview.jsp?productNo="+productNo+"&reviewNo=" + no)
	        var modbutton = document.querySelector("#modify-button")
            var btnDispCheck = '0' == loginedAdmin || review.userId == loginedUserId
            modbutton.style.display = btnDispCheck ? "block" : "none"
		}
		
	});
}
</script>
