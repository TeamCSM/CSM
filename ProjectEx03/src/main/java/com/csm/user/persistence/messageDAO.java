package com.csm.user.persistence;

import java.util.List;

import com.csm.user.domain.LoginDTO;
import com.csm.user.domain.messageVO;

public interface messageDAO {
	
	public void create(messageVO vo)throws Exception;
	
	public LoginDTO read(LoginDTO login)throws Exception;
	
	public void update(messageVO vo)throws Exception;
	
	public void delete(Integer messagenum)throws Exception;
	
	public List<messageVO> myMassage(LoginDTO login)throws Exception;

	public List<messageVO> yourMassage(LoginDTO login) throws Exception;

	public int userCheck(messageVO board)throws Exception;

	public messageVO readMessage(Integer messagenum)throws Exception;

	public void receiveReadCheck(int messagenum)throws Exception;

}
