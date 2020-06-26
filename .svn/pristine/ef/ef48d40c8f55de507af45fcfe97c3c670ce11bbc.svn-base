<%@page import="com.br.utils.StringUtil"%>
<%@page import="com.br.dto.ReviewDto"%>
<%@page import="com.br.service.ReviewService"%>
<%@page import="java.util.Map"%>
<%@page import="com.br.utils.FileUtil"%>
<%@page import="com.br.utils.BRStatics"%>
<%@page import="com.br.utils.NumberUtil"%>
<%@page import="com.br.vo.Review"%>
<%@page import="com.br.dao.ReviewDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/logincheck.jsp"%>
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
ReviewDao reviewDao = new ReviewDao();
ReviewService reviewService = new ReviewService();

int no = NumberUtil.stringToInt(reviewMap.get("reviewNo"));
int productNo = NumberUtil.stringToInt(reviewMap.get("productNo"));
System.out.println("no : " + no);
ReviewDto beforeReview = reviewService.getReviewByNo(productNo);

if(beforeReview == null){
	response.sendRedirect("deletereviewform.jsp?productNo="+ productNo);
}

Review reviews = new Review();
reviews = reviewDao.getReviewNo(no);
String title = reviewMap.get("title");
String content = reviewMap.get("content");
System.out.println("content : "+ content);
int liked = reviews.getLiked();
String imgPath = reviewMap.get("fileRealName");

// Review객체를 생성하고 Review정보를 저장한다.
// ReviewDao reviewDao = new ReviewDao();


//게시물 수정시 좋아요 횟수 유지하기
reviews.setNo(no);
reviews.setTitle(title);
reviews.setContent(content);
reviews.setLiked(liked);



reviewService.updateReviewByNo(reviews, imgPath);


System.out.println("no : "+no); 


// 리뷰수정글 상세정보화면을 재요청하게 한다.
//response.sendRedirect("deletereviewform.jsp?productNo="+ productNo);
	
%>