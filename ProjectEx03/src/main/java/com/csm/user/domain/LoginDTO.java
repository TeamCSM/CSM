package com.csm.user.domain;

public class LoginDTO {
	
	private String user_id;
	private String user_pass;
	private String user_name;
	private String user_authority;
	private String user_point;
	private String user_loginType = null;
	private boolean useCookie;
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pass() {
		return user_pass;
	}
	public void setUser_pass(String user_pass) {
		this.user_pass = user_pass;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public boolean isUseCookie() {
		return useCookie;
	}
	public void setUseCookie(boolean useCookie) {
		this.useCookie = useCookie;
	}
	public String getUser_loginType() {
		return user_loginType;
	}
	public void setUser_loginType(String user_loginType) {
		this.user_loginType = user_loginType;
	}
	public String getUser_authority() {
		return user_authority;
	}
	public void setUser_authority(String user_authority) {
		this.user_authority = user_authority;
	}
	public String getUser_point() {
		return user_point;
	}
	public void setUser_point(String user_point) {
		this.user_point = user_point;
	}
	@Override
	public String toString() {
		return "LoginDTO [user_id=" + user_id + ", user_pass=" + user_pass + ", user_name=" + user_name
				+ ", user_authority=" + user_authority + ", user_point=" + user_point + ", user_loginType="
				+ user_loginType + ", useCookie=" + useCookie + "]";
	}
	
	
}
