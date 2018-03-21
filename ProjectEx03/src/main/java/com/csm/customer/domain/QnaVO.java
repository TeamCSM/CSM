package com.csm.customer.domain;

import java.sql.Date;

public class QnaVO {
	private Integer qna_bno;
	private String qna_title;
	private String qna_content;
	private String qna_writer;
	private Date qna_regidate;
	private int qna_viewcnt;
	public Integer getQna_bno() {
		return qna_bno;
	}
	public void setQna_bno(Integer qna_bno) {
		this.qna_bno = qna_bno;
	}
	public String getQna_title() {
		return qna_title;
	}
	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}
	public String getQna_content() {
		return qna_content;
	}
	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}
	public String getQna_writer() {
		return qna_writer;
	}
	public void setQna_writer(String qna_writer) {
		this.qna_writer = qna_writer;
	}
	public Date getQna_regidate() {
		return qna_regidate;
	}
	public void setQna_regidate(Date qna_regidate) {
		this.qna_regidate = qna_regidate;
	}
	public int getQna_viewcnt() {
		return qna_viewcnt;
	}
	public void setQna_viewcnt(int qna_viewcnt) {
		this.qna_viewcnt = qna_viewcnt;
	}
	@Override
	public String toString() {
		return "QnaVO [qna_bno=" + qna_bno + ", qna_title=" + qna_title + ", qna_content=" + qna_content
				+ ", qna_writer=" + qna_writer + ", qna_regidate=" + qna_regidate + ", qna_viewcnt=" + qna_viewcnt
				+ "]";
	}
	
	
}
