package com.csm.user.interceptor;

import java.io.PrintWriter;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import com.csm.user.domain.LoginDTO;
import com.csm.user.domain.UserVO;
import com.csm.user.service.UserService;

public class AdminInterceptor extends HandlerInterceptorAdapter{
	
private static final Logger logger = LoggerFactory.getLogger(AuthInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		
		LoginDTO dto = (LoginDTO) session.getAttribute("login");
		
		//세션 로그인이 비어있으면..
		if(dto == null) {
			System.out.println("로그인이 비어있음");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('관리자가 아닙니다.'); history.go(-1);</script>");
			out.flush();
			return false;
		//로그인을 했지만 권한이 없으면...
		}else if (!dto.getUser_authority().equals("ADMIN")) {
			System.out.println("로그인을 했지만 권한이 없음 현재 권한 : "+ dto.getUser_authority());
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('관리자가 아닙니다.'); history.go(-1);</script>");
			out.flush();
			return false;
		}else {
			
			return true;
		}
	}

	
}
