package com.spring.jieun.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.finalproject.common.MyUtil;
import com.spring.hyerin.model.EmployeeVO;
import com.spring.jieun.service.InterSearchService;

@Controller
public class SearchController {
	@Autowired
	private InterSearchService service;
	
	
	@ResponseBody
	@RequestMapping(value = "/searchEmpList.up", method = {RequestMethod.GET}, produces = "text/plain;charset=UTF-8")
	public String showEmpList(HttpServletRequest request, ModelAndView mav) {
		
		String searchWord_side = request.getParameter("searchWord_side");
		if(searchWord_side == null) searchWord_side = "";
		
		
		Map<String, String> paraMap = new HashMap<String, String>();
		paraMap.put("searchWord_side",searchWord_side); // ''
		
		//구성원 목록을 읽어오기
		List<EmployeeVO> empvoList = service.getEmpList(paraMap);
		
		JSONArray jsonarr = new JSONArray();
		
		//구성원 목록 저장하기
		for(EmployeeVO empvo : empvoList) {
			JSONObject jsonobj = new JSONObject();
			jsonobj.put("fk_department_no", empvo.getFk_department_no());
			jsonobj.put("department_name", empvo.getDepartment_name());
			jsonobj.put("fk_team_no", empvo.getFk_team_no());
			jsonobj.put("team_name", empvo.getTeam_name());
			jsonobj.put("employee_no", empvo.getEmployee_no());
			jsonobj.put("name_kr", empvo.getName_kr());
			jsonobj.put("role", empvo.getRole());
			jsonobj.put("position", empvo.getPosition());
			jsonobj.put("profile_systemfilename", empvo.getProfile_systemfilename());
			
			jsonarr.put(jsonobj);
		}//end of for
		
		return jsonarr.toString();
	}//end of showEmpList
	
	@ResponseBody
	@RequestMapping(value = "/searchMsgList.up", method = {RequestMethod.GET}, produces = "text/plain;charset=UTF-8")
	public String mgtotal(HttpServletRequest request, ModelAndView mav) {
		
		// 로그인된 유저 정보(receiver) 가져오기
		HttpSession session = request.getSession();
		EmployeeVO emp = (EmployeeVO) session.getAttribute("loginuser");
		String employee_no= emp.getEmployee_no();
		
		// 검색정보 가져오기
		String searchWord_side = request.getParameter("searchWord_side");
		if(searchWord_side == null) searchWord_side = ""; 
		
		Map<String, String> paraMap = new HashMap<String, String>();
		paraMap.put("searchWord_side", searchWord_side);
		paraMap.put("employee_no",employee_no);
		
		// 메시지리스트 검색 
		List<Map<String,String>> mvoList = service.getMsgList(paraMap);
		
		JSONArray jsonarr = new JSONArray();
		if(mvoList != null) {
			for(Map<String,String> map : mvoList) {
				JSONObject jsonobj = new JSONObject();
				jsonobj.put("mno", map.get("mno"));
				jsonobj.put("writer", map.get("writer"));
//				jsonobj.put("receiver", map.get(""));
				jsonobj.put("reno", map.get("reno"));
				jsonobj.put("r_name", map.get("r_name"));
				jsonobj.put("w_name", map.get("w_name"));
				jsonobj.put("subject", map.get("subject"));
				jsonobj.put("sendtime_d", map.get("sendtime_d"));
				jsonobj.put("sendtime_y", map.get("sendtime_y"));
				jsonarr.put(jsonobj);
			}//end of for
		}//end of if
		
		return jsonarr.toString();
	}//end of mgtotal
	
	@ResponseBody
	@RequestMapping(value = "/searchAppList.up", method = {RequestMethod.GET}, produces = "text/plain;charset=UTF-8")
	public String searchAppList(HttpServletRequest request, ModelAndView mav) {
		
		// 로그인된 유저 정보(receiver) 가져오기
		HttpSession session = request.getSession();
		EmployeeVO emp = (EmployeeVO) session.getAttribute("loginuser");
		String employee_no= emp.getEmployee_no();
		
		// 검색정보 가져오기
		String searchWord_side = request.getParameter("searchWord_side");
		if(searchWord_side == null) searchWord_side = ""; 
		
		Map<String, String> paraMap = new HashMap<String, String>();
		paraMap.put("searchWord_side", searchWord_side);
		paraMap.put("employee_no",employee_no);
		
		// 결재문서 리스트 검색 
		List<Map<String,String>> appList = service.getAppList(paraMap);
		
		JSONArray jsonarr = new JSONArray();
		if(appList != null) {
			for(Map<String,String> map : appList) {
				JSONObject jsonobj = new JSONObject();
				jsonobj.put("ano", map.get("ano"));
				jsonobj.put("fk_empno", map.get("fk_empno"));
				jsonobj.put("ap_type", map.get("ap_type"));
				jsonobj.put("writeday_y", map.get("writeday_y"));
				jsonobj.put("writeday_d", map.get("writeday_d"));
				jsonobj.put("name_kr", map.get("name_kr"));
				jsonarr.put(jsonobj);
			}//end of for
		}//end of if
		
		return jsonarr.toString();
	}//end of mgtotal
}
