package com.csm.customer.persistence;

import java.util.List;

import com.csm.customer.domain.BestQVO;
import com.csm.customer.domain.Criteria;
import com.csm.customer.domain.NoticeVO;
import com.csm.customer.domain.SearchCriteria;

public interface BestQBoardDAO {
	public void create(BestQVO vo)throws Exception;
	
	public BestQVO read(Integer bno)throws Exception;
	
	public void update(BestQVO vo)throws Exception;
	
	public void delete(Integer bno)throws Exception;
	
	public List<BestQVO> listAll()throws Exception;
	
	public List<BestQVO> listPage(int page)throws Exception;
	
	public List<BestQVO> listCriteria(Criteria cri)throws Exception;
	
	public int countPaging(Criteria cri)throws Exception;
	
	public List<BestQVO> listSearch(SearchCriteria cri)throws Exception;
	
	public int listSearchCount(SearchCriteria cri)throws Exception;
}
