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
			<div class="list-banner">
				<img src="../image/list-banner-img-main.jpg" alt="" />
			</div>
			<div class="container">

				<div class="row">
					<!-- monthly best item -->
					<div class="col-12">
						<h4 class="display-4 text-center">FLAVOR OF MONTH</h4>
						<hr />
						<img src="../image/flavorofmonth-img.jpg" alt="" />
					</div>
					<!-- monthly best item -->
					<!-- product list ice cream-->
					<div class="col-12 br-event-container">
						<h4 class="display-4 text-center">ICE CREAM</h4>
						<hr />
						<div class="row custom-content-box">
							<!-- product ice cream-->
							<div class="col-3 list-box">
								<div class="card">
									<div class="card-body">
										<h6 class="card-title text-center">아몬드봉봉</h6>
										<hr />
										<div class="card-text text-center">
										<a href="detail.jsp" class="btn btn-primary btn-sm">구매</a>
										
										</div>
									</div>
									<img class="card-img-top" src="../image/amond-bongbong.jpg"
										alt="" />
								</div>
							</div>
							<div class="col-3 list-box">
								<div class="card">
									<div class="card-body">
										<h6 class="card-title text-center">아몬드봉봉</h6>
										<hr />
										<div class="card-text text-center">
										<a href="detail.jsp" class="btn btn-primary btn-sm">구매</a>
										</div>
									</div>
									<img class="card-img-top" src="../image/amond-bongbong.jpg"
										alt="" />
								</div>
							</div>
							
							<!-- product ice cream end-->
						</div>
					</div>
					<!-- product list  ice cream end-->
					<div class="col-12 br-event-container">
						<h4 class="display-4 text-center">ICE CAKE</h4>
						<hr />
						<div class="row custom-content-box">
							<!-- product ice cream-->
							<div class="col-3 list-box">
								<div class="card">
									<div class="card-body">
									<!-- cake name -->
										<h6 class="card-title text-center">어섬케이크</h6>
									<!-- cake name -->	
										<hr />
										<div class="card-text text-center">
											<a href="detail.jsp" class="btn btn-primary btn-sm">구매</a>
										</div>
									</div>
									<!-- cake image -->
									<img class="card-img-top" src="../image/CAKE/CAKE_AWESOME_COOKIE.png"
										alt="" />
									<!-- cake image -->
								</div>
							</div>
							<div class="col-3 list-box">
								<div class="card">
									<div class="card-body">
									<!-- cake name -->
										<h6 class="card-title text-center">어섬케이크</h6>
									<!-- cake name -->	
										<hr />
										<div class="card-text text-center">
										<a href="detail.jsp" class="btn btn-primary btn-sm">구매</a>
										</div>
									</div>
									<!-- cake image -->
									<img class="card-img-top" src="../image/CAKE/CAKE_AWESOME_COOKIE.png"
										alt="" />
									<!-- cake image -->
								</div>
							</div>
							
							<!-- product ice cream end-->
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