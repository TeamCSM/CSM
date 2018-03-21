package com.csm.matching.persistence;

import java.util.List;

import com.csm.matching.domain.Criteria;
import com.csm.matching.domain.ProgramVO;


public interface ProgramDAO {
	public void create(ProgramVO vo) throws Exception;
	
	public ProgramVO read(Integer idx) throws Exception;
	
	public void update(ProgramVO vo) throws Exception;
	
	public void delete(Integer idx) throws Exception;
	
	public List<ProgramVO> listAll(Criteria cri) throws Exception;
	
	public List<ProgramVO> listPage(int page) throws Exception;
	
	public List<ProgramVO> listCriteria(Criteria cri) throws Exception;
	
	public int countPaging(Criteria cri) throws Exception;
	
	public void updateViewCnt(Integer idx) throws Exception;
	
	public void pUpdate(ProgramVO program) throws Exception;
}
