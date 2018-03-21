package com.csm.user.domain;

import java.sql.Date;

public class messageVO {
	
	private Integer messagenum;
	private String title;
	private String senderid;
	private String receiverid;
	private String content;
	private Date regidate;
	private int receiverChecks;
	public Integer getMessagenum() {
		return messagenum;
	}
	public void setMessagenum(Integer messagenum) {
		this.messagenum = messagenum;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getSenderid() {
		return senderid;
	}
	public void setSenderid(String senderid) {
		this.senderid = senderid;
	}
	public String getReceiverid() {
		return receiverid;
	}
	public void setReceiverid(String receiverid) {
		this.receiverid = receiverid;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegidate() {
		return regidate;
	}
	public void setRegidate(Date regidate) {
		this.regidate = regidate;
	}
	public int getReceiverChecks() {
		return receiverChecks;
	}
	public void setReceiverChecks(int receiverChecks) {
		this.receiverChecks = receiverChecks;
	}
	@Override
	public String toString() {
		return "messageVO [messagenum=" + messagenum + ", title=" + title + ", senderid=" + senderid + ", receiverid="
				+ receiverid + ", content=" + content + ", regidate=" + regidate + ", receiverChecks=" + receiverChecks
				+ "]";
	}
	
}
