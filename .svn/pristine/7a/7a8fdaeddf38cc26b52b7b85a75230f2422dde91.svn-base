<%@page import="com.br.dto.ReviewDto"%>
<%@page import="com.br.utils.NumberUtil"%>
<%@page import="com.br.vo.Review"%>
<%@page import="com.br.dao.ReviewDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../common/logincheck.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
</style>
<body>
	<div class="wrapper">
		<div class="header">
			<%@ include file="/common/header.jsp"%>
		</div>
		<div class="navi">
			<%
				String position = "review";
			%>
			<%
				int reviewNo = NumberUtil.stringToInt(request.getParameter("reviewNo"));
				System.out.println(reviewNo);
				ReviewDao reviewDao = new ReviewDao();
				Review review = reviewDao.getReviewNo(reviewNo);
			%>
			<%@ include file="/common/navi.jsp"%>
		</div>
		<div class="body">
			<div class="container">
				<div class="content-header text-center">
					<h1 class="display-4">REVIEW</h1>
					<p>
						<strong>리뷰 수정 페이지 입니다.</strong>
					</p>
				</div>
				<div class="custom-content-box">
					<hr />
					<div class="title text-center">
						<h5>회원님의 소중한 리뷰 감사합니다.</h5>
						<p>다른 회원님들과의 리뷰를 공유해보세요</p>
					</div>
					<!-- review form start -->
					<div class="custom-box-wrap">
						<div class="custom-box">
							<form method="post" enctype="multipart/form-data"
								action="modify.jsp" id="review-form">
								<input type="hidden" name="reviewNo" value="<%=reviewNo%>" /> <input
									type="hidden" name="productNo"
									value="<%=review.getProductNo()%>" />
								<table class="table table-bordered">
									<thead>
										<tr>
											<td class="text-center" colspan="4">Reviews</td>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td colspan="4"><input type="text" class="form-control"
												id="title" value="<%=review.getTitle()%>" name="title"
												maxlength="50" /></td>
										</tr>
										<tr>
											<td colspan="4">
												<div class="input-group">
													<div class="custom-file">
														<input type="file" class="custom-file-input" name="image"
															id="imageUpload" value="<%=review.getPicture()%>"
															aria-describedby="inputGroupFileAddon01" /> <label
															for="imageUpload" class="custom-file-label"><%=review.getPicture()%></label>
													</div>
												</div>
											</td>
										</tr>
										<tr>

											<td colspan="4">
												<div>
													<img src="../image/REVIEW/<%=review.getPicture()%>" id="change-image"
														class="card-img" alt="...">
												</div>
											</td>

										</tr>
										<tr>
											<td colspan="4"><textarea class="form-control"
													id="content" name="content" maxlength="2048"
													style="height: 100px;"><%=review.getContent() %></textarea>
											</td>
										</tr>
									</tbody>
								</table>
								<div class="form-btn text-right">
									<button onclick="history.go(-1);" type="button"
										class="btn btn-secondary">돌아가기</button>
									<button type="button" class="btn btn-primary"  onclick="checkField(event);">작성완료</button>
								</div>
							</form>
						</div>
					</div>
					<!-- review form end -->
				</div>
			</div>
		</div>
		<div class="footer">
			<%@ include file="/common/footer.jsp"%>
		</div>
	</div>
		<script type="text/javascript">
						
				function checkField(event) {
					
					var title = document.querySelector("#title");
					var content = document.querySelector("#content");
					var form = document.querySelector('#review-form');
					if (!title.value) {
						alert('제목을 입력해주세요');
						title.focus();
						return;
					}
					if (!content.value) {
						alert('내용을 입력해주세요');
						content.focus();
						return;
					}
					if($('#change-image').attr('src') == '../image/no_detail_img.jpg'){
						alert('사진을 등록해주세요');
						return;
					}
					form.submit();	
				}
		</script>
</body>
</html>