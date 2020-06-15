<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
			String position = "notice";
		%>
			<%@ include file="/common/navi.jsp"%>
		</div>
		<div class="body">
			<div class="container">
				<div class="content-header text-center">
					<h1 class="display-4">NOTICE</h1>
					<p>
						<strong>공지사항 수정 페이지 입니다.</strong>
					</p>
				</div>
				<!-- event form start -->
					<div class="custom-content-box">
							<form action="">
								<table class="table table-bordered">
									<thead>
										<tr>
											<td class="text-center" colspan="4">NOTICE</td>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td colspan="4">
												<div class="input-group">
															<input type="text" class="form-control"
												placeholder="제목을 입력해주세요" name="title" maxlength="50" />
													<div class="input-group-prepend">
														<div class="input-group-text">
															<input type="radio" /><span>중요공지</span>
															<input type="radio" checked="checked"/><span>일반공지</span>
														</div>
													</div>
												</div>
											</td>
										</tr>
										<tr>
											<td colspan="4">
												<div class="input-group">
													<div class="custom-file">
														<input type="file" class="custom-file-input" id="imageUpload" />
														<label for="imageUpload" class="custom-file-label">이미지 등록</label>
													</div>
												</div>
											</td>
										</tr>
										<tr>
											<td colspan="4">
												<div>
													<img src="../image/bera-review-sample.jpg" class="card-img" alt="...">
												</div>
											</td>
										</tr>
										<tr>
											<td colspan="4">
												<textarea class="form-control" placeholder="내용을 입력해주세요"
													name="content" maxlength="2048" style="height: 100px;" /></textarea>
											</td>
										</tr>	
									</tbody>
								</table>
							<div class="form-btn text-right">
								<button onclick="history.go(-1);" type="button" class="btn btn-secondary">돌아가기</button>
								<button type="submit" class="btn btn-primary">수정</button>
							</div>
							</form>						
						</div>
					</div>
				<!-- event form end -->
				</div>
		<div class="footer">
			<%@ include file="/common/footer.jsp"%>
		</div>
	</div>
</body>
</html>