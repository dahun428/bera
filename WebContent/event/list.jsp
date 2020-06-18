<%@page import="com.br.dto.EventDto"%>
<%@page import="java.util.List"%>
<%@page import="com.br.service.EventService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%

	EventService eventService = new EventService();
	List<EventDto> events = eventService.getAllEventThumbnail();

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
							
							<%
								for(EventDto event : events){
							%>
							<div class="col-3">
								<div class="card">
								<!-- event image -->
									<div class="card-img">
										<a href="detail.jsp?no=<%=event.getNo()%>">
											<img style="max-height: 280px;" src="../image/EVENT/<%=event.getImagePath() %>" alt="" class="card-img-top"/>
										</a>
									</div>
										<div class="card-body">
										<!--  event title -->
											<h5 class="card-title"><%=event.getTitle() %></h5>
										<!--  event date -->	
										<p>
										<span><%=event.getStartDate() %></span>~
										<span><%=event.getEndDate() %></span>
										</p>
										</div>
								</div>
															
							</div>
							<%
								}
							%>	
						</div>
					</div>
					<div class="col-12 text-right">
						<a href="eventform.jsp" class="btn btn-primary">글쓰기</a>
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