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
			String position = "user";
		%>
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
					<%
						String myPagePosition = "deletePage";
					%>
					<!-- mypage-nav start -->
					<%@ include file="mypage-navi.jsp"%>
					<!-- mypage-nav end -->
					<!-- mypage-orderlist content start -->
					<!-- 서버에서 주문정보 불러와서 테이블 형태로 화면에 나타내기 -->
					<div class="row content-header text-center">
						<div class="col-12">
							<h2>회원탈퇴 페이지 입니다.</h2>
						</div>
					</div>
					<div class="row content-header">
						<div class="col-12">
							<h4>회원탈퇴</h4>
							<hr />
							<!-- 회원 탈퇴 폼 만들기 -->
							<div class="user-delete-form">
							</div>
							<!-- 회원 탈퇴 폼 만들기 end -->
						</div>
					</div>
				</div>
			</div>

		</div>
		<div class="footer">
			<%@ include file="/common/footer.jsp"%>
		</div>
	</div>
</body>
</html>