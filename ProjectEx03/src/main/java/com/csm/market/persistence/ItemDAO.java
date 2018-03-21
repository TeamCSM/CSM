package com.csm.market.persistence;

import java.util.List;

import com.csm.market.domain.InquiryVO;
import com.csm.market.domain.ItemVO;
import com.csm.market.domain.ReviewVO;

public interface ItemDAO {

	public void itemRegister(ItemVO vo) throws Exception;
	
	public void addItemImgFile(String fullName) throws Exception;
	
	public List<ItemVO> listBaseInfo(String area, String user_id) throws Exception;
	
	public List<ItemVO> listSubInfo(String area) throws Exception;
	
	public ItemVO readBaseInfo(String item_idx) throws Exception;
	
	public List<ItemVO> readSubInfo(String item_idx) throws Exception;
	
	public void itemDelete(String item_idx) throws Exception;
	
	public List<String> getItemPhoto(int item_idx) throws Exception;
	
	public void subItemDelete(String fileName) throws Exception;
	
	public void itemBaseModify(ItemVO vo) throws Exception;
	
	public void itemReviewRegister(ReviewVO vo) throws Exception;
	
	public List<ReviewVO> itemReviewList(ReviewVO vo) throws Exception;
	
	public void itemInquiryRegister(InquiryVO vo) throws Exception;
	
	public List<InquiryVO> itemInquriyList(InquiryVO vo) throws Exception;
	
	public void itemAmountModify(ItemVO vo) throws Exception;
}
