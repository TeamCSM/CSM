package com.csm.community.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.csm.community.domain.FreeboardVO;
import com.csm.community.domain.PageMake;
import com.csm.community.domain.UnderPage;

public interface FreeboardService {
	
	public void regist(FreeboardVO freeboard, HttpServletRequest req) throws Exception;
	
	public FreeboardVO read (Integer bno) throws Exception;
	
	public void modify(FreeboardVO freeboard) throws Exception;
	
	public void remove(Integer bno) throws Exception;
	
	public List<FreeboardVO> listPage(PageMake pm) throws Exception;
	
	public int listCountPaging(PageMake pm) throws Exception;
	
	public void UpdateViewCount(Integer bno) throws Exception;
	
	public List<String> SelectIp() throws Exception;
	
	public int IpCount(String ip) throws Exception;
	
}
