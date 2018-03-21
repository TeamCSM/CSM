package com.csm.matching.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.csm.matching.domain.Criteria;
import com.csm.matching.domain.DesignVO;


@Repository
public class DesignDAOImpl implements DesignDAO {
	@Inject
	private SqlSession session;
	
	private static String namespace = "com.csm.mapper.DesignMapper";
	
	@Override
	public void create(DesignVO vo) throws Exception {
		session.insert(namespace +".create", vo);
	}
	
	@Override
	public DesignVO read(Integer idx) throws Exception {
		return session.selectOne(namespace +".read", idx);
	}
	
	@Override
	public void update(DesignVO vo) throws Exception {
		session.update(namespace +".update", vo);
	}
	
	@Override
	public void delete(Integer idx) throws Exception {
		session.delete(namespace +".delete", idx);
	}
	
	@Override
	public List<DesignVO> listAll(Criteria cri) throws Exception {
		return session.selectList(namespace +".listAll", cri);
	}
	
	@Override
	public List<DesignVO> listPage(int page) throws Exception {
		if(page <= 0) {
			page = 1;
		}
		
		page = (page - 1) * 10;
		
		return session.selectList(namespace +".listPage", page);
	}
	
	@Override
	public List<DesignVO> listCriteria(Criteria cri) throws Exception {
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
	public void dUpdate(DesignVO design) throws Exception {
		session.update(namespace +".dUpdate", design);
	}
}
