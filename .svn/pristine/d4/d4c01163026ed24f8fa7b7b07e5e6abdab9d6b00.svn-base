package com.br.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.br.utils.ConnectionUtil;
import com.br.utils.QueryUtil;
import com.br.vo.Order;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.br.dto.BasketDto;
import com.br.dto.OrderDto;
import com.br.vo.Basket;
import com.br.vo.Product;


public class OrderDao {
	
	public void insertOrder(Order order) throws SQLException {
		List<Product> products = order.getProducts();
		Connection connection = ConnectionUtil.getConnection();
		connection.setAutoCommit(false);
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("order.insertOrderMain"));
		pstmt.setString(1, order.getUserId());
		pstmt.setInt(2, order.getUsingPoint());
		pstmt.setInt(3, order.getPayment());
		pstmt.executeUpdate();
		
		pstmt = connection.prepareStatement(QueryUtil.getSQL("order.getCurrval"));
		ResultSet rs = pstmt.executeQuery();
		int orderNo = 0;
		if(rs.next()) {
			orderNo = rs.getInt("order_no");
		}
		for(Product product : products) {
			pstmt = connection.prepareStatement(QueryUtil.getSQL("order.insertOrderSub"));
			pstmt.setInt(1, orderNo);
			pstmt.setInt(2, product.getNo());
			pstmt.setInt(3, product.getPrice()-product.getDiscountPrice());
			pstmt.setInt(4, product.getAmount());
			pstmt.executeUpdate();
		}
		
		connection.commit();
		ConnectionUtil.close(connection, pstmt);
	}
	
	public List<OrderDto> getOrderByOrderNo(int orderNo) throws SQLException {
		
		List<OrderDto> orderDtos = new ArrayList<OrderDto>();
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("order.getOrderByOrderNo"));
		pstmt.setInt(1, orderNo);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			OrderDto orderDto = new OrderDto();
			orderDto.setImagePath(rs.getString("image_path"));
			orderDto.setOrderNo(rs.getInt("order_no"));
			orderDto.setProductNo(rs.getInt("product_no"));
			orderDto.setName(rs.getString("name"));
			orderDto.setPrice(rs.getInt("product_price"));
			orderDto.setAmount(rs.getInt("amount"));
			orderDto.setRegDate(rs.getDate("reg_date"));
			
			orderDtos.add(orderDto);
		}
		rs.close();
		pstmt.close();
		connection.close();
		
		return orderDtos;
	}
	
	public List<OrderDto> getOrderByUserId(String userId) throws SQLException {
		
		List<OrderDto> orderDtos = new ArrayList<OrderDto>();
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("order.getOrderByUserId"));
		pstmt.setString(1, userId);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			OrderDto orderDto = new OrderDto();
			orderDto.setName(rs.getString("product_name"));
			orderDto.setPayment(rs.getInt("order_payment"));
			orderDto.setOrderProductAmount(rs.getInt("order_total_amount"));
			orderDto.setRegDate(rs.getDate("reg_date"));
			
			orderDtos.add(orderDto);
		}
		rs.close();
		pstmt.close();
		connection.close();
		return orderDtos;
	}
	public void executeOrder(int orderNo) {}
	public void deleteOrder(int orderNo) {}
	
	
	public void addBasket(Basket basket) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("order.addShoppingBasket"));
		pstmt.setString(1, basket.getUserId());
		pstmt.setInt(2, basket.getProductNo());
		pstmt.setInt(3, basket.getAmount());
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
	
	public void deleteBasket(String userId, int productNo) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("order.deleteBasket"));
		pstmt.setString(1, userId);
		pstmt.setInt(2, productNo);
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
	
	public List<BasketDto> getAllBasketByUserId(String userId) throws SQLException {
		List<BasketDto> basketDtos = new ArrayList<BasketDto>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("order.getAllBasketByUserId"));
		pstmt.setString(1, userId);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			BasketDto basketDto = new BasketDto();
			basketDto.setImagePath(rs.getString("image_path"));
			basketDto.setName(rs.getString("name"));
			basketDto.setPrice(rs.getInt("price"));
			basketDto.setDiscountPrice(rs.getInt("discount_price"));
			basketDto.setPoint(rs.getInt("point"));
			basketDto.setNo(rs.getInt("product_no"));
			basketDto.setCategory(rs.getString("category"));
			basketDto.setAmount(rs.getInt("amount"));
			
			
			basketDtos.add(basketDto);
		}
		rs.close();
		pstmt.close();
		connection.close();
		
		return basketDtos;
	}
	
	public BasketDto getProductByBasket(int productNo, String userId) throws SQLException {
		BasketDto basketDto = null;
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("order.getProductByBasket"));
		pstmt.setInt(1, productNo);
		pstmt.setString(2, userId);
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next()) {
			basketDto = new BasketDto();
			basketDto.setImagePath(rs.getString("image_path"));
			basketDto.setName(rs.getString("name"));
			basketDto.setPrice(rs.getInt("price"));
			basketDto.setDiscountPrice(rs.getInt("discount_price"));
			basketDto.setPoint(rs.getInt("point"));
			basketDto.setNo(rs.getInt("product_no"));
			basketDto.setCategory(rs.getString("category"));
			basketDto.setAmount(rs.getInt("amount"));
			basketDto.setUserId(rs.getString("user_id"));
		}
		rs.close();
		pstmt.close();
		connection.close();
		
		return basketDto;
	}
	
	public void basketAmountPlus(BasketDto basketDto, int amount) throws SQLException {
		BasketDto findBasketDto = getProductByBasket(basketDto.getNo(), basketDto.getUserId());
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("order.basketAmountPlus"));
		pstmt.setInt(1, findBasketDto.getAmount() + amount);
		pstmt.setString(2, basketDto.getUserId());
		pstmt.setInt(3, findBasketDto.getNo());
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
}
