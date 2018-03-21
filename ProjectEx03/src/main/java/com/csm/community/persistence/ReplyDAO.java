package com.csm.community.persistence;

import java.util.List;

import com.csm.community.domain.FreeboardVO;
import com.csm.community.domain.PageMake;
import com.csm.community.domain.ReplyVO;

public interface ReplyDAO {
	
	public List<ReplyVO> list(Integer bno) throws Exception;
	
	public void create(ReplyVO vo) throws Exception;
	
	public void update(ReplyVO vo) throws Exception;
	
	public void delete(Integer rno) throws Exception;
	
	public List<ReplyVO> listPage(ReplyVO vo, PageMake pm) throws Exception;
	
	public int count(Integer bno) throws Exception;
	
	public int getBno(Integer rno) throws Exception;
	
	public void answerReply(ReplyVO vo) throws Exception;
	
	public void answerRegist(ReplyVO vo) throws Exception;
	
}
