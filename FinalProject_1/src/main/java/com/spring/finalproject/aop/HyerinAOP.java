package com.spring.finalproject.aop;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

import com.spring.finalproject.common.MyUtil;


@Aspect
@Component
public class HyerinAOP {
	
	// 로그인 필요한 메소드
	@Pointcut("execution(public * com.spring..*Controller.rl_*(..) )")
	public void requiredLogin() {}
	
	@Before("requiredLogin()")
	public void loginCheck(JoinPoint joinpoint) {
		joinpoint.getArgs(); // 주업무메소드의 파라미터를 모두 가져옴
		HttpServletRequest request = (HttpServletRequest) joinpoint.getArgs()[0]; // 주업무메소드의 첫번째 파라미터를 가져옴
		HttpServletResponse response = (HttpServletResponse) joinpoint.getArgs()[1]; // 주업무메소드의 두번째 파라미터를 가져옴
		HttpSession session = request.getSession();
		
		if (session.getAttribute("loginuser") == null) {
			String loc = request.getContextPath() + "/login.up";
			request.setAttribute("loc", loc);
			
			//로그인 성공후 로그인전 페이지로 돌아가게 하기
			String url = MyUtil.getCurrentURL(request);
			session.setAttribute("goBackURL", url);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/msg.jsp");
			try {
				dispatcher.forward(request, response);
			} catch (ServletException | IOException e) {
				e.printStackTrace();
			}
		}
	}//end of loginCheck
	
	// 사이드바체크가 필요한 메소드
	@Pointcut("execution(public * com.spring..*Controller.*_sc(..) )")
	public void requiredSidebar() {}
	
	@Before("requiredSidebar()")
	public void sidebarCheck(JoinPoint joinpoint) {
		joinpoint.getArgs(); // 주업무메소드의 파라미터를 모두 가져옴
		HttpServletRequest request = (HttpServletRequest) joinpoint.getArgs()[0]; // 주업무메소드의 첫번째 파라미터를 가져옴
		HttpServletResponse response = (HttpServletResponse) joinpoint.getArgs()[1]; // 주업무메소드의 두번째 파라미터를 가져옴

		HttpSession session = request.getSession();
		if("0".equals(session.getAttribute("sidebar_yn"))) { //사이드바 작게보기인 경우
			
			
			
		} else { //사이드바 넓게보기인경우 (0)
			
		}
		
	}
}
