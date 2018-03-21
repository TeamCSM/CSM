package com.csm.customer.service;

import java.util.List;

import com.csm.customer.domain.BestMVO;
import com.csm.customer.domain.BestQVO;
import com.csm.customer.domain.Criteria;
import com.csm.customer.domain.SearchCriteria;
import com.csm.user.domain.UserVO;

public interface BestMBoardService {
	
	public void regist(BestMVO board)throws Exception;
	
	public BestMVO read(Integer bno)throws Exception;
	
	public void modify(BestMVO board)throws Exception;
	
	public void answer(BestMVO vo)throws Exception;
	
	public void remove(Integer bno)throws Exception;
	
	public List<BestMVO> listAll() throws Exception;
	
	public List<BestMVO> listCriteria(Criteria cri) throws Exception;
	
	public int listCountCriteria(Criteria cri)throws Exception;
	
	public int listSearchCount(SearchCriteria cri)throws Exception;
	
	public List<BestMVO> listSearchCriteria(SearchCriteria cri)throws Exception;
}
