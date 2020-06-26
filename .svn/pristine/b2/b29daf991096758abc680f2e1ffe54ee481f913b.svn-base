<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.br.dao.AdminDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.br.vo.ChartData"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%
	String type = request.getParameter("type");
	
	AdminDao adminDao = new AdminDao();
	Map<String, Object> result = new HashMap<String, Object>();
	
	if("total".equals(type)) {
		result.put("label", "최근 5년간 매출액");
		result.put("orderTotal", adminDao.getTotal());
		result.put("rows", adminDao.getTotalGraph());
	} else if("monthly".equals(type)) {
		result.put("label", "올해 총 매출액");
		result.put("orderTotal", adminDao.getTotalYear());
		result.put("rows", adminDao.getGraphByMonth());
	} else if("weekly".equals(type)) {
		result.put("label", "이번달 총 매출액");
		result.put("orderTotal", adminDao.getTotalMonth());
		result.put("rows", adminDao.getGraphByWeek());
	} else {
		result.put("label", "오늘 총 매출액");
		result.put("orderTotal", adminDao.getTotalDay());
		result.put("rows", adminDao.getGraphByDay());
	}
	
	Gson gson = new Gson();
	String jsonText = gson.toJson(result);
	
	out.write(jsonText);
%>