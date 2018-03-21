package com.csm.community.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import com.csm.community.domain.PageMake;
import com.csm.community.domain.ReplyVO;
import com.csm.community.persistence.FreeboardDAO;
import com.csm.community.persistence.ReplyDAO;


@Service
public class ReplyServiceImpl implements ReplyService{
	
	@Inject
	private ReplyDAO dao;
	
	@Inject
	private FreeboardDAO freedao;
	
	@Transactional
	@Override
	public void addReply(ReplyVO vo, HttpServletRequest req) throws Exception{
		
		dao.create(vo);
		freedao.UpdateReplyCount(vo.getBno());
	}
	
	@Override
	public List<ReplyVO> listReply(Integer bno) throws Exception{
		
		return dao.list(bno);
	}
	
	@Override
	public void modifyReply(ReplyVO vo) throws Exception{
		
		dao.update(vo);
	}
	
	@Override
	public void removeReply(Integer rno) throws Exception{
		
		dao.delete(rno);
	}
	
	@Override
	public List<ReplyVO> listReplyPage(ReplyVO vo, PageMake pm) throws Exception{
		
		return dao.listPage(vo, pm);
	}
	
	@Override
	public int count(Integer bno) throws Exception{
		
		return dao.count(bno);
	}
	
	@Override
	public void answerReply(ReplyVO vo) throws Exception{
		
		dao.answerReply(vo);
	}
	
	@Override
	public void answerRegist(ReplyVO vo) throws Exception{
		
		dao.answerRegist(vo);
	}
}
