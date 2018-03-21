package com.csm.customer.persistence;

import java.util.List;

import com.csm.customer.domain.QnaVO;

public interface QnaReplyDAO {
	
public List<QnaVO> list(Integer bno) throws Exception;
	
	public void create(QnaVO vo) throws Exception;
	
	public void update(QnaVO vo) throws Exception;
	
	public void delete(Integer rno) throws Exception;
}
