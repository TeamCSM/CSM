package com.csm.customer.service;

import java.util.List;

import com.csm.customer.domain.Criteria;
import com.csm.customer.domain.QnaVO;
import com.csm.customer.domain.SearchCriteria;

public interface QnaBoardService {
	
	public void regist(QnaVO vo)throws Exception;
	
	public QnaVO read(Integer bno)throws Exception;
	
	public void modify(QnaVO board)throws Exception;
	
	public void remove(Integer bno)throws Exception;
	
	public List<QnaVO> listAll()throws Exception;
	
	public List<QnaVO> listCriteria(Criteria cri)throws Exception;
	
	public int listCountCriteria(Criteria cri)throws Exception;
	
	public int listSearchCount(SearchCriteria cri)throws Exception;
	
	public List<QnaVO> listSearchCriteria(SearchCriteria cri)throws Exception;
}
