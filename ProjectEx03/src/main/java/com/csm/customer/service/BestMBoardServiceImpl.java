package com.csm.customer.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.csm.customer.domain.BestMVO;
import com.csm.customer.domain.BestQVO;
import com.csm.customer.domain.Criteria;
import com.csm.customer.domain.SearchCriteria;
import com.csm.customer.persistence.BestMBoardDAO;
import com.csm.user.domain.UserVO;

@Service
public class BestMBoardServiceImpl implements BestMBoardService{

	@Inject
	private BestMBoardDAO dao;
	
	@Override
	public void regist(BestMVO board) throws Exception {

		dao.create(board);	
	}

	@Override
	public BestMVO read(Integer bno) throws Exception {
		
		return dao.read(bno);
	}

	@Override
	public void modify(BestMVO board) throws Exception {

		dao.update(board);
		
	}
	@Override
	public void answer(BestMVO vo) throws Exception {

		dao.answer(vo);
		
	}
	
	@Override
	public void remove(Integer bno) throws Exception {

		dao.delete(bno);
		
	}

	@Override
	public List<BestMVO> listAll() throws Exception {
		
		return dao.listAll();
	}

	@Override
	public List<BestMVO> listCriteria(Criteria cri) throws Exception {

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
	public List<BestMVO> listSearchCriteria(SearchCriteria cri) throws Exception {

		return dao.listSearch(cri);
	}
}
