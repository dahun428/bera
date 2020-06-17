<%@page import="com.br.dao.OrderDao"%>
<%@page import="com.br.utils.NumberUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String[] productNo = request.getParameterValues("productNo");
	int[] productNoList = new int[productNo.length];
	for (int i = 0; i < productNoList.length; i++) {
		productNoList[i] = NumberUtil.stringToInt(productNo[i]);
	}
	
	OrderDao orderDao = new OrderDao();
	for(int no : productNoList) {
		orderDao.deleteBasket(loginedUserId, no);
		System.out.println(no);
	}
	
	response.sendRedirect("../user/mypage-cart.jsp");
%>