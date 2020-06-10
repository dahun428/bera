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
					<!-- mypage-orderlist content start -->
					<div class="row content-header">
						<table class="table table-borered">
							<thead>
								<tr>
									<th>상품명</th>
									<th>상품가격</th>
									<th>구매수량</th>
									<th>구매일</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>상품명</td>
									<td>상품가격</td>
									<td>구매수량</td>
									<td>구매일</td>
								</tr>
								<tr>
									<td>상품명</td>
									<td>상품가격</td>
									<td>구매수량</td>
									<td>구매일</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- mypage-orderlist content end -->
				</div>
			</div>
		</div>
		<div class="footer">
			<%@ include file="/common/footer.jsp"%>
		</div>
	</div>
</body>
</html>