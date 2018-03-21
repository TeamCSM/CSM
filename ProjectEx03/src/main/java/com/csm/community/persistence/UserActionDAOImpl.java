package com.csm.community.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.csm.community.domain.UserActionVO;

@Repository
public class UserActionDAOImpl implements UserActionDAO{
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "com.csm.mapper.userActionMapper";
	
	@Override
	public void insertAction(String user_id) throws Exception{
		session.insert(namespace+".insertAction", user_id);
	}
	
	@Override
	public int checkAction(String user_id) throws Exception{
		return session.selectOne(namespace+".checkAction", user_id);
	}
	
	@Override
	public void insertLike(UserActionVO vo) throws Exception{
		session.selectOne(namespace+".insertLike", vo);
	}
	
	@Override
	public int likeAction(UserActionVO vo) throws Exception{
		return session.selectOne(namespace+".likeAction", vo);
	}
}
