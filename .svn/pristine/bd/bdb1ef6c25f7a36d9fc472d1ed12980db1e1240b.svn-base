<%@page import="com.br.utils.StringUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%

	String category = StringUtil.nullToBlank(request.getParameter("category"));
	String searchValue = StringUtil.nullToBlank(request.getParameter("searchValue"));
	String hashtag = StringUtil.nullToBlank(request.getParameter("hashtag"));

	System.out.println("category: ["+category+"]");
	System.out.println("searchValue: ["+searchValue+"]");
	System.out.println("hashtag: ["+hashtag+"]");

	if(!hashtag.isEmpty()){
		response.sendRedirect("/semi-project/product/search.jsp?tag="+hashtag.replaceAll("#", ""));
	} else if(!category.isEmpty()){
		response.sendRedirect("/semi-project/product/search.jsp?category="+category+"&search="+searchValue);	
	} else {
		response.sendRedirect("/semi-project/product/search.jsp?search="+searchValue);	
	}

	
	
%>