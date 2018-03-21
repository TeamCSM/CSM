package com.csm.market.domain;

public class SaveAddrVO {

	private String saveAddr_name;
	private String user_id; 
	private String user_name; 
	private String user_phone; 
	private String user_mailNumber; 
	private String user_streetAddr; 
	private String user_detailedAddr; 
	private int saveAddr_step;
	
	
	public String getSaveAddr_name() {
		return saveAddr_name;
	}
	public void setSaveAddr_name(String saveAddr_name) {
		this.saveAddr_name = saveAddr_name;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	public String getUser_mailNumber() {
		return user_mailNumber;
	}
	public void setUser_mailNumber(String user_mailNumber) {
		this.user_mailNumber = user_mailNumber;
	}
	public String getUser_streetAddr() {
		return user_streetAddr;
	}
	public void setUser_streetAddr(String user_streetAddr) {
		this.user_streetAddr = user_streetAddr;
	}
	public String getUser_detailedAddr() {
		return user_detailedAddr;
	}
	public void setUser_detailedAddr(String user_detailedAddr) {
		this.user_detailedAddr = user_detailedAddr;
	}
	public int getSaveAddr_step() {
		return saveAddr_step;
	}
	public void setSaveAddr_step(int saveAddr_step) {
		this.saveAddr_step = saveAddr_step;
	}
	
	@Override
	public String toString() {
		return "SaveAddrVO [saveAddr_name=" + saveAddr_name + ", user_id=" + user_id + ", user_name=" + user_name
				+ ", user_phone=" + user_phone + ", user_mailNumber=" + user_mailNumber + ", user_streetAddr="
				+ user_streetAddr + ", user_detailedAddr=" + user_detailedAddr + ", saveAddr_step=" + saveAddr_step
				+ "]";
	}
	
}
