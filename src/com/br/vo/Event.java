package com.br.vo;

import java.util.Date;
import java.util.List;

public class Event {
/*
event_no number(6,0) primary key,
title varchar2(100) not null,
content varchar2(4000) not null,
start_date date not null,
end_date date not null,
ended char(1) default 'N'

event_no number(6,0) REFERENCES br_events(event_no),
user_id varchar2(30) REFERENCES br_users(user_id)
 */
	private int no;
	private String title;
	private String content;
	private Date startDate;
	private Date endDate;
	private boolean ended;
	private List<User> users;
	
	public Event() {
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
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

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public boolean isEnded() {
		return ended;
	}

	public void setEnded(boolean ended) {
		this.ended = ended;
	}

	public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}
	
}
