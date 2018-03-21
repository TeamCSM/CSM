package com.csm.community.domain;

public class ReplyVO {
	
	private Integer rno;
	private Integer bno;
	private String replytext;
	private String replyer;
	private java.sql.Date regdate;
	private java.sql.Date updatedate;
	private String rnum;
	private int bgroup;
	private int indent;
	private String typeboard;
	
	public String getRnum() {
		return rnum;
	}
	public void setRnum(String rnum) {
		this.rnum = rnum;
	}
	public Integer getRno() {
		return rno;
	}
	public void setRno(Integer rno) {
		this.rno = rno;
	}
	public Integer getBno() {
		return bno;
	}
	public void setBno(Integer bno) {
		this.bno = bno;
	}
	public String getReplytext() {
		return replytext;
	}
	public void setReplytext(String replytext) {
		this.replytext = replytext;
	}
	public String getReplyer() {
		return replyer;
	}
	public void setReplyer(String replyer) {
		this.replyer = replyer;
	}
	public java.sql.Date getRegdate() {
		return regdate;
	}
	public void setRegdate(java.sql.Date regdate) {
		this.regdate = regdate;
	}
	public java.sql.Date getUpdatedate() {
		return updatedate;
	}
	public void setUpdatedate(java.sql.Date updatedate) {
		this.updatedate = updatedate;
	}
	public int getBgroup() {
		return bgroup;
	}
	public void setBgroup(int bgroup) {
		this.bgroup = bgroup;
	}
	public int getIndent() {
		return indent;
	}
	public void setIndent(int indent) {
		this.indent = indent;
	}
	public String getTypeboard() {
		return typeboard;
	}
	public void setTypeboard(String typeboard) {
		this.typeboard = typeboard;
	}
	
	@Override
	public String toString() {
		return "ReplyVO [rno=" + rno + ", bno=" + bno + ", replytext=" + replytext + ", replyer=" + replyer
				+ ", regdate=" + regdate + ", updatedate=" + updatedate + ", rnum=" + rnum + ", bgroup=" + bgroup
				+ ", indent=" + indent + ", typeboard=" + typeboard + "]";
	}
}
