<%@page import="com.br.service.NoticeService"%>
<%@page import="com.br.vo.Notice"%>
<%@page import="com.br.utils.NumberUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("utf-8");

	int noticeNo = NumberUtil.stringToInt(request.getParameter("no"));
	NoticeService noticeService = new NoticeService();
	noticeService.deleteNoticeByNo(noticeNo);
	
	response.sendRedirect("list.jsp");

%>