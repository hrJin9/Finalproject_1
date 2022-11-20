package com.spring.meetingroom.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MeetingroomController {
	
	@RequestMapping(value="/support/meetingroom-1.up")
	public ModelAndView meetingroom_1(HttpServletRequest request, ModelAndView mav){
		mav.setViewName("reservation/meetingroom-1.tiles");
		return mav;
	}
	@RequestMapping(value="/support/meetingroom-3.up")
	public ModelAndView meetingroom_3(HttpServletRequest request, ModelAndView mav){
		mav.setViewName("reservation/meetingroom-3.tiles");
		return mav;
	}
	
}
