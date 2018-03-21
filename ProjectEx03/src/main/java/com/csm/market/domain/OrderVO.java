package com.csm.market.domain;

import java.sql.Date;

public class OrderVO {
	
	private String item_totalPrice; 
	private String order_msg; 
	
	//외부에서 추가
	private String item_names; 
	private String saveAddr_name;
	private String order_idx;
	private String user_id; 
	private String item_sellerId;
	private String item_sellerName;
	
	//미입력
	private String order_progress;
	private Date order_regdate;
	
	public String getOrder_idx() {
		return order_idx;
	}
	public void setOrder_idx(String order_idx) {
		this.order_idx = order_idx;
	}
	public Date getOrder_regdate() {
		return order_regdate;
	}
	public void setOrder_regdate(Date order_regdate) {
		this.order_regdate = order_regdate;
	}
	public String getItem_names() {
		return item_names;
	}
	public void setItem_names(String item_names) {
		this.item_names = item_names;
	}
	public String getItem_totalPrice() {
		return item_totalPrice;
	}
	public void setItem_totalPrice(String item_totalPrice) {
		this.item_totalPrice = item_totalPrice;
	}
	public String getOrder_progress() {
		return order_progress;
	}
	public void setOrder_progress(String order_progress) {
		this.order_progress = order_progress;
	}
	public String getOrder_msg() {
		return order_msg;
	}
	public void setOrder_msg(String order_msg) {
		this.order_msg = order_msg;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getSaveAddr_name() {
		return saveAddr_name;
	}
	public void setSaveAddr_name(String saveAddr_name) {
		this.saveAddr_name = saveAddr_name;
	}
	public String getItem_sellerId() {
		return item_sellerId;
	}
	public void setItem_sellerId(String item_sellerId) {
		this.item_sellerId = item_sellerId;
	}
	public String getItem_sellerName() {
		return item_sellerName;
	}
	public void setItem_sellerName(String item_sellerName) {
		this.item_sellerName = item_sellerName;
	}
	@Override
	public String toString() {
		return "OrderVO [item_totalPrice=" + item_totalPrice + ", order_msg=" + order_msg + ", item_names=" + item_names
				+ ", saveAddr_name=" + saveAddr_name + ", order_idx=" + order_idx + ", user_id=" + user_id
				+ ", item_sellerId=" + item_sellerId + ", item_sellerName=" + item_sellerName + ", order_progress="
				+ order_progress + ", order_regdate=" + order_regdate + "]";
	}
	
	
}
