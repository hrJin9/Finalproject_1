package com.spring.board.controller;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.finalproject.service.InterFinalprojectService;

@Controller
public class BoardController {
	@Autowired
	private InterFinalprojectService service;
	
	@RequestMapping(value = "/board/view.up")
	public String view(HttpServletRequest request) {
		return "board/view.tiles";
	}
	
	@RequestMapping(value = "/board/add.up")
	public String add(HttpServletRequest request) {
		return "board/add.tiles";
	}
	
	@RequestMapping(value = "/board_all.up")
	public String board_all(HttpServletRequest request) {
		return "board/notice_all.tiles";
	}
	
	@RequestMapping(value = "/board_team.up")
	public String board_team(HttpServletRequest request) {
		return "board/notice_team.tiles";
	}
	
	@RequestMapping(value = "/board/freeboard.up")
	public String freeboard(HttpServletRequest request) {
		return "board/freeboard.tiles";
	}
	
	
	@RequestMapping(value = "/board/myboard.up")
	public String myboard(HttpServletRequest request) {
		return "board/myboard.tiles";
	}
	
	
	
	
	
}