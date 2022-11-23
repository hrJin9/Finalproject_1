package com.spring.admin_member.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class Admin_memberController {

	@RequestMapping(value = "/admin_memberList.up")
	public ModelAndView admin_memberList(HttpServletRequest request, ModelAndView mav) {
		mav.setViewName("admin/admin_memberList.tiles");
		return mav;
	} 
	
	@RequestMapping(value = "/admin_memberAdd.up")
	public ModelAndView admin_memberAdd(HttpServletRequest request, ModelAndView mav) {
		mav.setViewName("admin/admin_memberAdd.tiles");
		return mav;
	} 
	
	
}
