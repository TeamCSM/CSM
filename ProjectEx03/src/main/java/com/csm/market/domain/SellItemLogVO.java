package com.csm.market.domain;

import java.sql.Date;

public class SellItemLogVO {
    
	private String log_idx;
    private String item_idx; 
    private String item_name;
    private int item_price; 
    private int item_amount; 
    private String item_sellerId; 
    private String item_photoName; 
    private String log_action; 
    private Date log_regdate; 
    private String user_id;
    
	public String getLog_idx() {
		return log_idx;
	}
	public void setLog_idx(String log_idx) {
		this.log_idx = log_idx;
	}
	public String getItem_idx() {
		return item_idx;
	}
	public void setItem_idx(String item_idx) {
		this.item_idx = item_idx;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public int getItem_price() {
		return item_price;
	}
	public void setItem_price(int item_price) {
		this.item_price = item_price;
	}
	public int getItem_amount() {
		return item_amount;
	}
	public void setItem_amount(int item_amount) {
		this.item_amount = item_amount;
	}
	public String getItem_sellerId() {
		return item_sellerId;
	}
	public void setItem_sellerId(String item_sellerId) {
		this.item_sellerId = item_sellerId;
	}
	public String getItem_photoName() {
		return item_photoName;
	}
	public void setItem_photoName(String item_photoName) {
		this.item_photoName = item_photoName;
	}
	public String getLog_action() {
		return log_action;
	}
	public void setLog_action(String log_action) {
		this.log_action = log_action;
	}
	public Date getLog_regdate() {
		return log_regdate;
	}
	public void setLog_regdate(Date log_regdate) {
		this.log_regdate = log_regdate;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	
	@Override
	public String toString() {
		return "SellItemLogVO [log_idx=" + log_idx + ", item_idx=" + item_idx + ", item_name=" + item_name
				+ ", item_price=" + item_price + ", item_amount=" + item_amount + ", item_sellerId=" + item_sellerId
				+ ", item_photoName=" + item_photoName + ", log_action=" + log_action + ", log_regdate=" + log_regdate
				+ ", user_id=" + user_id + "]";
	} 
}
