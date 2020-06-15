package com.br.vo;

import java.util.Date;

public class Notice {
	/*
	 * notice_no number (6,0) primary key, user_id varchar2(30) references
	 * br_users(user_id), notice_title varchar2(200) not null, notice_content
	 * varchar2(4000) not null, notice_reg_date date default sysdate, notice_deleted
	 * char(1) default 'N'
	 */
	private int no;
	private String userId;
	private String title;
	private String content;
	private Date regDate;
	private boolean deleted;
	private String important;
	
	public Notice() {
	}

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

	@Override
	public String toString() {
		return "Notice [no=" + no + ", userId=" + userId + ", title=" + title + ", content=" + content + ", regDate="
				+ regDate + ", deleted=" + deleted + ", important=" + important + "]";
	}

	
}
