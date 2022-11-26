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
	@RequestMapping(value = {"/main.up", "/"})
	public ModelAndView index(HttpServletRequest request, ModelAndView mav) {
		
		mav.setViewName("main/index.tiles");
		return mav;
	}
	
	@RequestMapping(value = "/main_todo.up")
	public ModelAndView index_todo(HttpServletRequest request, ModelAndView mav) {
		
		mav.setViewName("main/index_todo.tiles");
		return mav;
	}
	
	@RequestMapping(value = "/side/search.up")
	public ModelAndView sidebar_search(HttpServletRequest request, ModelAndView mav) {
		
		mav.setViewName("/tiles/main/sidebar_search");
		return mav;
	}
	
	@RequestMapping(value = "/side/searchEnd.up")
	public ModelAndView sidebar_searchEnd(HttpServletRequest request, ModelAndView mav) {
		
		mav.setViewName("/tiles/main/sidebar_searchEnd");
		return mav;
	}
	
	
	
	
}
