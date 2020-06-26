<%@page import="com.br.service.EventService"%>
<%@page import="com.br.dto.EventDto"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.br.utils.NumberUtil"%>
<%@page import="com.br.utils.FileUtil"%>
<%@page import="java.util.Map"%>
<%@page import="com.br.utils.BRStatics"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("utf-8");
	
	String userAgent = request.getHeader("User-Agent");
	String path = "";
	
	//저장할 위치
	if(userAgent.indexOf("Windows")>0){
		//윈도우인 경우
		path = BRStatics.ROOT_PATH;
	} else if(userAgent.indexOf("Mac")>0){
		//맥인 경우
		path = BRStatics.ROOT_PATH_FOR_MAC;
	}
	
	String directory = path + "/EVENT";
	
	Map<String, String> fileMap = FileUtil.MultifileUploadExecute(request, directory);

	int eventNo = NumberUtil.stringToInt(fileMap.get("eventNo"));
	String thumbnailImagePath = fileMap.get("fileRealNamethumbnail");
	if(thumbnailImagePath == null){
		thumbnailImagePath = fileMap.get("thumbnailImagePath");
	}
	String contentImagePath = fileMap.get("fileRealNamecontent");
	if(contentImagePath == null){
		contentImagePath = fileMap.get("contentImagePath");
	}
	String bannerImagePath = fileMap.get("fileRealNamebanner");
	if(thumbnailImagePath == null){
		bannerImagePath = fileMap.get("bannerImagePath");
	}
	String title = fileMap.get("title");
	String content = fileMap.get("content");
	
	String eventDay = fileMap.get("eventday");

	SimpleDateFormat df = new SimpleDateFormat("yyyyMMdd");
	Date startDate = df.parse("20190101");
	Date endDate = df.parse("20990101");

	if(!"everyday".equals(eventDay)){
		
		// 월, 일에 0 붙이기
		String startYear = fileMap.get("startYear");
		String startMonth = String.format("%02d",NumberUtil.stringToInt(fileMap.get("startMonth")));
		String startDay = String.format("%02d",NumberUtil.stringToInt(fileMap.get("startDay")));
		String endYear = fileMap.get("endYear");
		String endMonth = String.format("%02d",NumberUtil.stringToInt(fileMap.get("endMonth")));
		String endDay = String.format("%02d",NumberUtil.stringToInt(fileMap.get("endDay")));
		//string to Date 
		StringBuffer startDateBuffer = new StringBuffer();
		String startDateStr = startDateBuffer.append(startYear).append(startMonth).append(startDay).toString();
		startDate = df.parse(startDateStr);
		
		StringBuffer endDateBuffer = new StringBuffer();
		String endDateStr = endDateBuffer.append(endYear).append(endMonth).append(endDay).toString();
		endDate = df.parse(endDateStr);
	}
	
	EventDto event = new EventDto();
	event.setNo(eventNo);
	event.setTitle(title);
	event.setContent(content);
	event.setStartDate(startDate);
	event.setEndDate(endDate);
	event.setEnded(true);
	event.setContentImagePath(contentImagePath);
	event.setThumbnailImagePath(thumbnailImagePath);
	event.setBannerImagePath(bannerImagePath);
	
	boolean isBanner = false;
	if(thumbnailImagePath != null || contentImagePath != null){
		isBanner = true;
	}
	event.setBanner(isBanner);
	
	System.out.println(event);
	EventService eventService = new EventService();
	eventService.updateEvent(event);	
	response.sendRedirect("eventmanager.jsp");
%>