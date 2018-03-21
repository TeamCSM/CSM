package com.csm.customer.persistence;

import java.util.List; 

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.csm.customer.domain.BestQVO;
import com.csm.customer.domain.Criteria;
import com.csm.customer.domain.NoticeVO;
import com.csm.customer.domain.SearchCriteria;

@Repository
public class BestQBoardDAOImpl implements BestQBoardDAO{

	@Inject
	private SqlSession session;
	
	private static String namespace
		="com.csm.mapper.BestQBoardMapper";
	
	@Override
	public void create(BestQVO vo) throws Exception {
		session.insert(namespace+ ".create", vo);
	}

	@Override
	public BestQVO read(Integer bno) throws Exception {
		
		return session.selectOne(namespace +".read",bno);
	}

	@Override
	public void update(BestQVO vo) throws Exception {
		
		session.update(namespace+".update",vo);
	}

	@Override
	public void delete(Integer bno) throws Exception {
		
		session.delete(namespace+".delete", bno);
	}

	@Override
	public List<BestQVO> listAll() throws Exception {
		
		return session.selectList(namespace+ ".listAll"); 
	}

	@Override
	public List<BestQVO> listPage(int page) throws Exception {
		if(page <=0) {
			page = 1;
		}
		
		page = (page -1) * 10;
		
		return session.selectList(namespace + ".listPage", page);
	}

	@Override
	public List<BestQVO> listCriteria(Criteria cri) throws Exception {
		
		return session.selectList(namespace+".listCriteria", cri);
	}

	@Override
	public int countPaging(Criteria cri) throws Exception {
		
		return session.selectOne(namespace+".countPaging",cri);
	}
	@Override
	public List<BestQVO> listSearch(SearchCriteria cri) throws Exception {
		
		return session.selectList(namespace+ ".listSearch", cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		
		return session.selectOne(namespace+ ".listSearchCount", cri);
	}

}
