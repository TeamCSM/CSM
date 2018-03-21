package com.csm.customer.persistence;

import java.util.List;

import com.csm.customer.domain.Criteria;
import com.csm.customer.domain.ContactVO;
import com.csm.customer.domain.SearchCriteria;

public interface ContactBoardDAO {
	
	public void create(ContactVO vo)throws Exception;
	
	public ContactVO read(Integer bno)throws Exception;
	
	public void update(ContactVO vo)throws Exception;
	
	public void delete(Integer bno)throws Exception;
	
	public List<ContactVO> listAll()throws Exception;
	
	public List<ContactVO> listPage(int page)throws Exception;
	
	public List<ContactVO> listCriteria(Criteria cri)throws Exception;

	public int countPaging(Criteria cri) throws Exception;
	
	public List<ContactVO> listSearch(SearchCriteria cri)throws Exception;
	
	public int listSearchCount(SearchCriteria cri)throws Exception;
}
