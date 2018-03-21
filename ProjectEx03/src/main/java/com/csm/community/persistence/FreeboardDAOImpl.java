package com.csm.community.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.csm.community.domain.FreeboardVO;
import com.csm.community.domain.PageMake;
import com.csm.community.domain.UnderPage;

@Repository
public class FreeboardDAOImpl implements FreeboardDAO{
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "com.csm.mapper.FreeboardMapper";
	
	@Override
	public void create(FreeboardVO vo) throws Exception{
		session.insert(namespace+".create",vo);
	}
	
	@Override
	public FreeboardVO read(Integer bno) throws Exception{
		return session.selectOne(namespace+".read",bno);
	}
	
	@Override
	public void update(FreeboardVO vo) throws Exception{
		session.update(namespace+".update",vo);
	}
	
	@Override
	public void delete(Integer bno) throws Exception{
		session.delete(namespace+".delete",bno);
	}
	
	@Override
	public List<FreeboardVO> listPage(PageMake pm) throws Exception{
	
		return session.selectList(namespace+".listPage", pm);
		
	}

	@Override
	public int listCountPaging(PageMake pm) throws Exception {
		
		return session.selectOne(namespace+".listCountPaging", pm);
	}
	
	@Override
	public void UpdateViewCount(Integer bno) throws Exception{
		
		session.update(namespace+".UpdateViewCount", bno);
	}
	
	@Override
	public void UpdateReplyCount(Integer bno) throws Exception{
		
		session.update(namespace+".UpdateReplyCount", bno);
	}
	
	@Override
	public List<String> SelectIp() throws Exception{
		return session.selectList(namespace+".SelectIp");
	}
	
	@Override
	public int IpCount(String ip) throws Exception{
		return session.selectOne(namespace+".IpCount", ip);
	}

}
