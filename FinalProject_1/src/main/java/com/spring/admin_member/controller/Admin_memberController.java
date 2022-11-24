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
	
	@RequestMapping(value = "/admin_memberAdd_hr.up")
	public ModelAndView admin_memberAdd_hr(HttpServletRequest request, ModelAndView mav) {
		mav.setViewName("admin/admin_memberAdd_hr.tiles");
		return mav;
	} 
	
	@RequestMapping(value = "/admin_memberAdd_personal.up")
	public ModelAndView admin_memberAdd_personal(HttpServletRequest request, ModelAndView mav) {
		mav.setViewName("admin/admin_memberAdd_personal.tiles");
		return mav;
	} 
	
	@RequestMapping(value = "/admin_memberView_hr.up")
	public ModelAndView admin_memberView_hr(HttpServletRequest request, ModelAndView mav) {
		mav.setViewName("admin/admin_memberView_hr.tiles");
		return mav;
	} 
	
	@RequestMapping(value = "/admin_memberView_personal.up")
	public ModelAndView admin_memberView_personal(HttpServletRequest request, ModelAndView mav) {
		mav.setViewName("admin/admin_memberView_personal.tiles");
		return mav;
	} 
	
	
}
