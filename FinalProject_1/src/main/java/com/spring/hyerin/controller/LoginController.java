package com.spring.hyerin.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.finalproject.service.InterFinalprojectService;

@Controller
public class LoginController {
	@Autowired
	private InterFinalprojectService service;
	
	@RequestMapping(value = "/login.up")
	public String login(HttpServletRequest request) {
		return "login/login";
	}
	
	@RequestMapping(value = "/login/pwdFind.up")
	public String pwdFind(HttpServletRequest request) {
		return "login/pwdFind";
	}
	
	@RequestMapping(value = "/login/pwdFind_update.up")
	public String pwdFind_update(HttpServletRequest request) {
		return "login/pwdFind_update";
	}
	
}
