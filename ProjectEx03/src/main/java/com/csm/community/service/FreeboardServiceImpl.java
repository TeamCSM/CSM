package com.csm.community.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.csm.community.domain.FreeboardVO;
import com.csm.community.domain.PageMake;
import com.csm.community.domain.UnderPage;
import com.csm.community.persistence.FreeboardDAO;

@Service
public class FreeboardServiceImpl implements FreeboardService{
	
	@Inject
	private FreeboardDAO dao;
	
	@Override
	public void regist(FreeboardVO freeboard, HttpServletRequest req) throws Exception{
		dao.create(freeboard);
	}
	
	@Override
	public FreeboardVO read(Integer bno) throws Exception{
		return dao.read(bno);
	}
	
	@Override
	public void modify(FreeboardVO freeboard) throws Exception{
		dao.update(freeboard);
	}
	
	@Override
	public void remove(Integer bno) throws Exception{
		dao.delete(bno);
	}
	
	@Override
	public List<FreeboardVO> listPage(PageMake pm) throws Exception{
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
	public List<String> SelectIp() throws Exception{
		
		return dao.SelectIp();
	}
	
	@Override
	public int IpCount(String ip) throws Exception{
		
		return dao.IpCount(ip);
	}
	
}
