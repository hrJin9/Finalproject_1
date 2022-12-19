package com.spring.interceptor.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class LoginInterceptor implements HandlerInterceptor{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession();

		if (session.getAttribute("loginuser") == null) {
			
			String loc = request.getContextPath() + "/login.up";
			request.setAttribute("loc", loc);
			
			
			System.out.println("로그아웃 후 에도 오는건가");
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/message.jsp");
			try {
				dispatcher.forward(request, response);
			} catch (ServletException | IOException e) {
				e.printStackTrace();
			}

			return false;
		}
		
		return true;
		
	}
	
}
