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
				String position = "modify";
			%>
			<%@ include file="/common/navi.jsp"%>
		</div>
		<div class="body">
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
						String myPagePosition = "modifyPage";
					%>
					<!-- mypage-nav start -->
					<%@ include file="mypage-navi.jsp"%>
					<!-- mypage-nav end -->
					<!-- modify form start -->
					<div class="row content-header text-center">
						<div class="col-12">
							<h2>회원 정보 수정 페이지 입니다.</h2>
						</div>
					</div>
					<div class="row content-header">
						<div class="col-12">
							<h4>나의 회원 정보</h4>
							<hr />
							<div class="my-info-modify">
								<form action="modify.jsp" method="post">
									<table class="table table-bordered">
										<tbody>
										<%
											UserDao userDao = new UserDao();
											User user = userDao.getUserById(loginedUserId);
										%>
											<tr>
												<td>이름</td>
												<td>
													<div class="form-group">
														<input name="name" type="text" class="form-control"
															disabled="disabled" value="<%=loginedUserName %>"/>
													</div>
												</td>
											</tr>
											<tr>
												<td>아이디</td>
												<td>
													<div class="form-group">
														<input name="id" type="text" class="form-control"
															disabled="disabled" value="<%=loginedUserId %>"/>
													</div>
												</td>
											</tr>
											<tr>
												<td>비밀번호</td>
												<td>
													<div class="form-group">
														<input name="pwd" type="password" class="form-control" id="pwdId"/>
													</div>
												</td>
											</tr>
											<tr>
												<td>비밀번호 확인</td>
												<td>
													<div class="form-group">
														<input name="pwd-chk" type="password" class="form-control" id="pwd-chkId" onkeyup="pwdCheck()"/>
													</div>
													<p style="margin: 0; color: red; font-size: 13px;" id="error-text"></p>
												</td>
											</tr>
											<tr>
												<td>전화번호</td>
												<td>
													<div class="form-group">
														<input name="tel" type="text" class="form-control" value="<%=user.getPhone() %>"/>
													</div>
												</td>
											</tr>
											<tr>
												<td>이메일</td>
												<td>
													<div class="form-group">
														<input name="email" type="text" class="form-control" value="<%=user.getEmail() %>"/>
													</div>
												</td>
											</tr>
										</tbody>
									</table>
									<div class="form-btn text-right">
										<a class="btn btn-secondary" href="mypage-point.jsp">돌아가기</a>
										<button class="btn btn-primary" id="modify-button" type="submit" disabled>수정하기</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- modify form end -->
			
			<script type="text/javascript">
				function pwdCheck() {
					var pwd = document.getElementById("pwdId").value;
					var pwdChk = document.getElementById("pwd-chkId").value;
					var errorText = document.getElementById("error-text");
					
					if(pwd !== pwdChk) {
						$("#modify-button").attr("disabled", "disabled");
						errorText.textContent = "비밀번호가 일치하지 않습니다!"
					} else {
						$("#modify-button").removeAttr("disabled");
						errorText.textContent = "";
					}
				}
			</script>
		</div>
		<div class="footer">
			<%@ include file="/common/footer.jsp"%>
		</div>
	</div>
</body>
</html>