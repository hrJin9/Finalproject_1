package com.spring.finalproject.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletWebRequest;
import org.springframework.web.servlet.ModelAndView;

import com.spring.finalproject.service.InterFinalprojectService;
import com.spring.hyerin.model.EmployeeVO;
import com.spring.jieun.model.ApprovalVO;
import com.spring.yeeun.model.AttendanceVO;

@Controller
public class FinalprojectController {
	@Autowired
	private InterFinalprojectService service;
	
	
	@RequestMapping(value = {"/main.up", "/"})
	public ModelAndView rl_index(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {
		HttpSession session = request.getSession();
		EmployeeVO loginuser = (EmployeeVO)session.getAttribute("loginuser");
		String employee_no = loginuser.getEmployee_no();
		
		// 오늘 출근시간 알아오기
		List<AttendanceVO> avoList = service.getTodayStarttime(employee_no);
		
		// 오늘 총근무시간 알아오기
		String todayWorkingTime = service.getTodayWorkingtime(employee_no);
		
		// 이번주 총근무시간 알아오기
		String weekWorkingTime = service.getWeekWorkingTime(employee_no);
		
		// 오늘 출퇴근시간 처리
		String starttime = "";
		String endtime = "";
		
		int lastAd = 0;
		try {
			lastAd = avoList.size();
			if(lastAd > 0) {
				for(int i=0; i<lastAd; i++) {
					if(i==0) {
						starttime = avoList.get(i).getStartTime();
					}
					if(i==lastAd-1) {
						endtime = avoList.get(i).getEndTime();
					}
				}
			}
		} catch(Exception e) {
			
		}
		
		
		// 오늘 총근무시간 처리
		if(todayWorkingTime != null) {
			int i_todayWorkingTime = Integer.parseInt(todayWorkingTime);
			int twh = i_todayWorkingTime / 60;
			int twm = i_todayWorkingTime % 60;
			
			if(twm != 0) {
				todayWorkingTime = twh + "시간 " + twm + "분";
			} else {
				todayWorkingTime = twh + "시간 ";
			}
		}
		
		String overWt = "0";
		String regularWt = "0";
		// 이번주 총근무시간 처리
		if(weekWorkingTime != null) {
			int i_weekWorkingTime = Integer.parseInt(weekWorkingTime);
			int w_twh = i_weekWorkingTime / 60;
			int w_twm = i_weekWorkingTime % 60;
			
			if(w_twm != 0) {
				weekWorkingTime = w_twh + "시간 " + w_twm + "분";
			} else {
				weekWorkingTime = w_twh + "시간";
			}
			
			//초과근무시간 처리
			if(w_twh > 40) {
				regularWt = "40시간";
				overWt =  String.valueOf(w_twh - 40);
			} else {
				regularWt = w_twh + "시간";
				if(w_twm != 0) {
					regularWt += " " + w_twm + "분";
				}
			}
		}
		
		
		// 결재요청온것
		List<Map<String,String>> apList = service.getAvMy(employee_no);
		
		for(Map<String,String> map : apList) {
			int writetime = Integer.parseInt(map.get("writeday"));
			int writeh = writetime / 60;
			if(writeh > 1) {
				map.put("writeday",writeh/24/2 + "일 전");
			} else {
				int wirtem = writetime % 60;
				map.put("writeday",wirtem + "분 전");
			}
		}
		
		mav.addObject("apList",apList);
		mav.addObject("overWt", overWt);
		mav.addObject("regularWt",regularWt);
		mav.addObject("starttime",starttime);
		mav.addObject("endtime",endtime);
		mav.addObject("todayWorkingTime",todayWorkingTime);
		mav.addObject("weekWorkingTime",weekWorkingTime);
		mav.setViewName("main/index.tiles");
		return mav;
	}
	
	@RequestMapping(value = "/main_todo.up")
	public ModelAndView index_todo(HttpServletRequest request, ModelAndView mav) {
		
		mav.setViewName("main/index_todo.tiles");
		return mav;
	}
	
	@RequestMapping(value = "/side/search.up")
	public ModelAndView sidebar_search(HttpServletRequest request, ModelAndView mav) {
		
		mav.setViewName("/tiles/main/sidebar_search");
		return mav;
	}
	
	@RequestMapping(value = "/side/searchEnd.up")
	public ModelAndView sidebar_searchEnd(HttpServletRequest request, ModelAndView mav) {
		
		mav.setViewName("/tiles/main/sidebar_searchEnd");
		return mav;
	}
	
	
	
	
}
