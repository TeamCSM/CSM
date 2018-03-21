package com.csm.market.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.csm.market.domain.SellItemLogVO;
import com.csm.user.domain.LoginDTO;

@Repository
public class MarketDAOImpl implements MarketDAO{
	
	@Inject
	private SqlSession session;

	private static String namespace = "com.csm.mapper.MarketMapper";

	@Override
	public List<SellItemLogVO> sellItemLogList(String item_area) throws Exception {
		
		Map<String, Object> paramMap = new HashMap<>();
		
		paramMap.put("item_area", item_area);
		
		return session.selectList(namespace+".sellItemLogList", paramMap);
	}

	@Override
	public List<SellItemLogVO> sellList(LoginDTO dto) throws Exception {
		
		return session.selectList(namespace+".sellList", dto);
	}
	
	
}
