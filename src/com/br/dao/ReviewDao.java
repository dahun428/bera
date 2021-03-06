package com.br.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import com.br.dto.ReviewDto;
import com.br.utils.ConnectionUtil;
import com.br.utils.JdbcHelper;
import com.br.utils.JdbcHelper.RowMapper;
import com.br.utils.QueryUtil;
import com.br.vo.Review;

public class ReviewDao {
	//pagination
	public List<ReviewDto> getReviewsByProductNoPagination(int productNo, int beginIndex, int endIndex) throws SQLException{
		String query = QueryUtil.getSQL("review.getReviewsByProductNoPagination");
		List<ReviewDto> reviews = new ArrayList<ReviewDto>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(query);
		pstmt.setInt(1, productNo);
		pstmt.setInt(2, beginIndex);
		pstmt.setInt(3, endIndex);
	
		ResultSet rs  = pstmt.executeQuery();
		while (rs.next()) {
			ReviewDto review = new ReviewDto();
			review.setNo(rs.getInt("review_no"));
			review.setImagePath(rs.getString("image_path"));
			
			reviews.add(review);
		}
		rs.close();
		pstmt.close();
		connection.close();
		
		return reviews;
	}
	public int getReviewsByProductNoPaginationTotalCount(int productNo) {
		String query = QueryUtil.getSQL("review.getReviewsByProductNoPaginationTotalCount");
		return JdbcHelper.selectOne(query, new RowMapper<Integer>() {
			public Integer mapRow(ResultSet rs) throws SQLException {
				return rs.getInt("cnt");
			}
		}, productNo);
	}
	
	
	
	//리뷰 이미지 삽입
	public void insertReviewImagePath(int reviewNo, String imagePath) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("review.insertReviewImagePath"));
		
		pstmt.setInt(1, reviewNo);
		pstmt.setString(2, imagePath);
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
	public int insertReview(Review review) throws SQLException {
		
	
		String query = QueryUtil.getSQL("review.insertReview");
		String query2 = QueryUtil.getSQL("review.insertReviewGetReviewNo");
	
		int no = 0;
		
		Connection conn = ConnectionUtil.getConnection();
		PreparedStatement pstmt = conn.prepareStatement(query);
		
		pstmt.setInt(1, review.getProductNo());
		pstmt.setString(2, review.getUserId());
		pstmt.setString(3, review.getTitle());
		pstmt.setString(4, review.getContent());
		
		pstmt.executeUpdate();
		
		pstmt = conn.prepareStatement(query2);
		
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()) {
			no = rs.getInt("review_no");
			return no;
		}
		
		ConnectionUtil.close(conn, pstmt, rs);
		
		return no;
	}
	
	//리뷰 게시판 순서대로 정렬
	public List<ReviewDto> getReviewsByProductNo(int productNo) throws SQLException {
		List<ReviewDto> reviews = new ArrayList<ReviewDto>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("review.getReviewsByProductNo"));
		pstmt.setInt(1, productNo);
		ResultSet rs  = pstmt.executeQuery();
		while (rs.next()) {
			ReviewDto review = new ReviewDto();
			review.setNo(rs.getInt("review_no"));
			review.setProductNo(rs.getInt("product_no"));
			review.setUserId(rs.getString("user_id"));
			review.setTitle(rs.getString("title"));
			review.setContent(rs.getString("content"));
			review.setDeleted(rs.getString("deleted"));
			review.setRegDate(rs.getDate("reg_date"));
			review.setImagePath(rs.getString("image_path"));
			
			reviews.add(review);
		}
		rs.close();
		pstmt.close();
		connection.close();
		
		return reviews;
	}
	
	public Review getReviewNo(int reviewNo) throws SQLException{
		Review review = null;
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("review.getReviewNo"));
		pstmt.setInt(1, reviewNo);
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next()) {
			review = new Review();
			review.setNo(rs.getInt("review_no"));
			review.setUserId(rs.getString("user_id"));
			review.setProductNo(rs.getInt("product_no"));
			review.setTitle(rs.getString("title"));
			review.setContent(rs.getString("content"));
			review.setPicture(rs.getString("image_path"));
			review.setRegDate(rs.getDate("reg_date"));
			review.setLiked(rs.getInt("liked"));
		}
		rs.close();
		pstmt.close();
		connection.close();
		
		return review;
	}
	public void getReviewUpdate(Review review) throws SQLException {
		
		Connection connection = ConnectionUtil.getConnection();
		System.out.println("connection loading");
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("review.getReviewUpdate"));
		pstmt.setString(1, review.getTitle());
		pstmt.setString(2, review.getContent());
		pstmt.setInt(3, review.getLiked());
		pstmt.setInt(4, review.getNo());
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
	
	public void updateReviewImagePath(int reviewNo, String imagePath) throws SQLException {

//		String query = QueryUtil.getSQL("review.updateReviewImagePath");
		Connection conn = ConnectionUtil.getConnection();
		PreparedStatement pstmt = conn.prepareStatement(QueryUtil.getSQL("review.updateReviewImagePath"));
		pstmt.setString(1, imagePath);
		pstmt.setInt(2, reviewNo);
		pstmt.executeUpdate();
		
		ConnectionUtil.close(conn, pstmt);
	}
	
	public ReviewDto getReviewImagePathByReivewNo(int reviewNo) throws SQLException {
		
		String query = QueryUtil.getSQL("reivew.getReviewImagePathByReviewNo");
		
		Connection conn = ConnectionUtil.getConnection();
		PreparedStatement pstmt = conn.prepareStatement(query);
		pstmt.setInt(1, reviewNo);
		ResultSet rs = pstmt.executeQuery();
		
		ReviewDto review = null;

		if(rs.next()) {
			review = new ReviewDto();
			review.setNo(rs.getInt("review_no"));
			review.setImagePath(rs.getString("image_path"));
			review.setTitle(rs.getString("title"));
			review.setContent(rs.getString("content"));
			review.setRegDate(rs.getDate("reg_date"));

		}
		
		ConnectionUtil.close(conn, pstmt, rs);
		
		return review;
		
	}
	
	
	public ReviewDto getReviewByNo(int reviewNo) throws SQLException {
		
		String query = QueryUtil.getSQL("notice.getReviewByNo");
		Connection conn = ConnectionUtil.getConnection();
		PreparedStatement pstmt = conn.prepareStatement(query);
		pstmt.setInt(1, reviewNo);
		ResultSet rs = pstmt.executeQuery();
		ReviewDto review = null;
		while(rs.next()) {
			review = new ReviewDto();
			
			review.setNo(rs.getInt("REVIEW_NO"));
			review.setUserId(rs.getString("user_id"));
			review.setTitle(rs.getString("title"));
			review.setContent(rs.getString("Content"));
			review.setRegDate(rs.getDate("notice_reg_date"));
			review.setImagePath(rs.getString("image_path"));
			
		}
		ConnectionUtil.close(conn, pstmt, rs);
		
		return review;
		
	}
	public ReviewDto getReviewDtoByNo(int reviewNo) throws SQLException {
		
		String query = QueryUtil.getSQL("review.getReviewByNo");
		Connection conn = ConnectionUtil.getConnection();
		PreparedStatement pstmt = conn.prepareStatement(query);
		pstmt.setInt(1, reviewNo);
		ResultSet rs = pstmt.executeQuery();
		ReviewDto reivew = null;
		while(rs.next()) {
			reivew = new ReviewDto();
			reivew.setNo(rs.getInt("review_no"));
			reivew.setTitle(rs.getString("title"));
			reivew.setContent(rs.getString("content"));
			reivew.setRegDate(rs.getDate("reg_date"));
			reivew.setImagePath(rs.getString("image_path"));
		}
		ConnectionUtil.close(conn, pstmt, rs);
		
		return reivew;
	}
	
	
	public Review getReviewByReviewNo(int reviewNo) throws SQLException {
		Review review = null;
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("review.getReviewsByReviewNo"));
		pstmt.setInt(1, reviewNo);
		ResultSet rs  = pstmt.executeQuery();
		
		if (rs.next()) {
			review = new Review();
			review.setNo(rs.getInt("review_no"));
			review.setUserId(rs.getString("user_id"));
			review.setPoint(rs.getInt("title"));
			review.setContent(rs.getString("review_content"));
			
		}
		rs.close();
		pstmt.close();
		connection.close();
			
		return review;
	}
	
	public ReviewDto getReviewUserId(String userId) throws SQLException {
		
		String query = QueryUtil.getSQL("review.getReviewUserId");
		Connection conn = ConnectionUtil.getConnection();
		PreparedStatement pstmt = conn.prepareStatement(query);
		pstmt.setString(1, userId);
		ResultSet rs = pstmt.executeQuery();
		ReviewDto reivew = null;
		while(rs.next()) {
			reivew = new ReviewDto();
			reivew.setNo(rs.getInt("review_no"));
			reivew.setTitle(rs.getString("title"));
			reivew.setContent(rs.getString("content"));
			reivew.setRegDate(rs.getDate("reg_date"));
			reivew.setImagePath(rs.getString("image_path"));
		}
		ConnectionUtil.close(conn, pstmt, rs);
		
		return reivew;
	}
	
	
	public void deleteReview(int reviewNo) throws SQLException{
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("review.deleteReview"));
		
		pstmt.setInt(1, reviewNo);
		
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
	
	
	
	
	
	public List<ReviewDto> getAllReviews() throws SQLException{
		
		List<ReviewDto> reviews = new ArrayList<ReviewDto>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("review.getAllReviews"));
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			ReviewDto review = new ReviewDto();
			
			review.setNo(rs.getInt("review_no"));
			review.setUserId(rs.getString("user_id"));
			review.setRegDate(rs.getDate("reg_date"));
			review.setTitle(rs.getString("title"));
			review.setContent(rs.getString("content"));
			review.setImagePath(rs.getString("image_path"));
			
			reviews.add(review);
			
		}
		connection.close();
		pstmt.close();
		rs.close();
		
			return reviews;
	}

	
	public List<ReviewDto> getReviews(int beginIndex, int endIndex) throws SQLException {
		List<ReviewDto> reviews = new ArrayList<ReviewDto>();

		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("review.getReviews"));
		pstmt.setInt(1, beginIndex);
		pstmt.setInt(2, endIndex);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			ReviewDto reviewDto = new ReviewDto();
			reviewDto.setNo(rs.getInt("review_no"));
			reviewDto.setProductNo(rs.getInt("product_no"));
			reviewDto.setTitle(rs.getString("title"));
			reviewDto.setContent(rs.getString("content"));
			reviewDto.setRegDate(rs.getDate("reg_date"));
			reviewDto.setImagePath(rs.getString("image_path"));

			reviews.add(reviewDto);

		}
		rs.close();
		pstmt.close();
		connection.close();
		
		return reviews;
	}
	
	public int getTotalRows() throws SQLException {
		int totalRows = 0;
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("review.getTotalRows"));
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		totalRows = rs.getInt("cnt");
		rs.close();
		pstmt.close();
		connection.close();
		return totalRows;
	}
	
	public Review likesCnt(int reviewNo, String userId) throws SQLException{
		int count = 0;
		Review review = new Review();
		Connection connection = ConnectionUtil.getConnection();
		CallableStatement cstmt = connection.prepareCall(QueryUtil.getSQL("review.getLikes"));
		
		cstmt.setInt(1, reviewNo);
		
		cstmt.setString(2, userId);
		
		cstmt.registerOutParameter(3, java.sql.Types.INTEGER);
		
		cstmt.executeUpdate();
		
		count = cstmt.getInt(3);
		review.setLiked(count);
		cstmt.close();
		connection.close();
		return review;
	}
}
