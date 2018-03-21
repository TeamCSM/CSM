package com.csm.market.service;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.csm.market.domain.CartVO;
import com.csm.market.domain.OrderDTO;
import com.csm.market.persistence.CartDAO;

@Service
public class CartServiceImpl implements CartService{

	@Inject
	private CartDAO dao;
	
	@Override
	public void cartInsert(CartVO vo) throws Exception {
		dao.cartInsert(vo);
	}

	@Override
	public List<CartVO> cartRead(String user_id) throws Exception {
		return dao.cartRead(user_id);
	}

	@Override
	public void cartDelete(OrderDTO dto, String user_id) throws Exception {
		
		System.out.println(dto);
		
		for(CartVO vo : dto.getOrderItems()) {
			if(vo.getItem_check() == 1) {
				vo.setUser_id(user_id);
				dao.cartDelete(vo);
			}
		}
	}

	@Override
	public void cartClean(String user_id) throws Exception {
		dao.cartClean(user_id);
	}

	@Override
	public int cartOverlap(CartVO vo) throws Exception {
		return dao.cartOverlap(vo);
	}

	@Override
	public void cartAmountChange(OrderDTO dto, String user_id) throws Exception {
		
		for(CartVO vo : dto.getOrderItems()) {
			if(vo.getItem_check() == 1) {
				vo.setUser_id(user_id);
				dao.cartAmountChange(vo);
			}
		}
	}

	@Override
	public List<CartVO> checkdCartRead(OrderDTO dto, String user_id) throws Exception {
	
		List<CartVO> list = new ArrayList<>();
		
		for(CartVO vo : dto.getOrderItems()) {
			if(vo.getItem_check() == 1) {
				vo.setUser_id(user_id);
				list.add(dao.checkdCartRead(vo));
			}
		}
		
		return list;
	}

	@Override
	public void cartQuickDelete(CartVO vo) throws Exception {
		
		dao.cartDelete(vo);
	}

}
