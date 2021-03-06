<%@page import="com.br.vo.Pagenation"%>
<%@page import="com.br.utils.NumberUtil"%>
<%@page import="java.util.List"%>
<%@page import="com.br.vo.User"%>
<%@page import="com.br.vo.PointUse"%>
<%@page import="com.br.dao.UserDao"%>
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
				String position = "myPoint";
			%>
			<%@ include file="/common/navi.jsp"%>
		</div>
		<div class="body">
			<%
				UserDao userDao = new UserDao();
				User user = userDao.getUserById(loginedUserId);
				
				/* 페이지 처리 */
				int pageNo = NumberUtil.stringToInt(request.getParameter("page"),1);
				int totalRows = userDao.getTotalPointRows(loginedUserId);
				Pagenation pagenation = new Pagenation(5, 5, pageNo, totalRows);
				List<PointUse> pointUses= userDao.getPointUseByUserId(loginedUserId, pagenation.getBeginIndex(), pagenation.getEndIndex());
				
			%>
			<div class="container">
				<div class="content-header text-center">
					<h1 class="display-4">MY PAGE</h1>
					<p>
						<strong>회원님을 위한 베스킨라빈스의 다양한 정보</strong>
					</p>
				</div>
				<div class="custom-content-box">
					<hr />
					<%
						String myPagePosition = "myPoint";
					%>
					<%@ include file="mypage-navi.jsp"%>
					<div class="row content-header text-center">
						<!-- mypoint content start -->
						<div class="col-12">
							<h2 class="text-info"><%=loginedUserName %>님의 포인트내역입니다.</h2>
						</div>
					</div>
					<div class="row content-header">
						<div class="col-12">
							<h4 class="color-pink">나의 포인트 <span class="badge badge-pill badge-dark"><%=NumberUtil.numberWithComma(user.getPoint()) %> 점</span></h4>
							<hr />
							<div class="my-point-table">

								<table class="table">
									<thead>
										<tr>
											
											<th>주문상품</th>
											<th>사용한 포인트</th>
											<th>사용일자</th>
										</tr>
									</thead>
									<tbody>
										<%
											if(pointUses.size() == 0) {
										%>
										<tr>
											<td colspan="4" class="text-center">사용 내역이 없습니다.</td>
										</tr>
										<%
											} else {
												for(PointUse pointUse : pointUses) {
										%>
										<tr>
											
											<td><%=pointUse.getReason() %></td>
											<td><%=pointUse.getPoint() %></td>
											<td><%=pointUse.getUsedDate() %></td>
										</tr>
										<%
												}
											}
										%>
									</tbody>
								</table>
								<ul class="pagination justify-content-center"
											style="margin: 20px 0">

											<%
												if (pagenation.getPageNo() > 1) {
											%>
											<li class="page-item"><a class="page-link"
												href="mypage-point.jsp?page=<%=pagenation.getPageNo() - 1%>">이전</a></li>
											<%
												}

												for (int num = pagenation.getBeginPage(); num <= pagenation.getEndPage(); num++) {
											%>

											<li class="page-item"><a
												class="page-link <%=num == pageNo ? "active" : ""%>"
												href="mypage-point.jsp?page=<%=num%>"><%=num%></a></li>

											<%
												}

												if (pagenation.getPageNo() < pagenation.getTotalPages()) {
											%>
											<li class="page-item"><a class="page-link"
												href="mypage-point.jsp?page=<%=pagenation.getPageNo() + 1 %>">다음</a></li>
											<%
												}
											%>
										</ul>
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