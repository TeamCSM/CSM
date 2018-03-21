package com.csm.user.service;

import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.csm.market.domain.InquiryVO;
import com.csm.market.domain.ReviewVO;
import com.csm.market.domain.SellItemLogVO;
import com.csm.matching.domain.StatisticsVO;
import com.csm.user.domain.LoginDTO;
import com.csm.user.domain.UserLogVO;
import com.csm.user.domain.UserVO;
import com.csm.user.persistence.UserDAO;

@Service
public class UserServiceImpl implements UserService{

	@Inject
	private UserDAO dao;
	
	@Override
	public void sineUpBase(UserVO vo) throws Exception {
		dao.createBase(vo);
	}

	@Override
	public LoginDTO login(LoginDTO dto) throws Exception {
		
		return dao.login(dto);
	}

	@Override
	public void keepLogin(String user_id, String sessionId, Date next) throws Exception {
		dao.keepLogin(user_id, sessionId, next);
	}

	@Override
	public LoginDTO checkLoginBefore(String value) throws Exception {
		return dao.checkUserWithSessionKey(value);
	}

	@Override
	public UserVO idFindConfirm(UserVO vo) throws Exception  {
		
		if(vo.getUser_email() == null || vo.getUser_email().equals("")) {
			return dao.birthdayFind(vo);
		}else {
			return dao.idEmailFind(vo); 
		}
	}

	@Override
	public UserVO realIdFind(UserVO vo) throws Exception {
		
		if(vo.getUser_email().equals("") || vo.getUser_email() == null) {
			return dao.realIdbirthdayFind(vo);
		}else {
			return dao.realIdEmailFind(vo);
		}
	}

	@Override
	public UserVO passFindConfirm(UserVO vo) throws Exception {
		
		return dao.passFindConfirm(vo);
	}

	@Override
	public int newPassSave(UserVO vo) throws Exception {
		return dao.newPassSave(vo);
	}

	@Override
	public int usePassConfirm(UserVO vo) throws Exception {
		return dao.usePassConfirm(vo);
	}

	@Override
	public UserVO userInfo(String user_id) throws Exception {
		return dao.userInfo(user_id);
	}
	
	@Override
	public void modify(UserVO vo) throws Exception {
		dao.modify(vo);
	}
	
	@Override
	public UserVO passwordCheck(UserVO vo) throws Exception {
		return dao.passwordCheck(vo);
	}
	
	@Override
	public void passModify(UserVO vo) throws Exception {
		dao.passModify(vo);
	}
	
	@Override
	public void delete(String user_id) throws Exception {
		dao.delete(user_id);
	}
	
	@Override
	public void pointPayment(UserVO vo) throws Exception {
		dao.pointPayment(vo);
	}
	
	@Override
	public void pointWithdraw(UserVO vo) throws Exception {
		dao.pointWithdraw(vo);
	}
	
	@Override
	public StatisticsVO sellStatistics(String item_sellerId) throws Exception {
		return dao.sellStatistics(item_sellerId);
	}
	
	@Override
	public StatisticsVO priceStatistics(String item_sellerId) throws Exception {
		return dao.priceStatistics(item_sellerId);
	}
	
	@Override
	public List<SellItemLogVO> buyList(String user_id) throws Exception {
		return dao.buyList(user_id);
	}
	
	@Override
	public List<InquiryVO> itemInquiry(String user_id) throws Exception {
		return dao.itemInquiry(user_id);
	}
	
	@Override
	public List<ReviewVO> itemReview(String user_id) throws Exception {
		return dao.itemReview(user_id);
	}
	
	@Override
	public void logInsert(UserLogVO vo) throws Exception {
		dao.logInsert(vo);
	}
	@Override
	public UserLogVO messageCheck(String user_id) throws Exception {
		return dao.messageCheck(user_id);
	}
}
