<%@page import="com.br.dao.ReviewDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	<%  %>
	<div class="row custom-review-content-box">
		<div class="col-3 custom-review-img-box">
			<!-- review-content-img -->
			<a href="#" data-toggle="modal" data-target="#review-column-01">
				<img src="../image/BERA ICEREAM/ALMOND BONBONBON.png" alt=""
				class="img-thumbnail" />
			</a>
			<!-- review-content-img -->
		</div>
		<div class="col-12 text-right">
			<a href="/semi-project/review/reviewform.jsp?productNo=<%=productNo %>" class="btn btn-primary">리뷰남기기</a>
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
				<div class="col-md-6">
					<img src="../image/bera-review-sample.jpg" class="card-img" alt="...">
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
									<a href="#">ididid</a>
									<!-- review id -->
								</p>
								<p>
									<small class="text-muted">Last updated 3 mins ago</small>
								</p>
								<!-- review title -->
								<h5 class="card-title">Card title</h5>
								<!-- review title -->
								<!-- review content -->
								<p class="card-text">This is a wider card with supporting
									text below as a natural lead-in to additional content. This
									content is a little bit longer.</p>
								<!-- review content -->
							</div>
						</div>
						<div class="col-12">
							<div class="modal-footer">
								<a href="#"><i class="far fa-heart"></i></a>
							<!-- likes count -->
								<span class="badge badge-primary text-wrap">17</span>
							
							</div>
							<div class="modal-footer">
								<a href="../review/modifyform.jsp" class="btn btn-primary">수정</a>
								<a href="../review/deletereview.jsp?productNo=<%=productNo %>" class="btn btn-primary">삭제</a>
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
<script>

</script>