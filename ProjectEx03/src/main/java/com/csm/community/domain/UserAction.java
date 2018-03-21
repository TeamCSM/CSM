package com.csm.community.domain;

import java.sql.Date;

public class UserAction {
	
	private String user_id;
	private String user_action;
	private int user_flag;
	private Date action_regdate;
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_action() {
		return user_action;
	}
	public void setUser_action(String user_action) {
		this.user_action = user_action;
	}
	public int getUser_flag() {
		return user_flag;
	}
	public void setUser_flag(int user_flag) {
		this.user_flag = user_flag;
	}
	public Date getAction_regdate() {
		return action_regdate;
	}
	public void setAction_regdate(Date action_regdate) {
		this.action_regdate = action_regdate;
	}
	@Override
	public String toString() {
		return "UserAction [user_id=" + user_id + ", user_action=" + user_action + ", user_flag=" + user_flag
				+ ", action_regdate=" + action_regdate + "]";
	}

}
