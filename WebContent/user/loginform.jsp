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
			String position = "login";
		%>
			<%@ include file="/common/navi.jsp"%>
		</div>
		<div class="body">
			<div class="container">
				<div class="content-header text-center">
					<h1 class="display-4">LOGIN</h1>
					<p>
						<strong>배스킨 라빈스 홈페이지에 오신 것을 환영합니다.</strong>
					</p>
				</div>
				<div class="custom-content-box">
					<hr />
					<div class="title text-center">
						<h5>베스킨라빈스 로그인</h5>
						<p>해피포인트 아이디로 간편하게 로그인 하세요</p>
					</div>
					<!-- login form start -->
					<div class="custom-box-wrap">
						<div class="custom-box">
							<form action="">
								<div class="row">
									<div class="col-8">
										<div class="form-group">
											<input type="text" name="id" class="form-control"
												placeholder="아이디를 입력하세요" />
										</div>
										<div class="form-group">
											<input type="password" name="pwd" class="form-control"
												placeholder="비밀번호를 입력하세요" />
										</div>
									</div>
									<div class="col-4">
										<button class="login-btn">로그인</button>
									</div>
								</div>
							</form>
						</div>
					</div>
					<!-- login form end -->
				</div>
			</div>
		</div>
		<div class="footer">
			<%@ include file="/common/footer.jsp"%>
		</div>
	</div>
</body>
</html>