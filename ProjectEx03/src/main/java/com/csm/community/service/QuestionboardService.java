package com.csm.community.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.csm.community.domain.PageMake;
import com.csm.community.domain.QuestionboardVO;
import com.csm.user.domain.UserVO;

public interface QuestionboardService {
	
	public void regist(QuestionboardVO questionboard, UserVO vo) throws Exception;
	
	public QuestionboardVO read (Integer bno) throws Exception;
	
	public void modify(QuestionboardVO questionboard) throws Exception;
	
	public void remove(QuestionboardVO questionboardVO) throws Exception;
	
	public List<QuestionboardVO> listPage(PageMake pm) throws Exception;
	
	public int listCountPaging(PageMake pm) throws Exception;
	
	public void UpdateViewCount(Integer bno) throws Exception;
	
	public void UpdateReplyCount(int bgroup) throws Exception;
	
	public List<String> SelectIp() throws Exception;
	
	public int IpCount(String ip) throws Exception;
	
	public void answer (QuestionboardVO questionboard) throws Exception;
	
	public void answerRegist(QuestionboardVO questionboard) throws Exception;
	
	public List<QuestionboardVO> AnswerListPage(PageMake pm) throws Exception;
	
	public UserVO checkPoint(UserVO vo) throws Exception;
	
	public void updateCheckCount(QuestionboardVO questionboardVO, QuestionboardVO answer) throws Exception;
	
	public void updateLikenum(QuestionboardVO questionboardVO) throws Exception;
	
	public QuestionboardVO answerRead(QuestionboardVO questionboardVO) throws Exception;
}
