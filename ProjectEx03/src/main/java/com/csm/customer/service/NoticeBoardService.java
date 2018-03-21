package com.csm.customer.service;

import java.util.List;

import com.csm.customer.domain.Criteria;
import com.csm.customer.domain.NoticeVO;
import com.csm.customer.domain.SearchCriteria;

public interface NoticeBoardService {
	
	public void regist(NoticeVO board)throws Exception;
	
	public NoticeVO read(Integer bno)throws Exception;
	
	public void modify(NoticeVO board)throws Exception;
	
	public void remove(Integer bno)throws Exception;
	
	public List<NoticeVO> listAll() throws Exception;
	
	public List<NoticeVO> listCriteria(Criteria cri) throws Exception;
	
	public int listCountCriteria(Criteria cri)throws Exception;
	
	public int listSearchCount(SearchCriteria cri)throws Exception;
	
	public List<NoticeVO> listSearchCriteria(SearchCriteria cri)throws Exception;
}
