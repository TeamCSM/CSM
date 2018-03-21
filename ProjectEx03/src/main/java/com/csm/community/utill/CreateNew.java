package com.csm.community.utill;

import com.csm.community.domain.FreeboardVO;
import com.csm.community.domain.QuestionboardVO;

public class CreateNew {

	public String addNew(FreeboardVO vo) {

		java.util.Date date = vo.getRegdate();

		long now = System.currentTimeMillis();

		long inputDate = date.getTime();

		String mark = "";
		
		if(now - inputDate < (1000*60*60*24*1)){

			  mark = "<img src='/resources/community/img/New_icons_40.gif' style='margin-top:0px;'/>";

			}


		return mark;
	}
	public String addNew2(QuestionboardVO vo) {

		java.util.Date date = vo.getRegdate();

		long now = System.currentTimeMillis();

		long inputDate = date.getTime();

		String mark = "";
		
		if(now - inputDate < (1000*60*60*24*1)){

			  mark = "<img src='/resources/community/img/New_icons_40.gif' style='margin-top:0px;'/>";

			}


		return mark;
	}
}
