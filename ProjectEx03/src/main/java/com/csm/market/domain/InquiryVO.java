package com.csm.market.domain;

import java.sql.Date;

public class InquiryVO {
	
    private String item_idx;
    private String inquiry_idx;
    private String inquiry_title;
    private String inquiry_contents;
    private Date inquiry_regdate; 
    private int inquiry_secret; 
    private String inquiry_email;
    private String inquiry_state;
    private String inquiry_type;
    private String user_id;
    
	public String getItem_idx() {
		return item_idx;
	}
	public void setItem_idx(String item_idx) {
		this.item_idx = item_idx;
	}
	public String getInquiry_idx() {
		return inquiry_idx;
	}
	public void setInquiry_idx(String inquiry_idx) {
		this.inquiry_idx = inquiry_idx;
	}
	public String getInquiry_title() {
		return inquiry_title;
	}
	public void setInquiry_title(String inquiry_title) {
		this.inquiry_title = inquiry_title;
	}
	public String getInquiry_contents() {
		return inquiry_contents;
	}
	public void setInquiry_contents(String inquiry_contents) {
		this.inquiry_contents = inquiry_contents;
	}
	public Date getInquiry_regdate() {
		return inquiry_regdate;
	}
	public void setInquiry_regdate(Date inquiry_regdate) {
		this.inquiry_regdate = inquiry_regdate;
	}
	public int getInquiry_secret() {
		return inquiry_secret;
	}
	public void setInquiry_secret(int inquiry_secret) {
		this.inquiry_secret = inquiry_secret;
	}
	public String getInquiry_email() {
		return inquiry_email;
	}
	public void setInquiry_email(String inquiry_email) {
		this.inquiry_email = inquiry_email;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getInquiry_state() {
		return inquiry_state;
	}
	public void setInquiry_state(String inquiry_state) {
		this.inquiry_state = inquiry_state;
	}
	public String getInquiry_type() {
		return inquiry_type;
	}
	public void setInquiry_type(String inquiry_type) {
		this.inquiry_type = inquiry_type;
	}
	@Override
	public String toString() {
		return "InquiryVO [item_idx=" + item_idx + ", inquiry_idx=" + inquiry_idx + ", inquiry_title=" + inquiry_title
				+ ", inquiry_contents=" + inquiry_contents + ", inquiry_regdate=" + inquiry_regdate
				+ ", inquiry_secret=" + inquiry_secret + ", inquiry_email=" + inquiry_email + ", inquiry_state="
				+ inquiry_state + ", inquiry_type=" + inquiry_type + ", user_id=" + user_id + "]";
	}
    
    
}
