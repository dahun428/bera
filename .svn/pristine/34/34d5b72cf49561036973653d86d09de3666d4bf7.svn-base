<%@page import="com.br.dao.ReviewDao"%>
<%@page import="com.br.utils.NumberUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/logincheck.jsp" %>
 <%
 	int reviewNo = NumberUtil.stringToInt(request.getParameter("reviewNo"));
 	int productNo = NumberUtil.stringToInt(request.getParameter("productNo"));
 
 	ReviewDao reviewDao = new ReviewDao();
 	
 	reviewDao.deleteReview(reviewNo);
 	
 	response.sendRedirect("deletereviewform.jsp?productNo=" + productNo);
 %>