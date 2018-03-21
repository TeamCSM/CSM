package com.csm.user.persistence;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.csm.market.domain.InquiryVO;
import com.csm.market.domain.ReviewVO;
import com.csm.market.domain.SellItemLogVO;
import com.csm.matching.domain.StatisticsVO;
import com.csm.user.domain.LoginDTO;
import com.csm.user.domain.UserLogVO;
import com.csm.user.domain.UserVO;

@Repository
public class UserDAOImpl implements UserDAO{

	@Inject
	private SqlSession session;

	private static String namespace = "com.csm.mapper.UserMapper";

	@Override
	public void createBase(UserVO vo) throws Exception {

		session.insert(namespace+".createBase", vo);
	}

	@Override
	public LoginDTO login(LoginDTO dto) throws Exception {

		return session.selectOne(namespace+".login", dto);
	}

	@Override
	public void keepLogin(String user_id, String sessionId, Date next) throws Exception {

		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("user_id", user_id);
		paramMap.put("sessionId", sessionId);
		paramMap.put("next", next);

		session.update(namespace+".keepLogin", paramMap);
	}

	@Override
	public LoginDTO checkUserWithSessionKey(String value) throws Exception {

		return session.selectOne(namespace+".checkUserWithSessionKey",value);
	}

	@Override
	public UserVO idEmailFind(UserVO vo) throws Exception {
		return session.selectOne(namespace+".idEmailFind", vo);
	}

	@Override
	public UserVO birthdayFind(UserVO vo) throws Exception {
		return session.selectOne(namespace+".birthdayFind", vo);
	}

	@Override
	public UserVO realIdEmailFind(UserVO vo) throws Exception {
		return session.selectOne(namespace+".realIdEmailFind", vo);
	}

	@Override
	public UserVO realIdbirthdayFind(UserVO vo) throws Exception {
		return session.selectOne(namespace+".realIdbirthdayFind", vo);
	}

	@Override
	public UserVO passFindConfirm(UserVO vo) throws Exception {
		return session.selectOne(namespace+".passFindConfirm", vo);
	}

	@Override
	public int newPassSave(UserVO vo) throws Exception {		
		return session.update(namespace+".newPassSave", vo);
	}

	@Override
	public int usePassConfirm(UserVO vo) throws Exception {
		return session.selectOne(namespace+".usePassConfirm", vo);
	}

	@Override
	public UserVO userInfo(String user_id) throws Exception {
		return session.selectOne(namespace +".userInfo", user_id);
	}
	@Override
	public void modify(UserVO vo) throws Exception {
		session.update(namespace +".modify", vo);
	}

	@Override
	public UserVO passwordCheck(UserVO vo) throws Exception {
		return session.selectOne(namespace +".passwordCheck", vo);
	}

	@Override
	public void passModify(UserVO vo) throws Exception {
		session.update(namespace +".passModify", vo);
	}

	@Override
	public void delete(String user_id) throws Exception {
		session.delete(namespace +".delete", user_id);
	}

	@Override
	public void pointPayment(UserVO vo) throws Exception {
		session.update(namespace +".pointPayment", vo);
	}

	@Override
	public void pointWithdraw(UserVO vo) throws Exception {
		session.update(namespace +".pointWithdraw", vo);
	}
	
	@Override
	public StatisticsVO sellStatistics(String item_sellerId) throws Exception {
		return session.selectOne(namespace +".sellStatistics", item_sellerId);
	}
	
	@Override
	public StatisticsVO priceStatistics(String item_sellerId) throws Exception {
		return session.selectOne(namespace +".priceStatistics", item_sellerId);
	}
	
	@Override
	public List<SellItemLogVO> buyList(String user_id) throws Exception {
		return session.selectList(namespace +".buyList", user_id);
	}
	
	@Override
	public List<InquiryVO> itemInquiry(String user_id) throws Exception {
		return session.selectList(namespace +".itemInquiry", user_id);
	}
	
	@Override
	public List<ReviewVO> itemReview(String user_id) throws Exception {
		return session.selectList(namespace +".itemReview", user_id);
	}
	
	@Override
	public void logInsert(UserLogVO vo) throws Exception {
		session.insert(namespace+".logInsert", vo);
	}
	@Override
	public UserLogVO messageCheck(String user_id) throws Exception {
		return session.selectOne(namespace +".messageCheck", user_id);
	}
}
