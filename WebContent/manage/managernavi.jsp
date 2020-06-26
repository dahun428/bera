<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="manager-nav">
	<ul class="nav nav-tabs">
			<li class="nav-item"><a href="main.jsp" class="nav-link <%="main".equals(managerPosition) ? "active" : "" %>">매출관리</a></li>
			<li class="nav-item"><a href="productAdminPage.jsp" class="nav-link <%="productmanager".equals(managerPosition) ? "active" : "" %>">상품관리</a></li>
			<li class="nav-item"><a href="eventmanager.jsp" class="nav-link <%="eventmanager".equals(managerPosition) ? "active" : "" %>">이벤트관리</a></li>
			<li class="nav-item"><a href="noticemanager.jsp" class="nav-link <%="noticemanager".equals(managerPosition) ? "active" : "" %>">공지관리</a></li>
		
	</ul>
</div>