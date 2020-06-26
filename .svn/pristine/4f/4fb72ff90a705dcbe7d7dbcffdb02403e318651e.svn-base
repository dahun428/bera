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


import com.br.dao.ReviewDao;
import com.br.dto.ReviewDto;
import com.br.utils.NumberUtil;
import com.br.vo.Pagenation;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

@WebServlet("/reviewPagination")
public class reviewPagination extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int productNo = NumberUtil.stringToInt(request.getParameter("productNo"));
		int pageNo = NumberUtil.stringToInt(request.getParameter("pageNo"));
		System.out.println("pageNo : " + pageNo);
		System.out.println("productNo : "+productNo);
		ReviewDao reviewDao = new ReviewDao();
		
		int totalrows = reviewDao.getReviewsByProductNoPaginationTotalCount(productNo);

		List<ReviewDto> reviews = null;

		int rowsPerPage = 4;
		int pagesPerBlock = 1;


		Pagenation pagenation = new Pagenation(rowsPerPage, pagesPerBlock, pageNo, totalrows);
		int beginIndex = pagenation.getBeginIndex();
		int endIndex = pagenation.getEndIndex();

		
		try {
			reviews = reviewDao.getReviewsByProductNoPagination(productNo, beginIndex, endIndex);

		} catch (SQLException e) {

			e.printStackTrace();
		}
		Gson gson = new Gson();
		System.out.println("reviews : " + reviews.toString());
		JsonObject jsonObj = new JsonObject();
		String list = gson.toJson(reviews);
		System.out.println(list);
		jsonObj.addProperty("list", list);
		jsonObj.addProperty("totalPage", pagenation.getTotalPages());
		
		String jsonData = gson.toJson(jsonObj);
		response.setContentType("application/json;charset=utf8");
		PrintWriter out = response.getWriter();
		out.write(jsonData);
		out.flush();

	}

}
