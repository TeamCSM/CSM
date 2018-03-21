package com.csm.community.persistence;

import java.util.List;

import com.csm.community.domain.PageMake;
import com.csm.community.domain.QuestionboardVO;
import com.csm.user.domain.UserVO;

public interface QuestionboardDAO {

	public void create(QuestionboardVO vo) throws Exception;//글등록

	public QuestionboardVO read(Integer bno) throws Exception;//작성글 읽기

	public void update(QuestionboardVO vo) throws Exception;//글수정 등록

	public void delete(QuestionboardVO questionboardVO) throws Exception;//글삭제 등록

	public List<QuestionboardVO> listPage(PageMake pm) throws Exception;//데이터 ?개씩 출력

	public int listCountPaging(PageMake pm) throws Exception;//하단 페이지 갯수 출력

	public void UpdateViewCount(Integer bno) throws Exception;

	public void UpdateReplyCount(int bgroup) throws Exception;

	public List<String> SelectIp() throws Exception;

	public int IpCount(String ip) throws Exception;

	public void answer(QuestionboardVO vo) throws Exception;

	public void answerRegist(QuestionboardVO vo) throws Exception;

	public List<QuestionboardVO> AnswerListPage(PageMake pm) throws Exception;

	public UserVO checkPoint(UserVO vo) throws Exception;

	public void updateCheckCount(QuestionboardVO questionboardVO) throws Exception;

	public void updateLikenum(QuestionboardVO questionboardVO) throws Exception;

	public QuestionboardVO answerRead(QuestionboardVO questionboardVO) throws Exception;
}
