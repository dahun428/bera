package com.br.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.br.dao.EventDao;
import com.br.dao.ProductDao;
import com.br.dao.SearchDao;
import com.br.dto.EventDto;
import com.br.dto.ReviewDto;
import com.br.service.EventService;
import com.br.utils.NumberUtil;
import com.br.vo.Pagenation;
import com.br.vo.Product;
import com.google.gson.Gson;
import com.google.gson.JsonObject;


@WebServlet("/homeBodyPagenation")
public class homeBodyPagenation extends HttpServlet {
	private static final long serialVersionUID = 1L;
	EventService service = new EventService();
	EventDao eventDao = new EventDao();
	SearchDao searchDao = new SearchDao();
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		//ajax에서 받아온 데이터
		String type = request.getParameter("type");
		int rowsPerPage =  NumberUtil.stringToInt(request.getParameter("rowsPerPage"));
		int pagesPerBlock = NumberUtil.stringToInt(request.getParameter("pagesPerBlock"));
		int pageNo = NumberUtil.stringToInt(request.getParameter("pageNo"));
		
		//json 객체 선언부
		Gson gson = new Gson();
		JsonObject jsonObj = new JsonObject();
		
		//변수 초기화
		String jsonData = "";
		int totalRows = 0;
		int beginIndex = 0;
		int endIndex = 0;
		List<EventDto> events = null;
		List<Product> products = null;
		
		
		//changePageNo type null 여부로 검사하여 해당 데이터 ajax로 전송
		if(type != null) {
			if("progressevent".equals(type)) {
				totalRows = service.getProgressEventListThumbnailTypeTotalRows();
			} else if("rankingice".equals(type)) {
				totalRows = eventDao.getRankinProductsCount();
			}
			
			Pagenation pagenation = new Pagenation(rowsPerPage, pagesPerBlock, pageNo, totalRows);
			beginIndex = pagenation.getBeginIndex();
			endIndex = pagenation.getEndIndex();
			if("progressevent".equals(type)) {
				events = service.getProgressEventListThumbnailType(beginIndex, endIndex);
				String eventlist = gson.toJson(events);
				jsonObj.addProperty("totalRows", totalRows);
				jsonObj.addProperty("list", eventlist);
			} else if ("rankingice".equals(type)) {
				products = eventDao.getRankingProducts(beginIndex, endIndex);
				String productList = gson.toJson(products);
				jsonObj.addProperty("totalRows", totalRows);
				jsonObj.addProperty("list", productList);
			}			
			
			jsonData = gson.toJson(jsonObj);

		} else {

			int eventTotalRows = service.getProgressEventListThumbnailTypeTotalRows();
			int productTotalRows = eventDao.getRankinProductsCount();

		
			
			//Event Pagenation
			Pagenation eventPagenation = new Pagenation(rowsPerPage, pagesPerBlock, pageNo, eventTotalRows);
			int eventBeginIndex = eventPagenation.getBeginIndex();
			int eventEndIndex = eventPagenation.getEndIndex();
			
			//Product Pagenation
			Pagenation productPagenation = new Pagenation(rowsPerPage, pagesPerBlock, pageNo, productTotalRows);
			int productBeginIndex = productPagenation.getBeginIndex();
			int productEndIndex = productPagenation.getEndIndex();
			
			List<EventDto> progressEvents = service.getProgressEventListThumbnailType(eventBeginIndex, eventEndIndex);
			List<Product> rankingProducts = eventDao.getRankingProducts(productBeginIndex, productEndIndex);
			List<ReviewDto> rankingReviews = searchDao.getBestReviewByliked();
			
			//gson으로 jsonObject로 변환

			String progressEventList = gson.toJson(progressEvents);
			String progressThumbnailTotalRows = gson.toJson(eventTotalRows);

			String rankingProductList = gson.toJson(rankingProducts);
			String rankingProductListTotalRows = gson.toJson(productTotalRows);
			
			//reviews
			String rankingReviewList = gson.toJson(rankingReviews);
			
			
			
			
			
			
			jsonObj.addProperty("progressEventList", progressEventList);
			jsonObj.addProperty("progressEventTotalRows", progressThumbnailTotalRows);
			jsonObj.addProperty("rankingProductList", rankingProductList);
			jsonObj.addProperty("rankingProductListTotalRows", rankingProductListTotalRows);
			jsonObj.addProperty("rankingReviewList", rankingReviewList);
			
			jsonData = gson.toJson(jsonObj);
		
		}
		//한글 깨짐 처리
		response.setContentType("application/json;charset=utf8");
		PrintWriter out = response.getWriter();
		out.write(jsonData);
		out.flush();
	}

}
