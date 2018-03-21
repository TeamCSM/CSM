package com.csm.market.service;

import java.util.Iterator;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.csm.market.domain.SellItemLogVO;
import com.csm.market.persistence.MarketDAO;
import com.csm.user.domain.LoginDTO;

@Service
public class MarketServiceImpl implements MarketService{

	@Inject
	private MarketDAO marketDAO;
	
	@Override
	public List<SellItemLogVO> BestItemList(String item_area) throws Exception {
		
		return marketDAO.sellItemLogList(item_area);
	}

	@Override
	public List<SellItemLogVO> sellList(LoginDTO dto) throws Exception {
		
		return marketDAO.sellList(dto);
	}

}
