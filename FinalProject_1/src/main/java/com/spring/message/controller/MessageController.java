package com.spring.message.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.finalproject.common.FileManager;
import com.spring.hyerin.model.MessageVO;
import com.spring.hyerin.service.InterMessageService;

@Controller
public class MessageController {
	
	@Autowired
	private InterMessageService service;
	
	@Autowired
	private FileManager fileManager;

	@RequestMapping(value = {"/message.up","/message/recieve.up"})
	public ModelAndView messageHome(HttpServletRequest request, ModelAndView mav) {
		// 로그인된 유저의 employee_no 알아오기
		String receiver = "106";
		// 로그인유저의 메시지리스트 불러오기
		List<Map<String,String>> mvoList = service.getmvoList(receiver);
		
		mav.addObject("mvoList",mvoList);
		mav.setViewName("message/message_recieve.tiles");
		return mav;
	}
	
	@RequestMapping(value = "/message/all.up")
	public ModelAndView messageAll(HttpServletRequest request, ModelAndView mav) {
		
		// 로그인된 유저의 employee_no 알아오기
		String receiver = "106";
		// 로그인유저의 메시지리스트 불러오기
		List<Map<String,String>> mvoList = service.getmvoList(receiver);
		
		mav.addObject("mvoList",mvoList);
		mav.setViewName("tiles/message/message_all");
		return mav;
	}
	
	
	@RequestMapping(value = "/message/unread.up")
	public ModelAndView messageUnread(HttpServletRequest request, ModelAndView mav) {
		
		// 로그인된 유저의 employee_no 알아오기
		String receiver = "106";
		// 로그인유저의 메시지리스트 불러오기
		List<Map<String,String>> mvoList = service.unread_mvoList(receiver);
		mav.addObject("mvoList",mvoList);
		mav.setViewName("tiles/message/message_unread");
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
	
	@RequestMapping(value = "/message/memberList.up")
	public ModelAndView messageMemberList(HttpServletRequest request, ModelAndView mav) {
		
		mav.setViewName("tiles/message/message_memberList");
		return mav;
	}
	
	@RequestMapping(value = "/message/book.up")
	public ModelAndView messageBook(HttpServletRequest request, ModelAndView mav) {
		
		mav.setViewName("tiles/message/message_book");
		return mav;
	}
	
	
}
