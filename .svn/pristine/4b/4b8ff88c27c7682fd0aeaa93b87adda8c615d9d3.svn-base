package com.br.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.br.dto.EventDto;
import com.br.service.EventService;
import com.br.utils.BRStatics;
import com.br.utils.FileUtil;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

@WebServlet("/EventFileDelete")
public class EventFileDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	EventService eventService = new EventService();
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
		String directory = path + "/EVENT";
		
		String jsonData = request.getParameter("jsonData");
		JsonParser parser = new JsonParser();
		JsonElement element = parser.parse(jsonData);
		
		int eventNo = element.getAsJsonObject().get("eventno").getAsInt();
		String eventType = element.getAsJsonObject().get("eventType").getAsString();
	
		System.out.println("eventNo : " + eventNo);
		System.out.println("eventType : "  +eventType );
		
		EventDto event = eventService.getEventImageByNo(eventNo, eventType);
		String imagePath = event.getImagePath();
		System.out.println("imagePath : "  + imagePath);
		
		FileUtil.fileDeleteExecute(imagePath, directory);
		eventService.deleteEventImage(eventNo, imagePath);
		System.out.println("이벤트 파일 삭제 완료");
		
	}

}
