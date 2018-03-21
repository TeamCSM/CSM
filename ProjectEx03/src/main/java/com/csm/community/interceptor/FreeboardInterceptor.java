package com.csm.community.interceptor;

import java.io.PrintWriter;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import com.csm.community.service.FreeboardService;

public class FreeboardInterceptor extends HandlerInterceptorAdapter{
	
	@Inject
	FreeboardService service;
	
	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object object)
			throws Exception{
		List<String> list = service.SelectIp();
		
		for(String li : list) {
			
			if(req.getRemoteAddr().matches(li)) {
				if(service.IpCount(li)>=5) {
					res.setContentType("text/html; charset=UTF-8");
					PrintWriter out = res.getWriter();
	                out.println("<script>alert('하루 가능한 글 작성개수는 5개입니다.');history.go(-1);</script>");
	                return false;
				}
			}
		}
		return true;
		}
	}
