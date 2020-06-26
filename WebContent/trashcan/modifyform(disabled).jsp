<%@page import="com.br.utils.StringUtil"%>
<%@page import="com.br.dto.NoticeDto"%>
<%@page import="com.br.service.NoticeService"%>
<%@page import="com.br.utils.NumberUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	int noticeNo = NumberUtil.stringToInt(request.getParameter("no"));
	NoticeService noticeService = new NoticeService();
	NoticeDto notice = noticeService.getNoticeByNo(noticeNo);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
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
				<div class="content-header text-center">
					<h1 class="display-4">NOTICE</h1>
					<p>
						<strong>공지사항 수정 페이지 입니다.</strong>
					</p>
				</div>
				<!-- event form start -->
					<div class="custom-content-box">
							<form action="noticeupdate.jsp" method="post" enctype="multipart/form-data" id="notice-form" >
								<table class="table table-bordered">
									<thead>
										<tr>
											<td class="text-center" colspan="4">NOTICE</td>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td colspan="4">
												<div class="input-group">
													<input type="text" class="form-control"
												placeholder="제목을 입력해주세요" name="title" maxlength="50" id="notice-title" value="<%=notice.getTitle()%>"/>
													<div class="input-group-prepend">
														<div class="input-group-text">
															<input type="radio" name="noticeValue"  checked="<%="0".equals(notice.getImportant()) ? "checked" : " " %>" value="1" value="0" /><span>중요공지</span>
															<input type="radio" name="noticeValue" checked="<%="1".equals(notice.getImportant()) ? "checked" : " " %>" value="1"/><span>일반공지</span>
														</div>
													</div>
												</div>
											</td>
										</tr>
										<tr>
											<td colspan="4">
												<div class="input-group">
												
													<div class="custom-file">
														<input type="file" class="custom-file-input" name="uploadfile" id="imageUpload" value="" aria-describedby="inputGroupFileAddon01" />
														<label id="impageUploadName" for="imageUpload" class="custom-file-label">이미지를 첨부해주세요.</label>
													</div>
												</div>
											</td>
										</tr>
										<%
											if(notice.getImagePath() != null){
										%>
										<tr id="notice-image-delete-tr">
											<td colspan="4">
												<div class="text-left">
													<button class="btn btn-primary" type="button" id="notice-image-delete-btn">이미지 삭제</button>
												</div>
											</td>
										</tr>
										<%
											}
										%>
										<tr>
											<td colspan="4">
											<%
											if(notice.getImagePath() != null){
												
											
											%>
												<div>
													<img src="../image/NOTICE/<%=notice.getImagePath() %>" class="card-img" id="change-image" alt="...">
												</div>
												
											<%
											
											} else {
												
											%>
												<div>
													<img name="blank_img" src="../image/no_detail_img.jpg" class="card-img" id="change-image" alt="...">
												</div>


											<%
											
											}
											
											%>
											</td>
										</tr>
										<tr>
											<td colspan="4">
												<textarea class="form-control" placeholder="내용을 입력해주세요"
													id="notice-content" name="content" maxlength="2048" style="height: 100px;" /><%=notice.getContent() %></textarea>
											</td>
										</tr>	
									</tbody>
								</table>
							<div class="form-btn text-right">
								<input type="hidden" value="<%=notice.getNo() %>" name="no" />
								<button onclick="history.go(-1);" type="button" class="btn btn-secondary">돌아가기</button>
								<button type="button" class="btn btn-primary" id="notice-submit">수정완료</button>
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