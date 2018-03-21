package com.csm.matching.domain;

import java.util.Date;

public class ProgramVO {
	private int idx;
	private String id;
	private String pass;
	private String title;
	private String contents;
	private Date regidate;
	private int viewcnt;
	private String type;
	private int pmax;
	private int currentnum;
	private int selectnum;
	private Date selectDate;
	private String max_time;
	private String check_time;
	
	//getter/setter 메소드
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Date getRegidate() {
		return regidate;
	}
	public void setRegidate(Date regidate) {
		this.regidate = regidate;
	}
	public int getViewcnt() {
		return viewcnt;
	}
	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getPmax() {
		return pmax;
	}
	public void setPmax(int pmax) {
		this.pmax = pmax;
	}
	public int getCurrentnum() {
		return currentnum;
	}
	public void setCurrentnum(int currentnum) {
		this.currentnum = currentnum;
	}
	public Date getSelectDate() {
		return selectDate;
	}
	public void setSelectDate(Date selectDate) {
		this.selectDate = selectDate;
	}
	public String getMax_time() {
		return max_time;
	}
	public void setMax_time(String max_time) {
		this.max_time = max_time;
	}
	public String getCheck_time() {
		return check_time;
	}
	public void setCheck_time(String check_time) {
		this.check_time = check_time;
	}
	public int getSelectnum() {
		return selectnum;
	}
	public void setSelectnum(int selectnum) {
		this.selectnum = selectnum;
	}
	
	//toString 메소드
	@Override
	public String toString() {
		return "ProgramVO [idx=" + idx + ", id=" + id + ", pass=" + pass + ", title=" + title + ", contents=" + contents
				+ ", regidate=" + regidate + ", viewcnt=" + viewcnt + ", type=" + type + ", pmax=" + pmax
				+ ", currentnum=" + currentnum + ", selectnum=" + selectnum + ", selectDate=" + selectDate
				+ ", max_time=" + max_time + ", check_time=" + check_time + "]";
	}
	
}
