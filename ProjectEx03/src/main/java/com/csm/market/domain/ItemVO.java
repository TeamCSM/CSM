package com.csm.market.domain;

import java.sql.Date;
import java.util.Arrays;

public class ItemVO {
	//아이템 기본정보
    private String item_idx;
    private String item_name;
    private String item_area;
    private int item_price;
    private int item_sail;
    private int item_amount;
    private Date item_regdate;

    //아이템 판매글작성
    private String item_title;
    private String item_saleType;
    private String item_contents;
    private String item_sellerId;
    private String item_sellerName;
    
    //경매
    private int item_minPrice; 
    private Date item_enddate;
    
    //이미지 파일
    private String[] files;
    private String item_photoName;
    
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
	public String getItem_area() {
		return item_area;
	}
	public void setItem_area(String item_area) {
		this.item_area = item_area;
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
	public String getItem_saleType() {
		return item_saleType;
	}
	public void setItem_saleType(String item_saleType) {
		this.item_saleType = item_saleType;
	}
	public String getItem_contents() {
		return item_contents;
	}
	public void setItem_contents(String item_contents) {
		this.item_contents = item_contents;
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
	public int getItem_minPrice() {
		return item_minPrice;
	}
	public void setItem_minPrice(int item_minPrice) {
		this.item_minPrice = item_minPrice;
	}
	public Date getItem_enddate() {
		return item_enddate;
	}
	public void setItem_enddate(Date item_enddate) {
		this.item_enddate = item_enddate;
	}
	public String[] getFiles() {
		return files;
	}
	public void setFiles(String[] files) {
		this.files = files;
	}
	public String getItem_photoName() {
		return item_photoName;
	}
	public void setItem_photoName(String item_photoName) {
		this.item_photoName = item_photoName;
	}
	
	@Override
	public String toString() {
		return "ItemVO [item_idx=" + item_idx + ", item_name=" + item_name + ", item_area=" + item_area
				+ ", item_price=" + item_price + ", item_sail=" + item_sail + ", item_amount=" + item_amount
				+ ", item_regdate=" + item_regdate + ", item_title=" + item_title + ", item_saleType=" + item_saleType
				+ ", item_contents=" + item_contents + ", item_sellerId=" + item_sellerId + ", item_sellerName="
				+ item_sellerName + ", item_minPrice=" + item_minPrice + ", item_enddate=" + item_enddate + ", files="
				+ Arrays.toString(files) + ", item_photoName=" + item_photoName + "]";
	}
}
