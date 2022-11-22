package com.spring.admin_login.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class Admin_loginController {

	@RequestMapping(value = "/admin_login.up")
	public ModelAndView meetingroom(HttpServletRequest request, ModelAndView mav) {
		
		mav.setViewName("admin/admin_login.tiles");
		return mav;
	} 
	
	
}
