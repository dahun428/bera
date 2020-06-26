<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.br.utils.NumberUtil"%>
<%@page import="com.br.vo.Pagenation"%>
<%@page import="com.br.dto.EventDto"%>
<%@page import="java.util.List"%>
<%@page import="com.br.service.EventService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int pageNo = NumberUtil.stringToInt(request.getParameter("pageNo"), 1);
	
	EventService eventService = new EventService();
	int totalRows = eventService.getProgressEventListThumbnailTypeTotalRows();
	int rowsPerPage = 10;
	int pagesPerBlock = 5;
	
	Pagenation pagenation = new Pagenation(rowsPerPage, pagesPerBlock, pageNo, totalRows);
	List<EventDto> events = eventService.getEndedEventListThumbnailType(pagenation.getBeginIndex(), pagenation.getEndIndex());
	
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
							<h5>종료된 이벤트 입니다.</h5>
						<hr />
						</div>
						<div class="row">
							<div class="col-12">
								<div class="row">
					<%
						if(!events.isEmpty()){
					%>
							<%
								for(EventDto event : events){
							%>
							<div class="col-3">
								<div class="card list-box " style="height:450px; max-hegiht:450px;">
								<!-- event image -->
									<div class="card-img">
										<img style="max-height: 280px;" src="../image/EVENT/<%=event.getImagePath() %>" alt="" class="card-img-top"/>
									</div>
										<div class="card-body text-center">
										<!--  event title -->
										<div class="card-title" style="margin: auto 0;height:80px; max-height:80px;">
											<h5 class="color-pink font-weight-bold"><%=event.getTitle() %></h5>
										</div>
										<!--  event date -->	
										<p class="text-info">
								<%
									SimpleDateFormat df = new SimpleDateFormat("yyyy");
								
									boolean isLimit = false;
									String endDate = df.format(event.getEndDate());
									if("2099".equals(endDate)){
										isLimit = true;
									}
								%>	
								<%
									if(isLimit){
								%>
									<span>상시진행</span>
								<%
								
									} else {
								%>	
										<span><%=event.getStartDate() %></span>~
										<span><%=event.getEndDate() %></span>
								<%
									}
								%>
										</p>
										</div>
								</div>
															
							</div>
							<%
								}
							%>	
						</div>
						<!-- pagenation -->
						<div>
							<ul class="pagination justify-content-center">
							<%
								if(pagenation.getPageNo() > 1){
							%>
							<li class="page-item">
								<a href="list.jsp?pageNo=<%=pagenation.getPageNo() - 1 %>" class="page-link">이전</a>
							</li>
							<%
								}
							%>
							<%
								for(int num = pagenation.getBeginPage(); num <= pagenation.getEndPage(); num++){
							%>
							<li class="page-item">
								<a href="list.jsp?pageNo=<%=num %>" class="page-link <%=num == pageNo ? "active" : "" %>"><%=num %></a>
							</li>
							<%
								}
							%>
							<%
								if(pagenation.getPageNo() < pagenation.getTotalPages()){
							%>
							<li class="page-item">
								<a href="list.jsp?pageNo=<%=pagenation.getPageNo() + 1 %>" class="page-link">다음</a>
							</li>
							<%
								}
							%>
							</ul>
							<!-- pagenation -->
						</div>
					<%
						} else {
					%>	
								<div class="col-12 text-center">
									<h4>
										현재 진행중인 이벤트가 없습니다.
									</h4>
								</div>
					<%
						}
					%>
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