package com.spring.finalproejct.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import com.spring.finalproject.service.InterFinalprojectService;


@Controller
public class FinalprojectController {
	@Autowired
	private InterFinalprojectService service;
}
