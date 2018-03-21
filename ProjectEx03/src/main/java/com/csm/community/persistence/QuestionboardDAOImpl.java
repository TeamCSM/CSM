package com.csm.community.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.csm.community.domain.PageMake;
import com.csm.community.domain.QuestionboardVO;
import com.csm.user.domain.UserVO;

@Repository
public class QuestionboardDAOImpl implements QuestionboardDAO{
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "com.csm.mapper.QuestionboardMapper";
	
	@Override
	public void create(QuestionboardVO vo) throws Exception{
		session.insert(namespace+".create",vo);
	}
	
	@Override
	public QuestionboardVO read(Integer bno) throws Exception{
		return session.selectOne(namespace+".read",bno);
	}
	
	@Override
	public void update(QuestionboardVO vo) throws Exception{
		session.update(namespace+".update",vo);
	}
	
	@Override
	public void delete(QuestionboardVO questionboardVO) throws Exception{
		session.delete(namespace+".delete",questionboardVO);
	}
	
	@Override
	public List<QuestionboardVO> listPage(PageMake pm) throws Exception{

		return session.selectList(namespace+".listPage", pm);
		
	}

	@Override
	public int listCountPaging(PageMake pm) throws Exception {
		
		return session.selectOne(namespace+".listCountPaging", pm);
	}
	
	@Override
	public void UpdateViewCount(Integer bno) throws Exception{
		
		session.update(namespace+".UpdateViewCount", bno);
	}
	
	@Override
	public void UpdateReplyCount(int bgroup) throws Exception{
		
		session.update(namespace+".UpdateReplyCount", bgroup);
	}
	
	@Override
	public List<String> SelectIp() throws Exception{
		return session.selectList(namespace+".SelectIp");
	}
	
	@Override
	public int IpCount(String ip) throws Exception{
		return session.selectOne(namespace+".IpCount", ip);
	}
	
	@Override
	public void answer(QuestionboardVO vo) throws Exception{
		session.update(namespace+".answer",vo);
	}
	
	@Override
	public void answerRegist(QuestionboardVO vo) throws Exception{
		session.insert(namespace+".answerRegist",vo);
	}
	
	@Override
	public List<QuestionboardVO> AnswerListPage(PageMake pm) throws Exception{

		return session.selectList(namespace+".AnswerListPage", pm);
		
	}
	
	@Override
	public UserVO checkPoint(UserVO vo) throws Exception{
		return session.selectOne(namespace+".checkPoint", vo);
	}
	
	@Override
	public void updateCheckCount(QuestionboardVO questionboardVO) throws Exception{
		session.update(namespace+".updateCheckCount",questionboardVO);
	}
	@Override
	public void updateLikenum(QuestionboardVO questionboardVO) throws Exception{
		session.update(namespace+".updateLikenum", questionboardVO);
	}

	@Override
	public QuestionboardVO answerRead(QuestionboardVO questionboardVO) throws Exception {
		
		return session.selectOne(namespace+".answerRead", questionboardVO);
	}
}
