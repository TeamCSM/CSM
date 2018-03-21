package com.csm.customer.persistence;

import java.util.List; 

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.csm.customer.domain.Criteria;
import com.csm.customer.domain.NoticeVO;
import com.csm.customer.domain.SearchCriteria;
import java.util.Calendar;//Calendar class importing... 

@Repository
public class NoticeBoardDAOImpl implements NoticeBoardDAO{

	@Inject
	private SqlSession session;
	//틀릴 수 있으니 네임스페이스는 동일하게 복사하여 붙여주자 xml에
	private static String namespace = "com.csm.mapper.NoticeBoardMapper";
	
	@Override
	public void create(NoticeVO vo) throws Exception {
		
		session.insert(namespace+".create",vo);
	}

	@Override
	public NoticeVO read(Integer bno) throws Exception {
		
		return session.selectOne(namespace +".read",bno);
	}

	@Override
	public void update(NoticeVO vo) throws Exception {
		
		session.update(namespace + ".update", vo);
	}

	@Override
	public void delete(Integer bno) throws Exception {
		
		session.delete(namespace +".delete",bno);
	}

	@Override
	public List<NoticeVO> listAll() throws Exception {
		
		return session.selectList(namespace+".listAll");
	}
	@Override
	public List<NoticeVO> listPage(int page) throws Exception {
		
		if(page <=0) {
			page = 1;
		}
		
		page = (page -1) * 10;
		
		return session.selectList(namespace +".listPage", page);
	}

	@Override
	public List<NoticeVO> listCriteria(Criteria cri) throws Exception {
		
		return session.selectList(namespace+".listCriteria", cri);
	}

	@Override
	public int countPaging(Criteria cri) throws Exception {
		
		return session.selectOne(namespace+".countPaging",cri);
	}

	@Override
	public int listCountCriteria(Criteria cri) throws Exception {
		
		return session.selectOne(namespace+".countPaging", cri);
	}

	@Override
	public List<NoticeVO> listSearch(SearchCriteria cri) throws Exception {
		
		return session.selectList(namespace+ ".listSearch", cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		
		return session.selectOne(namespace+ ".listSearchCount", cri);
		

		
	}
}
