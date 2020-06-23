<%@page import="com.br.dto.EventDto"%>
<%@page import="java.util.List"%>
<%@page import="com.br.service.EventService"%>
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
				String position = "event";
			%>
			<%@ include file="/common/navi.jsp"%>
		</div>
		<div class="body">
			<div class="container">
				<div class="row">
					<div class="col-12 custom-box">
						<h4 class="display-4 text-center">EVENT MANAGER</h4>
						<div class="title text-center">
							<h5>이벤트 관리자 페이지 입니다.</h5>
							<hr />
							<div class="col-12 text-right">
								<a href="eventform.jsp" class="btn btn-primary">이벤트추가</a>
							</div>
						</div>
						<div class="row">
							<div class="col-12 card list-box">
								<div class="card-body font-weight-bold">
									<h3 class="card-title">진행중인 이벤트</h3>
									<div class="row" id="progress-event">
										<!-- progress event -->

										<!-- progress event -->
									</div>
									<div id="progress-event-pagenation"></div>
								</div>
							</div>
							<div class="col-12 card list-box">
								<div class="card-body font-weight-bold">
									<h3 class="card-title">진행중인 배너</h3>
									<div class="row" id="progress-banner">
										<!-- progress banner -->

										<!-- progress banner -->
									</div>
									<div id="progress-banner-pagenation"></div>
								</div>
							</div>
							<div class="col-12 card list-box">
								<div class="card-body font-weight-bold">
									<h3 class="card-title">종료된 이벤트</h3>
									<div class="row" id="end-event">
										<!-- terminated event -->

										<!-- terminated event -->
									</div>
									<div id="end-event-pagenation"></div>
								</div>
							</div>
							<div class="col-12 card list-box">
								<div class="card-body font-weight-bold">
									<h3 class="card-title">종료된 배너</h3>
									<div class="row" id="end-banner">
										<!-- terminated banner -->

										<!-- terminated banner -->
									</div>
									<div id="end-banner-pagenation"></div>
								</div>
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

	<script type="text/javascript" src="../js/eventpagenation.js"></script>
</body>
</html>