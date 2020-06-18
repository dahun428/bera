<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	.error {
		color: red;
		font-weight: bold;
		font-style: italic;
	}
	.field-error {
		border: 1px solid red;
	}
</style>
<body>
	<div class="wrapper">
		<div class="header">
			<%@ include file="/common/header.jsp"%>
		</div>
		<div class="navi">
		<%
			String position = "join";
		%>
			<%@ include file="/common/navi.jsp"%>
		</div>
		<div class="body">
			<div class="container">
			
				<div class="content-header text-center">
					<h1 class="display-4">JOIN</h1>
					<p>
						<strong>회원등록 페이지 입니다.</strong>
					</p>
				</div>
				<div class="custom-content-box">
					<hr />
					<div class="title text-center">
						<h5>베스킨라빈스 회원가입</h5>
						<p>회원등록을 하셔서 다양한 혜택을 만나보세요</p>
						
					</div>
					<div class="error">
						<%
							String error = request.getParameter("error");
						%>
						<%
							if ("dup".equals(error)) {
									
						%>
							<p class="text-center">이미 사용중인 아이디입니다.</p>
						<%
							}			
						%>
						<%
							if ("null".equals(error)) {
									
						%>
							<p class="text-center">null</p>
						<%
							}			
						%>	
					</div>
					
					<!-- join form start -->
					<div class="custom-box-wrap">
						<div class="custom-box">
							<form id="user-joinform"method="post"action="joinregister.jsp"onsubmit="checkField(event)">
								<table class="table table-bordered">
									<tbody>
										<tr>
											<td>이름</td>
											<td>
												<div id='name-input' class="form-group">
													<input name="name" type="text" class="form-control" />
												</div>
											</td>
										</tr>
										<tr>
											<td>아이디</td>
											<td>
												<div id='id-input' class="form-group">
													<input name="id" type="text" class="form-control" />
												</div>
											</td>
										</tr>
										<tr>
											<td>비밀번호</td>
											<td>
												<div id='pwd-input'class="form-group">
													<input name="pwd" type="text" class="form-control" />
												</div>
											</td>
										</tr>
										<tr>
											<td>비밀번호 확인</td>
											<td>
												<div id='pwd-chk-input'class="form-group">
													<input name="pwd-chk" type="text" class="form-control" />
												</div>
											</td>
										</tr>
										<tr>
											<td>전화번호</td>
											<td>
												<div id='phone-input'class="form-group">
													<input name="phone" type="text" class="form-control" />
												</div>
											</td>
										</tr>
										<tr>
											<td>이메일</td>
											<td>
												<div id='email-input'class="form-group">
													<input name="email" type="text" class="form-control" />
												</div>
											</td>
										</tr>
										<tr>
											<td colspan="2">
												<div class="form-group">
													<input type="checkbox" name="userAgree"
														id="join-user-agree"> <label><small>이용약관
															및 개인정보 처리 방침에 동의합니다.</small></label>
												</div>
											</td>
										</tr>
									</tbody>
								</table>
							<div class="form-btn text-right">
								<a href="../home.jsp"class="btn btn-secondary">돌아가기</a>
								<button type="submit" class="btn btn-primary">회원가입</button>
							</div>
							</form>
						</div>
					</div>
					<!-- join form end -->
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
		var nameField = document.querySelector("input[name=name]");
		var emailField = document.querySelector("input[name=email]");
		var idField = document.querySelector("input[name=id]");
		var pwdField = document.querySelector("input[name=pwd]");
		var phoneField = document.querySelector("input[name=phone]");
		var pwdchkField = document.querySelector("input[name=pwd-chk]");
		var agreeField = document.querySelector("input[name=userAgree]");
		
		var isPassed = true;
		if (!nameField.value) {
			document.querySelector("#name-input").classList.add("field-error");
			isPassed = false;
		}
		if (!emailField.value) {
			document.querySelector("#email-input").classList.add("field-error");
			isPassed = false;
		}
		if (!idField.value) {
			document.querySelector("#id-input").classList.add("field-error");
			isPassed = false;
		}
		if (!pwdField.value) {
			document.querySelector("#pwd-input").classList.add("field-error");
			isPassed = false;
		}
		if (!phoneField.value) {
			document.querySelector("#phone-input").classList.add("field-error");
			isPassed = false;
		}
		if (!pwdchkField.value) {
			document.querySelector("#pwd-chk-input").classList.add("field-error");
			isPassed = false;
		}
		if (!agreeField.checked) {
			document.querySelector("#join-user-agree").classList.add("field-error");
			alert("약관을 반드시 동의해주세요");
			isPassed = false;
		}
		if (!isPassed) {
			event.preventDefault();			
		}
	}
	
	function clearErrorField() {
		var fields = document.querySelectorAll(".form-group");
		for (var i=0; i<fields.length; i++) {
			var input = fields[i];
			input.classList.remove('field-error');
		}
	}
</script>
</body>
</html>