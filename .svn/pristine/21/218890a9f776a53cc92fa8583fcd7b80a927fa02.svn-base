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
				List<PointUse> pointUses= userDao.getPointUseByUserId(loginedUserId);
				User user = userDao.getUserById(loginedUserId);
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
							<h2>포인트 내역 페이지입니다.</h2>
						</div>
					</div>
					<div class="row content-header">
						<div class="col-12">
							<h4>나의 포인트 <span class="badge badge-pill badge-dark"><%=NumberUtil.numberWithComma(user.getPoint()) %> 점</span></h4>
							<hr />
							<div class="my-point-table">

								<table class="table">
									<thead>
										<tr>
											<th>아이디</th>
											<th>사용내역</th>
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
											<td><%=pointUse.getUserId() %></td>
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