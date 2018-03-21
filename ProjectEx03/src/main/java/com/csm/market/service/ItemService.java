package com.csm.market.service;


import java.util.List;
import java.util.Map;

import com.csm.market.domain.InquiryVO;
import com.csm.market.domain.ItemVO;
import com.csm.market.domain.OrderDTO;
import com.csm.market.domain.ReviewVO;

public interface ItemService {

	public void itemRegister(ItemVO vo) throws Exception;
	
	public Map<String, Object> itemListPage(String area, String user_id) throws Exception;
	
	public Map<String, Object> itemReadPage(String item_idx) throws Exception;
	
	public ItemVO itemBaseInfoRead(String item_idx) throws Exception;
	
	public void itemDelete(String item_idx) throws Exception;
	
	public List<String> getItemPhoto(int item_idx) throws Exception;
	
	public void subItemDelete(String fileName) throws Exception;
	
	public void itemModify(ItemVO vo) throws Exception;
	
	public void itemReviewRegister(ReviewVO vo) throws Exception;
	
	public List<ReviewVO> itemReviewList(ReviewVO vo) throws Exception;
	
	public void itemInquiryRegister(InquiryVO vo) throws Exception;
	
	public List<InquiryVO> itemInquriyList(InquiryVO vo) throws Exception;
}
