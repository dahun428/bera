<%@page import="com.google.gson.Gson"%>
<%@page import="com.br.vo.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.br.dao.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String category = request.getParameter("category");
	ProductDao productDao = new ProductDao();
	List<Product> products = null;
	
	if("All".equals(category)){
		products = productDao.getAllProducts();
	}else{
		products = productDao.getProductsByCategory(category);
	}

	Gson gson = new Gson();
	String productJson = gson.toJson(products);

	out.write(productJson);
%>