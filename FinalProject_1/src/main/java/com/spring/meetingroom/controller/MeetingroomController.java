package com.spring.meetingroom.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.chae0.service.InterMeetingroomService;
import com.spring.hyerin.model.EmployeeVO;

@Controller
public class MeetingroomController {
	
	@Autowired
	private InterMeetingroomService service;  
	 
	
	@RequestMapping(value="/support/meetingroom.up")
	public ModelAndView meetingroom(HttpServletRequest request, ModelAndView mav){
		mav.setViewName("reservation/meetingroom.tiles");
		return mav;
	}
	
	
	/*
	// 회의실 예약하기 
	@ResponseBody     
	@RequestMapping(value="/support/meetingroom.up", produces="text/plain;charset=UTF-8")
	public String meetingadd(HttpServletRequest request, HttpServletResponse response) throws Exception {  
		
		String[] sdateArr = request.getParameterValues("startTimeArr");  // 시작시간 배열
		String[] edateArr = request.getParameterValues("endTimeArr");  	 // 종료시간 배열
		String todaydate = request.getParameter("todaydate"); 			 // 오늘 날짜
		String r_content = request.getParameter("r_content"); 			 // 내용 
		
		// 로그인된 유저의 employee_no 알아오기
		HttpSession session = request.getSession();
		EmployeeVO loginuser = (EmployeeVO) session.getAttribute("loginuser");
		String fk_employee_no = loginuser.getEmployee_no();
		
		JSONObject jsonobj = new JSONObject();
		
		//int n = 0;
        int n2 = 0; 
		for (int i = 0; i < edateArr.length; i++) {
			Map<String, String> paraMap = new HashMap<String, String>();
			String year = todaydate.substring(0,4);
			String month = todaydate.substring(6,8);
			String day = todaydate.substring(10,12);
			
			String r_startdate = year+'-'+month+'-'+day+' '+ sdateArr[i];
			String r_enddate = year+'-'+month+'-'+day+' '+edateArr[i];
			//String selectdate = year+'-'+month+'-'+day;
			
			paraMap.put("fk_employee_no", fk_employee_no);   
	        paraMap.put("r_startdate", r_startdate); 
	        paraMap.put("r_enddate", r_enddate);  
	        paraMap.put("r_content", r_content);   
	        
	        System.out.println("fk_employee_no : " +fk_employee_no); 
	        System.out.println("r_startdate : " +r_startdate);
	        System.out.println("r_enddate : "+r_enddate);
	        System.out.println("r_content : "+r_content);
	        
	        
			try {
				//n = service.atdetailAllDel(paraMap); // 해당날짜 전부 삭제 
				//if(n != 0) { 
					n2 = service.addMeetingroom(paraMap); // 해당날짜 다시 insert 
				//}
			} catch (Exception e) {
				e.printStackTrace();  // 콘솔에만 찍어준다.
			}
			
		}
		
		//jsonobj.put("n", n);  
		jsonobj.put("n", n2);
		return jsonobj.toString();
	}
	*/ 
	 
	// === 회의실 예약하기 === 
	@RequestMapping(value="/support/meetingroom_add.up", method = {RequestMethod.POST}) 
	public ModelAndView meetingroom_add(ModelAndView mav, HttpServletRequest request) throws Throwable {
		
		String startdate = request.getParameter("startdate");  
		String enddate = request.getParameter("enddate"); 
		
		System.out.println("확인용 startdate => " + startdate);
		System.out.println("확인용 enddate => " + enddate); 
		
		 
		String r_content = request.getParameter("r_content");
		System.out.println("확인용 r_content => " + r_content);  
		
		String fk_employee_no = request.getParameter("fk_employee_no");
		System.out.println("확인용 fk_employee_no => " + fk_employee_no);   
		
		String fk_roomno = request.getParameter("fk_roomno");
		System.out.println("확인용 fk_roomno => " + fk_roomno);   
		
		
		Map<String,String> paraMap = new HashMap<String, String>();
		paraMap.put("startdate", startdate);
		paraMap.put("enddate", enddate);
		paraMap.put("r_content", r_content); 
		paraMap.put("fk_employee_no", fk_employee_no);
		paraMap.put("fk_roomno", fk_roomno);
		
		int n = service.meetingroom_add(paraMap);
 
		if(n == 0) {
			mav.addObject("message", "예약 실패하였습니다.");
		}
		else {
			mav.addObject("message", "예약 성공하였습니다.");
		}
		
		mav.addObject("loc", request.getContextPath()+"/support/meetingroom.up");
		
		mav.setViewName("msg");
		
		return mav;
	}
	
		
	
}
