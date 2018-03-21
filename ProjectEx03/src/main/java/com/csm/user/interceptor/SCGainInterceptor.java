package com.csm.user.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.csm.user.domain.LoginDTO;

public class SCGainInterceptor extends HandlerInterceptorAdapter {
	
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
			out.println("<script>alert('로그인이 필요한 서비스입니다.'); location.href='/user/login';</script>");
			out.flush();
			return false;
		//로그인을 했지만 권한이 없으면...
		}else if (!dto.getUser_authority().equals("USER")) {
			System.out.println("로그인을 했지만 권한이 없음 현재 권한 : "+ dto.getUser_authority());
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('판매신청은 유저만 신청 할 수 있습니다.'); location.href='/market/marketHome';</script>");
			out.flush();
			return false;
		}else {
			
			return true;
		}
	}

}
