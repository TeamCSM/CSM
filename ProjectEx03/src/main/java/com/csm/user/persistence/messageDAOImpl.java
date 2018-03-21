package com.csm.user.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.csm.user.domain.LoginDTO;
import com.csm.user.domain.messageVO;

@Repository
public class messageDAOImpl implements messageDAO{

	@Inject
	private SqlSession session;
	
	private static String namespace = "com.csm.mapper.MessageMapper";
	
	@Override
	public void create(messageVO vo) throws Exception {
	
		session.insert(namespace+".create",vo);
	}
	
	@Override
	public LoginDTO read(LoginDTO login) throws Exception {
		
		return session.selectOne(namespace +".read", login);
	}

	@Override
	public void update(messageVO vo) throws Exception {
		
		session.update(namespace + ".update", vo);
	}

	@Override
	public void delete(Integer messagenum) throws Exception {
		
		session.delete(namespace +".delete",messagenum);
	}

	@Override
	public List<messageVO> myMassage(LoginDTO login) throws Exception {
		
		return session.selectList(namespace + ".myMessage", login);
	}

	@Override
	public List<messageVO> yourMassage(LoginDTO login) throws Exception {
		
		return session.selectList(namespace + ".yourMessage", login);
	}

	@Override
	public int userCheck(messageVO board) throws Exception {
		
		return session.selectOne(namespace + ".userCheck", board);
	}

	@Override
	public messageVO readMessage(Integer messagenum) throws Exception {
		
		return session.selectOne(namespace +".readMessage", messagenum);
	}
	
	@Override
	public void receiveReadCheck(int messagenum) throws Exception {

		session.insert(namespace + ".receiveReadCheck", messagenum);	
	}

}
