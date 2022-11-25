package com.spring.admin_payroll.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class Admin_payrollController {

	@RequestMapping(value = "/admin_payroll.up")
	public ModelAndView admin_memberList(HttpServletRequest request, ModelAndView mav) {
		mav.setViewName("admin/admin_payroll.tiles");
		return mav;
	} 
	
	
}
