package com.csm.customer.service;

import java.util.List;   

import com.csm.customer.domain.BestQVO;
import com.csm.customer.domain.Criteria;
import com.csm.customer.domain.SearchCriteria;

public interface BestQBoardService {
	
	public void regist(BestQVO board)throws Exception;
	
	public BestQVO read(Integer bno)throws Exception;
	
	public void modify(BestQVO board)throws Exception;
	
	public void remove(Integer bno)throws Exception;
	
	public List<BestQVO> listAll() throws Exception;
	
	public List<BestQVO> listCriteria(Criteria cri) throws Exception;
	
	public int listCountCriteria(Criteria cri)throws Exception;
	
	public int listSearchCount(SearchCriteria cri)throws Exception;
	
	public List<BestQVO> listSearchCriteria(SearchCriteria cri)throws Exception;
}
