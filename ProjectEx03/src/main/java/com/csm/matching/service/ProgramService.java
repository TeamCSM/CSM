package com.csm.matching.service;

import java.util.List;

import com.csm.matching.domain.Criteria;
import com.csm.matching.domain.ProgramVO;


public interface ProgramService {
	public void regist(ProgramVO program) throws Exception;
	
	public ProgramVO read(Integer idx) throws Exception;
	
	public void modify(ProgramVO program) throws Exception;
	
	public void remove(Integer idx) throws Exception;
	
	public List<ProgramVO> listAll(Criteria cri) throws Exception;
	
	public List<ProgramVO> listCriteria(Criteria cri) throws Exception;
	
	public int listCountCriteria(Criteria cri) throws Exception;
	
	public void update(ProgramVO program) throws Exception;

}
