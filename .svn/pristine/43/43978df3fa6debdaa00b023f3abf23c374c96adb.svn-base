package com.br.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.br.utils.ConnectionUtil;
import com.br.utils.QueryUtil;
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
	public void/*List<User>*/ getAllUsers(){}
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
			user.setEmail(rs.getString("email"));
			user.setPoint(rs.getInt("point"));
			user.setDeleted(rs.getString("deleted"));
			user.setAdmin(rs.getString("admin"));
			user.setRegDate(rs.getDate("reg_date"));
		}
		
		return user;
	}
	public void passwordChange(/*User user*/) {}
	public void deleteUser(String userId) {}
	
}
