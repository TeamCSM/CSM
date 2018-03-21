package com.csm.market.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.csm.market.domain.InquiryVO;
import com.csm.market.domain.ItemVO;
import com.csm.market.domain.ReviewVO;

@Repository
public class ItemDAOImpl implements ItemDAO{

	@Inject
	private SqlSession session;

	private static String namespace = "com.csm.mapper.MarketMapper";

	@Override
	public void itemRegister(ItemVO vo) throws Exception {
		session.insert(namespace+".itemRegister", vo);
	}

	@Override
	public void addItemImgFile(String fullName) throws Exception {
		session.insert(namespace+".addItemImgFile", fullName);
	}

	@Override
	public List<ItemVO> listBaseInfo(String area, String user_id) throws Exception {

		Map<String, Object> paramMap = new HashMap<>();

		if(area == null) {
			area = "";
			System.out.println("area : "+ area);
		}
		if(user_id == null) {
			user_id = "";
			System.out.println("user_id : "+ user_id);
		}
		
		paramMap.put("area", area);
		paramMap.put("user_id", user_id);
		return session.selectList(namespace+".listBaseInfo", paramMap);
	}

	@Override
	public List<ItemVO> listSubInfo(String area) throws Exception {		
		return session.selectList(namespace+".listSubInfo", area);
	}

	@Override
	public ItemVO readBaseInfo(String item_idx) throws Exception {
		return session.selectOne(namespace+".readBaseInfo", item_idx);
	}

	@Override
	public List<ItemVO> readSubInfo(String item_idx) throws Exception {
		return session.selectList(namespace+".readSubInfo", item_idx);
	}

	@Override
	public void itemDelete(String item_idx) throws Exception {
		
		session.delete(namespace+".itemDelete", item_idx);
	}

	@Override
	public List<String> getItemPhoto(int item_idx) throws Exception {
		
		return session.selectList(namespace+".getItemPhoto", item_idx);
	}
	
	@Override
	public void subItemDelete(String fileName) throws Exception {
		
		session.delete(namespace+".subItemDelete", fileName);
	}

	@Override
	public void itemReviewRegister(ReviewVO vo) throws Exception {
		
		session.insert(namespace+".itemReviewRegister", vo);
	}

	@Override
	public List<ReviewVO> itemReviewList(ReviewVO vo) throws Exception {
		
		return session.selectList(namespace+".itemReviewList", vo);
	}

	@Override
	public void itemInquiryRegister(InquiryVO vo) throws Exception {
		
		session.insert(namespace+".itemInquiryRegister", vo);
	}

	@Override
	public List<InquiryVO> itemInquriyList(InquiryVO vo) throws Exception {
		
		return session.selectList(namespace+".itemInquriyList", vo);
	}

	@Override
	public void itemBaseModify(ItemVO vo) throws Exception {
		
		session.update(namespace+".itemBaseModify", vo);
	}

	@Override
	public void itemAmountModify(ItemVO vo) throws Exception {
		session.update(namespace+".itemAmountModify", vo);
	}
}
