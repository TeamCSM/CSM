package com.csm.customer.persistence;

import java.util.List;


import com.csm.customer.domain.Criteria;
import com.csm.customer.domain.NoticeVO;
import com.csm.customer.domain.SearchCriteria;

public interface NoticeBoardDAO {
	
	public void create(NoticeVO vo)throws Exception;
	
	public NoticeVO read(Integer bno)throws Exception;
	
	public void update(NoticeVO vo)throws Exception;
	
	public void delete(Integer bno)throws Exception;
	
	public List<NoticeVO> listAll()throws Exception;
	
	public List<NoticeVO> listPage(int page)throws Exception;
	
	public List<NoticeVO> listCriteria(Criteria cri)throws Exception;
	
	public int countPaging(Criteria cri)throws Exception;
	
	public int listCountCriteria(Criteria cri)throws Exception;
	
	public List<NoticeVO> listSearch(SearchCriteria cri)throws Exception;
	
	public int listSearchCount(SearchCriteria cri)throws Exception;
}
