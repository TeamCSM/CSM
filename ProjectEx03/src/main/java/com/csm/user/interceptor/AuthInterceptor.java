package com.csm.user.interceptor;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import com.csm.user.domain.LoginDTO;
import com.csm.user.domain.UserVO;
import com.csm.user.service.UserService;
/*
	특정 경로에 접근하는 사용자가 로그인상태인지 아닌지 체크하는 인터셉터
*/
public class AuthInterceptor extends HandlerInterceptorAdapter{
	
	private static final Logger logger = LoggerFactory.getLogger(AuthInterceptor.class);
	
	@Inject
	private UserService service;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		
		//세션 로그인이 비어있으면..
		if(session.getAttribute("login") == null) {
			logger.info("current user is not logined : 유저가 로그인되지 않았음");
			
			saveDest(request);
			
			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
			//쿠키가 존재한다면..
			if(loginCookie != null) {
				
				LoginDTO dto = service.checkLoginBefore(loginCookie.getValue());
				
				logger.info("기존에 있던 사용자: "+dto);
				//DB에 기록이 있다면..
				if(dto != null) {
					
					session.setAttribute("login", dto);
					return true;
				}
			}
			
			if(session.getAttribute("SigninOnly") != null) {
				session.removeAttribute("SigninOnly");
				session.removeAttribute("dest");
				response.sendRedirect("http://localhost:8080");
			}else {
				response.sendRedirect("/user/login");
			}
			return false;
		}
		return true;
	}

	
	//인터셉터 되기전의 정보를 가져오는 메소드
	private void saveDest(HttpServletRequest req) {
		
		//인터셉터 되기전 URI
		String uri = req.getRequestURI();
		//인터셉터 되기전 쿼리스트링
		String query = req.getQueryString();
		
		if(query == null || query.equals("null")) {
			query = "";
		}else {
			query = "?" + query;
		}
		
		if(req.getMethod().equals("GET")) {
			logger.info("dest: "+ (uri+query));
			req.getSession().setAttribute("dest", uri+query);
		}
	}
}
