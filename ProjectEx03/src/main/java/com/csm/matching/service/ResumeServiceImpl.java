package com.csm.matching.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.csm.matching.domain.MonthStatisticsVO;
import com.csm.matching.domain.ResumeVO;
import com.csm.matching.domain.StatisticsVO;
import com.csm.matching.persistence.ResumeDAO;


@Service
public class ResumeServiceImpl implements ResumeService {
	@Inject
	private ResumeDAO dao;
	
	@Override
	public void resume(ResumeVO resume) throws Exception {
		dao.create(resume);
	}
	
	@Transactional
	@Override
	public ResumeVO read(Integer uno) throws Exception {
		dao.status(uno);
		
		return dao.read(uno);
	}
	
	@Override
	public List<ResumeVO> listAll(Integer idx) throws Exception {

		return dao.listAll(idx);
	}
	
	@Override
	public StatisticsVO readResume(String id) throws Exception {
		
		return dao.readResume(id);
	}
	
	@Override
	public StatisticsVO resumeStatistics(String id) throws Exception {
		
		return dao.resumeStatistics(id);
	}
	
	@Override
	public void delete(Integer uno) throws Exception {
		dao.delete(uno);
	}
	
	@Transactional
	@Override
	public void accept(Integer uno, ResumeVO vo) throws Exception {
		dao.matching(vo);
		dao.accept(uno);
	}
	
	@Override
	public MonthStatisticsVO contrastStatistics(String id) throws Exception {
		return dao.contrastStatistics(id);
	}
	
	@Override
	public MonthStatisticsVO contrastReadStatistics(String id) throws Exception {
		return dao.contrastReadStatistics(id);
	}
	
}
