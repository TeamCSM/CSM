package com.csm.market.persistence;

import java.util.List;

import com.csm.market.domain.CartVO;
import com.csm.market.domain.OrderDTO;
import com.csm.market.domain.OrderVO;
import com.csm.market.domain.SaveAddrVO;

public interface OrderDAO {

	public void saveAddrUpdate(SaveAddrVO vo) throws Exception;
	
	public void saveAddrInsert(SaveAddrVO vo) throws Exception;
	
	public SaveAddrVO saveAddrRead(SaveAddrVO vo) throws Exception;
	
	public void orderBaseInfoInsert(OrderVO vo) throws Exception;
	
	public void orderItemInfoInsert(CartVO vo, String order_idx) throws Exception;
	
	public List<OrderVO> orderBaseInfoListRead(String user_id) throws Exception;
	
	public List<CartVO> orderItemInfoRead(OrderVO vo) throws Exception;
	
	public OrderVO orderBaseInfoRead(String user_id, String order_idx) throws Exception;
	
	public void baseInfoOrderProgressUpdate(OrderVO vo) throws Exception;
	
	public void orderProgressChange(OrderVO vo) throws Exception;
	
	public void sellItemLogInsert(CartVO vo) throws Exception;
}
