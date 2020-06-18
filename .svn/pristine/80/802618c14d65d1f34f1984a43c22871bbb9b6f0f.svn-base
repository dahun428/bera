package com.br.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.br.utils.ConnectionUtil;
import com.br.utils.QueryUtil;
import com.br.vo.PointUse;
import com.br.vo.User;

public class UserDao {

	public void insertUser(User user) throws SQLException{
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("user.insertUser"));
		pstmt.setString(1, user.getId());
		pstmt.setString(2, user.getName());
		pstmt.setString(3, user.getPassword());
		pstmt.setString(4, user.getPhone());
		pstmt.setString(5, user.getEmail());
		
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
	public List<User> getAllUsers() throws SQLException {
		List<User> users = new ArrayList<User>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("user.getAllUsers"));
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			User user = new User();
			user.setId(rs.getString("user_id"));
			user.setName(rs.getString("name"));
			user.setPassword(rs.getString("password"));
			user.setPhone(rs.getString("phone"));
			user.setEmail(rs.getString("email"));
			user.setPoint(rs.getInt("point"));
			user.setDeleted(rs.getString("deleted"));
			user.setAdmin(rs.getString("admin"));
			user.setRegDate(rs.getDate("reg_date"));
			
			users.add(user);
		}
		rs.close();
		pstmt.close();
		connection.close();
		
		return users;
	}
	
	public User getUserById(String userId) throws SQLException {
		User user = null;
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("user.getUserById"));
		pstmt.setString(1, userId);
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next()) {
			user = new User();
			user.setId(rs.getString("user_id"));
			user.setName(rs.getString("name"));
			user.setPassword(rs.getString("password"));
			user.setPhone(rs.getString("phone"));
			user.setEmail(rs.getString("email"));
			user.setPoint(rs.getInt("point"));
			user.setDeleted(rs.getString("deleted"));
			user.setAdmin(rs.getString("admin"));
			user.setRegDate(rs.getDate("reg_date"));
		}
		rs.close();
		pstmt.close();
		connection.close();
		
		return user;
	}
	public void infoChange(User user) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("user.infoChange"));
		pstmt.setString(1, user.getPassword());
		pstmt.setString(2, user.getPhone());
		pstmt.setString(3, user.getEmail());
		pstmt.setString(4, user.getId());
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
	
	public void deleteUser(String userId) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("user.deleteUser"));
		pstmt.setString(1, userId);
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
	
	
	
	/* PointUse */
	/**
	 * 유저 아이디로 포인트 사용내역 조회
	 * @param userId
	 * @return
	 * @throws SQLException
	 */
	public List<PointUse> getPointUseByUserId(String userId) throws SQLException {
		List<PointUse> pointUses = new ArrayList<PointUse>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("user.getPointUseByUserId"));
		pstmt.setString(1, userId);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			PointUse pointUse = new PointUse();
			pointUse.setUserId(rs.getString("user_id"));
			pointUse.setPoint(rs.getInt("used_point"));
			pointUse.setUsedDate(rs.getDate("used_date"));
			pointUse.setReason(rs.getString("used_reason"));
			
			pointUses.add(pointUse);
		}
		rs.close();
		pstmt.close();
		connection.close();
		
		return pointUses;
	}
	
	/**
	 * 포인트 사용내역 등록(상품구매할때 같이 실행하기)
	 * @param pointUse
	 * @throws SQLException
	 */
	public void addPointUse(PointUse pointUse) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("user.addPointUse"));
		pstmt.setString(1, pointUse.getUserId());
		pstmt.setInt(2, pointUse.getPoint());
		pstmt.setString(3, pointUse.getReason());
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
	
	public void changePoint(String userId, int point, String type) throws SQLException {
		User user = getUserById(userId);
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("user.usingPointMinus"));
		if("minus".equals(type)) {
			pstmt.setInt(1, user.getPoint() - point);
		} else if("plus".equals(type)) {
			pstmt.setInt(1, user.getPoint() + point);
		}
		pstmt.setString(2, userId);
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
	
	public List<PointUse> getAllPointUsesByUserId(String userId) throws SQLException {
		List<PointUse> pointUses = new ArrayList<PointUse>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("user.getAllPointUsesByUserId"));
		pstmt.setString(1, userId);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			PointUse pointUse = new PointUse();
			pointUse.setUserId(rs.getString("user_id"));
			pointUse.setPoint(rs.getInt("used_point"));
			pointUse.setUsedDate(rs.getDate("used_date"));
			pointUse.setReason(rs.getString("used_reason"));
			
			pointUses.add(pointUse);
		}
		rs.close();
		pstmt.close();
		connection.close();
		
		return pointUses;
	}
}
