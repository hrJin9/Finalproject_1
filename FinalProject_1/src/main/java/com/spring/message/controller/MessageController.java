package com.spring.message.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MessageController {

	@RequestMapping(value = "/message.up")
	public ModelAndView meetingroom(HttpServletRequest request, ModelAndView mav) {
		
		mav.setViewName("message/message.tiles");
		return mav;
	}
	
	
}
