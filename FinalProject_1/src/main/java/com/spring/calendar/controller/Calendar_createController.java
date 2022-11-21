package com.spring.calendar.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class Calendar_createController {

	@RequestMapping(value = "/calendar_create.up")
	public ModelAndView meetingroom(HttpServletRequest request, ModelAndView mav) {
		
		mav.setViewName("calendar/calendar_create.tiles");
		return mav;
	}
	 
} 
