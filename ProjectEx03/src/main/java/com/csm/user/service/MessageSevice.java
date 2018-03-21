package com.csm.user.service;

import java.util.List;

import com.csm.user.domain.LoginDTO;
import com.csm.user.domain.messageVO;

public interface MessageSevice {
	
	public void regist(messageVO board)throws Exception;
	
	public LoginDTO read(LoginDTO login)throws Exception;
	
	public void modify(messageVO board)throws Exception;
	
	public void remove(Integer messagenum)throws Exception;

	public List<messageVO> myMassage(LoginDTO login) throws Exception;

	public List<messageVO> yourMassge(LoginDTO login) throws Exception;

	public int userCheck(messageVO board) throws Exception;

	public messageVO readMessage(Integer messagenum)throws Exception;

	public void readCheck(int messagenum, String type)throws Exception;
}
