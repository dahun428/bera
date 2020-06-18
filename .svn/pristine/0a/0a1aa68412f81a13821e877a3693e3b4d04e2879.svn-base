package com.br.service;

import java.sql.SQLException;

import com.br.dao.NoticeDao;
import com.br.dao.ReviewDao;
import com.br.dto.NoticeDto;
import com.br.dto.ReviewDto;
import com.br.vo.Notice;
import com.br.vo.Review;

public class ReviewService {

	ReviewDao reviewDao = new ReviewDao();
	/**
	 * 공지사항 추가 기능
	 *  
	 * @param notice Notice 객체를 전달 받는다.
	 * @param imagePath image 파일 이름을 전달 받는다.
	 * @return noticeNo 값을 리턴으로 하여 해당 값을 기준으로 페이지 이동 및, 추가 작업 수행
	 * @throws SQLException
	 */
	public int insertReview(Review review, String imagePath) throws SQLException {
		int reviewNo = reviewDao.insertReview(review);
		
		if(imagePath != null) {
			reviewDao.insertReviewImagePath(reviewNo, imagePath);
		}
		return reviewNo;
	}
	/**
	 * 공지사항 조회 기능
	 * @param noticeNo 에 해당하는 공지사항을 조회한다.
	 * @return NoticeDto 객체를 리턴받아, 해당 공지사항이 있는 detail.jsp?no= 값을 전달 받을 수 있게 한다.
	 * @throws SQLException
	 */
	public ReviewDto getReviewByNo(int noticeNo) throws SQLException {
		ReviewDao reviewDao = reviewDao.get(noticeNo);
		return ReviewDto;
	}
	/**
	 * 공지사항의 이미지 파일을 찾는 기능
	 * 해당 공지사항의 이미지가 있으면 해당 값을 리턴 받는다.
	 * @return
	 * @throws SQLException
	 */
	public NoticeDto getNoticeImagePathByNoticeNo(int noticeNo) throws SQLException {
		return noticeDao.getNoticeImagePathByNoticeNo(noticeNo);
	}
	
	/**
	 * 공지사항 업데이트 기능
	 * Notice 객체를 전달받아 해당 값들을 수정하며, imagePath 값을 전달받아 이미지 테이블의 값 또한 수정할 수 있게 한다.
	 * 이전에 공지된 게시판에 이미지가 없을 경우, 추가시, image 값을 추가할 수 있도록 한다.
	 * @param notice
	 * @param imagePath
	 * @throws SQLException
	 */
	public void updateNoticeByNo(Notice notice, String imagePath) throws SQLException {
		//이전에도 imagepath가 겂었고, 지금에도 imagepath 값이 없으면?
		
		noticeDao.updateNotice(notice);
		//이미지 패스 값이 null이 아닐 경우에만 imgpath값을 notice_image DB에저장한다.
		if(imagePath != null) {
			noticeDao.updateNoticeImagePath(notice.getNo(), imagePath);
		}
		//notice객체의 값을 DB에  update 한다.
		
		//null 값여부검사
		NoticeDto beforeExistNoticeImage = noticeDao.getNoticeImagePathByNoticeNo(notice.getNo());
		
		//이미지 path 값이 기존에 null 이고, imagePath 값이 null 이 아닐 경우에만 DB에 새롭게 insert 한다.
		//이미지 path 값이 기존에 null 이었을 경우에는 imgpath 값을 DB에 새롭게 insert 한다.
		if(beforeExistNoticeImage == null && imagePath != null) {
			noticeDao.insertNoticeImagePath(notice.getNo(), imagePath);
		}
		
	}
	/**
	 * 공지사항 삭제 기능
	 * DB에서 delete 문이 아닌, update 문으로 deleted 값을 0으로 설정하여 해당 게시판이 보이지 앟게 한다.
	 * @param noticeNo
	 * @throws SQLException
	 */
	public void deleteNoticeByNo(int noticeNo) throws SQLException {
		
		NoticeDto noticeDto = noticeDao.getNoticeDtoByNo(noticeNo);
		if(noticeDto == null) {
			return;
		}
		noticeDao.deleteNotice(noticeNo);
		
	}
	/**
	 * 이미지 삭제 기능
	 * 공지사항 수정시 이미지 삭제 버튼을 누르면 해당 이미지가 삭제 될 수 있도록 한다.
	 * @param noticeNo
	 * @throws SQLException
	 */
	public void deleteNoticeImageByNoticeNo(int noticeNo) throws SQLException {
		NoticeDto isExistNoticeImage =  noticeDao.getNoticeImagePathByNoticeNo(noticeNo);
		if(isExistNoticeImage == null) {
			return;
		}
		noticeDao.deleteNoticeImagePathByNoticeNo(noticeNo);
		
		
	}
	
}

