<%@page import="com.br.vo.Notice"%>
<%@page import="com.br.dao.NoticeDao"%>
<%@page import="com.br.utils.FileUtil"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");


	String title = request.getParameter("title");
	String content = request.getParameter("content");	
	String noticeValue = request.getParameter("isImportant");
	//String uploadfile = request.getParameter("uploadfile");

	//String directory = "/upload/notice";
	//Map<String, String> fileMap = FileUtil.fileUploadExecute(request, directory);
	
	NoticeDao noticeDao = new NoticeDao();
	Notice notice = new Notice();
	notice.setTitle(title);
	notice.setContent(content);
	notice.setImportant(noticeValue);
	
	System.out.println(notice);
	//noticeDao.insertNotice(notice);
	
	//response.sendRedirect("list.jsp");




%>