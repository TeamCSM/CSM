package com.csm.market.persistence;

import java.util.List;

import com.csm.market.domain.CartVO;

public interface CartDAO {

	public void cartInsert(CartVO vo) throws Exception;
	
	public List<CartVO> cartRead(String user_id) throws Exception;
	
	public void cartDelete(CartVO vo) throws Exception;
	
	public void cartClean(String user_id) throws Exception;
	
	public int cartOverlap(CartVO vo) throws Exception;
	
	public void cartAmountChange(CartVO vo) throws Exception;
	
	public CartVO checkdCartRead(CartVO vo) throws Exception;
}
