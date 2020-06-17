package com.br.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.br.dto.NoticeDto;
import com.br.service.NoticeService;
import com.br.utils.BRStatics;
import com.br.utils.FileUtil;
import com.br.utils.NumberUtil;


@WebServlet("/NoticeFileDelete")
public class NoticeFileDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	NoticeService noticeService = new NoticeService();
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
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
		
		int noticeNo = NumberUtil.stringToInt(request.getParameter("no"));
		System.out.println("noticeNo : "+noticeNo);
		
		
		try {
			NoticeDto noticeDto = noticeService.getNoticeImagePathByNoticeNo(noticeNo);
			String fileName = noticeDto.getImagePath();
			FileUtil.fileDeleteExecute(fileName, directory);
			noticeService.deleteNoticeImageByNoticeNo(noticeNo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	
	}

}
