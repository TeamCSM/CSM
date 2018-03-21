package com.csm.customer.service;

import java.util.List;  

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.csm.customer.domain.Criteria;
import com.csm.customer.domain.NoticeVO;
import com.csm.customer.domain.SearchCriteria;
import com.csm.customer.persistence.NoticeBoardDAO;
 
@Service
public class NoticeBoardServiceImpl implements NoticeBoardService{
	
	@Inject
	private NoticeBoardDAO dao;
	
	@Override
	public void regist(NoticeVO board) throws Exception {
		
		dao.create(board);
		
	}

	@Override
	public NoticeVO read(Integer bno) throws Exception {
		System.out.println(bno);
		return dao.read(bno);
	}

	@Override
	public void modify(NoticeVO board) throws Exception {
		
		dao.update(board);
		
	}

	@Override
	public void remove(Integer bno) throws Exception {
		
		dao.delete(bno);
	}

	@Override
	public List<NoticeVO> listAll() throws Exception {
	
		return dao.listAll();
	}

	@Override
	public List<NoticeVO> listCriteria(Criteria cri) throws Exception {
		
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
	public List<NoticeVO> listSearchCriteria(SearchCriteria cri) throws Exception {

		return dao.listSearch(cri);
	}
}
