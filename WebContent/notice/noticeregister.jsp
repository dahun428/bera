<%@page import="com.br.utils.StringUtil"%>
<%@page import="com.br.utils.BRStatics"%>
<%@page import="com.br.service.NoticeService"%>
<%@page import="java.util.Collection"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.br.vo.Notice"%>
<%@page import="com.br.dao.NoticeDao"%>
<%@page import="com.br.utils.FileUtil"%>
<%@page import="java.util.Map"%>
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

	String directory = path + "/NOTICE";

	//파일 유틸에서 업로드 기능 실행
	Map<String, String> fileMap = FileUtil.fileUploadExecute(request, directory);

	//맵으로 변환된 파일 이름, 파라미터 이름
	//getparameter 대신 fileMap 에 있는 값을 가져온다.
	String title = fileMap.get("title");
	String content = fileMap.get("content");
	String noticeValue = fileMap.get("noticeValue");
	String imgPath = fileMap.get("fileRealName");
	
	//DB에 fileMap 에서 가져온 값 넣기
	NoticeDao noticeDao = new NoticeDao();
	Notice notice = new Notice();
	notice.setTitle(title);
	notice.setContent(StringUtil.nullToValue((content.isEmpty() ? null : content)," "));
	notice.setImportant(noticeValue);
	
	NoticeService noticeService = new NoticeService();
	int no = noticeService.insertNotice(notice, imgPath);
	
	
	response.sendRedirect("../manage/noticemanager-detail.jsp?no="+no);




%>