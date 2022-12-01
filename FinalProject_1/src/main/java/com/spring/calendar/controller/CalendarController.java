package com.spring.calendar.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.chae0.service.InterCalendarService;
import com.spring.finalproject.service.InterFinalprojectService;

@Controller
public class CalendarController {

	@Autowired
	private InterCalendarService service;
	 
	@RequestMapping(value = "/calendar.up")
	public String calendar(HttpServletRequest request) {
		return "calendar/calendar.tiles";
	}
	
	@RequestMapping(value = "/calendar_todo.up")
	public String calendar_todo(HttpServletRequest request) {
		return "calendar/calendar_todo.tiles";
	}
	
	/*
	 * @RequestMapping(value = "/calendar.up") public ModelAndView
	 * meetingroom(HttpServletRequest request, ModelAndView mav) {
	 * 
	 * mav.setViewName("calendar/calendar.tiles"); return mav; }
	 */

	
}
