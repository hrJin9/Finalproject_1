package com.spring.approval.controller;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.finalproject.service.InterFinalprojectService;

@Controller
public class ApprovalController {
	@Autowired
	private InterFinalprojectService service;
	
	@RequestMapping(value = "/approval.up")
	public String approval_view(HttpServletRequest request) {
		return "/approval/approval.tiles";
	}
	
	
	@RequestMapping(value = "/approval/writing.up")
	public String approval_writing(HttpServletRequest request) {
		return "/approval/approval_writing.tiles";
	}
	
	
	
	
}