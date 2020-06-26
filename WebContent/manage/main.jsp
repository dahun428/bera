<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.br.utils.NumberUtil"%>
<%@page import="com.br.dao.AdminDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title></title>
<meta charset="utf-8">
</head>
<body>
	<div class="wrapper">
		<div class="header">
			<%@ include file="/common/header.jsp"%>
		</div>
		<div class="navi">
			<%
				String position = "ADMIN";
			%>
			<%@ include file="/common/navi.jsp"%>
		</div>
		<div class="body">
			<div class="container">
				<div class="row mt-4">
					<div class="col-12">
						<div class="row mt-4">
							<div class="col-3">
								<h2 class="font-weight-bold">관리자페이지</h2>
							</div>
							<div class="col-9">
								<!-- manager na3vi -->
								<%
									String managerPosition = "main";
								%>
								<%@ include file="managernavi.jsp"%>
								<!-- manager navi -->
							</div>
						</div>
						<div class="col-12">
						<div style="background-color: black; height: 2px;" class="mb-2"></div>
						<!-- manager content -->
							<%@ include file="admin.jsp" %>
						<!-- manager content -->
						</div>
					</div>
				</div>
			</div>
			<div class="footer">
				<%@ include file="/common/footer.jsp"%>
			</div>
		</div>
	</div>
</body>
</html>