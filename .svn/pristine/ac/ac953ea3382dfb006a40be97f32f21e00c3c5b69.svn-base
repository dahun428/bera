<%@page import="com.br.utils.StringUtil"%>
<%@page import="com.br.dto.NoticeDto"%>
<%@page import="com.br.dao.NoticeDao"%>
<%@page import="com.br.utils.NumberUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	int no = NumberUtil.stringToInt(request.getParameter("no"));
	
	NoticeDao noticeDao = new NoticeDao();
	NoticeDto notice = noticeDao.getNoticeDtoByNo(no);
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
			String position = "notice";
		%>
			<%@ include file="/common/navi.jsp"%>
		</div>
		<div class="body">
		<div class="container">
				<div class="row">
					<div class="col-12 custom-box">
						<h4 class="display-4 text-center">NOTICE</h4>
						<div class="title text-center">
							<h5>공지사항</h5>
							<hr />
						</div>
						
						
						<div class="row">
							<div class="col-12">
								<div class="card">
								
								<%
									if(notice == null){
										
								
								%>
									<div class="card-body">
										<h3>존재하지 않는 페이지 입니다.</h3>
									</div>
								<%
								
									} else {
								
								%>
									<div class="card-header text-center">
									<!-- event title -->
										<h4 class="font-weight-bold"><%=StringUtil.strWithBr(notice.getTitle()) %></h4>
									<!-- event title -->
									</div>
									<div class="card-body">
								<table class="table table-bordered">
									<tbody>
										<tr>
											<td>
												<p class="text-left color-pink font-weight-bold">
												<span>등록일</span>
													<%=notice.getRegDate() %>
												</p>
											</td>
										</tr>
										<tr>
											<td class="custom-event-box">
							<%
										if(notice.getImagePath() != null){
											
							%>
										<div class=" text-center">
											<img src="../image/NOTICE/<%=notice.getImagePath() %>" alt="" />
										</div>
							<%
										}
							%>
												<p class="notice-text-box"><%=StringUtil.strWithBr(notice.getContent()) %></p>
											
											</td>
										</tr>
									</tbody>
								</table>
									</div>
								</div>
								<%
									}
								%>
								
								
							</div>
							<div class="col-12 text-center">
								<hr />
								<a href="list.jsp" class="btn btn-outline-primary btn-lg">목록으로</a>
							</div>
							
						<%
							if("0".equals(loginedAdmin)){
								
						%>	
							<div class="col-12 text-right">
								<a href="delete.jsp?no=<%=notice.getNo() %>" class="btn btn-secondary">삭제</a>
								<a href="modifyform.jsp?no=<%=notice.getNo() %>" class="btn btn-primary">수정</a>
							</div>
						<%
							}
						
						%>
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