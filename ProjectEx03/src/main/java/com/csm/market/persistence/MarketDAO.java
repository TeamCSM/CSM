package com.csm.market.persistence;

import java.util.List;

import com.csm.market.domain.SellItemLogVO;
import com.csm.user.domain.LoginDTO;

public interface MarketDAO {

	public List<SellItemLogVO> sellItemLogList(String item_area) throws Exception;
	
	public List<SellItemLogVO> sellList(LoginDTO dto) throws Exception;
	
}
