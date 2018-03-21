package com.csm.customer.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.csm.customer.domain.Criteria;
import com.csm.customer.domain.QnaVO;
import com.csm.customer.domain.SearchCriteria;

@Service
public class QnaBoardDAOImpl implements QnaBoardDAO{
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "com.csm.mapper.QnaBoardMapper";
	
	@Override
	public void create(QnaVO vo) throws Exception {
		
		session.insert(namespace+".create", vo);
	}

	@Override
	public QnaVO read(Integer bno) throws Exception {
		
		return session.selectOne(namespace +".read",bno);

	}

	@Override
	public void update(QnaVO vo) throws Exception {

		session.update(namespace + ".update", vo);
	}

	@Override
	public void delete(Integer bno) throws Exception {

		session.delete(namespace +".delete",bno);
	}

	@Override
	public List<QnaVO> listAll() throws Exception {
		
		return session.selectList(namespace+".listAll");
	}

	@Override
	public List<QnaVO> listPage(int page) throws Exception {
		if(page <=0) {
			page = 1;
		}
		
		page = (page -1) * 10;
		
		return session.selectList(namespace + ".listPage", page);
	}

	@Override
	public List<QnaVO> listCriteria(Criteria cri) throws Exception {
		
		return session.selectList(namespace+ ".listCriteria", cri);
	}
	@Override
	public int countPaging(Criteria cri) throws Exception {
		
		return session.selectOne(namespace+".countPaging",cri);
	}

	@Override
	public List<QnaVO> listSearch(SearchCriteria cri) throws Exception {
		
		return session.selectList(namespace+ ".listSearch", cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {

		return session.selectOne(namespace+ ".listSearchCount", cri);
	}

	@Override
	public int listSearchCount2(SearchCriteria cri) throws Exception {
		
		return session.selectOne(namespace+ ".listSearchCount2", cri);
	}

}
