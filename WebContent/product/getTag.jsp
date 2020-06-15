<%@page import="java.util.List"%>
<%@page import="com.br.dao.ProductDao"%>
<%@page import="com.br.utils.NumberUtil"%>
<%@page import="com.google.gson.Gson"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int productNo = NumberUtil.stringToInt(request.getParameter("productNo"));
	ProductDao productDao = new ProductDao();
	List<String> tags = productDao.getProductTagByProductNo(productNo);
	Gson gson = new Gson();
	String jsonContent = gson.toJson();
	out.write(jsonContent);
%>