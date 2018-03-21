package com.csm.customer.domain;

import java.sql.Date;

public class NoticeVO {
	private Integer notice_bno;
	private String notice_title;
	private String notice_content;
	private String notice_writer;
	private Date notice_regidate;
	private int notice_viewcnt;
	public Integer getNotice_bno() {
		return notice_bno;
	}
	public void setNotice_bno(Integer notice_bno) {
		this.notice_bno = notice_bno;
	}
	public String getNotice_title() {
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public String getNotice_writer() {
		return notice_writer;
	}
	public void setNotice_writer(String notice_writer) {
		this.notice_writer = notice_writer;
	}
	public Date getNotice_regidate() {
		return notice_regidate;
	}
	public void setNotice_regidate(Date notice_regidate) {
		this.notice_regidate = notice_regidate;
	}
	public int getNotice_viewcnt() {
		return notice_viewcnt;
	}
	public void setNotice_viewcnt(int notice_viewcnt) {
		this.notice_viewcnt = notice_viewcnt;
	}
	@Override
	public String toString() {
		return "CustomerVO [notice_bno=" + notice_bno + ", notice_title=" + notice_title + ", notice_content="
				+ notice_content + ", notice_writer=" + notice_writer + ", notice_regidate=" + notice_regidate
				+ ", notice_viewcnt=" + notice_viewcnt + "]";
	}
	
}
