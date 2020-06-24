<%@page import="com.br.vo.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.br.dao.ProductDao"%>
<%@page import="com.br.utils.NumberUtil"%>
<%@page import="com.google.gson.Gson"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

Gson gson = new Gson();
String category = request.getParameter("category");
int startRow = NumberUtil.stringToInt(request.getParameter("startRow"));
int endRow = NumberUtil.stringToInt(request.getParameter("endRow"));

ProductDao productDao = new ProductDao();
List<Product> products = productDao.getProductByCategoryPagenated(category, startRow, endRow);

String productJson = gson.toJson(products);

out.write(productJson);
%>