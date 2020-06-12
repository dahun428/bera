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
				String position = "menu";
			%>
			<%@ include file="/common/navi.jsp"%>
		</div>
		<div class="body">
			<div class="container">
				<!-- product detail -->
				<div class="row">
					<div class="col-12">
						<div class="content-header text-center">
							<span class="color-pink"><i class="fas fa-ice-cream fa-5x"></i></span>
							<!-- product name -->
							<h4 class="display-4 text-center">초코 아몬드 봉봉</h4>
							<!-- product detail -->
							<p class="color-gray-pink">달콤한 밀크 초콜릿 아이스크림에 초코 아몬드, 초콜릿 칩이
								들어간 아이스크림</p>
						</div>
					</div>
					<div class="col-12">
						<div class="product-detail-img text-center">
							<!-- product img -->
							<img src="../image/BERA ICEREAM/ALMOND BONBONBON.png" alt="" />
						</div>
							<div class="product-con-img text-center">
								<img src="../image/BERA ICEREAM/icecream-bottom.png" alt="" />
							</div>
							<div class="product-detail-btn">
							<!-- 구매하기 버튼 get 방식으로 url 보내기 -->
								<a href="../order/detail.jsp" type="button" class="btn btn-primary btn-lg">구매하기</a>
							</div>
					</div>
					<div class="col-12">
					<hr />
						<div class="pack-info">
							<img src="../image/bera-pack-info.JPG" alt="" />
						</div>
					</div>
					<div class="col-12 text-center">
						<h1>리뷰 페이지 넣기</h1>
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