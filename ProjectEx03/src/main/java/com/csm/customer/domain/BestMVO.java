package com.csm.customer.domain;

import java.sql.Date;

public class BestMVO {
	private Integer bestm_bno;
	private String bestm_title;
	private String bestm_content;
	private String bestm_writer;
	private Date bestm_regidate;
	private String answer;
	
	public Integer getBestm_bno() {
		return bestm_bno;
	}
	public void setBestm_bno(Integer bestm_bno) {
		this.bestm_bno = bestm_bno;
	}
	public String getBestm_title() {
		return bestm_title;
	}
	public void setBestm_title(String bestm_title) {
		this.bestm_title = bestm_title;
	}
	public String getBestm_content() {
		return bestm_content;
	}
	public void setBestm_content(String bestm_content) {
		this.bestm_content = bestm_content;
	}
	public String getBestm_writer() {
		return bestm_writer;
	}
	public void setBestm_writer(String bestm_writer) {
		this.bestm_writer = bestm_writer;
	}
	public Date getBestm_regidate() {
		return bestm_regidate;
	}
	public void setBestm_regidate(Date bestm_regidate) {
		this.bestm_regidate = bestm_regidate;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	@Override
	public String toString() {
		return "BestMVO [bestm_bno=" + bestm_bno + ", bestm_title=" + bestm_title + ", bestm_content=" + bestm_content
				+ ", bestm_writer=" + bestm_writer + ", bestm_regidate=" + bestm_regidate + ", bestm_power="
				+ answer + "]";
	}
	
	
}
