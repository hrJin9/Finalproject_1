package com.spring.meetingroom.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MeetingroomController {
	
	@RequestMapping(value="/support/meetingroom.up")
	public ModelAndView meetingroom(HttpServletRequest request, ModelAndView mav){
		mav.setViewName("reservation/meetingroom.tiles");
		return mav;
	}
}
