package com.csm.matching.domain;

import java.sql.Date;

public class ResumeVO {
	private String name;
	private String phonenumber;
	private int idx;
	private int uno;
	private String type;
	private String gender;
	private Date birthday;
	private String id;
	private String status;
	private Date regidate;
	private String mailNumber;
	private String streetAddr;
	private String detailedAddr;
	private String career;
	private String award;
	private int accept;
	//메세지용 추가
	private String sid;
	private String title;
	
	public ResumeVO() {
		
	}
	
	//getter/setter 메소드
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhonenumber() {
		return phonenumber;
	}
	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getUno() {
		return uno;
	}
	public void setUno(int uno) {
		this.uno = uno;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Date getRegidate() {
		return regidate;
	}
	public void setRegidate(Date regidate) {
		this.regidate = regidate;
	}
	public String getMailNumber() {
		return mailNumber;
	}
	public void setMailNumber(String mailNumber) {
		this.mailNumber = mailNumber;
	}
	public String getStreetAddr() {
		return streetAddr;
	}
	public void setStreetAddr(String streetAddr) {
		this.streetAddr = streetAddr;
	}
	public String getDetailedAddr() {
		return detailedAddr;
	}
	public void setDetailedAddr(String detailedAddr) {
		this.detailedAddr = detailedAddr;
	}
	public String getCareer() {
		return career;
	}
	public void setCareer(String career) {
		this.career = career;
	}
	public String getAward() {
		return award;
	}
	public void setAward(String award) {
		this.award = award;
	}
	public int getAccept() {
		return accept;
	}
	public void setAccept(int accept) {
		this.accept = accept;
	}
	public String getSid() {
		return sid;
	}

	public void setSid(String sid) {
		this.sid = sid;
	}
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	//toString()
	@Override
	public String toString() {
		return "ResumeVO [name=" + name + ", phonenumber=" + phonenumber + ", idx=" + idx + ", uno=" + uno + ", type="
				+ type + ", gender=" + gender + ", birthday=" + birthday + ", id=" + id + ", status=" + status
				+ ", regidate=" + regidate + ", mailNumber=" + mailNumber + ", streetAddr=" + streetAddr
				+ ", detailedAddr=" + detailedAddr + ", career=" + career + ", award=" + award + ", accept=" + accept
				+ ", sid=" + sid + ", title=" + title + "]";
	}

}
