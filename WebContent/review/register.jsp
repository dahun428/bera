<%@page import="com.br.utils.NumberUtil"%>
<%@page import="com.br.vo.Review"%>
<%@page import="com.br.dao.ReviewDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/logincheck.jsp" %>

<% 
	//DB에 한글로 저장
   request.setCharacterEncoding("utf-8");
	
   int reviewNo = NumberUtil.stringToInt(request.getParameter("reviewNo"));
   int productNo = NumberUtil.stringToInt(request.getParameter("productNo"));
   String title = request.getParameter("title");
   String content = request.getParameter("content");

   
   // Review객체를 생성하고 Review정보를 저장한다.
   Review review = new Review();
   review.setProductNo(productNo);
   review.setTitle(title);
   review.setContent(content);
   review.setUserId(loginedUserId);
   
   ReviewDao reviewDao = new ReviewDao();
   
   reviewDao.insertReview(review);

   
   // list.jsp를 재요청하는 응답을 보낸다.
   response.sendRedirect("detail.jsp?productNo=" + productNo);
   %>