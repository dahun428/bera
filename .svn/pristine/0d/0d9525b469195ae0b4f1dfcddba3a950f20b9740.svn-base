<%@page import="com.br.vo.User"%>
<%@page import="com.br.dao.UserDao"%>
<%@page import="com.br.dto.BasketDto"%>
<%@page import="com.br.dao.OrderDao"%>
<%@page import="com.br.vo.Product"%>
<%@page import="com.br.dao.ProductDao"%>
<%@page import="com.br.utils.NumberUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Insert title here</title>
<style>
	.field-error {
		border: 1px solid red;
	}
</style>
</head>
<body>
	<div class="wrapper">
		<!-- header start -->
		<div class="header">
			<%@ include file="/common/header.jsp"%>
		</div>
		<!-- header end -->

		<div class="navi">
			<%
				String position = "credit";
			%>
			<!-- navi start -->
			<%@ include file="/common/navi.jsp"%>
			<!-- navi end -->
		</div>
		<div class="body">
			<%
				// credit.jsp에 나올 상품 리스트
				String[] productNo = request.getParameterValues("productNo");
				String[] amount = request.getParameterValues("amount");
				
				int[] productNoList = new int[productNo.length];
				int[] amountList = new int[amount.length];
				for (int i = 0; i < productNoList.length; i++) {
					productNoList[i] = NumberUtil.stringToInt(productNo[i]);
					amountList[i] = NumberUtil.stringToInt(amount[i]);
				}
				
				int totalPrice = 0;			// 총 상품금액
				int totalDiscountPrice = 0; // 총 할인금액
				int totalPayPrice = 0;		// 총 결제금액
			%>
			<div class="container">
				<div class="content-header text-center">
					<h1 class="display-4">CREDIT</h1>
					<p>
						<strong>주문 결제 페이지 입니다.</strong>
					</p>
				</div>
				<div class="custom-content-box">
					<hr />
					<div class="title text-center">
						<h5>회원님의 소중한 결제 감사합니다.</h5>
						<p>언제나 고객님을 위해 최선을 다하겠습니다.</p>
					</div>
					<form action="orderregister.jsp" method="post" id="form-group" onsubmit="checkField(event)">
						<div class="row orderlist">
							<div class="col-12">
								<!-- creidt form start -->

								<table class="table table-bordered text-center">
									<thead>
										<tr>
											<th scope="row"><input type="checkbox" /></th>
											<th scope="row" colspan="2">상품</th>
											<th scope="row" style="width: 100px;">수량</th>
											<th scope="row">가격(원)</th>
											<th scope="row">구매 시 적립포인트</th>

										</tr>
									</thead>
									<!-- 서버에서 장바구니 구현하기 -->
									<tbody>
										<%
											OrderDao orderDao = new OrderDao();
											ProductDao productDao = new ProductDao();
											
											UserDao userDao = new UserDao();
											User user = userDao.getUserById(loginedUserId);

											String type = request.getParameter("type");
											
											for (int i = 0; i < productNoList.length; i++) {
												BasketDto basketDto = orderDao.getProductByBasket(productNoList[i], loginedUserId);
												Product product = productDao.getProductByProductNo(productNoList[i]);
												
												
												
												totalPrice += (product.getPrice()*(basketDto == null ? amountList[i] : (basketDto.getAmount() != amountList[i] ? amountList[i] : basketDto.getAmount())));
												totalDiscountPrice += product.getDiscountPrice()*(basketDto == null ? amountList[i] : (basketDto.getAmount() != amountList[i] ? amountList[i] : basketDto.getAmount()));
												totalPayPrice = totalPrice - totalDiscountPrice;
										%>
										<tr>
											<td>
												<input type="hidden" name="productNo" value="<%=productNoList[i] %>">
												<input type="checkbox" />
											</td>
											<td><img
												src="../image/<%="ICECREAM".equals(product.getCategory()) ? "ICECREAM" : "CAKE"%>/<%=product.getImagePath()%>" />
											</td>
											<td>
												<p><%=product.getName()%></p>
											</td>
											<td>
												<p>
													<input type="number" value="<%=basketDto == null ? amountList[i] : ("one".equals(type) ? amountList[i] : basketDto.getAmount()) %>" name="product-amount"
														class="form-control text-right" id="amount-input"/>
												</p>
											</td>
											<td>
												<p><%=NumberUtil.numberWithComma(product.getPrice() - product.getDiscountPrice())%></p>
											</td>
											<td>
												<p><%=NumberUtil.numberWithComma(product.getPoint())%>p
												</p>
											</td>
										</tr>
										<%
											}
										%>
									</tbody>
								</table>
							</div>
							<div class="col-12">
								<table class="table table-bordered">
									<tbody>
										<tr class="table-borderless">
											<td colspan="3">총 상품금액</td>
											<td colspan="1">
												<!-- product price -->
												<div class="text-right font-weight-bold" id="price-div">
													<%=NumberUtil.numberWithComma(totalPrice) %> <span>원</span>
												</div>
											</td>
										</tr>
										<tr class="table-borderless">
											<td colspan="3">할인금액</td>
											<td colspan="1">
												<!-- product price -->
												<div class="text-right font-weight-bold text-danger" id="discount-price-div">
													<%=NumberUtil.numberWithComma(totalDiscountPrice) %> <span>원</span>
												</div>
											</td>
										</tr>
										<tr class="table-borderless">
											<td colspan="3">현재보유포인트</td>
											<td colspan="1"><div
													class="text-right font-weight-bold text-primary">
													<%=NumberUtil.numberWithComma(user.getPoint()) %><span>point</span>
												</div></td>
										</tr>
										<tr class="table-borderless">
											<td colspan="1"><span>포인트사용</span></td>
											<td colspan="3">
												<!-- point --> <input class="form-control text-right" type="number" value="0"
												style="margin: 0px;" name="using-point" />
											</td>
										</tr>
										<tr class="table-borderless">
											<td colspan="1"><span class="font-weight-bold">총결제금액</span></td>
											<td colspan="3">
												<div class="text-right font-weight-bold" id="total-price-div">

													<%=NumberUtil.numberWithComma(totalPayPrice) %> <span>원</span>

												</div>
												<input type="hidden" name="total-payment" value="<%=totalPayPrice %>">
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<div class="col-12 text-center">
							<hr />
							<div class="title">
								<h5>회원정보</h5>
							</div>
							<table class="table table-bordered">
								<tbody>
									<tr>
										<td>이름</td>
										<td>
											<div class="form-group">
												<input name="name" type="text" class="form-control" value="<%=user.getName() %>"
													disabled="disabled" />
											</div>
										</td>
									</tr>
									<tr>
										<td>아이디</td>
										<td>
											<div class="form-group">
												<input name="id" type="text" class="form-control" value="<%=user.getId() %>"
													disabled="disabled" />
											</div>
										</td>
									</tr>
									<tr>
										<td>전화번호</td>
										<td>
											<div class="form-group" id="tel-input">
												<input name="tel" type="text" class="form-control" value="<%=user.getPhone() %>"/>
											</div>
										</td>
									</tr>
									<tr>
										<td>이메일</td>
										<td>
											<div class="form-group" id="email-input">
												<input name="email" type="text" class="form-control" value="<%=user.getEmail() %>"/>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
							<hr />
						</div>
						<div class="text-center">
							<button type="button" class="btn btn-secondary btn-lg">돌아가기</button>
							<button type="submit" class="btn btn-primary btn-lg">결제하기</button>
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
		function checkField(event) {
			clearErrorField();
			
			var tel = document.querySelector("input[name=tel]");
			var email = document.querySelector("input[name=email]");
			
			var isPassed = true;
			if(!tel.value) {
				document.querySelector("#tel-input").classList.add("field-error");
				isPassed = false;
			}
			if(!email.value) {
				document.querySelector("#email-input").classList.add("field-error");
				isPassed = false;
			}
			if (!isPassed) {
				event.preventDefault();			
			}
		}
		
		function clearErrorField() {
			var fields = document.querySelectorAll(".form-group");
			console.log(fields);
			for(var i=0; i<fields.length; i++) {
				var input = fields[i];
				input.classList.remove("field-error");
			}
		}
	</script>
</body>
</html>