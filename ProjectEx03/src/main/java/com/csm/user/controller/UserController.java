package com.csm.user.controller;

import java.util.Date;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.util.WebUtils;

import com.csm.user.domain.LoginDTO;
import com.csm.user.domain.UserLogVO;
import com.csm.user.domain.UserVO;
import com.csm.user.service.UserService;
import com.csm.user.util.SHA256Util;

@Controller
@RequestMapping("/user/*")
public class UserController {

	@Inject
	UserService service;

	//로그인
	@RequestMapping(value="login", method=RequestMethod.GET)
	public void loginGet(HttpServletRequest req, Model model) {
		
		String referrer = req.getHeader("Referer");
		req.getSession().setAttribute("Referer", referrer);
		
		model.addAttribute("logout", req.getParameter("logout"));
	}

	@RequestMapping(value = "/loginPost", method= RequestMethod.POST)
	public void loginPOST(LoginDTO dto, HttpSession session, Model model) throws Exception{

		//암호화
		SHA256Util sha = new SHA256Util();
		dto.setUser_pass(sha.encryptSHA256(dto.getUser_pass()));

		//해당 아이디가 존재하는가?
		LoginDTO result = service.login(dto);

		//없으면 실행
		if(result == null) {
			return; //"/user/login";
		}

		model.addAttribute("loginResult", result);

		//리멤버미 체크박스가 체크되어있는지 확인
		if(dto.isUseCookie()) {

			int amount = 60 * 60 * 24 * 7;
			//쿠키 유지시간
			Date sessionLimit = new Date(System.currentTimeMillis()+(1000*amount));
			//로그인 했다는 정보를 해당아이디에다가 삽입
			service.keepLogin(result.getUser_id(), session.getId(), sessionLimit);
		}
		UserLogVO vo = new UserLogVO();
		vo.setUser_id(result.getUser_id());
		vo.setLog_action("L");
		
		service.logInsert(vo);
		//return "home";
	}

	@RequestMapping(value = "/loginPostFaceBook", method= RequestMethod.GET)
	public String loginPostFaceBook(LoginDTO dto, HttpSession session, Model model) throws Exception{

		model.addAttribute("loginDTO", dto);

		return "home";
	}

	//로그아웃
	@RequestMapping(value = "/logout", method= RequestMethod.GET)
	public void logout(HttpServletRequest req, HttpServletResponse response, HttpSession session, Model model) throws Exception{

		LoginDTO dto = (LoginDTO) session.getAttribute("login");

		if(dto==null) {
			response.sendRedirect("/");
			return;
		}
		
		if(dto.getUser_loginType()==null) {
			System.out.println("일반로그아웃");

		}else if(dto.getUser_loginType().equals("facebook")) {
			model.addAttribute("logout", "facebook");
		}

		session.removeAttribute("login");

		 Cookie loginCookie = WebUtils.getCookie(req, "loginCookie");
         if ( loginCookie != null ){
             
             // 쿠키 유효시간을 0으로 설정
             loginCookie.setMaxAge(0);
             // 쿠키 설정을 적용한다.
             response.addCookie(loginCookie);
              
             //로그아웃시 시간 재설정
             Date date = new Date(System.currentTimeMillis());
             service.keepLogin(dto.getUser_id(), session.getId(), date);
         }
		
		session.setAttribute("SigninOnly", "SigninOnly");
		
		String referrer = req.getHeader("Referer");
		
		response.sendRedirect(referrer != null ? (String)referrer:"/");
		
		
		
	}

}
