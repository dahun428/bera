<%@page import="com.br.vo.User"%>
<%@page import="com.br.dao.UserDao"%>
<%@page import="com.br.dto.BasketDto"%>
<%@page import="com.br.dao.OrderDao"%>
<%@page import="com.br.vo.Product"%>
<%@page import="com.br.dao.ProductDao"%>
<%@page import="com.br.utils.NumberUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/logincheck.jsp" %>
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
					<form action="orderregister.jsp" method="post" id="form-group">
						<input type="hidden" name="type" value="<%=request.getParameter("type") %>">
						<div class="row orderlist">
							<div class="col-12">
								<!-- creidt form start -->

								<table class="table table-bordered text-center">
									<thead>
										<tr>
											<th scope="row"><input type="checkbox" name="checkall" onchange="toggleChecked()" checked/></th>
											<th scope="row" colspan="2">상품</th>
											<th scope="row" style="width: 100px;">수량</th>
											<th scope="row">가격(원)</th>
											<th scope="row">예상 적립포인트</th>

										</tr>
									</thead>
									<!-- 서버에서 장바구니 구현하기 -->
									<tbody>
										<%
											OrderDao orderDao = new OrderDao();
											ProductDao productDao = new ProductDao();
											
											UserDao userDao = new UserDao();
											User user = userDao.getUserById(loginedUserId);
											int userPoint = user.getPoint();

											String type = request.getParameter("type");
											
											for (int i = 0; i < productNoList.length; i++) {
												BasketDto basketDto = orderDao.getProductByBasket(productNoList[i], loginedUserId);
												Product product = productDao.getProductByProductNo(productNoList[i]);
												
												// 상품 개수
												int productAmount = basketDto == null ? amountList[i] : ("one".equals(type) ? amountList[i] : basketDto.getAmount());
												totalPrice += product.getPrice() * productAmount;
												totalDiscountPrice += product.getDiscountPrice() * productAmount;
										%>
										<tr>
											<td>
												<!--
												<input type="hidden" name="productNo" value="<%=productNoList[i] %>">
												-->
												<input type="hidden" id="product-one-price-<%=productNoList[i] %>" value="<%=product.getPrice() %>">
												<input type="hidden" id="products-discountPrice-<%=productNoList[i] %>" value="<%=product.getDiscountPrice() %>">
												<input type="hidden" id="product-one-point-<%=productNoList[i] %>" value="<%=product.getPoint() %>">
												<input type="hidden" id="user-point" value="<%=user.getPoint() %>">
												
												
												<input type="checkbox" id="product-checkbox-<%=productNoList[i] %>" name="productNo" value="<%=productNoList[i] %>" onchange="changeAllCheckbox()" checked/>
											</td>
											<td><img
												src="../image/<%="ICECREAM".equals(product.getCategory()) ? "ICECREAM" : "CAKE"%>/<%=product.getImagePath()%>" />
											</td>
											<td>
												<p><%=product.getName()%></p>
											</td>
											<td>
												<p>
													<input type="number" value="<%=productAmount %>"
														class="form-control text-right" id="amount-input-<%=productNoList[i] %>" min="1" onchange="changeAmount(<%=productNoList[i] %>)"/>
												</p>
											</td>
											<td>
												<p id="order-price-<%=productNoList[i] %>"><%=NumberUtil.numberWithComma(product.getPrice()*amountList[i])%></p>
											</td>
											<td>
												<p><span id="product-point-<%=productNoList[i] %>"><%=NumberUtil.numberWithComma(product.getPoint()*amountList[i])%></span>p
												</p>
												<p id="add-hidden-td"></p>
											</td>
											
										</tr>
										<%
											}
											totalPayPrice = totalPrice - totalDiscountPrice;
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
												<div class="text-right font-weight-bold">
													<span id="price-span"><%=NumberUtil.numberWithComma(totalPrice) %></span> <span>원</span>
												</div>
											</td>
										</tr>
										<tr class="table-borderless">
											<td colspan="3">할인금액</td>
											<td colspan="1">
												<!-- product price -->
												<div class="text-right font-weight-bold text-danger" id="discount-price-div">
													<span id="discount-price-span"><%=NumberUtil.numberWithComma(totalDiscountPrice) %></span> <span>원</span>
												</div>
											</td>
										</tr>
										<tr class="table-borderless">
											<td colspan="3">현재보유포인트</td>
											<td colspan="1"><div
													class="text-right font-weight-bold text-primary">
													<span id="user-point-span"><%=NumberUtil.numberWithComma(user.getPoint()) %></span> <span>point</span>
												</div></td>
										</tr>
										<tr class="table-borderless">
											<td colspan="1"><span>포인트사용</span></td>
											<td colspan="3">
												<!-- point --> <input class="form-control text-right" id="using-point-input" type="number" value="0" min="0" max="<%=userPoint %>"
												style="margin: 0px;" name="using-point" onchange="refreshTotalOrderPrice()" onkeyup="refreshTotalOrderPrice()"/>
											</td>
										</tr>
										<tr class="table-borderless">
											<td colspan="1"><span class="font-weight-bold">총결제금액</span></td>
											<td colspan="3">
												<div class="text-right font-weight-bold">

													<span id="total-price-span"><%=NumberUtil.numberWithComma(totalPayPrice) %></span> <span>원</span>
													<input type="hidden" id="total-price-hidden" value="<%=totalPayPrice %>">
												</div>
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
							<button type="button" class="btn btn-secondary btn-lg" onclick="history.back();">돌아가기</button>
							<button type="button" class="btn btn-primary btn-lg" onclick="formSubmit(event)">결제하기</button>
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
			var isPass = true;
			
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
				isPass = false;
			}
			
			return isPass;
		}
		
		function clearErrorField() {
			var fields = document.querySelectorAll(".form-group");
			console.log(fields);
			for(var i=0; i<fields.length; i++) {
				var input = fields[i];
				input.classList.remove("field-error");
			}
		}
		
		
		
		
		function toggleChecked() {
			var checkbox = document.querySelector("input[name=checkall]");
			var checkedStatus = checkbox.checked;
			
			var checkboxs = document.querySelectorAll("input[name=productNo]");
			for(var i=0; i<checkboxs.length; i++) {
				checkboxs[i].checked = checkedStatus;
			}
			
			refreshTotalOrderPrice();
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
			
			refreshTotalOrderPrice();
		}
		
		
		
		
		// 선택된 체크박스의 내용만 뽑아오기
		function selectCheckbox() {
			// form onsubmit 이벤트
			// 체크된 row의 수량값을 받아오기
			// innerHTML으로 input hidden 같은name으로 수량 저장하기
			var checkbox = $('input[name=productNo]:checked');
			var amountValue = "";
			var addHidden = document.querySelector("#add-hidden-td");
			var amountHtml = "";
			
			checkbox.each(function(i) {
				var tr = checkbox.parent().parent().eq(i);
				var td = tr.children();
				var amountValue = td.eq(3).children().children().val();	// 체크된 상품별 수량
				
				amountHtml += "<input type='hidden' name='product-amount' value=" + amountValue + ">"
			});
			addHidden.innerHTML = amountHtml;
		}
		
		
		function changeAmount(productNo) {
			var price = currencyToNumber(document.getElementById("product-one-price-" + productNo).value);
			var amount = parseInt(document.getElementById("amount-input-" + productNo).value);
			var point = currencyToNumber(document.getElementById("product-one-point-" + productNo).value);
			
			var orderPrice = price * amount;
			var orderPoint = point * amount;
			document.getElementById("order-price-" + productNo).textContent = numberToCurrency(orderPrice);
			document.getElementById("product-point-" + productNo).textContent = numberToCurrency(orderPoint);
			
			refreshTotalOrderPrice();
		}
		
		function refreshTotalOrderPrice() {
			var checkboxes = document.querySelectorAll('input[id^=product-checkbox]');
			
			var totalPrice = 0;
			var totalDiscountPrice = 0;
			for(var i=0; i<checkboxes.length; i++) {
				var checkbox = checkboxes[i];
				
				if(checkbox.checked) {
					var productNo = checkbox.value;
					var amount = parseInt(document.getElementById("amount-input-" + productNo).value);
					
					/* 총 상품금액 표시 */
					var priceCurrencyText = document.getElementById("product-one-price-" + productNo).value;
					var orderPrice = currencyToNumber(priceCurrencyText);
					totalPrice += orderPrice*amount;
					
					/* 총 할인금액 표시 */
					var discountCurrencyText = document.getElementById("products-discountPrice-" + productNo).value;
					var orderDiscount = currencyToNumber(discountCurrencyText);
					totalDiscountPrice += orderDiscount*amount;
				}
					/* 총 결제금액 표시 */
					var usingPoint = document.getElementById("using-point-input").value;
					var totalOrderPrice = totalPrice - totalDiscountPrice - usingPoint;
			}
			document.getElementById("price-span").textContent = numberToCurrency(totalPrice);
			document.getElementById("discount-price-span").textContent = numberToCurrency(totalDiscountPrice);
			document.getElementById("total-price-span").textContent = numberToCurrency(totalOrderPrice);
			if(totalPrice - totalDiscountPrice != 0) {
				document.getElementById("total-price-hidden").value = totalPrice - totalDiscountPrice;			
			}
		}
		
		function numberToCurrency(number) {
			return new Number(number).toLocaleString();
		}

		function currencyToNumber(currency) {
			return parseInt(currency.replace(/,/g, ''));
		}
		
		
		
		function pointCheck(event) {
			var isPass = true;
			
			var usingPoint = document.getElementById("using-point-input").value;
			var orderPrice = document.getElementById("total-price-hidden").value;
			if (parseInt(usingPoint) > parseInt(orderPrice)) {
				alert("포인트를 상품 가격보다 많게 사용할 수 없습니다");
				isPass = false;
			}
			
			return isPass;
		}
		
		function nullCheck(event) {
			var isPass = true;
			
			var checkboxs = document.querySelectorAll("input[name=productNo]");
			
			var totalCheckboxCount = checkboxs.length;	
			var checkedCount = 0;						
			for(var i=0; i<checkboxs.length; i++) {
				if(checkboxs[i].checked) {		
					checkedCount++;	
				}
			}
			
			if(checkedCount == 0) {
				alert("하나 이상의 상품을 선택해주세요!");
				isPass = false;
			}
			
			return isPass;
		}
		
		function formSubmit(event) {
			var form = document.getElementById("form-group");
			
			var pass1 = checkField(event);
			if(!pass1) {
				return;
			}
			selectCheckbox();
			var pass2 = pointCheck(event);
			if(!pass2) {
				return;
			}
			var pass3 = nullCheck(event);
			if(!pass3) {
				return;
			}
			
			var usingPoint = document.getElementById("using-point-input").value;
			var userPoint = document.getElementById("user-point").value
			
			if(parseInt(usingPoint) > parseInt(userPoint)) {
				alert("포인트를 보유 포인트보다 많게 사용할 수 없습니다.");
				return;
			}
			
			if(!pass1 || !pass2 || !pass3) {
				return;
			}	
			
			form.submit();				
		}
	</script>
</body>
</html>