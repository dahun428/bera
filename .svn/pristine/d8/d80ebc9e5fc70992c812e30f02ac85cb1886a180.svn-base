package com.br.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.br.dto.NoticeDto;
import com.br.utils.ConnectionUtil;
import com.br.utils.QueryUtil;
import com.br.vo.Notice;

public class NoticeDao {
	
	public void deleteNoticeImagePathByNoticeNo(int noticeNo) throws SQLException {
		
		String query = "delete from br_notice_image_path where notice_no = ? ";
		
		Connection conn = ConnectionUtil.getConnection();
		PreparedStatement pstmt = conn.prepareStatement(query);
		pstmt.setInt(1, noticeNo);
		pstmt.executeUpdate();
		
		ConnectionUtil.close(conn, pstmt);
		
	}
	
	public NoticeDto getNoticeImagePathByNoticeNo(int noticeNo) throws SQLException {
		
		String query = QueryUtil.getSQL("notice.getNoticeImagePathByNoticeNo");
		
		Connection conn = ConnectionUtil.getConnection();
		PreparedStatement pstmt = conn.prepareStatement(query);
		pstmt.setInt(1, noticeNo);
		ResultSet rs = pstmt.executeQuery();
		
		NoticeDto notice = null;

		if(rs.next()) {
			notice = new NoticeDto();
			notice.setNo(rs.getInt("notice_no"));
			notice.setTitle(rs.getString("notice_title"));
			notice.setContent(rs.getString("notice_content"));
			notice.setRegDate(rs.getDate("notice_reg_date"));
			notice.setDeleted(rs.getBoolean("notice_deleted"));
			notice.setImportant(rs.getString("notice_important"));
			notice.setImagePath(rs.getString("image_path"));
		}
		
		ConnectionUtil.close(conn, pstmt, rs);
		
		return notice;
		
	}
	public void insertNoticeImagePath(int noticeNo, String imagePath) throws SQLException {
		String query = QueryUtil.getSQL("notice.insertNoticeImagePath");
		Connection conn = ConnectionUtil.getConnection();
		PreparedStatement pstmt = conn.prepareStatement(query);
		pstmt.setInt(1, noticeNo);
		pstmt.setString(2, imagePath);
		pstmt.executeUpdate();
		
		ConnectionUtil.close(conn, pstmt);
	}
	public int insertNotice(Notice notice) throws SQLException {
		
		String query = QueryUtil.getSQL("notice.insertNotice");
		String query2 = QueryUtil.getSQL("notice.insertNoticeGetNoticeNo");
	
		int no = 0;
		
		Connection conn = ConnectionUtil.getConnection();
		PreparedStatement pstmt = conn.prepareStatement(query);
		pstmt.setString(1, notice.getTitle());
		pstmt.setString(2, notice.getContent());
		pstmt.setString(3, notice.getImportant());
		pstmt.executeUpdate();
		
		pstmt = conn.prepareStatement(query2);
		
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()) {
			no = rs.getInt("notice_no");
			return no;
		}
		
		ConnectionUtil.close(conn, pstmt);
		
		return no;
	}
	
	//getImportant  값이 0을 제외하고 모든 값 붑러오기
	public List<NoticeDto> getAllNotice() throws SQLException {
		List<NoticeDto> notices = new ArrayList<NoticeDto>();
		
		String query = QueryUtil.getSQL("notice.getAllNotice");
		
		Connection conn = ConnectionUtil.getConnection();
		PreparedStatement pstmt = conn.prepareStatement(query);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			NoticeDto notice = new NoticeDto();
			notice.setRowNum(rs.getInt("rownumber"));
			notice.setNo(rs.getInt("notice_no"));
			notice.setTitle(rs.getString("notice_title"));
			notice.setContent(rs.getString("notice_content"));
			notice.setRegDate(rs.getDate("notice_reg_date"));
			notice.setDeleted(rs.getBoolean("notice_deleted"));
			notice.setImportant(rs.getString("notice_important"));
			notice.setImagePath(rs.getString("image_path"));
			notices.add(notice);
			
		}
		ConnectionUtil.close(conn, pstmt, rs);

		return notices;
	}
	public List<NoticeDto> getAllNoticeImportant() throws SQLException {
		List<NoticeDto> notices = new ArrayList<NoticeDto>();
		
		String query = QueryUtil.getSQL("notice.getAllNoticeImportant");
		
		Connection conn = ConnectionUtil.getConnection();
		PreparedStatement pstmt = conn.prepareStatement(query);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			NoticeDto notice = new NoticeDto();
			notice.setNo(rs.getInt("notice_no"));
			notice.setTitle(rs.getString("notice_title"));
			notice.setContent(rs.getString("notice_content"));
			notice.setRegDate(rs.getDate("notice_reg_date"));
			notice.setDeleted(rs.getBoolean("notice_deleted"));
			notice.setImportant(rs.getString("notice_important"));
			notice.setImagePath(rs.getString("image_path"));
			notices.add(notice);
			
		}
		ConnectionUtil.close(conn, pstmt, rs);

		return notices;
		
	}
	public int getTotal() throws SQLException  {
		String query = QueryUtil.getSQL("notice.getTotal");
		
		int totalRows = 0;
		
		Connection conn = ConnectionUtil.getConnection();
		PreparedStatement pstmt = conn.prepareStatement(query);
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		totalRows = rs.getInt("cnt");
		ConnectionUtil.close(conn, pstmt, rs);
		
		return totalRows;
	}
	public int getTotalByTitle(String title) throws SQLException {
		String query = QueryUtil.getSQL("notice.getTotalByTitle");
		
		int totalRows = 0;
		
		Connection conn = ConnectionUtil.getConnection();
		PreparedStatement pstmt = conn.prepareStatement(query);
		pstmt.setString(1, title);
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		totalRows = rs.getInt("cnt");
		ConnectionUtil.close(conn, pstmt, rs);
		
		return totalRows;
	}
	public int getTotalByContent(String content) throws SQLException {
		String query = QueryUtil.getSQL("notice.getTotalByContent");
		
		int totalRows = 0;
		
		Connection conn = ConnectionUtil.getConnection();
		PreparedStatement pstmt = conn.prepareStatement(query);
		pstmt.setString(1, content);
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		totalRows = rs.getInt("cnt");
		ConnectionUtil.close(conn, pstmt, rs);
		
		return totalRows;
	}
	public List<NoticeDto> getPaginatedNotice(int startNo, int endNo) throws SQLException {
		List<NoticeDto> notices = new ArrayList<NoticeDto>();
		
		String query = QueryUtil.getSQL("notice.getPaginatedNotice");
		
		Connection conn = ConnectionUtil.getConnection();
		PreparedStatement pstmt = conn.prepareStatement(query);
		pstmt.setInt(1, endNo);
		pstmt.setInt(2, startNo);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			NoticeDto notice = resultSetFun(rs);
			notices.add(notice);
			
		}
		ConnectionUtil.close(conn, pstmt, rs);
		return notices;
	}
	public List<NoticeDto> getPaginatedNoticeByTitle(int startNo, int endNo, String title) throws SQLException {
		List<NoticeDto> notices = new ArrayList<NoticeDto>();
		
		String query = QueryUtil.getSQL("notice.getPaginatedNoticeByTitle");
		
		Connection conn = ConnectionUtil.getConnection();
		PreparedStatement pstmt = conn.prepareStatement(query);
		pstmt.setString(1, title);
		pstmt.setInt(2, endNo);
		pstmt.setInt(3, startNo);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			NoticeDto notice = resultSetFun(rs);
			notices.add(notice);
		}
		ConnectionUtil.close(conn, pstmt, rs);
		return notices;  
	}
	public List<NoticeDto> getPaginatedNoticeByContent(int startNo, int endNo, String content) throws SQLException {
		List<NoticeDto> notices = new ArrayList<NoticeDto>();
		
		String query = QueryUtil.getSQL("notice.getPaginatedNoticeByContent");
		
		Connection conn = ConnectionUtil.getConnection();
		PreparedStatement pstmt = conn.prepareStatement(query);
		pstmt.setString(1, content);
		pstmt.setInt(2, endNo);
		pstmt.setInt(3, startNo);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			NoticeDto notice = resultSetFun(rs);
			notices.add(notice);
		}
		ConnectionUtil.close(conn, pstmt, rs);
		return notices;
	}
	
	public NoticeDto getNoticeDtoByNo(int noticeNo) throws SQLException {
		
		String query = QueryUtil.getSQL("notice.getNoticeByNo");
		Connection conn = ConnectionUtil.getConnection();
		PreparedStatement pstmt = conn.prepareStatement(query);
		pstmt.setInt(1, noticeNo);
		ResultSet rs = pstmt.executeQuery();
		NoticeDto notice = null;
		while(rs.next()) {
			notice = new NoticeDto();
			notice.setNo(rs.getInt("notice_no"));
			notice.setTitle(rs.getString("notice_title"));
			notice.setContent(rs.getString("notice_content"));
			notice.setRegDate(rs.getDate("notice_reg_date"));
			notice.setDeleted(rs.getBoolean("notice_deleted"));
			notice.setImportant(rs.getString("notice_important"));
			notice.setImagePath(rs.getString("image_path"));
			
		}
		ConnectionUtil.close(conn, pstmt, rs);
		
		return notice;

	}
	
	public void updateNoticeImagePath(int noticeNo, String imagePath) throws SQLException {

		String query = QueryUtil.getSQL("notice.updateNoticeImagePath");
		Connection conn = ConnectionUtil.getConnection();
		PreparedStatement pstmt = conn.prepareStatement(query);
		pstmt.setString(1, imagePath);
		pstmt.setInt(2, noticeNo);
		pstmt.executeUpdate();
		
		ConnectionUtil.close(conn, pstmt);
		
	}
	public void updateNotice(Notice notice) throws SQLException {
		String query = QueryUtil.getSQL("notice.updateNotice");
		Connection conn = ConnectionUtil.getConnection();
		PreparedStatement pstmt = conn.prepareStatement(query);
		pstmt.setString(1, notice.getTitle());
		pstmt.setString(2, notice.getContent());
		pstmt.setBoolean(3, notice.isDeleted());
		pstmt.setString(4, notice.getImportant());
		pstmt.setInt(5, notice.getNo());
		pstmt.executeUpdate();
		
		ConnectionUtil.close(conn, pstmt);
		
	}
	public void deleteNotice(int noticeNo) throws SQLException {
		
		String query = QueryUtil.getSQL("notice.deleteNoticeByNo");
		Connection conn = ConnectionUtil.getConnection();
		PreparedStatement pstmt = conn.prepareStatement(query);
		pstmt.setInt(1, noticeNo);
		pstmt.executeUpdate();
		
		ConnectionUtil.close(conn, pstmt);
		
	}
	
	
	private NoticeDto resultSetFun(ResultSet rs) throws SQLException {
		
		NoticeDto notice = new NoticeDto();
		notice.setRowNum(rs.getInt("rownumber"));
		notice.setNo(rs.getInt("notice_no"));
		notice.setTitle(rs.getString("notice_title"));
		notice.setContent(rs.getString("notice_content"));
		notice.setRegDate(rs.getDate("notice_reg_date"));
		notice.setDeleted(rs.getBoolean("notice_deleted"));
		notice.setImportant(rs.getString("notice_important"));
		notice.setImagePath(rs.getString("image_path"));
		
		return notice;
	}
	
}
