package com.csm.market.service;

import java.util.List;

import com.csm.market.domain.CartVO;
import com.csm.market.domain.OrderDTO;
import com.csm.market.domain.OrderVO;
import com.csm.market.domain.SaveAddrVO;

public interface OrderService {
	
	public void orderInsert(OrderDTO dto, String user_id, OrderVO orderVO) throws Exception;
	
	public List<OrderVO> orderBaseInfoListRead(String user_id) throws Exception;
	
	public List<CartVO> orderItemInfoRead(OrderVO vo) throws Exception;
	
	public OrderVO orderBaseInfoRead(String user_id , String order_idx) throws Exception;
	
	public SaveAddrVO saveAddrRead(OrderVO vo) throws Exception;
	
	public void orderCancle(OrderVO vo) throws Exception;
	
	public void orderProgressChange(OrderVO vo) throws Exception;
	
	public void orderProgressComplete(OrderDTO dto, String user_id, OrderVO orderVO) throws Exception;
}
