<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="com.br.utils.NumberUtil"%>
<%@page import="java.util.List"%>
<%@page import="com.br.dto.EventDto"%>
<%@page import="com.br.service.EventService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int eventNo = NumberUtil.stringToInt(request.getParameter("no"));
	EventService eventService = new EventService();
	EventDto event = eventService.getProgressEventContentByNo(eventNo);
%>
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
						<h4 class="display-4 text-center">EVENT</h4>
						<div class="title text-center">
							<h5>현재 진행중인 이벤트 입니다.</h5>
						<hr />
							<p>베스킨라빈스 회원들에게 드리는 특별한 혜택을 만나보세요</p>
						</div>
						<div class="row">
							<div class="col-12">

								<div class="card">
									<div class="card-header text-center">
									<!-- event title -->
										<h4 class="font-weight-bold"><%=event.getTitle() %></h4>
									<!-- event title -->
									</div>
									<div class="card-body">
									
								<table class="table table-bordered">
									<tbody>
										<tr>
											<td>
												<p class="text-left color-pink font-weight-bold">
												<span>이벤트 기간</span>
												<span>
													<%=event.getStartDate() %>
												</span>~
												<span>
													<%=event.getEndDate() %>
												</span>
												</p>
											</td>
										</tr>
										<%
										if(StringUtils.isEmpty(event.getImagePath()) == false){
										%>
										<tr>
											<td class="text-center custom-event-box">
												<img src="../image/EVENT/<%=event.getImagePath() %>" alt="" />
											</td>
										</tr>
										<%
										}
										%>
									</tbody>
								</table>
									</div>
								</div>
							</div>
							<div class="col-12 text-center">
								<hr />
								<a href="list.jsp" class="btn btn-outline-primary btn-lg">목록으로</a>
							</div>
							<div class="col-12 text-right">
								<a href="modifyform.jsp?no=<%=eventNo %>" class="btn btn-primary">수정</a>
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