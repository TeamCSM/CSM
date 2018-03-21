package com.csm.customer.service;

import java.util.List;

import com.csm.customer.domain.Criteria;
import com.csm.customer.domain.ContactVO;
import com.csm.customer.domain.SearchCriteria;

public interface ContactBoardService {
	
	public void regist(ContactVO vo)throws Exception;
	
	public ContactVO read(Integer bno)throws Exception;
	
	public void modify(ContactVO board)throws Exception;
	
	public void remove(Integer bno)throws Exception;
	
	public List<ContactVO> listAll()throws Exception;
	
	public List<ContactVO> listCriteria(Criteria cri)throws Exception;
	
	public int listCountCriteria(Criteria cri)throws Exception;
	
	public int listSearchCount(SearchCriteria cri)throws Exception;
	
	public List<ContactVO> listSearchCriteria(SearchCriteria cri)throws Exception;
}
