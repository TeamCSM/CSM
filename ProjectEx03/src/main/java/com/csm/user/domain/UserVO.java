package com.csm.user.domain;

import java.sql.Date;

public class UserVO {
	
	//유저 개인정보
	private String user_id;
	private String user_pass;
	private String user_name;
	private String user_gender;
	private String user_birthday;
	private String user_email;
	private String user_phone;
	private Date user_regdate;
	private int user_point;
	//집주소
	private String user_mailNumber;
	private String user_streetAddr;
	private String user_detailedAddr;
	//유저, 운영자 여부판단
	private String user_authority;
	//유저 동의정보
	private String user_termsService; 
	private String user_termsPrivacy; 
	private String user_termsLocation; 
	private String user_termsEmail;
	
	//패스워드 확인용
	private String user_newPass;
	private int reqAuthority;
		
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
	public String getUser_gender() {
		return user_gender;
	}
	public void setUser_gender(String user_gender) {
		this.user_gender = user_gender;
	}
	public String getUser_birthday() {
		return user_birthday;
	}
	public void setUser_birthday(String user_birthday) {
		this.user_birthday = user_birthday;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	public Date getUser_regdate() {
		return user_regdate;
	}
	public void setUser_regdate(Date user_regdate) {
		this.user_regdate = user_regdate;
	}
	public int getUser_point() {
		return user_point;
	}
	public void setUser_point(int user_point) {
		this.user_point = user_point;
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
	public String getUser_authority() {
		return user_authority;
	}
	public void setUser_authority(String user_authority) {
		this.user_authority = user_authority;
	}
	public String getUser_termsService() {
		return user_termsService;
	}
	public void setUser_termsService(String user_termsService) {
		this.user_termsService = user_termsService;
	}
	public String getUser_termsPrivacy() {
		return user_termsPrivacy;
	}
	public void setUser_termsPrivacy(String user_termsPrivacy) {
		this.user_termsPrivacy = user_termsPrivacy;
	}
	public String getUser_termsLocation() {
		return user_termsLocation;
	}
	public void setUser_termsLocation(String user_termsLocation) {
		this.user_termsLocation = user_termsLocation;
	}
	public String getUser_termsEmail() {
		return user_termsEmail;
	}
	public void setUser_termsEmail(String user_termsEmail) {
		this.user_termsEmail = user_termsEmail;
	}
	public String getUser_newPass() {
		return user_newPass;
	}
	public void setUser_newPass(String user_newPass) {
		this.user_newPass = user_newPass;
	}
	public int getReqAuthority() {
		return reqAuthority;
	}
	public void setReqAuthority(int reqAuthority) {
		this.reqAuthority = reqAuthority;
	}
	
	@Override
	public String toString() {
		return "UserVO [user_id=" + user_id + ", user_pass=" + user_pass + ", user_name=" + user_name + ", user_gender="
				+ user_gender + ", user_birthday=" + user_birthday + ", user_email=" + user_email + ", user_phone="
				+ user_phone + ", user_regdate=" + user_regdate + ", user_point=" + user_point + ", user_mailNumber="
				+ user_mailNumber + ", user_streetAddr=" + user_streetAddr + ", user_detailedAddr=" + user_detailedAddr
				+ ", user_authority=" + user_authority + ", user_termsService=" + user_termsService
				+ ", user_termsPrivacy=" + user_termsPrivacy + ", user_termsLocation=" + user_termsLocation
				+ ", user_termsEmail=" + user_termsEmail + ", user_newPass=" + user_newPass + ", reqAuthority="
				+ reqAuthority + "]";
	}
}
