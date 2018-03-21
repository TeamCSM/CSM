package com.csm.admin.persistence;

import java.util.List;

import com.csm.user.domain.UserLogVO;
import com.csm.user.domain.UserVO;

public interface AdminUserDAO {
	
	/*public List<AdminUserVO> userListAll();*/
	
	public List<UserVO> userList();

	
 	public UserVO userDetail(String user_id);

	public void deleteuser(UserVO vo);
	
	public void changeSeller(UserVO vo);
	
	public void changeUser(UserVO vo);
	
	public List<UserLogVO> reqAuthority();
	
/*
	public int userDropOut(int user_number);

	public int userListCnt(AdminUserVO uvo);
	
	통계-일반회원
	public int userStatisticeY(AdminUserVO uvo);
	통계-탈퇴회원
	public int userStatisticeN(AdminUserVO uvo);
*/
}
