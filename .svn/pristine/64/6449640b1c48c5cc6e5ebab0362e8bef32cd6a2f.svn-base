package com.br.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.br.utils.ConnectionUtil;
import com.br.utils.QueryUtil;

public class AdminDao {

	/**
	 * 총 매출 구하기
	 * @return
	 * @throws SQLException
	 */
	public int getTotalSales() throws SQLException {
		int totalSales = 0;
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("admin.getTotalSales"));
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		totalSales = rs.getInt("total_payment");
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return totalSales;
	}
	
	/**
	 * 예) 2020년 6월 매출 구하기
	 * @param year  예) 2020
	 * @param month 예) 6
	 * @return
	 * @throws SQLException
	 */
	public int getSalesByMonth(int year, int month) throws SQLException {
		int monthSales = 0;
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("admin.getSalesByMonth"));
		pstmt.setInt(1, year);
		pstmt.setInt(2, month);
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		monthSales = rs.getInt("total_payment");
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return monthSales;
	}
	
	/**
	 * 예) 2020년 6월 3주차 매출 구하기
	 * @param year	예) 2020
	 * @param month	예) 6
	 * @param week	예) 3
	 * @return
	 * @throws SQLException
	 */
	
	public int getSalesByWeek(int year, int month, int week) throws SQLException {
		int weekSales = 0;
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("admin.getSalesByWeek"));
		pstmt.setInt(1, year);
		pstmt.setInt(2, month);
		pstmt.setInt(3, week);
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		weekSales = rs.getInt("total_payment");
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return weekSales;
	}
	
	/**
	 * 예) 2020년 6월 23일 매출 구하기
	 * @param year	예) 2020
	 * @param month 예) 6
	 * @param day	예) 23
	 * @return
	 * @throws SQLException
	 */
	public int getSalesByDay(int year, int month, int day) throws SQLException {
		
		int daySales = 0;
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("admin.getSalesByDay"));
		pstmt.setInt(1, year);
		pstmt.setInt(2, month);
		pstmt.setInt(3, day);
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		daySales = rs.getInt("total_payment");
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return daySales;
	}
	
	public int getSalesByCategoryDay(int year, int month, int day, String category) throws SQLException {
		int daySales=0;
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("admin.getSalesByCategoryDay"));
		pstmt.setInt(1, year);
		pstmt.setInt(2, month);
		pstmt.setInt(3, day);
		pstmt.setString(4, category);
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		daySales = rs.getInt("payment");
		
		ConnectionUtil.close(connection, pstmt, rs);
		return daySales;
	}
	
	public int getSalesByCategoryWeek(int year, int month, int week, String category) throws SQLException {
		int weekSales=0;
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("admin.getSalesByCategoryWeek"));
		pstmt.setInt(1, year);
		pstmt.setInt(2, month);
		pstmt.setInt(3, week);
		pstmt.setString(4, category);
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		weekSales = rs.getInt("payment");
		
		ConnectionUtil.close(connection, pstmt, rs);
		return weekSales;
	}
	
	public int getSalesByCategoryMonth(int year, int month, String category) throws SQLException {
		int monthSales=0;
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("admin.getSalesByCategoryMonth"));
		pstmt.setInt(1, year);
		pstmt.setInt(2, month);
		pstmt.setString(3, category);
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		monthSales = rs.getInt("payment");
		
		ConnectionUtil.close(connection, pstmt, rs);
		return monthSales;
	}
	
	public int getSalesByCategoryTotal(String category) throws SQLException {
		int totalSales=0;
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL(""));
		pstmt.setString(1, category);
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		totalSales = rs.getInt("payment");
		
		ConnectionUtil.close(connection, pstmt, rs);
		return totalSales;
	}
}
