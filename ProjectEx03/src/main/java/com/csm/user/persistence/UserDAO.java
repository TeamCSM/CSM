package com.csm.user.persistence;

import java.util.Date;
import java.util.List;

import com.csm.market.domain.InquiryVO;
import com.csm.market.domain.ReviewVO;
import com.csm.market.domain.SellItemLogVO;
import com.csm.matching.domain.StatisticsVO;
import com.csm.user.domain.LoginDTO;
import com.csm.user.domain.UserLogVO;
import com.csm.user.domain.UserVO;

public interface UserDAO {

	//아이디 생성
	public void createBase(UserVO vo) throws Exception;

	//로그인
	public LoginDTO login(LoginDTO dto) throws Exception;

	public void keepLogin(String user_id, String sessionId, Date next) throws Exception;

	public LoginDTO checkUserWithSessionKey(String value) throws Exception;
	//아이디 찾기
	public UserVO idEmailFind(UserVO vo) throws Exception;

	public UserVO birthdayFind(UserVO vo) throws Exception;

	public UserVO realIdEmailFind(UserVO vo) throws Exception;

	public UserVO realIdbirthdayFind(UserVO vo) throws Exception;

	//비밀번호 찾기
	public UserVO passFindConfirm(UserVO vo) throws Exception;

	public int newPassSave(UserVO vo) throws Exception;

	public int usePassConfirm(UserVO vo) throws Exception;

	//로그
	public void logInsert(UserLogVO vo) throws Exception;
	
	//마이페이지
		public UserVO userInfo(String user_id) throws Exception;

		public void modify(UserVO vo) throws Exception;

		public UserVO passwordCheck(UserVO vo) throws Exception;

		public void passModify(UserVO vo) throws Exception;

		public void delete(String user_id) throws Exception;

		public void pointPayment(UserVO vo) throws Exception;

		public void pointWithdraw(UserVO vo) throws Exception;
		
		public StatisticsVO sellStatistics(String item_sellerId) throws Exception;
		
		public StatisticsVO priceStatistics(String item_sellerId) throws Exception;
		
		public List<SellItemLogVO> buyList(String user_id) throws Exception;
		
		public List<InquiryVO> itemInquiry(String user_id) throws Exception;
		
		public List<ReviewVO> itemReview(String user_id) throws Exception;
		
		public UserLogVO messageCheck(String user_id) throws Exception;
}
