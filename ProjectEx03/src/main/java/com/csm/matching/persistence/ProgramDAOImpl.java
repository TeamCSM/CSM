package com.csm.matching.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.csm.matching.domain.Criteria;
import com.csm.matching.domain.ProgramVO;


@Repository
public class ProgramDAOImpl implements ProgramDAO {
	@Inject
	private SqlSession session;
	
	private static String namespace = "com.csm.mapper.ProgramMapper";
	
	@Override
	public void create(ProgramVO vo) throws Exception {
		session.insert(namespace +".create", vo);
	}
	
	@Override
	public ProgramVO read(Integer idx) throws Exception {
		return session.selectOne(namespace +".read", idx);
	}
	
	@Override
	public void update(ProgramVO vo) throws Exception {
		session.update(namespace +".update", vo);
	}
	
	@Override
	public void delete(Integer idx) throws Exception {
		session.delete(namespace +".delete", idx);
	}
	
	@Override
	public List<ProgramVO> listAll(Criteria cri) throws Exception {
		return session.selectList(namespace +".listAll", cri);
	}
	
	@Override
	public List<ProgramVO> listPage(int page) throws Exception {
		if(page <= 0) {
			page = 1;
		}
		
		page = (page - 1) * 10;
		
		return session.selectList(namespace +".listPage", page);
	}
	
	@Override
	public List<ProgramVO> listCriteria(Criteria cri) throws Exception {
		return session.selectList(namespace +".listCriteria", cri);
	}
	
	@Override
	public int countPaging(Criteria cri) throws Exception {
		return session.selectOne(namespace +".countPaging", cri);
	}
	
	@Override
	public void updateViewCnt(Integer idx) throws Exception {
		session.update(namespace +".updateViewCnt", idx);
	}
	
	@Override
	public void pUpdate(ProgramVO program) throws Exception {
		session.update(namespace +".pUpdate", program);
	}
	

}
