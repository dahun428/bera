<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<body>
	<div class="container">
		<div class="row custom-nav">
			<div class="col-1">
				<a href="${pageContext.request.contextPath }/user/loginform.jsp" class="nav-link">LOGIN</a>
			</div>
			<div class="col-1">
				<a href="${pageContext.request.contextPath }/user/joinform.jsp" class="nav-link">JOIN</a>
			</div>
			<div class="col-1">
				<a href="${pageContext.request.contextPath }/user/mypage.jsp" class="nav-link">MYPAGE</a>
			</div>
			<div class="col-9">
				<ul class="nav justify-content-end" id="custom-nav">
					<li class="nav-item"><a class="nav-link active" href="#">FLAVOR
							OF MONTH</a>
						<div class="nav-sub">
							<div class="nav-sub-menu">
								<img src="${pageContext.request.contextPath }/image/event_ice.jpg" alt="" />
							</div>
						</div></li>
					<li class="nav-item"><a class="nav-link" href="#">MENU</a>
						<div class="nav-sub">
							<ul class="nav-sub-menu">
								<li><a href="#">아이스크림</a></li>
								<li><a href="#">아이스크림 케이크</a></li>
								<li><a href="#">음료</a></li>
								<li><a href="#">커피</a></li>
								<li><a href="#">디저트</a></li>
							</ul>
						</div></li>
					<li class="nav-item"><a class="nav-link" href="#">EVENT</a>
						<div class="nav-sub">
							<ul class="nav-sub-menu">
								<li><a href="#">진행중인 이벤트</a></li>
								<li><a href="#">당첨자발표</a></li>
							</ul>
						</div></li>
					<li class="nav-item"><a class="nav-link" href="#">ABOUT</a>
						<div class="nav-sub">
							<ul class="nav-sub-menu">
								<li><a href="#">고객센터</a></li>
								<li><a href="#">공지사항</a></li>
							</ul>
						</div></li>
				</ul>
			</div>
		</div>
	</div>