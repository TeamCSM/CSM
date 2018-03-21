package com.csm.admin.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.csm.user.domain.UserLogVO;
import com.csm.user.domain.UserVO;



@Repository
public class AdminUserDAOImpl implements AdminUserDAO {
	
	@Inject
	private SqlSession session;

	private static String namespace = "com.csm.mapper.UserMapper";
	
	@Override
	public List<UserVO> userList() {
		
		return session.selectList(namespace+".userList");
	}
	
	
 	@Override
	public UserVO userDetail(String user_id) {

		return session.selectOne(namespace+".userDetail",user_id);
	}
 	
 	
	@Override
	public void deleteuser(UserVO vo) {
		session.delete(namespace+".deleteUser", vo);
	}
	@Override
	public void changeSeller(UserVO vo) {
		session.update(namespace+".changeSeller", vo);
	}
	
	@Override
	public void changeUser(UserVO vo) {
		session.update(namespace +".changeUser", vo);
	}


	@Override
	public List<UserLogVO> reqAuthority() {
		
		return session.selectList(namespace+".reqAuthority");
	}
	
	

}
