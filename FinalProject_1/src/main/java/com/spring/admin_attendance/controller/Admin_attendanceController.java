package com.spring.admin_attendance.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class Admin_attendanceController {

	@RequestMapping(value = "/admin_attendanceList_holding.up")
	public ModelAndView admin_attendanceList_holding(HttpServletRequest request, ModelAndView mav) {
		mav.setViewName("admin/admin_attendanceList_holding.tiles");
		return mav;
	} 
	
	@RequestMapping(value = "/admin_attendanceList_usage.up")
	public ModelAndView admin_attendanceList_usage(HttpServletRequest request, ModelAndView mav) {
		mav.setViewName("admin/admin_attendanceList_usage.tiles");
		return mav;
	} 
	
}
