package com.csm.customer.persistence;

import java.util.List;


import com.csm.customer.domain.Criteria;
import com.csm.customer.domain.QnaVO;
import com.csm.customer.domain.SearchCriteria;

public interface QnaBoardDAO {
	
	public void create(QnaVO vo)throws Exception;
	
	public QnaVO read(Integer bno)throws Exception;
	
	public void update(QnaVO vo)throws Exception;
	
	public void delete(Integer bno)throws Exception;
	
	public List<QnaVO> listAll()throws Exception;
	
	public List<QnaVO> listPage(int page)throws Exception;
	
	public List<QnaVO> listCriteria(Criteria cri)throws Exception;

	public int countPaging(Criteria cri) throws Exception;
	
	public List<QnaVO> listSearch(SearchCriteria cri)throws Exception;
	
	public int listSearchCount(SearchCriteria cri)throws Exception;
	
	public int listSearchCount2(SearchCriteria cri)throws Exception;
}
