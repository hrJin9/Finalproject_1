package com.spring.message.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MessageController {

	@RequestMapping(value = {"/message.up","/message/recieve.up"})
	public ModelAndView messageHome(HttpServletRequest request, ModelAndView mav) {
		
		mav.setViewName("message/message_recieve.tiles");
		return mav;
	}
	
	@RequestMapping(value = "/message/send.up")
	public ModelAndView messageRecieve(HttpServletRequest request, ModelAndView mav) {
		
		mav.setViewName("message/message_send.tiles");
		return mav;
	}
	
	@RequestMapping(value = "/message/temp.up")
	public ModelAndView messageTemp(HttpServletRequest request, ModelAndView mav) {
		
		mav.setViewName("message/message_temp.tiles");
		return mav;
	}
	
	@RequestMapping(value = "/message/write.up")
	public ModelAndView messageWrite(HttpServletRequest request, ModelAndView mav) {
		
		mav.setViewName("message/message_write.tiles");
		return mav;
	}
	
	
}
