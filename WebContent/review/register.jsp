<%@page import="com.br.utils.NumberUtil"%>
<%@page import="com.br.vo.Review"%>
<%@page import="com.br.dao.ReviewDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
	//DB에 한글로 저장
   request.setCharacterEncoding("utf-8");
	
   int reviewNo = NumberUtil.stringToInt(request.getParameter("reviewNo"));
   int productsNo = NumberUtil.stringToInt(request.getParameter("productNo"));
   String title = request.getParameter("title");
   String content = request.getParameter("content");
   
   System.out.println(reviewNo);
   
   ReviewDao reviewDao = new ReviewDao();
   Review review = reviewDao.getReviewByReviewNo(reviewNo);
   // Review 정보를 데이터베이스에 저장한다.

   if(review != null){
	   if(review.getNo()==(reviewNo)){
		   response.sendRedirect("reviewform.jsp?overlap=dup");
		   return;
	   }
   }
   
   // Review객체를 생성하고 Review정보를 저장한다.
   review = new Review();
   review.setProductNo(productsNo);
   review.setTitle(title);
   review.setContent(content);
   review.setUserId(loginedUserId);
   
   reviewDao.insertReview(review);

   
   // list.jsp를 재용청하는 응답을 보낸다.
   response.sendRedirect("detail.jsp");
   %>