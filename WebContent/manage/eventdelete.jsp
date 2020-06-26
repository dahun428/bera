<%@page import="com.br.dto.EventDto"%>
<%@page import="com.br.service.EventService"%>
<%@page import="com.br.utils.NumberUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

 	int eventNo = NumberUtil.stringToInt(request.getParameter("no"));
	
 	EventService service = new EventService();
 	EventDto event =  service.getEventByNo(eventNo);
 	if(event == null){
 		response.sendRedirect("eventmanager.jsp");
 	}
 	
 	service.deleteEventByNo(eventNo);
 	response.sendRedirect("eventmanager.jsp");
%>