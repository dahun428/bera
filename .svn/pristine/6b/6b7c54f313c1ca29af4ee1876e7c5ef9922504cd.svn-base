<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<body>
	<div class="container">
		<div class="row custom-nav">
		
		<%
			if(!"Y".equals(loginedYn)) {
		%>
			<div class="col-1">
				<a href="${pageContext.request.contextPath }/user/loginform.jsp"
					class="nav-link">LOGIN</a>
			</div>
			<div class="col-1">
				<a href="${pageContext.request.contextPath }/user/joinform.jsp"
					class="nav-link">JOIN</a>
			</div>
		<%
			} else {
		%>
			<div class="col-1">
				<a href="${pageContext.request.contextPath }/user/logout.jsp"
					class="nav-link">LOGOUT</a>
			</div>
			<div class="col-1">
				<a href="${pageContext.request.contextPath }/user/mypage-point.jsp"
					class="nav-link">MYPAGE</a>
			</div>
		<%
			}
		%>
			<div class="col-9">
				<ul class="nav justify-content-end" id="custom-nav">
					<li class="nav-item"><a class="nav-link <%="flavor".equals(position) ? "active" : "" %>" href="${pageContext.request.contextPath }/event/flavorOftheMonth.jsp">FLAVOR
							OF MONTH</a>
						<div class="nav-sub">
							<div class="nav-sub-menu">
								<a href="${pageContext.request.contextPath }/event/flavorOftheMonth.jsp">
								<img
									src="${pageContext.request.contextPath }/image/event_ice.jpg"
									alt="" />
								</a>
							
							</div>
						</div></li>
					<li class="nav-item"><a
						class="nav-link <%="menu".equals(position) ? "active" : "" %>"
						href="${pageContext.request.contextPath }/product/main.jsp">MENU</a>
						<div class="nav-sub">
							<ul class="nav-sub-menu">
								<li><a
									href="${pageContext.request.contextPath }/product/list.jsp?category=ICECREAM">아이스크림</a></li>
								<li><a
									href="${pageContext.request.contextPath }/product/list.jsp?category=CAKE">아이스크림
										케이크</a></li>
							</ul>
						</div></li>
					<li class="nav-item"><a
						class="nav-link <%="event".equals(position) ? "active" : "" %>"
						href="${pageContext.request.contextPath }/event/list.jsp">EVENT</a>
						<div class="nav-sub">
							<ul class="nav-sub-menu">
								<li><a
									href="${pageContext.request.contextPath }/event/list.jsp">진행중인
										이벤트</a></li>
								<li><a
									href="${pageContext.request.contextPath }/event/end.jsp">당첨자발표</a></li>
							</ul>
						</div></li>
					<li class="nav-item"><a
						class="nav-link <%="notice".equals(position) ? "active" : "" %>"
						href="${pageContext.request.contextPath }/notice/list.jsp">공지사항</a>
					</li>
				</ul>
			</div>
		</div>
	</div>