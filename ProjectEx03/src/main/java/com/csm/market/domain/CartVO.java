package com.csm.market.domain;

import java.sql.Date;
import java.util.Arrays;

public class CartVO {

	private String item_idx;
	private String item_name;
	private int item_price;
	private int item_sail;
	private int item_amount;
	private Date item_regdate;
	private String item_title;
	private String item_photoName;
	private String item_sellerId;
	private String item_sellerName;
	private String user_id;
	
	// 연산이 필요한 변수들
	private int item_priceResult;
	private int item_check;
	
	// 원래 없는 임시 변수
	private String order_progress;
	private String order_idx;
	
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
	public int getItem_sail() {
		return item_sail;
	}
	public void setItem_sail(int item_sail) {
		this.item_sail = item_sail;
	}
	public int getItem_amount() {
		return item_amount;
	}
	public void setItem_amount(int item_amount) {
		this.item_amount = item_amount;
	}
	public Date getItem_regdate() {
		return item_regdate;
	}
	public void setItem_regdate(Date item_regdate) {
		this.item_regdate = item_regdate;
	}
	public String getItem_title() {
		return item_title;
	}
	public void setItem_title(String item_title) {
		this.item_title = item_title;
	}
	public String getItem_photoName() {
		return item_photoName;
	}
	public void setItem_photoName(String item_photoName) {
		this.item_photoName = item_photoName;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getItem_priceResult() {
		return item_priceResult;
	}
	public void setItem_priceResult(int item_PriceResult) {
		this.item_priceResult = item_PriceResult;
	}
	public int getItem_check() {
		return item_check;
	}
	public void setItem_check(int item_check) {
		this.item_check = item_check;
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
	public String getOrder_progress() {
		return order_progress;
	}
	public void setOrder_progress(String order_progress) {
		this.order_progress = order_progress;
	}
	public String getOrder_idx() {
		return order_idx;
	}
	public void setOrder_idx(String order_idx) {
		this.order_idx = order_idx;
	}
	@Override
	public String toString() {
		return "CartVO [item_idx=" + item_idx + ", item_name=" + item_name + ", item_price=" + item_price
				+ ", item_sail=" + item_sail + ", item_amount=" + item_amount + ", item_regdate=" + item_regdate
				+ ", item_title=" + item_title + ", item_photoName=" + item_photoName + ", item_sellerId="
				+ item_sellerId + ", item_sellerName=" + item_sellerName + ", user_id=" + user_id
				+ ", item_priceResult=" + item_priceResult + ", item_check=" + item_check + ", order_progress="
				+ order_progress + ", order_idx=" + order_idx + "]";
	}
	
	
	
}
