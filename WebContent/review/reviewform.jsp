<%@page import="com.br.dao.ReviewDao"%>
<%@page import="com.br.utils.NumberUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/logincheck.jsp" %>
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
			int productNo =NumberUtil.stringToInt(request.getParameter("productNo"));
			String position = "review";
			
			ReviewDao reviewDao = new ReviewDao();
			
		%>
			<%@ include file="/common/navi.jsp"%>
		</div>
		<div class="body">
			<div class="container">
				<div class="content-header text-center">
					<h1 class="display-4">REVIEW</h1>
					<p>
						<strong>리뷰 등록 페이지 입니다.</strong>
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
							<form method="post" enctype="multipart/form-data" action="register.jsp">
								<input type="hidden" name="productNo" value="<%=productNo %>"/>
								<table class="table table-bordered">
									<thead>
										<tr>
											<td class="text-center" colspan="4">Reviews</td>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td colspan="4">
											<strong>
												<input type="text" class="form-control" id="title"
												placeholder="제목을 입력해주세요" name="title" maxlength="50" />
											</strong>
											</td>
										</tr>
										<tr>
											<td colspan="4">
												<div class="input-group">
													<div class="custom-file">
														<input type="file" class="custom-file-input" name="image" id="imageUpload" 
														value="" aria-describedby="inputGroupFileAddon01" />
														<label for="imageUpload" for="imageUplaod" class="custom-file-label">이미지를 첨부해주세요.</label>
													</div>
												</div>
											</td>
										</tr>
										<tr>
											<td colspan="4">
												<div class="blank_img">
													<img src="../image/no_detail_img.jpg" class="card-img" id="change-image" alt="...">
												</div>
											</td>
										</tr>
										<tr>
											<td colspan="4">
												<textarea class="form-control" placeholder="내용을 입력해주세요"
													id="content" name="content" maxlength="2048" style="height: 100px;" /></textarea>
											</td>
										</tr>
									</tbody>
								</table>
							<div class="form-btn text-right">
								<button onclick="history.go(-1);" type="button" class="btn btn-secondary">돌아가기</button>
								<button type="submit" class="btn btn-primary">작성완료</button>
							</div>
							</form>	
						</div>
					</div>
				<!-- review form end -->
				</div>
			</div>
			
						<script type="text/javascript">
				function checkField(event) {
					clearErrorField();
					
					var title = document.querySelector("input[name=title]");
					var content = document.querySelector("input[name=content]");

					if (!title.value) {
						document.querySelector("#title").classList
								.add("field-error");
						isPassed = false;
					}
					if (!content.value) {
						document.querySelector("#content").classList
								.add("field-error");
						isPassed = false;
					}
					if (!isPassed) {
						event.preventDefault();
					}
				}

				function clearErrorField() {
					var fields = document.querySelectorAll(".form-group");
					console.log(fields);
					for (var i = 0; i < fields.length; i++) {
						var input = fields[i];
						input.classList.remove("field-error");
					}
				}
				</script>
			
		</div>
		<div class="footer">
			<%@ include file="/common/footer.jsp"%>
		</div>
	</div>
</body>
</html>