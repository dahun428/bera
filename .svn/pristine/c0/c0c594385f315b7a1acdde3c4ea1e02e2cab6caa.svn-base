<%@page import="com.google.gson.Gson"%>
<%@page import="com.br.dao.ProductDao"%>
<%@page import="com.br.vo.Product"%>
<%@page import="com.br.utils.NumberUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
int productNo = NumberUtil.stringToInt(request.getParameter("productNo"));

ProductDao dao = new ProductDao();

Product product = dao.getProductByProductNo(productNo);


Gson gson = new Gson();

out.write(gson.toJson(product));

%>