package com.csm.matching.domain;

public class MonthStatisticsVO {
	private String lastm;
	private String thism;
	private String result;
	private String check_status;
	
	public String getLastm() {
		return lastm;
	}
	public void setLastm(String lastm) {
		this.lastm = lastm;
	}
	public String getThism() {
		return thism;
	}
	public void setThism(String thism) {
		this.thism = thism;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public String getCheck_status() {
		return check_status;
	}
	public void setCheck_status(String check_status) {
		this.check_status = check_status;
	}
	
	@Override
	public String toString() {
		return "MonthStatisticsVO [lastm=" + lastm + ", thism=" + thism + ", result=" + result + ", check_status="
				+ check_status + "]";
	}
		
}
