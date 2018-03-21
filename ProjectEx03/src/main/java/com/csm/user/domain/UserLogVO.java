package com.csm.user.domain;

import java.sql.Date;

public class UserLogVO {

	private String log_idx;
	private String user_id;
	private String log_action; 
	private Date log_regdate;
	private int count;
	
	public String getLog_idx() {
		return log_idx;
	}
	public void setLog_idx(String log_idx) {
		this.log_idx = log_idx;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getLog_action() {
		return log_action;
	}
	public void setLog_action(String log_action) {
		this.log_action = log_action;
	}
	public Date getLog_regdate() {
		return log_regdate;
	}
	public void setLog_regdate(Date log_regdate) {
		this.log_regdate = log_regdate;
	}	
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	
	@Override
	public String toString() {
		return "UserLogVO [log_idx=" + log_idx + ", user_id=" + user_id + ", log_action=" + log_action
				+ ", log_regdate=" + log_regdate + ", count=" + count + "]";
	}
	
}
