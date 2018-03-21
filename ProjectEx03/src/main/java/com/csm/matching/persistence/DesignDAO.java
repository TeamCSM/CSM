package com.csm.matching.persistence;

import java.util.List;

import com.csm.matching.domain.Criteria;
import com.csm.matching.domain.DesignVO;


public interface DesignDAO {
	public void create(DesignVO vo) throws Exception;
	
	public DesignVO read(Integer idx) throws Exception;
	
	public void update(DesignVO vo) throws Exception;
	
	public void delete(Integer idx) throws Exception;
	
	public List<DesignVO> listAll(Criteria cri) throws Exception;
	
	public List<DesignVO> listPage(int page) throws Exception;
	
	public List<DesignVO> listCriteria(Criteria cri) throws Exception;
	
	public int countPaging(Criteria cri) throws Exception;
	
	public void updateViewCnt(Integer idx) throws Exception;
	
	public void dUpdate(DesignVO design) throws Exception;
}
