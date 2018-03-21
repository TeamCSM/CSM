package com.csm.community.persistence;

import com.csm.community.domain.UserActionVO;

public interface UserActionDAO {
	
	public void insertAction(String user_id) throws Exception;
	
	public int checkAction(String user_id) throws Exception;
	
	public void insertLike(UserActionVO vo) throws Exception;
	
	public int likeAction(UserActionVO vo) throws Exception;
}
