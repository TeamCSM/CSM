package com.csm.community.service;

import com.csm.community.domain.UserActionVO;

public interface UserActionService {
	
	public void insertAction(String user_id) throws Exception;
	
	public int checkAction(String user_id) throws Exception;
	
	public void insertLike(UserActionVO vo) throws Exception;
	
	public int likeAction(UserActionVO vo) throws Exception;
}
