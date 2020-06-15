<%@page import="com.br.vo.User"%>
<%@page import="com.br.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String userId = request.getParameter("id");
	String password = request.getParameter("pwd");

	UserDao userDao = new UserDao();
	User user = userDao.getUserById(loginedUserId);
	
	if(!userId.equals(loginedUserId)) {
		response.sendRedirect("mypage-deleteform.jsp?error=fail");
		return;
	}
	if(!password.equals(user.getPassword())) {
		response.sendRedirect("mypage-deleteform.jsp?error=fail");
		return;
	}
	
	userDao.deleteUser(userId);
	session.invalidate();
	response.sendRedirect("../home.jsp");
%>