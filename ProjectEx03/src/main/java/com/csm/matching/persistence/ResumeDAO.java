package com.csm.matching.persistence;

import java.util.List;

import com.csm.matching.domain.MonthStatisticsVO;
import com.csm.matching.domain.ResumeVO;
import com.csm.matching.domain.StatisticsVO;


public interface ResumeDAO {
	public void create(ResumeVO vo) throws Exception;
	
	public ResumeVO read(Integer uno) throws Exception;
	
	public List<ResumeVO> listAll(Integer idx) throws Exception;
	
	public void status(Integer uno) throws Exception;
	
	public StatisticsVO readResume(String id) throws Exception;
	
	public StatisticsVO resumeStatistics(String id) throws Exception;
	
	public void delete(Integer uno) throws Exception;
	
	public void accept(Integer uno) throws Exception;
	
	public void matching(ResumeVO vo) throws Exception;
	
	public MonthStatisticsVO contrastStatistics(String id) throws Exception;
	
	public MonthStatisticsVO contrastReadStatistics(String id) throws Exception;
	
}
