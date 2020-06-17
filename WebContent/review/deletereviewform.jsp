<%@page import="com.br.dao.ReviewDao"%>
<%@page import="com.br.utils.NumberUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/logincheck.jsp" %>
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
			int productNo =NumberUtil.stringToInt(request.getParameter("productNo"));
			String position = "review";
			
			ReviewDao reviewDao = new ReviewDao();
			
		%>
			<%@ include file="/common/navi.jsp"%>
		</div>
		<div class="container">
		<div class="body text-center">
			<thead>
				<h1>리뷰가 수정 및 삭제되었습니다.</h1>
			</thead>
			<tbody>
			<hr />
			<div>
					<a href="/semi-project/home.jsp" class="btn btn-primary">메인화면으로</a></button>
					<a href="/semi-project/product/detail.jsp?productNo=<%=productNo %>" class="btn btn-primary">상품구매 및 리뷰화면으로</a></button>
			</div>
			</tbody>
				</div>
		</div>
		</div>
		<div class="footer">
			<%@ include file="/common/footer.jsp"%>
		</div>
	</div>