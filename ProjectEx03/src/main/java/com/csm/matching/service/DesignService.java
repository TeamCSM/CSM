package com.csm.matching.service;

import java.util.List;

import com.csm.matching.domain.Criteria;
import com.csm.matching.domain.DesignVO;


public interface DesignService {
	public void regist(DesignVO design) throws Exception;
	
	public DesignVO read(Integer idx) throws Exception;
	
	public void modify(DesignVO design) throws Exception;
	
	public void remove(Integer idx) throws Exception;
	
	public List<DesignVO> listAll(Criteria cri) throws Exception;
	
	public List<DesignVO> listCriteria(Criteria cri) throws Exception;
	
	public int listCountCriteria(Criteria cri) throws Exception;
	
	public void update(DesignVO design) throws Exception;
}
