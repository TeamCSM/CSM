package com.csm.market.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.csm.market.domain.CartVO;
import com.csm.market.domain.ItemVO;
import com.csm.market.domain.OrderDTO;
import com.csm.market.domain.OrderVO;
import com.csm.market.domain.SaveAddrVO;
import com.csm.market.persistence.CartDAO;
import com.csm.market.persistence.ItemDAO;
import com.csm.market.persistence.OrderDAO;

@Service
public class OrderServiceImpl implements OrderService{

	@Inject
	private OrderDAO dao;
	
	@Inject
	private CartDAO cartDAO;
	
	@Inject
	private ItemDAO itemDAO;

	@Transactional
	@Override
	public void orderInsert(OrderDTO dto, String user_id, OrderVO orderVO) throws Exception {

		SaveAddrVO temp = dto.getSaveAddVo();
		temp.setUser_id(user_id);

		if(dto.getSaveAddr_check() == 1) {
			//체크를 했으므로 기본배송지로 등록		
			//그냥 업데이트문 날림 대신 save네임은 고정
			temp.setSaveAddr_name("기본배송지");
			temp.setSaveAddr_step(1);

			if(dao.saveAddrRead(temp) == null) {
				dao.saveAddrInsert(temp);
			}else {
				dao.saveAddrUpdate(temp);
			}

		}else {
			//select * saveName 을 통한 중복유무검사
			//중복시 업데이트 미중복시 인서트
			temp.setSaveAddr_step(0);
			if(dao.saveAddrRead(temp) == null) {
				dao.saveAddrInsert(temp);
			}else {
				dao.saveAddrUpdate(temp);
			}

		}
				
		//private String order_idx;
		
		String item_names = ""; 
		int count = 0;
		for(CartVO vo : dto.getOrderItems()) {
			if(count > 0) {
				item_names += " , ";
			}
			
			if(vo.getItem_name() != null) {
				item_names += vo.getItem_name();
				count++;
			}	
		}
		
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmm");
		
		orderVO.setOrder_idx(sdf.format(date));
		orderVO.setSaveAddr_name(temp.getSaveAddr_name());
		orderVO.setItem_names(item_names);
		orderVO.setUser_id(user_id);
		dao.orderBaseInfoInsert(orderVO);
		
		for(CartVO vo : dto.getOrderItems()) {

			vo.setUser_id(user_id);
			dao.orderItemInfoInsert(vo, orderVO.getOrder_idx());
			
			
		}
		////////////////////////////// 장바구니 삭제부분
		
		for(CartVO vo : dto.getOrderItems()) {
			
			cartDAO.cartDelete(vo);
		}
		
		//////////////////////////// 아이템 갯수 삭제

		for(CartVO vo : dto.getOrderItems()) {
			ItemVO tmp = new ItemVO();
			tmp.setItem_idx(vo.getItem_idx());
			tmp.setItem_amount(vo.getItem_amount());
			itemDAO.itemAmountModify(tmp);
		}
		
	}

	@Override
	public List<OrderVO> orderBaseInfoListRead(String user_id) throws Exception {
		
		return dao.orderBaseInfoListRead(user_id);
	}

	@Override
	public List<CartVO> orderItemInfoRead(OrderVO vo) throws Exception {
		
		if(vo.getItem_sellerId()==null) {
			vo.setItem_sellerId("");
		}
		if(vo.getOrder_idx()==null) {
			vo.setOrder_idx("");
		}
		
		return dao.orderItemInfoRead(vo);
	}

	@Override
	public OrderVO orderBaseInfoRead(String user_id, String order_idx) throws Exception {
		
		return dao.orderBaseInfoRead(user_id, order_idx);
	}

	@Override
	public SaveAddrVO saveAddrRead(OrderVO vo) throws Exception {
		
		SaveAddrVO saveAddrVO = new SaveAddrVO();
		
		saveAddrVO.setSaveAddr_name(vo.getSaveAddr_name());
		saveAddrVO.setUser_id(vo.getUser_id());
		
		return dao.saveAddrRead(saveAddrVO);
	}

	@Override
	public void orderCancle(OrderVO vo) throws Exception {
		
		vo.setOrder_progress("주문취소");
		
		dao.baseInfoOrderProgressUpdate(vo);
	}

	@Transactional
	@Override
	public void orderProgressChange(OrderVO vo) throws Exception {
		System.out.println("확인 :패 "+ vo);
		dao.orderProgressChange(vo);
		dao.baseInfoOrderProgressUpdate(vo);
	}

	@Transactional
	@Override
	public void orderProgressComplete(OrderDTO dto, String user_id, OrderVO orderVO) throws Exception {
		
		//로그삽입
		for(CartVO vo : dto.getOrderItems()) {
			vo.setUser_id(user_id);
			dao.sellItemLogInsert(vo);
		}
		
		//배송정보 업데이트
		orderVO.setUser_id(user_id);
		dao.orderProgressChange(orderVO);
		dao.baseInfoOrderProgressUpdate(orderVO);
		
	}

}
