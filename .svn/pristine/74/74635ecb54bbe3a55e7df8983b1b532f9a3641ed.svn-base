<%@page import="com.br.utils.StringUtil"%>
<%@page import="com.br.vo.User"%>
<%@page import="com.br.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String userId = StringUtil.nullToBlank(request.getParameter("id"));
	String userName = request.getParameter("name");
	String userPassword = request.getParameter("pwd");
	String userEmail = request.getParameter("email");
	String userPhone = request.getParameter("phone");

	UserDao userDao = new UserDao();
	User user = userDao.getUserById(userId);

	if (user != null) {
		if (user.getId().equals(userId)) {
			response.sendRedirect("joinform.jsp?error=dup");
			return;
		}
	}
	user = new User();
	user.setId(userId);
	user.setName(userName);
	user.setPassword(userPassword);
	user.setEmail(userEmail);
	user.setPhone(userPhone);

	userDao.insertUser(user);

	response.sendRedirect("joinsuccess.jsp");
%>