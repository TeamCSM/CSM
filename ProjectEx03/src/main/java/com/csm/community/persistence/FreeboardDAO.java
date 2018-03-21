package com.csm.community.persistence;

import java.util.List;

import com.csm.community.domain.FreeboardVO;
import com.csm.community.domain.PageMake;
import com.csm.community.domain.UnderPage;

public interface FreeboardDAO {
	
	public void create(FreeboardVO vo) throws Exception;//글등록
	
	public FreeboardVO read(Integer bno) throws Exception;//작성글 읽기
	
	public void update(FreeboardVO vo) throws Exception;//글수정 등록
	
	public void delete(Integer bno) throws Exception;//글삭제 등록
	
	public List<FreeboardVO> listPage(PageMake pm) throws Exception;//데이터 ?개씩 출력
	
	public int listCountPaging(PageMake pm) throws Exception;//하단 페이지 갯수 출력
	
	public void UpdateViewCount(Integer bno) throws Exception;
	
	public void UpdateReplyCount(Integer bno) throws Exception;
	
	public List<String> SelectIp() throws Exception;
	
	public int IpCount(String ip) throws Exception;

}
