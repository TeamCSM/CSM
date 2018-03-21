package com.csm.matching.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.csm.matching.domain.Criteria;
import com.csm.matching.domain.DesignVO;
import com.csm.matching.persistence.DesignDAO;


@Service
public class DesignServiceImpl implements DesignService {
	
	@Inject
	private DesignDAO dao;
	
	@Override
	public void regist(DesignVO design) throws Exception {
		dao.create(design);
	}
	
	@Override
	public DesignVO read(Integer idx) throws Exception {
		dao.updateViewCnt(idx);
		return dao.read(idx);
	}
	
	@Override
	public void modify(DesignVO design) throws Exception {
		dao.update(design);
	}
	
	@Override
	public void remove(Integer idx) throws Exception {
		dao.delete(idx);
	}
	
	@Override
	public List<DesignVO> listAll(Criteria cri) throws Exception {
		return dao.listAll(cri);
	}
	
	@Override
	public List<DesignVO> listCriteria(Criteria cri) throws Exception {
		return dao.listCriteria(cri);
	}
	
	@Override
	public int listCountCriteria(Criteria cri) throws Exception {
		return dao.countPaging(cri);
	}
	
	@Override
	public void update(DesignVO design) throws Exception {
		dao.dUpdate(design);
	}
}
