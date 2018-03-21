package com.csm.market.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.csm.market.domain.CartVO;

@Repository
public class CartDAOImpl implements CartDAO{

	@Inject
	private SqlSession session;
	
	private static String namespace = "com.csm.mapper.MarketMapper";
	
	@Override
	public void cartInsert(CartVO vo) throws Exception {
		session.insert(namespace+".cartInsert", vo);
	}

	@Override
	public List<CartVO> cartRead(String user_id) throws Exception {
		return session.selectList(namespace+".cartRead", user_id);
	}

	@Override
	public void cartDelete(CartVO vo) throws Exception {
		session.delete(namespace+".cartDelete", vo);
	}

	@Override
	public void cartClean(String user_id) throws Exception {
		session.delete(namespace+".cartClean", user_id);
	}

	@Override
	public int cartOverlap(CartVO vo) throws Exception {
		return session.selectOne(namespace+".cartOverlap", vo);
	}

	@Override
	public void cartAmountChange(CartVO vo) throws Exception {
		session.update(namespace+".cartAmountChange", vo);
	}

	@Override
	public CartVO checkdCartRead(CartVO vo) throws Exception {
		return session.selectOne(namespace+".checkdCartRead", vo);
	}

}
