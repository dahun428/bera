<%@page import="com.br.service.ReviewService"%>
<%@page import="com.br.utils.FileUtil"%>
<%@page import="java.util.Map"%>
<%@page import="com.br.utils.BRStatics"%>
<%@page import="com.br.utils.NumberUtil"%>
<%@page import="com.br.vo.Review"%>
<%@page import="com.br.dao.ReviewDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/logincheck.jsp" %>

<% 
String path = "";
String userAgent = request.getHeader("User-Agent");

if(userAgent.indexOf("Windows")>0){
	//윈도우인 경우
	path = BRStatics.ROOT_PATH;
} else if(userAgent.indexOf("Mac")>0){
	//맥인 경우
	path = BRStatics.ROOT_PATH_FOR_MAC;
}
path += "REVIEW/";


	//DB에 한글로 저장
   request.setCharacterEncoding("utf-8");

	Map<String, String> reviewMap = FileUtil.fileUploadExecute(request, path);
	
   int productNo = NumberUtil.stringToInt(reviewMap.get("productNo"));
   String title = reviewMap.get("title");
   String content = reviewMap.get("content");
   String imgPath = reviewMap.get("fileRealName");
//   int reviewNo = NumberUtil.stringToInt(request.getParameter("reviewNo"));
//   int productNo = NumberUtil.stringToInt(request.getParameter("productNo"));
   //String title = request.getParameter("title");
   //String content = request.getParameter("content");
	
//   out.print(reviewMap.get("reviewNo"));
//   out.print("<br>");
//   out.print(path);
//   out.print("<br>");
   
   // Review객체를 생성하고 Review정보를 저장한다.
   
   ReviewService reviewService = new ReviewService();

//   ReviewDao reviewDao = new ReviewDao();
   Review review = new Review();
   review.setProductNo(productNo);
   review.setTitle(title);
   review.setContent(content);
   review.setUserId(loginedUserId);
   
//   reviewDao.insertReview(review);
   
   int no = reviewService.insertReview(review, imgPath);
   
  System.out.println("no : "+no); 
   
   
   // 재요청하는 응답을 보낸다.
   response.sendRedirect("detail.jsp?productNo=" + productNo);

   %>