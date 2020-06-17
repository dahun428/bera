<%@page import="javafx.scene.control.Pagination"%>
<%@page import="com.br.vo.Pagenation"%>
<%@page import="com.br.utils.NumberUtil"%>
<%@page import="com.br.dto.NoticeDto"%>
<%@page import="com.br.vo.Notice"%>
<%@page import="java.util.List"%>
<%@page import="com.br.dao.NoticeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String searchOption = request.getParameter("searchOption");
	String searchValue = request.getParameter("searchValue");

	NoticeDao noticeDao = new NoticeDao();
	int pageNo = NumberUtil.stringToInt(request.getParameter("page"), 1);

	int totalRows = 0;
	Pagenation pagenation = null;
	List<NoticeDto> notices = null;

	if ("title".equals(searchOption)) {
		totalRows = noticeDao.getTotalByTitle(searchValue);
		pagenation = new Pagenation(10, 5, pageNo, totalRows);
		notices = noticeDao.getPaginatedNoticeByTitle(pagenation.getBeginIndex(), pagenation.getEndIndex(), searchValue);
	} else if ("content".equals(searchValue)) {
		totalRows = noticeDao.getTotalByContent(searchValue);
		pagenation = new Pagenation(10, 5, pageNo, totalRows);
		notices = noticeDao.getPaginatedNoticeByContent(pagenation.getBeginIndex(), pagenation.getEndIndex(), searchValue);
	} else {
		totalRows = noticeDao.getTotal();
		pagenation = new Pagenation(10, 5, pageNo, totalRows);
		notices = noticeDao.getPaginatedNotice(pagenation.getBeginIndex(), pagenation.getEndIndex());
	}

	List<NoticeDto> noticesImp = noticeDao.getAllNoticeImportant();
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
									<div class="card-body">
										<!-- 검색조건, 정렬기준 입력 폼 시작 -->
										<form action="list.jsp" method="get">
											<div class="row">
												<!-- 검색조건 입력폼 시작 -->
												<div class="col-6">
													<div class="input-group mb-3">
														<div class="input-group-prepend">
															<select class="form-control" name="searchOption">
																<option value="title">제목</option>
																<option value="content">내용</option>
															</select>
														</div>
														<input type="text" class="form-control" name="searchValue"
															placeholder="검색어를 입력하세요">
														<div class="input-group-append">
															<button class="btn btn-outline-secondary" type="submit">조회</button>
														</div>
													</div>
												</div>
												<!-- 검색조건 입력폼 끝 -->
											</div>
										</form>
										<!-- 검색조건, 정렬기준 입력 폼 끝 -->
										<table class="table table-bordered custom-notice-table">
											<colgroup>
												<col width="10%">
												<col width="*">
												<col width="10%">
												<col width="10%">
												<col width="10%">
											</colgroup>
											<thead>
												<tr>
													<th>번호</th>
													<th>제목</th>
													<th>등록일</th>
												</tr>
											</thead>
											<tbody>
												<%
													if (!noticesImp.isEmpty()) {
														for (NoticeDto noticeImp : noticesImp) {
												%>
												<tr>
													<td class="text-center"><span
														class="badge badge-danger">공지</span></td>
													<td><a class="font-weight-bold"
														href="detail.jsp?no=<%=noticeImp.getNo()%>"><%=noticeImp.getTitle()%></a></td>
													<td><%=noticeImp.getRegDate()%></td>
												</tr>
												<%
													}
													}
												%>
												<%
													if (!notices.isEmpty()) {

														for (NoticeDto notice : notices) {
												%>
												<tr>
													<td class="text-center"><%=notice.getRowNum()%></td>
													<td><a style="text-decoration: none;"
														href="detail.jsp?no=<%=notice.getNo()%>"><%=notice.getTitle()%></a></td>
													<td><%=notice.getRegDate()%></td>
												</tr>
												<%
													}
													} else {
												%>
												<tr class="text-center">
													<td colspan="3">등록된 글이 없습니다.</td>
												</tr>

												<%
													}
												%>
											</tbody>
										</table>
										<!-- 페이지 처리 시작 -->
										<ul class="pagination justify-content-center"
											style="margin: 20px 0">

											<%
												if (pagenation.getPageNo() > 1) {
											%>
											<li class="page-item"><a class="page-link"
												href="list.jsp?page=<%=pagenation.getPageNo() - 1%>">이전</a></li>
											<%
												}

												for (int num = pagenation.getBeginPage(); num <= pagenation.getEndPage(); num++) {
											%>

											<li class="page-item"><a
												class="page-link <%=num == pageNo ? "active" : ""%>"
												href="list.jsp?page=<%=num%>"><%=num%></a></li>

											<%
												}

												if (pagenation.getPageNo() < pagenation.getTotalPages()) {
											%>
											<li class="page-item"><a class="page-link"
												href="list.jsp?page=<%=pagenation.getPageNo() + 1 %>">다음</a></li>
											<%
												}
											%>
										</ul>
										<!-- 페이지 처리 끝 -->
										<div class="row">
											<%
												if("0".equals(loginedAdmin)){
											%>
											<div class="col-12 text-right">
												<a href="noticeform.jsp" class="btn btn-primary">글쓰기</a>
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
				</div>
			</div>
		</div>
		<div class="footer">
			<%@ include file="/common/footer.jsp"%>
		</div>
	</div>
</body>
</html>