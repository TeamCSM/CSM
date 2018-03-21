package com.csm.customer.domain;

import java.sql.Date;

public class ContactVO {
	private Integer contact_bno;
	private String contact_id;
	private String contact_writer;
	private String contact_question;
	private String contact_title;
	private String contact_content;
	private Date contact_regidate;
	private int contact_viewcnt;
	public Integer getContact_bno() {
		return contact_bno;
	}
	public void setContact_bno(Integer contact_bno) {
		this.contact_bno = contact_bno;
	}
	public String getContact_id() {
		return contact_id;
	}
	public void setContact_id(String contact_id) {
		this.contact_id = contact_id;
	}
	public String getContact_writer() {
		return contact_writer;
	}
	public void setContact_writer(String contact_writer) {
		this.contact_writer = contact_writer;
	}
	public String getContact_question() {
		return contact_question;
	}
	public void setContact_question(String contact_question) {
		this.contact_question = contact_question;
	}
	public String getContact_title() {
		return contact_title;
	}
	public void setContact_title(String contact_title) {
		this.contact_title = contact_title;
	}
	public String getContact_content() {
		return contact_content;
	}
	public void setContact_content(String contact_content) {
		this.contact_content = contact_content;
	}
	public Date getContact_regidate() {
		return contact_regidate;
	}
	public void setContact_regidate(Date contact_regidate) {
		this.contact_regidate = contact_regidate;
	}
	public int getContact_viewcnt() {
		return contact_viewcnt;
	}
	public void setContact_viewcnt(int contact_viewcnt) {
		this.contact_viewcnt = contact_viewcnt;
	}
	@Override
	public String toString() {
		return "ContactVO [contact_bno=" + contact_bno + ", contact_id=" + contact_id + ", contact_writer="
				+ contact_writer + ", contact_question=" + contact_question + ", contact_title=" + contact_title
				+ ", contact_content=" + contact_content + ", contact_regidate=" + contact_regidate
				+ ", contact_viewcnt=" + contact_viewcnt + "]";
	}
}
