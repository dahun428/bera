<%@page import="com.br.vo.Pagenation"%>
<%@page import="com.br.vo.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.br.vo.Order"%>
<%@page import="com.br.utils.NumberUtil"%>
<%@page import="com.br.dto.OrderDto"%>
<%@page import="com.br.vo.User"%>
<%@page import="com.br.dao.UserDao"%>
<%@page import="java.util.List"%>
<%@page import="com.br.dao.OrderDao"%>
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
				String position = "order";
			%>
			<%@ include file="/common/navi.jsp"%>
		</div>
		<div class="body">
		<%
			UserDao userDao = new UserDao();
			User user = userDao.getUserById(loginedUserId);
			
			OrderDao orderDao = new OrderDao();
			
			/* 페이징 처리 */
			int pageNo = NumberUtil.stringToInt(request.getParameter("page"),1);
			int totalRows = orderDao.getTotal(loginedUserId);
			Pagenation pagenation = new Pagenation(5, 5, pageNo, totalRows);
			List<OrderDto> orderDtos = orderDao.getOrderByUserId(loginedUserId, pagenation.getBeginIndex(), pagenation.getEndIndex());
			
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
						String myPagePosition = "myOrderlist";
					%>
					<!-- mypage-nav start -->
					<%@ include file="mypage-navi.jsp"%>
					<!-- mypage-nav end -->
					<!-- mypage-orderlist content start -->
					<!-- 서버에서 주문정보 불러와서 테이블 형태로 화면에 나타내기 -->
					<div class="row content-header text-center">
						<div class="col-12">
							<h2>주문 내역 페이지 입니다.</h2>
						</div>					
					</div>
					<div class="row content-header">
						<div class="col-12">
							<h4>나의 주문내역</h4>
							<hr />
							<div class="my-order-table">
								<table class="table table-borered">
									<thead>
										<tr>
											<th>상품명</th>
											<th>상품가격</th>
											<th>구매일</th>
											<th>상세내역</th>
										</tr>
									</thead>
									<tbody>
									<%
										if (!orderDtos.isEmpty()) {
									
											for (OrderDto orderDto : orderDtos) {
											
									%>
										<tr>
											<td><%=orderDto.getName() %><%=orderDto.getOrderProductAmount()>1 ? "외" + (orderDto.getOrderProductAmount()-1) + "건" : " " %></td>
											<td><%=NumberUtil.numberWithComma(orderDto.getPayment()) %></td>
											<td><%=orderDto.getRegDate()%></td>
											<td><button class="btn btn-primary" onclick="openPopup(<%=orderDto.getOrderNo() %>)">상세내역</button></td>
										</tr>
									<%
											}
										} else {
									%>
											<tr class="text-center">
												<td colspan="5">주문내역이 존재하지 않습니다.</td>
											</tr>
									<% 
										}
									%>	
									</tbody>
								</table>
								<!--  페이지 처리 시작 -->
								<ul class="pagination justify-content-center"
									style="margin: 20px 0">
									
									<%
										if (pagenation.getPageNo() > 1) {
									%>
									<li class="page-item"><a class="page-link"
												href="mypage-orderlist.jsp?page=<%=pagenation.getPageNo() - 1%>">이전</a></li>
									<%
										}

										for (int num = pagenation.getBeginPage(); num <= pagenation.getEndPage(); num++) {
									%>

									<li class="page-item"><a
										class="page-link <%=num == pageNo ? "active" : ""%>"
										href="mypage-orderlist.jsp?page=<%=num%>"><%=num%></a></li>

									<%
										}

										if (pagenation.getPageNo() < pagenation.getTotalPages()) {
									%>
									<li class="page-item"><a class="page-link"
										href="mypage-orderlist.jsp?page=<%=pagenation.getPageNo() + 1 %>">다음</a></li>
									<%
										}
									%>
								</ul>
							</div>
						</div>
					</div>
					<!-- mypage-orderlist content end -->
				</div>
			</div>
		</div>
		<div class="footer">
			<%@ include file="/common/footer.jsp"%>
		</div>
	</div>
</body>
</html>