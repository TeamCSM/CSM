package com.csm.user.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.util.SystemOutLogger;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.csm.user.domain.LoginDTO;
/*
	로그인한 사용자에 대해 HttpSession에 보관하는 처리 담당
 */
public class LoginInterceptor extends HandlerInterceptorAdapter{

	private static final String LOGIN = "login";
	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);

	//컨트롤러가 로그인관련처리를 마친후 세션에 로그인 관련데이터를 저장한다.
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

		System.out.println("포스트핸드 호출");
		HttpSession session = request.getSession();
		ModelMap modelMap = modelAndView.getModelMap();
		Object loginDTO = modelMap.get("loginResult");

		if(loginDTO != null) {

			logger.info("new login success : 새로운 로그인 정보를 세션에 담습니다.");
			session.setAttribute(LOGIN, loginDTO);

			//체크박스 선택시 적용..
			if(request.getParameter("useCookie") != null) {

				logger.info("remember me............");
				Cookie loginCookie = new Cookie("loginCookie", session.getId());
				loginCookie.setPath("/");
				// setMaxAge() : 초단위 시간동한 쿠키를 유지함 (60 * 60 * 24 * 7 ) = 7일
				loginCookie.setMaxAge(60 * 60 * 24 * 1);
				//쿠키를 전송시킨다.
				response.addCookie(loginCookie);
			}
			//response.sendRedirect("/");
			Object dest = session.getAttribute("dest");
			Object referer = session.getAttribute("Referer");
			session.removeAttribute("Referer");
			session.removeAttribute("dest");
			LoginDTO dto = (LoginDTO) session.getAttribute("login");
			if(dto.getUser_authority().equals("ADMIN")) {
				System.out.println("어드민 페이지로 리다이렉트 될 곳 입니다.");
				response.sendRedirect("/admin/adminmain");
			}else {
				System.out.println(referer);

				String result = palgogpalgog((String)referer);

				if(referer.equals("http://localhost:8080/user/join/signUp") || 
						referer.equals("http://localhost:8080/user/loginPost") || 
						result.equals("/user/loginPost") ||
						result.equals("/user/join/signUp") ||
						referer == null) {
					response.sendRedirect("/");
				}else {
					response.sendRedirect(dest != null ? (String)dest:(String)referer);
				}
			}
		}
	}


	//로그인 호출시 먼저 호출되어 세션을 비운다.
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("프리핸드 호출");
		HttpSession session = request.getSession();

		if(session.getAttribute(LOGIN) != null) {

			logger.info("clear login data before : 로그인전에 세션을 비웁니다.");
			session.removeAttribute(LOGIN);
		}


		return true;
	}

	public String palgogpalgog (String temp) {

		String[] aaa = temp.split("8080");
		String result = null;

		for(int i=0; i<aaa.length ; i++) {
			if(i==1) {
				result = aaa[i];

			}
		}
		return result;
	}

}


