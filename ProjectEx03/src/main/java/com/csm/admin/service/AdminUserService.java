package com.csm.admin.service;

import java.util.List;


import com.csm.user.domain.UserVO;

public interface AdminUserService {

	public List<UserVO> userList();

	public UserVO userDetail(String user_id);

	public void deleteuser(UserVO vo);

	public void changeSeller(UserVO vo);

	public void changeUser(UserVO vo);
}
