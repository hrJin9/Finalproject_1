package com.spring.payroll.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PayrollController {
	
	@RequestMapping(value="/payroll.up")
	public ModelAndView payroll(HttpServletRequest request, ModelAndView mav) {
		mav.setViewName("payroll/payroll.tiles");
		return mav;
	}
	
	
}
