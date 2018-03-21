package com.csm.home.aop;

import static org.hamcrest.CoreMatchers.instanceOf;

import java.lang.reflect.Constructor;
import java.util.Arrays;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

import com.csm.user.domain.LoginDTO;
import com.csm.user.domain.UserVO;
import com.csm.user.persistence.UserDAO;
import com.csm.user.service.UserService;

@Component
@Aspect
public class PointAdvice {

	@Inject
	private UserDAO dao;


	@After("execution(* com.csm.community.service.FreeboardService*.*regist*(..))")
	public void freeboardRegistPoint(JoinPoint joinPoint)throws Throwable{

		for ( Object o : joinPoint.getArgs() ){
			if ( o instanceof HttpServletRequest ) {
				HttpSession session = ((HttpServletRequest) o).getSession();
				LoginDTO dto = (LoginDTO) session.getAttribute("login");
				UserVO vo = new UserVO();
				vo.setUser_id(dto.getUser_id());
				vo.setUser_point(50);
				dao.pointPayment(vo);
			}
		}
	}

	@After("execution(* com.csm.community.service.ReplyService*.*addReply*(..))")
	public void freeboardReplyPoint(JoinPoint joinPoint)throws Throwable{

		for ( Object o : joinPoint.getArgs() ){
			if ( o instanceof HttpServletRequest ) {
				HttpSession session = ((HttpServletRequest) o).getSession();
				LoginDTO dto = (LoginDTO) session.getAttribute("login");
				UserVO vo = new UserVO();
				vo.setUser_id(dto.getUser_id());
				vo.setUser_point(5);
				dao.pointPayment(vo);
			}
		}
	}

	@After("execution(* com.csm.community.service.QuestionboardService*.*regist*(..))")
	public void questionboardRegisterPoint(JoinPoint joinPoint)throws Throwable{

		for ( Object o : joinPoint.getArgs() ){
			
			if(o instanceof UserVO) {

				UserVO vo = (UserVO) o;
				dao.pointWithdraw(vo);
			}
		}
	}

	@After("execution(* com.csm.community.service.UserActionService*.*insertAction*(..))")
	public void userActionPoint(JoinPoint joinPoint)throws Throwable{

		for ( Object o : joinPoint.getArgs() ){
			
			if(o instanceof UserVO) {

				UserVO vo = (UserVO) o;
				dao.pointPayment(vo);
			}
		}
	}
}
