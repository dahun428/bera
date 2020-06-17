<%@page import="com.br.dto.BasketDto"%>
<%@page import="com.br.utils.NumberUtil"%>
<%@page import="com.br.dao.OrderDao"%>
<%@page import="java.util.List"%>
<%@page import="com.br.vo.Product"%>
<%@page import="com.br.vo.User"%>
<%@page import="com.br.dao.UserDao"%>
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
			String position="mypage";
		%>
			<%@ include file="/common/navi.jsp"%>
		</div>
		<div class="body">
		<%
			UserDao userDao = new UserDao();
			User user = userDao.getUserById(loginedUserId);
			
			OrderDao orderDao = new OrderDao();
			List<BasketDto> basketDtos = orderDao.getAllBasketByUserId(loginedUserId);
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
						String myPagePosition = "myCartPage";
					%>
					<%@ include file="mypage-navi.jsp"%>
					<div class="row content-header text-center">
						<!-- mypoint content start -->
						<div class="col-9 custom-border-right">
							<h2>안녕하세요 <%=loginedUserName %>님</h2>
						</div>
						<div class="col-3">
							<h5>사용가능 총 포인트</h5>
							<span class="text-primary"><%=user.getPoint() %>p</span>
						</div>
						<!-- mypoint coatent end -->
					</div>
					<form action="../order/credit.jsp" method="post" id="cart-form">
						<div class="row content-header">
							<!-- mypage-cart content start -->
							<div class="col-12">
								<h4>나의 장바구니</h4>
								<hr />
								<div class="row orderlist">
									<table class="table table-bordered text-center">
										<thead>
											<tr>
												<th scope="row">
													<input type="checkbox" name="checkall" onchange="toggleChecked()"/>
												</th>
												<th scope="row" colspan="2">상품</th>
												<th scope="row">수량</th>
												<th scope="row">가격(원)</th>
												<th scope="row">구매 시 적립포인트</th>
												<th scope="row">구매하기</th>
											</tr>
										</thead>
										<!-- 서버에서 장바구니 구현하기 -->
										<tbody>
										<%
											if(basketDtos.size() == 0) {
										%>
											<tr>
												<td colspan="6" class="text-center">장바구니에 상품이 없습니다.</td>
											</tr>
										<%
											} else {
												for(BasketDto basketDto : basketDtos) {
										%>
											<tr>
												<td>
													<input type="hidden" name="amount" value="<%=basketDto.getAmount() %>"/>
													<input type="checkbox" name="productNo" value="<%=basketDto.getNo() %>" onchange="changeAllCheckbox()"/>
												</td>
												<td>
													<img src="../image/<%="ICECREAM".equals(basketDto.getCategory()) ? "ICECREAM":"CAKE" %>/<%=basketDto.getImagePath() %>"/>
												</td>
												<td>
													<p><%=basketDto.getName() %></p>
												</td>
												<td>
													<p><%=basketDto.getAmount() %></p>
												</td>
												<td>
													<p><%=NumberUtil.numberWithComma(basketDto.getPrice()-basketDto.getDiscountPrice()) %></p>
												</td>
												<td>
													<p><%=NumberUtil.numberWithComma(basketDto.getPoint()) %>p</p>
												</td>
												<td>
													<button type="button" class="btn btn-primary" onclick="AllCheckDelete(); check('../order/credit.jsp?productNo=<%=basketDto.getNo() %>&amount=<%=basketDto.getAmount() %>&type=one')">구매하기</button>
												</td>
											</tr>
										<%
												}
											}
										%>
										<!--  -->
										</tbody>
									</table>
								</div>
							</div>
							<div class="col-12">
								<div class="form-btn text-center">
									<button class="btn btn-danger" type="button" onclick="check('../order/basketdelete.jsp')">선택상품삭제</button>
									<button class="btn btn-primary" type="button" onclick="check('../order/credit.jsp')">선택상품구매</button>
								</div>
							</div>
							<!-- mypage-cart content end -->
						</div>
					</form>
				</div>
			</div>
		</div>
		<div class="footer">
			<%@ include file="/common/footer.jsp"%>
		</div>
	</div>
	
	<script type="text/javascript">
		function toggleChecked() {
			var checkbox = document.querySelector("input[name=checkall]");
			var checkedStatus = checkbox.checked;
			
			var checkboxs = document.querySelectorAll("input[name=productNo]");
			for(var i=0; i<checkboxs.length; i++) {
				checkboxs[i].checked = checkedStatus;
			}
		}
		
		function changeAllCheckbox() {
			var checkboxs = document.querySelectorAll("input[name=productNo]");
			
			var totalCheckboxCount = checkboxs.length;	
			var checkedCount = 0;						
			for(var i=0; i<checkboxs.length; i++) {
				if(checkboxs[i].checked) {		
					checkedCount++;	
				}
			}
			
			var checkbox = document.querySelector("input[name=checkall]");
			if(totalCheckboxCount == checkedCount) {
				checkbox.checked = true;
			} else {
				checkbox.checked = false;
			}
		}
		
		function AllCheckDelete() {
			var checkboxs = document.querySelectorAll("input[name=productNo]");
			for(var i=0; i<checkboxs.length; i++) {
				checkboxs[i].checked = false;
				console.log("실행");
			}
		}
		
		function check(url) {
			var form = document.getElementById("cart-form");
			form.setAttribute("action", url);
			form.submit();
		}
	</script>
</body>
</html>