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
					<h1 class="display-4">MY PAGE</h1>
					<p>
						<strong>회원님을 위한 베스킨라빈스의 다양한 정보</strong>
					</p>
				</div>
				<div class="custom-content-box">
					<hr />
					<%@ include file="mypage-navi.jsp"%>
					<!-- mypage-point content start -->
					<div class="row content-header">
						<div class="col-6 custom-border-right">
							<h5>해피포인트는 어떻게 발급받나요?</h5>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
								Voluptas quam.</p>
						</div>
						<div class="col-3">
							<h5>사용가능 총 포인트</h5>
						</div>
						<div class="col-3">
							<h5 class="text-primary">1000p</h5>
						</div>
					</div>
					<!-- mypage-point content end -->
				</div>
			</div>
		</div>
		<div class="footer">
			<%@ include file="/common/footer.jsp"%>
		</div>
	</div>
</body>
</html>