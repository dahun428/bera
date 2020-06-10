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
			<%@ include file="/common/navi.jsp"%>
		</div>
		<div class="body">
			<div class="container">
				<div class="content-header text-center">
					<h1 class="display-4">MODIFY</h1>
					<p>
						<strong>회원수정 페이지 입니다.</strong>
					</p>
				</div>
				<div class="custom-content-box">
					<hr />
					<%@ include file="mypage-navi.jsp" %>
					<!-- modify form start -->
					<div class="custom-box-wrap">
						<div class="custom-box">
							<form action="">
								<table class="table table-bordered">
									<tbody>
										<tr>
											<td>이름</td>
											<td>
												<div class="form-group">
													<input name="name" type="text" class="form-control" />
												</div>
											</td>
										</tr>
										<tr>
											<td>아이디</td>
											<td>
												<div class="form-group">
													<input name="id" type="text" class="form-control" />
												</div>
											</td>
										</tr>
										<tr>
											<td>비밀번호</td>
											<td>
												<div class="form-group">
													<input name="pwd" type="text" class="form-control" />
												</div>
											</td>
										</tr>
										<tr>
											<td>비밀번호 확인</td>
											<td>
												<div class="form-group">
													<input name="pwd-chk" type="text" class="form-control" />
												</div>
											</td>
										</tr>
										<tr>
											<td>전화번호</td>
											<td>
												<div class="form-group">
													<input name="tel" type="text" class="form-control" />
												</div>
											</td>
										</tr>
										<tr>
											<td>이메일</td>
											<td>
												<div class="form-group">
													<input name="email" type="text" class="form-control" />
												</div>
											</td>
										</tr>
									
									</tbody>
								</table>
							</form>
							<div class="form-btn text-right">
								<button class="btn btn-secondary">돌아가기</button>
								<button class="btn btn-primary">수정하기</button>
							</div>
						</div>
					</div>
					<!-- modify form end -->
				</div>
			</div>
		</div>
		<div class="footer">
			<%@ include file="/common/footer.jsp"%>
		</div>
	</div>
</body>
</html>