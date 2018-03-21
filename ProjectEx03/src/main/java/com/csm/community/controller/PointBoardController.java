package com.csm.community.controller;

import java.io.PrintWriter;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.csm.community.service.UserActionService;
import com.csm.user.domain.LoginDTO;
import com.csm.user.domain.UserVO;

@Controller
@RequestMapping("/community/pointboard/*")
public class PointBoardController {
	
	@Inject
	private UserActionService service;
	
	@RequestMapping(value="/PointBoard" , method=RequestMethod.GET)
	public String circleboardGET(HttpSession session,UserVO userVO,HttpServletResponse res) throws Exception{
		
		LoginDTO dto = (LoginDTO) session.getAttribute("login");
		
		if(dto==null) {
			res.setContentType("text/html; charset=UTF-8");
			PrintWriter out = res.getWriter();
            out.println("<script>alert('로그인 후 이용가능합니다.');window.close();</script>");
            out.flush();//강제 전송
		}
			
		userVO.setUser_id(dto.getUser_id());
		int num = service.checkAction(userVO.getUser_id());
		
		if(num==1) {
			res.setContentType("text/html; charset=UTF-8");
			PrintWriter out = res.getWriter();
            out.println("<script>alert('이벤트 참여는 1번만 가능합니다.');window.close();</script>");
            out.flush();//강제 전송
		}
		return "/community/pointboard/PointBoard";
	}
	
	@RequestMapping(value="/PointBoard" , method=RequestMethod.POST)
	public ResponseEntity<String> circleboardPOST(HttpSession session,UserVO userVO) throws Exception{
	
		LoginDTO dto = (LoginDTO) session.getAttribute("login");
		userVO.setUser_id(dto.getUser_id());
		
		ResponseEntity<String> entity = null;
		try {
			service.insertAction(userVO.getUser_id());
			
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		}
		catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}
