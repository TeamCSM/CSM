package com.csm.market.domain;

import java.sql.Date;

public class ReviewVO {
	
	private String item_idx;
	private String review_idx;
	private String review_title;
	private String review_contents; 
	private Date review_regdate; 
	private int review_score;
	private String user_id;
	
	public String getItem_idx() {
		return item_idx;
	}
	public void setItem_idx(String item_idx) {
		this.item_idx = item_idx;
	}
	public String getReview_idx() {
		return review_idx;
	}
	public void setReview_idx(String review_idx) {
		this.review_idx = review_idx;
	}
	public String getReview_title() {
		return review_title;
	}
	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}
	public String getReview_contents() {
		return review_contents;
	}
	public void setReview_contents(String review_contents) {
		this.review_contents = review_contents;
	}
	public Date getReview_regdate() {
		return review_regdate;
	}
	public void setReview_regdate(Date review_regdate) {
		this.review_regdate = review_regdate;
	}
	public int getReview_score() {
		return review_score;
	}
	public void setReview_score(int review_score) {
		this.review_score = review_score;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	@Override
	public String toString() {
		return "ReviewVO [item_idx=" + item_idx + ", review_idx=" + review_idx + ", review_title=" + review_title
				+ ", review_contents=" + review_contents + ", review_regdate=" + review_regdate + ", review_score="
				+ review_score + "]";
	}
}
