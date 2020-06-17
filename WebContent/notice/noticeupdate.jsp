<%@page import="com.br.utils.StringUtil"%>
<%@page import="com.br.dto.NoticeDto"%>
<%@page import="com.br.utils.NumberUtil"%>
<%@page import="com.br.service.NoticeService"%>
<%@page import="com.br.vo.Notice"%>
<%@page import="com.br.dao.NoticeDao"%>
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
	if (userAgent.indexOf("Windows") > 0) {
		//윈도우인 경우
		path = BRStatics.ROOT_PATH;
	} else if (userAgent.indexOf("Mac") > 0) {
		//맥인 경우
		path = BRStatics.ROOT_PATH_FOR_MAC;
	}
	String directory = path + "/NOTICE";
	//최종 저장 위치를 넣어 파일 업로드 기능 실행
	Map<String, String> fileMap = FileUtil.fileUploadExecute(request, directory);
	NoticeDao noticeDao = new NoticeDao();
	NoticeService noticeService = new NoticeService();

	
	//form 에서 받아온 no 값을 getNotieByNo 메소드를 통해 널값 검사
	int no = NumberUtil.stringToInt(fileMap.get("no"));
	System.out.println("no : " + no);
	NoticeDto beforeNotice = noticeService.getNoticeByNo(no);
	// 널값이면 list.jsp 로 넘어가게 해서 오류 방지
	if (beforeNotice == null) {
		response.sendRedirect("list.jsp");
	}
	//아니라면 form 에서 받아온 값을 fileMap 에서 찾는다.
	String title = fileMap.get("title");
	String content = fileMap.get("content");
	String noticeValue = fileMap.get("noticeValue");
	String imgPath = fileMap.get("fileRealName");

	//Notice 객체를 생성
	Notice notice = new Notice();
	notice.setNo(no);
	notice.setTitle(title);
	notice.setContent(StringUtil.nullToValue((content.isEmpty() ? null : content)," "));
	notice.setImportant(noticeValue);
	notice.setDeleted(true);

	//service에서 업데이트 기능 실행
	noticeService.updateNoticeByNo(notice, imgPath);

	//기능 실행후 현재 페이지로 redirect 실행
	response.sendRedirect("detail.jsp?no=" + no);
%>