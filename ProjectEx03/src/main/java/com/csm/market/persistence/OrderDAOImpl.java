package com.csm.market.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.csm.market.domain.CartVO;
import com.csm.market.domain.OrderDTO;
import com.csm.market.domain.OrderVO;
import com.csm.market.domain.SaveAddrVO;

@Repository
public class OrderDAOImpl implements OrderDAO{

	@Inject
	private SqlSession session;

	private static String namespace = "com.csm.mapper.MarketMapper";


	@Override
	public void saveAddrUpdate(SaveAddrVO vo) throws Exception {
		session.update(namespace+".saveAddrUpdate", vo);		
	}

	@Override
	public void saveAddrInsert(SaveAddrVO vo) throws Exception {
		session.insert(namespace+".saveAddrInsert", vo);
	}

	@Override
	public SaveAddrVO saveAddrRead(SaveAddrVO vo) throws Exception {	
		return session.selectOne(namespace+".saveAddrRead", vo);
	}

	@Override
	public void orderBaseInfoInsert(OrderVO vo) throws Exception {
		session.insert(namespace+".orderBaseInfoInsert", vo);	
	}

	@Override
	public void orderItemInfoInsert(CartVO vo, String order_idx) throws Exception {

		Map<String, Object> paramMap = new HashMap<>();

		paramMap.put("vo", vo);
		paramMap.put("order_idx", order_idx);

		session.insert(namespace+".orderItemInfoInsert", paramMap);
	}

	@Override
	public List<OrderVO> orderBaseInfoListRead(String user_id) throws Exception {

		return session.selectList(namespace+".orderBaseInfoListRead", user_id);
	}

	@Override
	public List<CartVO> orderItemInfoRead(OrderVO vo) throws Exception {
		System.out.println(vo);
		return session.selectList(namespace+".orderItemInfoRead", vo);
	}

	@Override
	public OrderVO orderBaseInfoRead(String user_id, String order_idx) throws Exception {
		
		Map<String, Object> paramMap = new HashMap<>();

		paramMap.put("user_id", user_id);
		paramMap.put("order_idx", order_idx);
		
		return session.selectOne(namespace+".orderBaseInfoRead", paramMap);
	}

	@Override
	public void baseInfoOrderProgressUpdate(OrderVO vo) throws Exception {
		
		session.update(namespace+".baseInfoOrderProgressUpdate", vo);
	}

	@Override
	public void orderProgressChange(OrderVO vo) throws Exception {
		
		session.update(namespace+".orderProgressChange", vo);
	}

	@Override
	public void sellItemLogInsert(CartVO vo) throws Exception {
		
		session.insert(namespace+".sellItemLogInsert", vo);
	}

}
