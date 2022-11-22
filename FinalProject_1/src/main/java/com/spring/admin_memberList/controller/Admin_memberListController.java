package com.spring.admin_memberList.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class Admin_memberListController {

	@RequestMapping(value = "/admin_memberList.up")
	public ModelAndView admin_memberList(HttpServletRequest request, ModelAndView mav) {
		mav.setViewName("admin/admin_memberList.tiles");
		return mav;
	} 
	
	
}
