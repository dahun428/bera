<%@page import="com.br.utils.BRStatics"%>
<%@page import="com.br.utils.FileUtil"%>
<%@page import="com.br.utils.NumberUtil"%>
<%@page import="com.br.vo.Product"%>
<%@page import="com.br.dao.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
ProductDao productDao = new ProductDao();
Product product = productDao.getProductByProductNo(NumberUtil.stringToInt(request.getParameter("productNo")));

String imagePath = product.getImagePath();
String category = product.getCategory();
int productNo = product.getNo();

productDao.deleteProduct(productNo);
String path = "";
if (request.getHeader("User-Agent").indexOf("Windows") > 0) {
	//윈도우인 경우
	path = BRStatics.ROOT_PATH;
} else if (request.getHeader("User-Agent").indexOf("Mac") > 0) {
	path = BRStatics.ROOT_PATH_FOR_MAC;
	//맥인 경우
}
FileUtil.fileDeleteExecute(imagePath, path+"/"+category);

response.sendRedirect("list.jsp?category="+category);
%>