package com.csm.community.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.csm.community.domain.UserActionVO;
import com.csm.community.persistence.UserActionDAO;

@Service
public class UserActionServiceImpl implements UserActionService{
	
	@Inject
	private UserActionDAO dao;
	
	@Override
	public void insertAction(String user_id) throws Exception{
		dao.insertAction(user_id);
	}
	
	@Override
	public int checkAction(String user_id) throws Exception{
		return dao.checkAction(user_id);
	}
	
	@Override
	public void insertLike(UserActionVO vo) throws Exception{
		dao.insertLike(vo);
	}
	
	@Override
	public int likeAction(UserActionVO vo) throws Exception{
		return dao.likeAction(vo);
	}
}
