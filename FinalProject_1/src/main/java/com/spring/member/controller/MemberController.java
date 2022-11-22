package com.spring.member.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.finalproject.service.InterFinalprojectService;

@Controller
public class MemberController {
	@Autowired
	private InterFinalprojectService service;
	
	@RequestMapping(value = "/member/memberRegister.up")
	public String memberRegister(HttpServletRequest request) {
		return "member/memberRegister";
	}
	
	@RequestMapping(value = "/member/myInfo_hr.up")
	public String myInfo_hr(HttpServletRequest request) {
		return "member/myInfo_hr.tiles";
	}
	
	@RequestMapping(value = "/member/myInfo_personal.up")
	public String myInfo_personal(HttpServletRequest request) {
		return "member/myInfo_personal.tiles";
	}
	
	@RequestMapping(value = "/member/pwdChange.up")
	public String pwdChange(HttpServletRequest request) {
		return "member/pwdChange";
	}
	
	@RequestMapping(value = "/member/memberList.up")
	public String memberList(HttpServletRequest request) {
		return "member/memberList.tiles";
	}
	
	@RequestMapping(value = "/member/memberInfo_hr.up")
	public String memberInfo_hr(HttpServletRequest request) {
		return "member/memberInfo_hr.tiles";
	}
	
	@RequestMapping(value = "/member/memberInfo_personal.up")
	public String memberInfo_personal(HttpServletRequest request) {
		return "member/memberInfo_personal.tiles";
	}
	
}
