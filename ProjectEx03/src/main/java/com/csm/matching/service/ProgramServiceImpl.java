package com.csm.matching.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.csm.matching.domain.Criteria;
import com.csm.matching.domain.ProgramVO;
import com.csm.matching.persistence.ProgramDAO;


@Service
public class ProgramServiceImpl implements ProgramService {
	@Inject
	private ProgramDAO dao;
	
	@Override
	public void regist(ProgramVO program) throws Exception {
		dao.create(program);
	}
	
	@Override
	public ProgramVO read(Integer idx) throws Exception {
		dao.updateViewCnt(idx);
		return dao.read(idx);
	}
	
	@Override
	public void modify(ProgramVO program) throws Exception {
		dao.update(program);
	}
	
	@Override
	public void remove(Integer idx) throws Exception {
		dao.delete(idx);
	}
	
	@Override
	public List<ProgramVO> listAll(Criteria cri) throws Exception {
		return dao.listAll(cri);
	}
	
	@Override
	public List<ProgramVO> listCriteria(Criteria cri) throws Exception {
		return dao.listCriteria(cri);
	}
	
	@Override
	public int listCountCriteria(Criteria cri) throws Exception {
		return dao.countPaging(cri);
	}
	
	@Override
	public void update(ProgramVO program) throws Exception {
		dao.pUpdate(program);
	}

}
