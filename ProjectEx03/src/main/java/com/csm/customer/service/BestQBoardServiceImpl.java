package com.csm.customer.service;

import java.util.List; 

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.csm.customer.domain.BestQVO;
import com.csm.customer.domain.Criteria;
import com.csm.customer.domain.NoticeVO;
import com.csm.customer.domain.SearchCriteria;
import com.csm.customer.persistence.BestQBoardDAO;

@Service
public class BestQBoardServiceImpl implements BestQBoardService{

	@Inject
	private BestQBoardDAO dao;
	
	@Override
	public void regist(BestQVO board) throws Exception {
		
		dao.create(board);
	}

	@Override
	public BestQVO read(Integer bno) throws Exception {
	
		return dao.read(bno);
	}

	@Override
	public void modify(BestQVO board) throws Exception {
		
		dao.update(board);
	}

	@Override
	public void remove(Integer bno) throws Exception {
		
		dao.delete(bno);
	}

	@Override
	public List<BestQVO> listAll() throws Exception {
		
		return dao.listAll();
	}

	@Override
	public List<BestQVO> listCriteria(Criteria cri) throws Exception {
		
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
	public List<BestQVO> listSearchCriteria(SearchCriteria cri) throws Exception {
		
		return dao.listSearch(cri);
	}


}
