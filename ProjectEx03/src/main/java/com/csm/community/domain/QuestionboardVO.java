package com.csm.community.domain;

import java.sql.Date;

public class QuestionboardVO {
	
	private Integer bno;
	private String question;
	private String title;
	private String content;
	private String writer;
	private Date regdate;
	private int viewcount;
	private int replycount;
	private int point;
	private String rnum;
	private String ip;
	private int bgroup;
	private int bstep;
	private int indent;
	private int checkcount;
	private int likenum;
	
	
	
	public int getLikenum() {
		return likenum;
	}
	public void setLikenum(int likenum) {
		this.likenum = likenum;
	}
	public int getCheckcount() {
		return checkcount;
	}
	public void setCheckcount(int checkcount) {
		this.checkcount = checkcount;
	}
	public Integer getBno() {
		return bno;
	}
	public void setBno(Integer bno) {
		this.bno = bno;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getViewcount() {
		return viewcount;
	}
	public void setViewcount(int viewcount) {
		this.viewcount = viewcount;
	}
	public int getReplycount() {
		return replycount;
	}
	public void setReplycount(int replycount) {
		this.replycount = replycount;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public String getRnum() {
		return rnum;
	}
	public void setRnum(String rnum) {
		this.rnum = rnum;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public int getBgroup() {
		return bgroup;
	}
	public void setBgroup(int bgroup) {
		this.bgroup = bgroup;
	}
	public int getBstep() {
		return bstep;
	}
	public void setBstep(int bstep) {
		this.bstep = bstep;
	}
	public int getIndent() {
		return indent;
	}
	public void setIndent(int indent) {
		this.indent = indent;
	}
	@Override
	public String toString() {
		return "QuestionboardVO [bno=" + bno + ", question=" + question + ", title=" + title + ", content=" + content
				+ ", writer=" + writer + ", regdate=" + regdate + ", viewcount=" + viewcount + ", replycount="
				+ replycount + ", point=" + point + ", rnum=" + rnum + ", ip=" + ip + ", bgroup=" + bgroup + ", bstep="
				+ bstep + ", indent=" + indent + ", checkcount=" + checkcount + ", likenum=" + likenum + "]";
	}
	
}
