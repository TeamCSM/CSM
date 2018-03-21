package com.csm.community.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.csm.community.domain.PageMake;
import com.csm.community.domain.ReplyVO;

public interface ReplyService {
	
	public void addReply(ReplyVO vo, HttpServletRequest req) throws Exception;
	
	public List<ReplyVO> listReply(Integer bno) throws Exception;
	
	public void modifyReply(ReplyVO vo) throws Exception;
	
	public void removeReply(Integer rno) throws Exception;
	
	public List<ReplyVO> listReplyPage(ReplyVO vo, PageMake pm) throws Exception;
	
	public int count(Integer bno) throws Exception;
	
	public void answerReply(ReplyVO vo) throws Exception;
	
	public void answerRegist(ReplyVO vo) throws Exception;
}
