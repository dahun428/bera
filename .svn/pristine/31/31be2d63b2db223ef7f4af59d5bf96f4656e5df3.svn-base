<%@page import="com.br.utils.NumberUtil"%>
<%@page import="com.br.dto.ReviewDto"%>
<%@page import="java.util.List"%>
<%@page import="com.br.dao.ReviewDao"%>
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
				String position = "review";
			%>
			<%@ include file="/common/navi.jsp"%>
		</div>
		<%
			int productNo = NumberUtil.stringToInt(request.getParameter("productNo"));
		%>

		<div class="container">
			<div class="body text-center">
				<div class="row">
					<div class="col-12 br-event-container">
						<h1>리뷰가 등록되었습니다.</h1>
						<hr />
						<div>
							<a href="/semi-project/home.jsp" class="btn btn-primary">메인화면으로</a>
							<a
								href="/semi-project/product/detail.jsp?productNo=<%=productNo%>"
								class="btn btn-primary">상품구매 및 리뷰화면으로</a>
						</div>
					</div>
					<hr />
				</div>
			</div>
		</div>
	</div>
	<div class="footer">
		<%@ include file="/common/footer.jsp"%>
	</div>
</body>
</html>