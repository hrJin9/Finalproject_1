package com.spring.calendar.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class Calendar_todoController {

	@RequestMapping(value = "/calendar_todo.up")
	public ModelAndView meetingroom(HttpServletRequest request, ModelAndView mav) {
		
		mav.setViewName("calendar/calendar_todo.tiles");
		return mav;
	}
	
}
