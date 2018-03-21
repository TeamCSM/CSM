package com.csm.customer.persistence;

import java.util.List; 

import com.csm.customer.domain.BestMVO;
import com.csm.customer.domain.BestQVO;
import com.csm.customer.domain.Criteria;
import com.csm.customer.domain.SearchCriteria;
import com.csm.user.domain.UserVO;

public interface BestMBoardDAO {
	
	public void create(BestMVO vo)throws Exception;
	
	public BestMVO read(Integer bno)throws Exception;
	
	public void update(BestMVO vo)throws Exception;
	
	public void answer(BestMVO vo)throws Exception;

	public void delete(Integer bno)throws Exception;
	
	public List<BestMVO> listAll()throws Exception;
	
	public List<BestMVO> listPage(int page)throws Exception;
	
	public List<BestMVO> listCriteria(Criteria cri)throws Exception;
	
	public int countPaging(Criteria cri)throws Exception;
	
	public List<BestMVO> listSearch(SearchCriteria cri)throws Exception;
	
	public int listSearchCount(SearchCriteria cri)throws Exception;
}
