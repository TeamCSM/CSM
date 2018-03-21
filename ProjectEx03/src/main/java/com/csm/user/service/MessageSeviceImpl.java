package com.csm.user.service;

import java.util.List; 

import javax.inject.Inject;

import org.springframework.stereotype.Service;


import com.csm.user.domain.LoginDTO;
import com.csm.user.domain.messageVO;
import com.csm.user.persistence.messageDAO;

@Service
public class MessageSeviceImpl implements MessageSevice{
	
	@Inject
	private messageDAO dao;
	
	@Override
	public void regist(messageVO board) throws Exception {
		
		dao.create(board);
	}

	@Override
	public LoginDTO read(LoginDTO login) throws Exception {
		return dao.read(login);
	}

	@Override
	public void modify(messageVO board) throws Exception {
		
		dao.update(board);
	}

	@Override
	public void remove(Integer messagenum) throws Exception {
		
		dao.delete(messagenum);
	}

	@Override
	public List<messageVO> myMassage(LoginDTO login) throws Exception {
		
		return dao.myMassage(login);
	}

	@Override
	public List<messageVO> yourMassge(LoginDTO login) throws Exception {
		
		return dao.yourMassage(login);
	}
	
	@Override
	public int userCheck(messageVO board) throws Exception {
		
		return dao.userCheck(board);
	}

	@Override
	public messageVO readMessage(Integer messagenum) throws Exception {
		
		return dao.readMessage(messagenum);
	}

	@Override
	public void readCheck(int messagenum, String type) throws Exception {
		
		if(type.equals("receive")) {
			dao.receiveReadCheck(messagenum);
		}
	}

}
