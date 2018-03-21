package com.csm.community.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.csm.community.domain.PageMake;
import com.csm.community.domain.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO{
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "com.csm.mapper.ReplyMapper";
	
	@Override
	public List<ReplyVO> list(Integer bno) throws Exception{
		
		return session.selectList(namespace+".list", bno);
	}
	
	@Override
	public void create(ReplyVO vo) throws Exception{
		
		session.insert(namespace+".create", vo);
	}
	
	@Override
	public void update(ReplyVO vo) throws Exception{
		
		session.update(namespace+".update", vo);
	}
	
	@Override
	public void delete(Integer rno) throws Exception{
		
		session.delete(namespace+".delete", rno);
	}
	
	@Override
	public List<ReplyVO> listPage(ReplyVO vo, PageMake pm) throws Exception{

		Map<String, Object> paramMap = new HashMap<>();
		
		paramMap.put("vo", vo);
		paramMap.put("pm", pm);
		
		return session.selectList(namespace+".listPage", paramMap);
	}
	
	@Override
	public int count(Integer bno) throws Exception{
		
		return session.selectOne(namespace+".count", bno);
	}
	
	@Override
	public int getBno(Integer rno) throws Exception{
		
		return session.selectOne(namespace+".getBno", rno);
	}
	
	@Override
	public void answerReply(ReplyVO vo) throws Exception{
		
		session.update(namespace+".answerReply", vo);
	}
	
	@Override
	public void answerRegist(ReplyVO vo) throws Exception{
		
		session.insert(namespace+".answerRegist", vo);
	}
}

