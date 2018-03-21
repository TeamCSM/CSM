package com.csm.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.csm.admin.persistence.AdminUserDAO;
import com.csm.user.domain.UserLogVO;
import com.csm.user.domain.UserVO;


@Service
public class AdminUserServiceImpl implements AdminUserService {

	@Autowired
	private AdminUserDAO adminUserDao;

	

	@Override
	public List<UserVO> userList() {

		List<UserVO> list = adminUserDao.userList();
		
		List<UserLogVO> logList = adminUserDao.reqAuthority();
		
		for(UserVO temp : list) {
			
			for(UserLogVO tmp : logList) {
				
				if(tmp.getUser_id().equals(temp.getUser_id())) {
					temp.setReqAuthority(1);
				}else {
					temp.setReqAuthority(0);
				}
			}
		}
		
		return list;
	}
					   
	@Override
	public UserVO userDetail(String user_id) {
	
		return adminUserDao.userDetail(user_id);
	}

	@Override
	public void deleteuser(UserVO vo) {
		adminUserDao.deleteuser(vo);
		
	}
	
	@Override
	public void changeSeller(UserVO vo) {
		adminUserDao.changeSeller(vo);
		
	}
	
	@Override
	public void changeUser(UserVO vo) {
		adminUserDao.changeUser(vo);
	}

	

}