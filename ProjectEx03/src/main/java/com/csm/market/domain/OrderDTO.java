package com.csm.market.domain;

import java.util.List;

public class OrderDTO {
	
	private List<CartVO> orderItems;
	private SaveAddrVO saveAddVo;
	private int saveAddr_check;
	
	public List<CartVO> getOrderItems() {
		return orderItems;
	}
	public void setOrderItems(List<CartVO> orderItems) {
		this.orderItems = orderItems;
	}
	public SaveAddrVO getSaveAddVo() {
		return saveAddVo;
	}
	public void setSaveAddVo(SaveAddrVO saveAddVo) {
		this.saveAddVo = saveAddVo;
	}
	public int getSaveAddr_check() {
		return saveAddr_check;
	}
	public void setSaveAddr_check(int saveAddr_check) {
		this.saveAddr_check = saveAddr_check;
	}
	
	@Override
	public String toString() {
		return "OrderDTO [orderItems=" + orderItems + ", saveAddVo=" + saveAddVo + ", saveAddr_check=" + saveAddr_check
				+ "]";
	}
	
}
