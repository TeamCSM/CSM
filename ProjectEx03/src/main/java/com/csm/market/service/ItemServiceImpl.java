package com.csm.market.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.csm.market.domain.CartVO;
import com.csm.market.domain.InquiryVO;
import com.csm.market.domain.ItemVO;
import com.csm.market.domain.OrderDTO;
import com.csm.market.domain.ReviewVO;
import com.csm.market.persistence.ItemDAO;
import com.csm.user.domain.UserVO;

@Service
public class ItemServiceImpl implements ItemService{

	@Inject
	private ItemDAO dao;

	@Transactional
	@Override
	public void itemRegister(ItemVO vo) throws Exception {
		dao.itemRegister(vo);

		String[] files = vo.getFiles();

		if(files == null) {return;}

		for(String fileName : files) {

			dao.addItemImgFile(fileName);
		}
	}

	@Override
	public Map<String, Object> itemListPage(String area, String user_id) throws Exception {

		Map<String, Object> paramMap = new HashMap<>();

		List<ItemVO> baseInfo = dao.listBaseInfo(area, user_id);

		if(user_id == null) {
			List<ItemVO> subInfo = dao.listSubInfo(area);

			int count = 0;
			for(ItemVO subTemp : subInfo) {

				if(count == 1) {
					count = 0;
					continue;
				}

				for(ItemVO baseTmep : baseInfo) {
					if(subTemp.getItem_idx().equals(baseTmep.getItem_idx())) {
						baseTmep.setItem_photoName(subTemp.getItem_photoName());
						count++;
					}
				}

			}
		}
		paramMap.put("baseInfo", baseInfo);

		return paramMap;
	}

	@Override
	public Map<String, Object> itemReadPage(String item_idx) throws Exception {

		Map<String, Object> paramMap = new HashMap<>();

		ItemVO baseInfo = dao.readBaseInfo(item_idx);

		List<ItemVO> subInfo = dao.readSubInfo(item_idx);

		if(!subInfo.isEmpty()) {
			String tmp[] = new String[subInfo.size()];
			int i = 0;
			for(ItemVO temp : subInfo) {	
				tmp[i] = temp.getItem_photoName();
				i++;
			}

			baseInfo.setFiles(tmp);
		}

		paramMap.put("baseInfo", baseInfo);

		return paramMap;
	}

	@Override
	public ItemVO itemBaseInfoRead(String item_idx) throws Exception {

		return dao.readBaseInfo(item_idx);
	}

	@Override
	public void itemDelete(String item_idx) throws Exception {
		dao.itemDelete(item_idx);
	}

	@Override
	public List<String> getItemPhoto(int item_idx) throws Exception {

		return dao.getItemPhoto(item_idx);
	}

	@Override
	public void subItemDelete(String fileName) throws Exception {
		dao.subItemDelete(fileName);
	}

	@Override
	public void itemModify(ItemVO vo) throws Exception {
		
		dao.itemBaseModify(vo);
		//dao.itemSubModify();
	}
	
	@Override
	public void itemReviewRegister(ReviewVO vo) throws Exception {

		dao.itemReviewRegister(vo);	
	}

	@Override
	public List<ReviewVO> itemReviewList(ReviewVO vo) throws Exception {
		
		return dao.itemReviewList(vo);
	}

	@Override
	public void itemInquiryRegister(InquiryVO vo) throws Exception {
		
		dao.itemInquiryRegister(vo);
	}

	@Override
	public List<InquiryVO> itemInquriyList(InquiryVO vo) throws Exception {
		
		return dao.itemInquriyList(vo);
	}

	
}
