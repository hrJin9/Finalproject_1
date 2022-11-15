package com.spring.finalproejct.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.finalproject.service.InterFinalprojectService;


@Controller
public class FinalprojectController {
	@Autowired
	private InterFinalprojectService service;
	/*
	 * @RequestMapping(value = "/main.action") public ModelAndView
	 * home(HttpServletRequest request, ModelAndView mav) {
	 * 
	 * mav.setViewName("main/index.tiles"); return mav; }// end of index
	 */
	@RequestMapping(value = "/")
	public String home(HttpServletRequest request) {
		return "main/index.tiles";
	}
	@RequestMapping(value = "/main.action")
	public ModelAndView home2(HttpServletRequest request, ModelAndView mav) {
		
		mav.setViewName("main/index.tiles");
		return mav;
	}
	
}
