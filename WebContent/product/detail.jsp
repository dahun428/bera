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
			String position="menu";
		%>
			<%@ include file="/common/navi.jsp"%>
		</div>
		<div class="body">
			<div class="container">
				<h1>상품상세보기 페이지 입니다.</h1>
				<a class="btn btn-primary" href="../order/detail.jsp">구매하기</a>
			</div>
		</div>
		<div class="footer">
			<%@ include file="/common/footer.jsp"%>
		</div>
	</div>
</body>
</html>