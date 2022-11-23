package com.spring.admin_insight.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class Admin_insightController {

	@RequestMapping(value = "/admin_insight.up")
	public ModelAndView meetingroom(HttpServletRequest request, ModelAndView mav) {
		
		mav.setViewName("admin/admin_insight.tiles");
		return mav;
	} 
	
	
}
