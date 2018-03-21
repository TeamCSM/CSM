package com.csm.customer.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Controller;

import com.csm.customer.domain.BestMVO;
import com.csm.customer.domain.BestQVO;
import com.csm.customer.domain.Criteria;
import com.csm.customer.domain.SearchCriteria;

@Controller
public class BestMBoardDAOImpl implements BestMBoardDAO{

	@Inject
	private SqlSession session;
	
	private static String namespace = "com.csm.mapper.BestMBoardMapper";
	
	@Override
	public void create(BestMVO vo) throws Exception {

		session.insert(namespace+".create",vo);
	}
	
	@Override
	public BestMVO read(Integer bno) throws Exception {
		
		return session.selectOne(namespace + ".read" ,bno);
	}

	@Override
	public void update(BestMVO vo) throws Exception {

		session.update(namespace + ".update", vo);
		
	}
	
	@Override
	public void answer(BestMVO vo) throws Exception {

		session.update(namespace + ".answer", vo);
		
	}

	@Override
	public void delete(Integer bno) throws Exception {

		session.delete(namespace +".delete",bno);
		
	}

	@Override
	public List<BestMVO> listAll() throws Exception {
		
		return session.selectList(namespace+".listAll");
	}

	@Override
	public List<BestMVO> listPage(int page) throws Exception {

		if(page <=0) {
			page = 1;
		}
		
		page = (page -1) * 10;
		
		return session.selectList(namespace + ".listPage", page);
	}

	@Override
	public List<BestMVO> listCriteria(Criteria cri) throws Exception {

		return session.selectList(namespace+".listCriteria", cri);
	}

	@Override
	public int countPaging(Criteria cri) throws Exception {

		return session.selectOne(namespace+".countPaging",cri);
	}

	@Override
	public List<BestMVO> listSearch(SearchCriteria cri) throws Exception {

		return session.selectList(namespace+ ".listSearch", cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		
		return session.selectOne(namespace+ ".listSearchCount", cri);
	}

}
