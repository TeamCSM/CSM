package com.csm.customer.domain;

import java.sql.Date;

public class BestQVO {
	private Integer bestq_bno;
	private String bestq_title;
	private String bestq_content;
	private String bestq_writer;
	private Date bestq_regidate;
	private int bestq_viewcnt;
	public Integer getBestq_bno() {
		return bestq_bno;
	}
	public void setBestq_bno(Integer bestq_bno) {
		this.bestq_bno = bestq_bno;
	}
	public String getBestq_title() {
		return bestq_title;
	}
	public void setBestq_title(String bestq_title) {
		this.bestq_title = bestq_title;
	}
	public String getBestq_content() {
		return bestq_content;
	}
	public void setBestq_content(String bestq_content) {
		this.bestq_content = bestq_content;
	}
	public String getBestq_writer() {
		return bestq_writer;
	}
	public void setBestq_writer(String bestq_writer) {
		this.bestq_writer = bestq_writer;
	}
	public Date getBestq_regidate() {
		return bestq_regidate;
	}
	public void setBestq_regidate(Date bestq_regidate) {
		this.bestq_regidate = bestq_regidate;
	}
	public int getBestq_viewcnt() {
		return bestq_viewcnt;
	}
	public void setBestq_viewcnt(int bestq_viewcnt) {
		this.bestq_viewcnt = bestq_viewcnt;
	}
	@Override
	public String toString() {
		return "BestQVO [bestq_bno=" + bestq_bno + ", bestq_title=" + bestq_title + ", bestq_content=" + bestq_content
				+ ", bestq_writer=" + bestq_writer + ", bestq_regidate=" + bestq_regidate + ", bestq_viewcnt="
				+ bestq_viewcnt + "]";
	}
	
}
