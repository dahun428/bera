package com.br.dto;

import java.util.Date;

public class NoticeDto {

	private int no;
	private String userId;
	private String title;
	private String content;
	private Date regDate;
	private boolean deleted;
	private String important;
	private String imagePath;
	private int rowNum;
	
	public NoticeDto() {}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public boolean isDeleted() {
		return deleted;
	}

	public void setDeleted(boolean deleted) {
		this.deleted = deleted;
	}

	public String getImportant() {
		return important;
	}

	public void setImportant(String important) {
		this.important = important;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	public int getRowNum() {
		return rowNum;
	}

	public void setRowNum(int rowNum) {
		this.rowNum = rowNum;
	}

	@Override
	public String toString() {
		return "NoticeDto [no=" + no + ", userId=" + userId + ", title=" + title + ", content=" + content + ", regDate="
				+ regDate + ", deleted=" + deleted + ", important=" + important + ", imagePath=" + imagePath
				+ ", rowNum=" + rowNum + "]";
	}
	
	
	
	
}
