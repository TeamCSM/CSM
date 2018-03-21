package com.csm.customer.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.csm.customer.domain.ContactVO;
import com.csm.customer.domain.Criteria;
import com.csm.customer.domain.SearchCriteria;
import com.csm.customer.persistence.ContactBoardDAO;

@Service
public class ContactBoardServiceImpl implements ContactBoardService{
	
	@Inject
	private ContactBoardDAO dao;
	@Override
	public void regist(ContactVO board) throws Exception {
		
		dao.create(board);
	}

	@Override
	public ContactVO read(Integer bno) throws Exception {
		
		return dao.read(bno);
	}

	@Override
	public void modify(ContactVO board) throws Exception {
		
		dao.update(board);
	}

	@Override
	public void remove(Integer bno) throws Exception {
		
		dao.delete(bno);
	}

	@Override
	public List<ContactVO> listAll() throws Exception {
		
		return dao.listAll();
	}
	
	@Override
	public List<ContactVO> listCriteria(Criteria cri) throws Exception {
		
		return dao.listCriteria(cri);
	}

	@Override
	public int listCountCriteria(Criteria cri) throws Exception {
		
		return dao.countPaging(cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		
		return dao.listSearchCount(cri);
	}

	@Override
	public List<ContactVO> listSearchCriteria(SearchCriteria cri) throws Exception {

		return dao.listSearch(cri);
	}

	
}
