package com.spring.finalproject.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
		
		mav.addObject("overWt", overWt);
		mav.addObject("regularWt",regularWt);
		mav.addObject("starttime",starttime);
		mav.addObject("endtime",endtime);
		mav.addObject("todayWorkingTime",todayWorkingTime);
		mav.addObject("weekWorkingTime",weekWorkingTime);
		mav.setViewName("main/index.tiles");
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value="/getMainAvList.up")
	public String getMainAvList(HttpServletRequest request) {
		String employee_no = request.getParameter("employee_no");
		// 결재요청온것
		List<Map<String,String>> apList = service.getAvMy(employee_no);
		
		JSONArray jsonarr = new JSONArray();
		if(apList != null) {
			for(Map<String,String> map : apList) {
				int writetime = Integer.parseInt(map.get("writeday"));
				int writeh = writetime / 60;
				if(writeh > 1) {
					map.put("writeday",writeh/24/2 + "일 전");
				} else {
					int wirtem = writetime % 60;
					map.put("writeday",wirtem + "분 전");
				}
				
				JSONObject jsonobj = new JSONObject();
				jsonobj.put("asno", map.get("asno"));
				jsonobj.put("profile_systemfilename", map.get("profile_systemfilename"));
				jsonobj.put("name_kr", map.get("name_kr"));
				jsonobj.put("title", map.get("title"));
				jsonobj.put("writeday", map.get("writeday"));
				jsonarr.put(jsonobj);
			}
		}
		
		return jsonarr.toString();
	}
	
	
	@ResponseBody
	@RequestMapping(value="/updateMainAvStatus.up")
	public String updateMainAvStatus(@RequestParam Map<String,String> paraMap, HttpServletRequest request) {
		
		// 결재요청 처리하기 (승인/반려)
		int result = service.updateMainAvStatus(paraMap);
		
		JSONObject jsonobj = new JSONObject();
		jsonobj.put("result", result);
		
		return jsonobj.toString();
	}
	
	
	@ResponseBody
	@RequestMapping(value="/getMainBoardList.up")
	public String getMainBoardList(@RequestParam Map<String,String> paraMap, HttpServletRequest request) {
		
		int sizePerPage = 5;
		String curpage = paraMap.get("curpage");
		if (curpage == null) curpage = "1";
		int startRno = ((Integer.parseInt(curpage) - 1) * sizePerPage) + 1;
		int endRno = startRno + sizePerPage - 1;
		
		paraMap.put("startRno", String.valueOf(startRno));
		paraMap.put("endRno", String.valueOf(endRno));
		
		
		int total = 0;
		List<Map<String,String>> boardList;
		if("notice".equals(paraMap.get("kind"))) { //공지게시판 불러오기
			// 총페이지수알아오기
			total = service.getNbtotal();
			// 리스트 가져오기
			boardList = service.getNbList(paraMap);
			
		} else { //자유게시판일 경우
			// 총페이지수알아오기
			total = service.getFbtotal();
			// 리스트 가져오기
			boardList = service.getFbList(paraMap);
		}
		
		JSONArray jsonarr = new JSONArray();
		if(boardList != null) {
			JSONObject jsonobj1 = new JSONObject();
			jsonobj1.put("total", total);
			jsonarr.put(jsonobj1);
			
			for(Map<String,String> map : boardList) {
				JSONObject jsonobj = new JSONObject();
				if("notice".equals(paraMap.get("kind"))){
					jsonobj.put("nbno", map.get("nbno"));
				} else {
					jsonobj.put("fbno", map.get("fbno"));
					jsonobj.put("department_name", map.get("department_name"));
				}
				jsonobj.put("name_kr", map.get("name_kr"));
				jsonobj.put("subject", map.get("subject"));
				jsonobj.put("content", map.get("content"));
				jsonobj.put("writedate", map.get("writedate"));
				
				jsonarr.put(jsonobj);
			}
		}
		
		return jsonarr.toString();
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
