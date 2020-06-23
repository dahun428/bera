package com.br.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.br.dto.EventDto;
import com.br.service.EventService;
import com.br.utils.NumberUtil;
import com.br.vo.Pagenation;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

@WebServlet("/eventpagenationServlet")
public class eventpagenationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	EventService service = new EventService();
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		//		String eventType =  request.getParameter("type");
		//		System.out.println("eventType :" + eventType);


		//ajax에서 받아온 데이터
		String type = request.getParameter("type");
		int rowsPerPage =  NumberUtil.stringToInt(request.getParameter("rowsPerPage"));
		int pagesPerBlock = NumberUtil.stringToInt(request.getParameter("pagesPerBlock"));
		int pageNo = NumberUtil.stringToInt(request.getParameter("pageNo"));
		System.out.println(type);
		
		//json 객체 선언부
		Gson gson = new Gson();
		JsonObject jsonObj = new JsonObject();
		
		//변수 초기화
		String jsonData = "";
		int totalRows = 0;
		int beginIndex = 0;
		int endIndex = 0;
		List<EventDto> events = null;
		
		//changePageNo type null 여부로 검사하여 해당 데이터 ajax로 전송
		if(type != null) {

			if("progressevent".equals(type)) {
				totalRows = service.getProgressEventListThumbnailTypeTotalRows();
			} else if ("progressbanner".equals(type)) {
				totalRows = service.getProgressEventListBannerTypeTotalRows();
			} else if ("endevent".equals(type)) {
				totalRows = service.getEndedEventListThumbnailTypeTotalRows();
			} else if ("endbanner".equals(type)) {
				totalRows = service.getEndedEventListBannerTypeTotalRows();
			}

			Pagenation pagenation = new Pagenation(rowsPerPage, pagesPerBlock, pageNo, totalRows);
			beginIndex = pagenation.getBeginIndex();
			endIndex = pagenation.getEndIndex();

			if("progressevent".equals(type)) {
				events = service.getProgressEventListThumbnailType(beginIndex, endIndex);
			} else if ("progressbanner".equals(type)) {
				events = service.getProgressEventListBannerType(beginIndex, endIndex);
			} else if ("endevent".equals(type)) {
				events = service.getEndedEventListThumbnailType(beginIndex, endIndex);
			} else if ("endbanner".equals(type)) {
				events = service.getEndedEventListBannerType(beginIndex, endIndex);
			}
			String eventlist = gson.toJson(events);
			jsonObj.addProperty("totalRows", totalRows);
			jsonObj.addProperty("eventList", eventlist);
			jsonData = gson.toJson(jsonObj);

		} else {

			int eventTotalRows = service.getProgressEventListThumbnailTypeTotalRows();
			int bannerTotalRows = service.getProgressEventListBannerTypeTotalRows();
			int endedEventTotalRows = service.getEndedEventListThumbnailTypeTotalRows();
			int endedBannerTotalRows = service.getEndedEventListBannerTypeTotalRows();


			//Event Pagenation
			Pagenation eventPagenation = new Pagenation(rowsPerPage, pagesPerBlock, pageNo, eventTotalRows);
			int eventBeginIndex = eventPagenation.getBeginIndex();
			int eventEndIndex = eventPagenation.getEndIndex();

			//Banner Pagenation
			Pagenation bannerPagenation = new Pagenation(rowsPerPage, pagesPerBlock, pageNo, bannerTotalRows);
			int bannerBeginIndex = bannerPagenation.getBeginIndex();
			int bannerEndIndex = bannerPagenation.getEndIndex();

			//end event Pagenation
			Pagenation endEventPagenation = new Pagenation(rowsPerPage, pagesPerBlock, pageNo, endedEventTotalRows);
			int endEventBeginIndex = endEventPagenation.getBeginIndex();
			int endEventEndIndex = endEventPagenation.getEndIndex();
			
			//end banner Pagenation
			Pagenation endBannerPagenation = new Pagenation(rowsPerPage, pagesPerBlock, pageNo, endedBannerTotalRows);
			int endBannerBeginIndex = endBannerPagenation.getBeginIndex();
			int endBannerEndIndex = endBannerPagenation.getEndIndex();
			
			List<EventDto> progressEvents = service.getProgressEventListThumbnailType(eventBeginIndex, eventEndIndex);
			List<EventDto> progressBanners = service.getProgressEventListBannerType(bannerBeginIndex, bannerEndIndex);
			List<EventDto> endEvents = service.getEndedEventListThumbnailType(endEventBeginIndex, endEventEndIndex);
			List<EventDto> endBanners = service.getEndedEventListBannerType(endBannerBeginIndex, endBannerEndIndex);
			
			//gson으로 jsonObject로 변환

			String progressEventList = gson.toJson(progressEvents);
			String progressThumbnailTotalRows = gson.toJson(eventTotalRows);
			
			String progressBannerList = gson.toJson(progressBanners);
			String progressBannerTotalRows = gson.toJson(bannerTotalRows);
			
			String endEventList = gson.toJson(endEvents);
			String endEventTotalRows = gson.toJson(endedEventTotalRows);
			
			String endBannerList = gson.toJson(endBanners);
			String endBannerTotalRows = gson.toJson(endedBannerTotalRows);
			
			jsonObj.addProperty("progressBannerList", progressBannerList);
			jsonObj.addProperty("progressBannerTotalRows", progressBannerTotalRows);
			jsonObj.addProperty("progressEventList", progressEventList);
			jsonObj.addProperty("progressEventTotalRows", progressThumbnailTotalRows);
			jsonObj.addProperty("endEventList", endEventList);
			jsonObj.addProperty("endEventTotalRows", endEventTotalRows);
			jsonObj.addProperty("endBannerList", endBannerList);
			jsonObj.addProperty("endBannerTotalRows", endBannerTotalRows);
			
			jsonData = gson.toJson(jsonObj);
		}
		//한글 깨짐 처리
		response.setContentType("application/json;charset=utf8");
		PrintWriter out = response.getWriter();
		out.write(jsonData);
		out.flush();


	}

}