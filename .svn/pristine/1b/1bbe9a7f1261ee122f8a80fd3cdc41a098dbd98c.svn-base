package com.br.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.br.utils.ConnectionUtil;
import com.br.utils.JdbcHelper;
import com.br.utils.JdbcHelper.RowMapper;
import com.br.utils.QueryUtil;
import com.br.vo.ChartData;

public class AdminDao {

	
	public int getTotal() {
		return JdbcHelper.selectOne(QueryUtil.getSQL("admin.getTotal"), new RowMapper<Integer>() {
			public Integer mapRow(ResultSet rs) throws SQLException {
				return rs.getInt("total");
			}
		});
	}
	public int getTotalYear() {
		return JdbcHelper.selectOne(QueryUtil.getSQL("admin.getTotalYear"), new RowMapper<Integer>() {
			public Integer mapRow(ResultSet rs) throws SQLException {
				return rs.getInt("total");
			}
		});
	}
	public int getTotalMonth() {
		return JdbcHelper.selectOne(QueryUtil.getSQL("admin.getTotalMonth"), new RowMapper<Integer>() {
			public Integer mapRow(ResultSet rs) throws SQLException {
				return rs.getInt("total");
			}
		});
	}
	public int getTotalDay() {
		return JdbcHelper.selectOne(QueryUtil.getSQL("admin.getTotalDay"), new RowMapper<Integer>() {
			public Integer mapRow(ResultSet rs) throws SQLException {
				return rs.getInt("total");
			}
		});
	}
	
	public List<ChartData> getTotalGraph() throws SQLException {
		List<ChartData> chartDatas = new ArrayList<ChartData>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("admin.getTotalGraph"));
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			ChartData chartData = new ChartData();
			chartData.setSeq(rs.getString("seq"));
			chartData.setIcecream(rs.getInt("icecream"));
			chartData.setCake(rs.getInt("cake"));
			chartData.setTotal(rs.getInt("total"));
			chartDatas.add(chartData);
		}
		ConnectionUtil.close(connection, pstmt, rs);
		return chartDatas;
	}
	
	
	public List<ChartData> getGraphByMonth() throws SQLException {
		List<ChartData> chartDatas = new ArrayList<ChartData>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("admin.getGraphByMonth"));
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			ChartData chartData = new ChartData();
			chartData.setSeq(rs.getString("seq"));
			chartData.setIcecream(rs.getInt("icecream"));
			chartData.setCake(rs.getInt("cake"));
			chartData.setTotal(rs.getInt("total"));
			chartDatas.add(chartData);
		}
		ConnectionUtil.close(connection, pstmt, rs);
		return chartDatas;
	}
	
	
	
	public List<ChartData> getGraphByWeek() throws SQLException {
		List<ChartData> chartDatas = new ArrayList<ChartData>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("admin.getGraphByWeek"));
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			ChartData chartData = new ChartData();
			chartData.setSeq(rs.getString("seq"));
			chartData.setIcecream(rs.getInt("icecream"));
			chartData.setCake(rs.getInt("cake"));
			chartData.setTotal(rs.getInt("total"));
			chartDatas.add(chartData);
		}
		ConnectionUtil.close(connection, pstmt, rs);
		return chartDatas;
	}
	
	public List<ChartData> getGraphByDay() throws SQLException {
		List<ChartData> chartDatas = new ArrayList<ChartData>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("admin.getGraphByDay"));
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			ChartData chartData = new ChartData();
			chartData.setSeq(rs.getString("seq"));
			chartData.setIcecream(rs.getInt("icecream"));
			chartData.setCake(rs.getInt("cake"));
			chartData.setTotal(rs.getInt("total"));
			chartDatas.add(chartData);
		}
		ConnectionUtil.close(connection, pstmt, rs);
		return chartDatas;
	}
	
	
	
	
}
