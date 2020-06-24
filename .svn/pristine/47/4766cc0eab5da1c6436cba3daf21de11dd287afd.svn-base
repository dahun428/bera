<%@page import="java.util.List"%>
<%@page import="com.br.dto.OrderDto"%>
<%@page import="com.br.dao.OrderDao"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.br.utils.NumberUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int orderNo = NumberUtil.stringToInt(request.getParameter("orderNo"));
	System.out.println(orderNo);
	OrderDao orderDao = new OrderDao();
	List<OrderDto> orderDto = orderDao.getOrderByOrderNo(orderNo);
	System.out.println(orderDto);
	Gson gson = new Gson();
	String jsonText = gson.toJson(orderDto);
	
	out.write(jsonText);
%>
