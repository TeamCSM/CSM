package com.csm.market.service;

import java.util.List;

import com.csm.market.domain.CartVO;
import com.csm.market.domain.OrderDTO;

public interface CartService {

	public void cartInsert(CartVO vo) throws Exception;
	
	public List<CartVO> cartRead(String user_id) throws Exception;
	
	public void cartDelete(OrderDTO dto, String user_id) throws Exception;
	
	public void cartClean(String user_id) throws Exception;
	
	public int cartOverlap(CartVO vo) throws Exception;
	
	public void cartAmountChange(OrderDTO dto, String user_id) throws Exception;
	
	public List<CartVO> checkdCartRead(OrderDTO dto, String user_id) throws Exception;
	
	public void cartQuickDelete(CartVO vo) throws Exception;
}
