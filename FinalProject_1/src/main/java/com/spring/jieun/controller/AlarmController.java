package com.spring.jieun.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.jieun.model.AlarmVO;
import com.spring.jieun.service.InterAlarmService;

@Controller
public class AlarmController {
	@Autowired
	private InterAlarmService service;
	
	// 알람테이블에 추가하기 
	@ResponseBody
	@PostMapping(value = "/addAlarm.up")
	public String addAlarm(HttpServletRequest request,HttpServletResponse response, @RequestBody AlarmVO avo ) {
			int n = 0;
			  
			if(avo != null) {
				n = service.addAlarm(avo);
			}
			
			JSONObject jsonobj = new JSONObject();
			jsonobj.put("result", n);
			
			return jsonobj.toString(); // "[]" 또는 "[{},{},{}]"
	}
	
	// 알림 목록 가져오기 
	@ResponseBody
	@RequestMapping(value = "/alarmList.up", method = {RequestMethod.GET})
	public String alarmList(HttpServletRequest request,HttpServletResponse response) {
		String employee_no = request.getParameter("empno"); 
		
		List<AlarmVO> alarmList = null; 
		alarmList = service.alarmList(employee_no);
		
		JSONArray jsonarr = new JSONArray(); // []
		
		if(alarmList  != null) {
			for(AlarmVO alvo: alarmList) {
				JSONObject jsonobj = new JSONObject();
				jsonobj.put("amno", alvo.getAmno());
				jsonobj.put("from_empname", alvo.getFrom_empname());
				jsonobj.put("to_empno", alvo.getTo_empno());
				jsonobj.put("ctgy", alvo.getCtgy());
				jsonobj.put("ctnt", alvo.getCtnt());
				jsonobj.put("linkno", alvo.getLinkno());
				jsonobj.put("readyn", alvo.getReadyn());
				jsonobj.put("registerdate", alvo.getRegisterdate());
				jsonarr.put(jsonobj);
			}
		}
		
		return jsonarr.toString(); // "[]" 또는 "[{},{},{}]"
	}
	// 알림 클릭시 읽음처리  
	@ResponseBody
	@RequestMapping(value = "/alarmRead.up", method = {RequestMethod.GET})
	public String alarmRead(HttpServletRequest request,HttpServletResponse response) {
		String amno = request.getParameter("amno"); 
		int n = 0;
		n = service.alarmRead(amno);
		
		JSONObject jsonobj = new JSONObject();
		jsonobj.put("result", n);
		
		return jsonobj.toString(); // "[]" 또는 "[{},{},{}]"
	}
}
