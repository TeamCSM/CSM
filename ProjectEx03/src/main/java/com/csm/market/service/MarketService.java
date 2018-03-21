package com.csm.market.service;

import java.util.List;

import com.csm.market.domain.SellItemLogVO;
import com.csm.user.domain.LoginDTO;

public interface MarketService {

	public List<SellItemLogVO> BestItemList(String item_area) throws Exception;
	
	public List<SellItemLogVO> sellList(LoginDTO dto) throws Exception;
}
