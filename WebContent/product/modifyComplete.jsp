<%@page import="com.br.utils.NumberUtil"%>
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
			String position = "product";
			String category = request.getParameter("category");
			int productNo = NumberUtil.stringToInt(request.getParameter("productNo"));
		%>
			<%@ include file="/common/navi.jsp"%>
		</div>
		<div class="body">
			<div class="container">
				<div class="custom-content-box">
					<hr />
					<div class="title text-center">
						<h5><%=productNo==0?"상품 등록이 완료되었습니다." : productNo + "번 상품 수정이 완료되었습니다." %></h5>
					</div>
					
					<div class="col-12 text-center">
						<hr />
						<div class="row">
						<div class="col-3 offset-3">
						<a href="../manage/productAdminPage.jsp" class="btn btn-outline-primary btn-lg">관리자 페이지로</a>
						</div>
						<div class="col-3">
						<a href="list.jsp?category=<%=category %>" class="btn btn-outline-primary btn-lg">상품 리스트로</a>
						</div>
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