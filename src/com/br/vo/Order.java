package com.br.vo;

import java.util.Date;
import java.util.List;

public class Order {
	/*
	 * create table br_order_main( order_no number(6,0) primary key, user_id
	 * varchar2(30) REFERENCES br_users(user_id), reg_date date default sysdate,
	 * completed char(1) default 'N' );
	 * 
	 * create table br_order_sub( order_no number(6,0) REFERENCES
	 * br_order_main(order_no), product_no number(6,0) REFERENCES
	 * br_products(product_no), product_point number not null, order_product_amount
	 * number );
	 */
	private int no;
	private String userId;
	private Date regDate;
	private boolean completed;
	private List<Product> products;

	public Order() {
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

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public boolean isCompleted() {
		return completed;
	}

	public void setCompleted(boolean completed) {
		this.completed = completed;
	}

	public List<Product> getProducts() {
		return products;
	}

	public void setProducts(List<Product> products) {
		this.products = products;
	}

}
