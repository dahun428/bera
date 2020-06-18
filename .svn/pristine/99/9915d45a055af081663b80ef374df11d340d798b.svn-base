<%@page import="com.br.utils.NumberUtil"%>
<%@page import="com.br.vo.Review"%>
<%@page import="com.br.dao.ReviewDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/logincheck.jsp" %>
<%
	//DB에 한글로 저장
	request.setCharacterEncoding("utf-8");

	int productNo = NumberUtil.stringToInt(request.getParameter("productNo"));
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String picture = request.getParameter("picture");
	
	ReviewDao reviewDao = new ReviewDao();
	Review review = reviewDao.getReviewById(loginedUserId);
	
	review.setTitle(title);
	review.setContent(content);
	review.setPicture(picture);
	
	reviewDao.getReviewUpdate(review);
	
	// 리뷰수정글 상세정보화면을 재요청하게 한다.
	response.sendRedirect("deletereviewform.jsp");
%>