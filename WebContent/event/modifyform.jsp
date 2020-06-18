<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.br.dto.EventDto"%>
<%@page import="com.br.service.EventService"%>
<%@page import="com.br.utils.NumberUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	int eventNo = NumberUtil.stringToInt(request.getParameter("no"));
	EventService eventService = new EventService();
	EventDto event = eventService.getEventByNo(eventNo);

	SimpleDateFormat year = new SimpleDateFormat("yyyy");
	SimpleDateFormat month = new SimpleDateFormat("M");
	SimpleDateFormat day = new SimpleDateFormat("d");

	String startYear = year.format(event.getStartDate());
	String startMonth = month.format(event.getStartDate());
	String startDay = day.format(event.getStartDate());
	String endYear = year.format(event.getEndDate());
	String endMonth = month.format(event.getEndDate());
	String endDay = day.format(event.getEndDate());
	
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
				<div class="content-header text-center">
					<h1 class="display-4">EVENT</h1>
					<p>
						<strong>이벤트 수정 페이지 입니다.</strong>
					</p>
				</div>
				<!-- event form start -->
				<div class="custom-content-box">
					<form action="eventregister.jsp" enctype="multipart/form-data"
						method="post" id="event-form">
						<table class="table">
							<thead>
								<tr>
									<td class="text-center" colspan="4">EVENT</td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td colspan="4"><input type="text" class="form-control"
										placeholder="제목을 입력해주세요" name="title" maxlength="50" value="<%=event.getTitle() %>" /></td>
								</tr>
								<tr>
									<td><span>이벤트 시작일</span></td>
									<td>
										<div class="form-group">
											<select name="startYear" id="" class="form-control">
												<option value="">연도 선택</option>
												<%
													for (int i = 2019; i <= 2050; i++) {
														int number = i;
												%>
												<option value="<%=number%>" <%=String.valueOf(number).equals(startYear) ? "selected" : ""%>><%=number%>년
												</option>	
												<%
													}
												%>
											</select>
										</div>
									</td>
									<td>
										<div class="form-group">
											<select name="startMonth" id="" class="form-control">
												<option value="">월 선택</option>
												<%
													for (int i = 1; i <= 12; i++) {
														int number = i;
												%>
												<option value="<%=number%>"  <%=String.valueOf(number).equals(startMonth) ? "selected" : ""%> ><%=number%>월
												</option>
												<%
													}
												%>
											</select>
										</div>
									</td>
									<td>
										<div class="form-group">
											<select name="startDay" id="" class="form-control">
												<option value="">일자 선택</option>
												<%
													for (int i = 1; i <= 31; i++) {
														int number = i;
												%>
												<option value="<%=number%>" <%=String.valueOf(number).equals(startDay) ? "selected" : ""%>><%=number%>일
												</option>
												<%
													}
												%>
											</select>
										</div>
									</td>
								</tr>
								<tr>
									<td><span>이벤트 종료일</span></td>
									<td>
										<div class="form-group">
											<select name="endYear" id="" class="form-control">
												<option value="">연도 선택</option>
												<%
													for (int i = 2019; i <= 2050; i++) {
														int number = i;
												%>
												<option value="<%=number%>"  <%=String.valueOf(number).equals(endYear) ? "selected" : ""%>><%=number%>년
												</option>
												<%
													}
												%>
											</select>
										</div>
									</td>
									<td>
										<div class="form-group">
											<select name="endMonth" id="" class="form-control">
												<option value="">월 선택</option>
												<%
													for (int i = 1; i <= 12; i++) {
														int number = i;
												%>
												<option value="<%=number%>" <%=String.valueOf(number).equals(endMonth) ? "selected" : ""%>><%=number%>월
												</option>
												<%
													}
												%>
											</select>
										</div>
									</td>
									<td>
										<div class="form-group">
											<select name="endDay" id="" class="form-control">
												<option value="">일자 선택</option>
												<%
													for (int i = 1; i <= 31; i++) {
														int number = i;
												%>
												<option value="<%=number%>"  <%=String.valueOf(number).equals(endDay) ? "selected" : ""%>><%=number%>일
												</option>
												<%
													}
												%>
											</select>
										</div>
									</td>
								</tr>
								<tr id="event-thumbnail">
									<td colspan="4">
										<div class="form-check form-check-inline">
											<input class="form-check-input" type="checkbox"
												id="event-thumbnail-checkbox" value="thumbnail" disabled="<%=event.getThumbnailImagePath() != null ? "disabled" : "" %>"
												name="thumbnail" checked="<%=StringUtils.isEmpty(event.getThumbnailImagePath()) == true ? "checked" : "" %>" > <label class="form-check-label"
												for="event-thumbnail-checkbox">썸네일 이미지 추가</label>
										</div>
									<%
										if(event.getThumbnailImagePath() != null){
									%>			
										<div class="text-right" style="display: inline-block;">
											<button class="btn btn-primary" type="button" id="thumbnail-img-delete-btn">이미지 취소</button>
										</div>
									<%
										}
									%>
							
									</td>
								</tr>
								<%
									if (event.getThumbnailImagePath() != null) {
								%>
								<tr id="event-thumbnail-inputbox">
									<td colspan="4">
										<div class="input-group">
											<div class="custom-file">
												<input type="file" class="custom-file-input" name="thumbnail"
													id="event-imageUpload-thumbnail" disabled="disabled" />
													<label for="event-imageUpload-thumbnail" class="custom-file-label"><%=event.getThumbnailImagePath() %></label>
											</div>
										</div>
									</td>
								</tr>
								<tr id="event-thumbnail-imgbox">
									<td colspan="4">
										<div class="blank_img">
											<img src="../image/EVENT/<%=event.getThumbnailImagePath() %>" class="card-img"
												id="change-image-thumbnail" alt="" />
										</div>
									</td>
								</tr>
								<%
									}
								%>
								<tr id="event-content">
									<td colspan="4">
										<div class="form-check form-check-inline">
											<input class="form-check-input" type="checkbox" disabled="<%=StringUtils.isEmpty(event.getContentImagePath()) == true ? "disabled" : "" %>"
												id="event-content-checkbox" value="content" name="content" checked="<%=StringUtils.isEmpty(event.getContentImagePath()) == true ? "checked" : "" %>" >
											<label class="form-check-label" for="event-content-checkbox">컨텐츠
												이미지 추가</label>
										</div>
									<%
										if(event.getContentImagePath() != null){
									%>			
										<div class="text-right" style="display: inline-block;">
											<button class="btn btn-primary" type="button" id="content-img-delete-btn">이미지 취소</button>
										</div>
									<%
										}
									%>
									</td>
								</tr>
								<%
									if (event.getContentImagePath() != null) {
								%>
								<tr id="event-content-inputbox">
									<td colspan="4">
										<div class="input-group">
											<div class="custom-file">
												<input type="file" class="custom-file-input" name="content"
													id="event-imageUpload-content" />
													<label for="event-imageUpload-content" class="custom-file-label"><%=event.getContentImagePath() %></label>
											</div>
										</div>
									</td>
								</tr>
								<tr id="event-content-imgbox">
									<td colspan="4">
										<div class="blank_img">
											<img src="../image/EVENT/<%=event.getContentImagePath() %>" class="card-img"
												id="change-image-content" alt="" />
										</div>
									</td>
								</tr>
								<%
									}
								%>
								
								<tr id="event-banner">
									<td colspan="4">
										<div class="form-check form-check-inline">
											<input class="form-check-input" type="checkbox" disabled="<%=event.getBannerImagePath() != null ? "disabled" : "" %>"
												id="event-banner-checkbox" value="banner" name="banner" checked="<%=event.getBannerImagePath() != null ? "checked" : "" %>">
											<label class="form-check-label" for="event-banner-checkbox">배너
												이미지 추가</label>
										</div>
									</td>
								</tr>
								<%
									if (event.getBannerImagePath() != null) {
								%>
								<tr id="event-banner-inputbox">
									<td colspan="4">
										<div class="input-group">
											<div class="custom-file">
												<input type="file" class="custom-file-input" name="banner"
													id="event-imageUpload-banner" />
													<label for="event-imageUpload-banner" class="custom-file-label"><%=event.getBannerImagePath() %></label>
											</div>
										</div>
									<%
										if(event.getBannerImagePath() != null){
									%>			
										<div class="text-right" style="display: inline-block;">
											<button class="btn btn-primary" type="button" id="banner-img-delete-btn">이미지 취소</button>
										</div>
									<%
										}
									%>
									</td>
								</tr>
								<tr id="event-banner-imgbox">
									<td colspan="4">
										<div class="blank_img">
											<img src="../image/EVENT/<%=event.getBannerImagePath() %>" class="card-img"
												id="change-image-banner" alt="" />
										</div>
									</td>
								</tr>
								<%
									}
								%>
								<tr>
									<td colspan="4"><textarea class="form-control"
											placeholder="내용을 입력해주세요" name="content" maxlength="2048"
											style="height: 100px;" /><%=event.getContent() %></textarea></td>
								</tr>
							</tbody>
						</table>
						<input type="hidden" name="eventNo" value="<%=event.getNo() %>" />
						<div class="form-btn text-right">
							<button onclick="history.go(-1);" type="button"
								class="btn btn-secondary">돌아가기</button>
							<button type="submit" class="btn btn-primary">수정완료</button>
						</div>
					</form>
				</div>
			</div>
			<!-- event form end -->
		</div>
		<div class="footer">
			<%@ include file="/common/footer.jsp"%>
		</div>
	</div>
</body>
</html>