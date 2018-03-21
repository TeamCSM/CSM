package com.csm.matching.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.csm.matching.domain.MonthStatisticsVO;
import com.csm.matching.domain.ResumeVO;
import com.csm.matching.domain.StatisticsVO;


@Repository
public class ResumeDAOImpl implements ResumeDAO {
	@Inject
	private SqlSession session;
	
	private static String namespace = "com.csm.mapper.ResumeMapper";
	
	@Override
	public void create(ResumeVO vo) throws Exception {
		session.insert(namespace +".create", vo);
	}
	
	@Override
	public ResumeVO read(Integer uno) throws Exception {
		return session.selectOne(namespace +".read", uno);
	}
	
	@Override
	public List<ResumeVO> listAll(Integer idx) throws Exception {
		return session.selectList(namespace +".listAll", idx);
	}
	
	@Override
	public void status(Integer uno) throws Exception {
		session.update(namespace +".status", uno);
	}
	
	@Override
	public StatisticsVO readResume(String id) throws Exception {
		return session.selectOne(namespace +".readResume", id);
	}
	
	@Override
	public StatisticsVO resumeStatistics(String id) throws Exception {

		return session.selectOne(namespace +".resumeStatistics", id);
	}
	
	@Override
	public void delete(Integer uno) throws Exception {
		
		session.delete(namespace +".delete", uno);
	}
	
	@Override
	public void accept(Integer uno) throws Exception {
		session.update(namespace +".accept", uno);
	}
	
	@Override
	public void matching(ResumeVO vo) throws Exception {
		session.insert("com.csm.mapper.MessageMapper.matching", vo);
	}
	
	@Override
	public MonthStatisticsVO contrastStatistics(String id) throws Exception {
		return session.selectOne(namespace +".contrastStatistics", id);
	}
	
	@Override
	public MonthStatisticsVO contrastReadStatistics(String id) throws Exception {
		return session.selectOne(namespace +".contrastReadStatistics", id);
	}

}
