<%@page import="com.google.gson.Gson"%>
<%@page import="com.br.vo.Review"%>
<%@page import="com.br.dao.ReviewDao"%>
<%@page import="com.br.utils.NumberUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int reviewNo = NumberUtil.stringToInt(request.getParameter("reviewNo"));
	
	ReviewDao reviewDao = new ReviewDao();
	Review review = reviewDao.getReviewNo(reviewNo);
	
	Gson gson = new Gson();
	String jsonText = gson.toJson(review);
	
	out.write(jsonText);
%>
