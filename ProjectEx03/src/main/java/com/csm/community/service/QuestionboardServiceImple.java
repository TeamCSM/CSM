package com.csm.community.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.csm.community.domain.PageMake;
import com.csm.community.domain.QuestionboardVO;
import com.csm.community.persistence.QuestionboardDAO;
import com.csm.user.domain.UserVO;
import com.csm.user.persistence.UserDAO;

@Service
public class QuestionboardServiceImple implements QuestionboardService{
	
	@Inject
	private QuestionboardDAO dao;
	
	@Override 
	public void regist(QuestionboardVO questionboard, UserVO vo) throws Exception{
		System.out.println("여기왕");
		dao.create(questionboard);
	}
	
	@Override
	public QuestionboardVO read(Integer bno) throws Exception{
		return dao.read(bno);
	}
	
	@Override
	public void modify(QuestionboardVO questionboard) throws Exception{
		dao.update(questionboard);
	}
	
	@Override
	public void remove(QuestionboardVO questionboardVO) throws Exception{
		dao.delete(questionboardVO);
	}
	
	@Override
	public List<QuestionboardVO> listPage(PageMake pm) throws Exception{
		return dao.listPage(pm);
	}

	@Override
	public int listCountPaging(PageMake pm) throws Exception {
		
		return dao.listCountPaging(pm);
	}
	
	@Override
	public void UpdateViewCount(Integer bno) throws Exception{
		
		dao.UpdateViewCount(bno);
	}
	
	@Override
	public void UpdateReplyCount(int bgroup) throws Exception{
		
		dao.UpdateReplyCount(bgroup);
	}
	
	@Override
	public List<String> SelectIp() throws Exception{
		
		return dao.SelectIp();
	}
	
	@Override
	public int IpCount(String ip) throws Exception{
		
		return dao.IpCount(ip);
	}
	
	@Override
	public void answer(QuestionboardVO questionboard) throws Exception{
		dao.answer(questionboard);
	}
	
	@Override
	public void answerRegist(QuestionboardVO questionboard) throws Exception{
		dao.answerRegist(questionboard);
	}
	
	@Override
	public List<QuestionboardVO> AnswerListPage(PageMake pm) throws Exception{
		return dao.AnswerListPage(pm);
	}
	
	@Override
	public UserVO checkPoint(UserVO vo) throws Exception{
		return dao.checkPoint(vo);
	}
	
	@Transactional
	@Override
	public void updateCheckCount(QuestionboardVO questionboardVO, QuestionboardVO answer) throws Exception{
		dao.updateCheckCount(questionboardVO);
		dao.updateCheckCount(answer);
	}
	@Override
	public void updateLikenum(QuestionboardVO questionboardVO) throws Exception{
		dao.updateLikenum(questionboardVO);
	}

	@Override
	public QuestionboardVO answerRead(QuestionboardVO questionboardVO) throws Exception {
		return dao.answerRead(questionboardVO);
	}
}
