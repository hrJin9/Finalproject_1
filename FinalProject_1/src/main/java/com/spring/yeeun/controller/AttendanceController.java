package com.spring.yeeun.controller;

import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.hyerin.model.EmployeeVO;
import com.spring.yeeun.model.AttendanceVO;
import com.spring.yeeun.model.DayoffVO;
import com.spring.yeeun.service.InterAttendanceService;

@Controller
public class AttendanceController {
	
	@Autowired
	private InterAttendanceService service;
	
	
	// ** 근무 ** //
	// 근무 기본페이지
	@RequestMapping(value = "/attendance.up")
	public ModelAndView rl_attendance(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) { 
		mav.setViewName("attendance/attendance.tiles"); 
		return mav; 
	}
	
	
	
	// 근무상태 저장하기
	@ResponseBody     // return 되는 값은 View 단 페이지를 통해서 출력되는 것이 아니라 return 되어지는 값 그 자체를 웹브라우저에 바로 직접 쓰여지게 하는 것이다. JSON 결과물을 보일때는 css 태그 와 같은 view단 태그는 필요없이  결과물만 찍어주면 되기 때문이다.
	@RequestMapping(value="/attendancadd.up", produces="text/plain;charset=UTF-8") // 웹브라우저에 출력되는 한글이 안 깨지기 위해 produces="text/plain;charset=UTF-8" 붙여준다.
	public String attendancadd(HttpServletRequest request, HttpServletResponse response) throws Exception {  // Ajax 방식은 view단 태그는 필요없이  결과물만 찍어주면 되기 때문에 항상 String 타입으로 해준다.
		
		String[] adcatgoArr = request.getParameterValues("attendancetypeArr"); // 근무형태 배열
		String[] sdateArr = request.getParameterValues("startTimeArr");  // 시작시간 배열
		String[] edateArr = request.getParameterValues("endTimeArr");  // 종료시간 배열
		String todaydate = request.getParameter("todaydate"); // 오늘 날짜
		
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
			
			String startTime = year+'-'+month+'-'+day+' '+ sdateArr[i];
			String endTime = year+'-'+month+'-'+day+' '+edateArr[i];
			//String selectdate = year+'-'+month+'-'+day;
			
			paraMap.put("fk_employee_no", fk_employee_no);  
			paraMap.put("adcatgo", adcatgoArr[i]); 
	        paraMap.put("startTime", startTime); 
	        paraMap.put("endTime", endTime); 
	        //paraMap.put("selectdate", selectdate); 
	        
	        //System.out.println("fk_employee_no : "+fk_employee_no);
	        //System.out.println("adcatgo : "+adcatgoArr[i]);
	        //S/ystem.out.println("startdate : " +startdate);
	        //System.out.println("enddate : "+enddate);
	        
	        
			try {
				//n = service.atdetailAllDel(paraMap); // 해당날짜 전부 삭제
				//if(n != 0) {
					n2 = service.addAttendance(paraMap); // 해당날짜 다시 insert
				//}
			} catch (Exception e) {
				e.printStackTrace();  // 콘솔에만 찍어준다.
			}
			
		}
		
		//jsonobj.put("n", n);  
		jsonobj.put("n", n2);
		return jsonobj.toString();
	}
	
	
	
	// 저장한 근무상태 조회하기
	@ResponseBody     // return 되는 값은 View 단 페이지를 통해서 출력되는 것이 아니라 return 되어지는 값 그 자체를 웹브라우저에 바로 직접 쓰여지게 하는 것이다. JSON 결과물을 보일때는 css 태그 와 같은 view단 태그는 필요없이  결과물만 찍어주면 되기 때문이다.
	@RequestMapping(value="/attendanceView.up", method= {RequestMethod.POST}, produces="text/plain;charset=UTF-8") // 웹브라우저에 출력되는 한글이 안 깨지기 위해 produces="text/plain;charset=UTF-8" 붙여준다.
	public String attendanceView(HttpServletRequest request) throws Throwable {  // Ajax 방식은 view단 태그는 필요없이  결과물만 찍어주면 되기 때문에 항상 String 타입으로 해준다.
		
		String seldate = request.getParameter("seldate"); // 선택한 날짜
		//System.out.println("seldate : " +seldate);
		
		// 로그인된 유저의 employee_no 알아오기
		HttpSession session = request.getSession();
		EmployeeVO loginuser = (EmployeeVO) session.getAttribute("loginuser");
		String fk_employee_no = loginuser.getEmployee_no();
		
		String year = seldate.substring(0,4);
		String month = seldate.substring(6,8);
		String day = seldate.substring(10,12);
		String selectdate = year+'-'+month+'-'+day;
		//System.out.println("selectdate : "+selectdate);
		
		Map<String, String> paraMap = new HashMap<>();
		paraMap.put("fk_employee_no", fk_employee_no);
		paraMap.put("selectdate", selectdate);
		
		List<AttendanceVO> attendancedetail = service.atdetailView(paraMap);
		
		JSONArray jsonArr = new JSONArray();  // []
		
		if(attendancedetail != null) {
			for(AttendanceVO atvo : attendancedetail) {
				JSONObject jsonObj = new JSONObject(); // JSON 객체 생성
				jsonObj.put("adno", atvo.getAdno());
				jsonObj.put("fk_employee_no", atvo.getFk_employee_no());
				jsonObj.put("adcatgo", atvo.getAdcatgo());
				jsonObj.put("startTime", atvo.getStartTime());
				jsonObj.put("endTime", atvo.getEndTime());
				jsonObj.put("workTime", atvo.getWorkTime());
				jsonObj.put("workMin", atvo.getWorkMin());
				jsonArr.put(jsonObj);
				
			}// end of for------------------
		}
		
		return jsonArr.toString();
	}		
	
	
	
	// 저장한 근무상태 한개 삭제하기
	@ResponseBody     // return 되는 값은 View 단 페이지를 통해서 출력되는 것이 아니라 return 되어지는 값 그 자체를 웹브라우저에 바로 직접 쓰여지게 하는 것이다. JSON 결과물을 보일때는 css 태그 와 같은 view단 태그는 필요없이  결과물만 찍어주면 되기 때문이다.
	@RequestMapping(value="/attendancadel.up", produces="text/plain;charset=UTF-8") // 웹브라우저에 출력되는 한글이 안 깨지기 위해 produces="text/plain;charset=UTF-8" 붙여준다.
	public String attendancadel(HttpServletRequest request) throws Exception {  // Ajax 방식은 view단 태그는 필요없이  결과물만 찍어주면 되기 때문에 항상 String 타입으로 해준다.
		
		// 삭제해야할 글번호 가져오기
		String adno = request.getParameter("adno");
		//System.out.println(adno);
		
		int n = 0;
		try {
			n = service.atdetailDel(adno); 
			
		} catch (Exception e) {
			e.printStackTrace();  // 콘솔에만 찍어준다.
		}
		
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("n", n);
		return jsonObj.toString();
	}
	
	
	// 근무상태 전부 삭제하기
	@ResponseBody     // return 되는 값은 View 단 페이지를 통해서 출력되는 것이 아니라 return 되어지는 값 그 자체를 웹브라우저에 바로 직접 쓰여지게 하는 것이다. JSON 결과물을 보일때는 css 태그 와 같은 view단 태그는 필요없이  결과물만 찍어주면 되기 때문이다.
	@RequestMapping(value="/attendancaAllDel.up", produces="text/plain;charset=UTF-8") // 웹브라우저에 출력되는 한글이 안 깨지기 위해 produces="text/plain;charset=UTF-8" 붙여준다.
	public String attendancaAllDel(HttpServletRequest request) throws Exception {  // Ajax 방식은 view단 태그는 필요없이  결과물만 찍어주면 되기 때문에 항상 String 타입으로 해준다.
		
		// 삭제해야할 글번호 가져오기
		String seldate = request.getParameter("seldate"); // 선택한 날짜
		//System.out.println("seldate : " + seldate);
		
		String year = seldate.substring(0,4);
		String month = seldate.substring(6,8);
		String day = seldate.substring(10,12);
		String selectdate = year+'-'+month+'-'+day;
		//System.out.println("selectdate : "+selectdate);
		
		// 로그인된 유저의 employee_no 알아오기
		HttpSession session = request.getSession();
		EmployeeVO loginuser = (EmployeeVO) session.getAttribute("loginuser");
		String fk_employee_no = loginuser.getEmployee_no();
		
		Map<String, String> paraMap = new HashMap<>();
		paraMap.put("selectdate", selectdate);
		paraMap.put("fk_employee_no", fk_employee_no);
		
		int n = 0;
		try {
			n = service.atdetailAllDel(paraMap); 
			
		} catch (Exception e) {
			e.printStackTrace();  // 콘솔에만 찍어준다.
		}
		
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("n", n);
		return jsonObj.toString();
	}
	
	
	
	
	// 하루치 시작,종료시간 조회해오기
	@ResponseBody     // return 되는 값은 View 단 페이지를 통해서 출력되는 것이 아니라 return 되어지는 값 그 자체를 웹브라우저에 바로 직접 쓰여지게 하는 것이다. JSON 결과물을 보일때는 css 태그 와 같은 view단 태그는 필요없이  결과물만 찍어주면 되기 때문이다.
	@RequestMapping(value="/getworkTimebyDay.up", produces="text/plain;charset=UTF-8") // 웹브라우저에 출력되는 한글이 안 깨지기 위해 produces="text/plain;charset=UTF-8" 붙여준다.
	public String getworkTimebyDay(HttpServletRequest request) throws Throwable {  // Ajax 방식은 view단 태그는 필요없이  결과물만 찍어주면 되기 때문에 항상 String 타입으로 해준다.
		
		String[] thisWeekDate = request.getParameterValues("thisWeekDate"); // 이번주 날짜
		//System.out.println("thisWeekDate.length >> "+thisWeekDate.length);
		
		// 로그인된 유저의 employee_no 알아오기
		HttpSession session = request.getSession();
		EmployeeVO loginuser = (EmployeeVO) session.getAttribute("loginuser");
		String fk_employee_no = loginuser.getEmployee_no();
		
		JSONArray jsonArr = new JSONArray();  // []
		
		for (int i = 0; i < thisWeekDate.length; i++) {
			Map<String, String> paraMap = new HashMap<String, String>();
			String year = thisWeekDate[i].substring(0, 4);
			String month = thisWeekDate[i].substring(6, 8);
			String day = thisWeekDate[i].substring(10, 12);
			String thisWeekDay = year+'-'+month+'-'+day;
			
			paraMap.put("fk_employee_no", fk_employee_no);  
			paraMap.put("thisWeekDay", thisWeekDay); 
			
			List<AttendanceVO> workTimeList = service.getworkTimebyDay(paraMap);
			
			if(!workTimeList.isEmpty()) {
				
				for (int j = 0; j < workTimeList.size(); j++) {
					JSONObject jsonObj = new JSONObject(); // JSON 객체 생성
					jsonObj.put("seldate", workTimeList.get(j).getSeldate());
					jsonObj.put("startTime", workTimeList.get(j).getStartTime());
					jsonObj.put("endTime", workTimeList.get(j).getEndTime());
					
					jsonArr.put(jsonObj);
				}
				
			} else {
				JSONObject jsonObj = new JSONObject(); // JSON 객체 생성
				jsonObj.put("seldate", "null"); 
				jsonObj.put("startTime", "null"); 
				jsonObj.put("endTime", "null"); 
				jsonArr.put(jsonObj);
			}
			
		}
		
		return jsonArr.toString();
	}		
	
	
	/*
	// 총 근무시간 및 시작,종료시간 조회해오기
	@ResponseBody     // return 되는 값은 View 단 페이지를 통해서 출력되는 것이 아니라 return 되어지는 값 그 자체를 웹브라우저에 바로 직접 쓰여지게 하는 것이다. JSON 결과물을 보일때는 css 태그 와 같은 view단 태그는 필요없이  결과물만 찍어주면 되기 때문이다.
	@RequestMapping(value="/getworkTimebyDay.up", produces="text/plain;charset=UTF-8") // 웹브라우저에 출력되는 한글이 안 깨지기 위해 produces="text/plain;charset=UTF-8" 붙여준다.
	public String getworkTimebyDay(HttpServletRequest request) throws Throwable {  // Ajax 방식은 view단 태그는 필요없이  결과물만 찍어주면 되기 때문에 항상 String 타입으로 해준다.
		
		String[] thisWeekDate = request.getParameterValues("thisWeekDate"); // 이번주 날짜
		//System.out.println("thisWeekDate.length >> "+thisWeekDate.length);
		
		// 로그인된 유저의 employee_no 알아오기
		HttpSession session = request.getSession();
		EmployeeVO loginuser = (EmployeeVO) session.getAttribute("loginuser");
		String fk_employee_no = loginuser.getEmployee_no();
		
		JSONArray jsonArr = new JSONArray();  // []
		
		for (int i = 0; i < thisWeekDate.length; i++) {
			Map<String, String> paraMap = new HashMap<String, String>();
			String year = thisWeekDate[i].substring(0, 4);
			String month = thisWeekDate[i].substring(6, 8);
			String day = thisWeekDate[i].substring(10, 12);
			String thisWeekDay = year+'-'+month+'-'+day;
			
			paraMap.put("fk_employee_no", fk_employee_no);  
			paraMap.put("thisWeekDay", thisWeekDay); 
			
			List<AttendanceVO> workTimeList = service.getworkTimebyDay(paraMap);
			
			if(!workTimeList.isEmpty()) {
				
				for (int j = 0; j < workTimeList.size(); j++) {
					JSONObject jsonObj = new JSONObject(); // JSON 객체 생성
					jsonObj.put("adno", workTimeList.get(j).getAdno());
					jsonObj.put("fk_employee_no", workTimeList.get(j).getFk_employee_no());
					jsonObj.put("adcatgo", workTimeList.get(j).getAdcatgo());
					jsonObj.put("seldate", workTimeList.get(j).getSeldate());
					jsonObj.put("startTime", workTimeList.get(j).getStartTime());
					jsonObj.put("endTime", workTimeList.get(j).getEndTime());
					jsonObj.put("workTime", workTimeList.get(j).getWorkTime());
					jsonObj.put("workMin", workTimeList.get(j).getWorkMin());
					jsonObj.put("totalTime", workTimeList.get(j).getTotalTime());
					System.out.println("seldate_or :" +workTimeList.get(j).getSeldate());
        			System.out.println("startTime_or :" +workTimeList.get(j).getStartTime());
        			System.out.println("endTime_or :" +workTimeList.get(j).getEndTime());
					
					jsonArr.put(jsonObj);
				}
				
			} else {
				JSONObject jsonObj = new JSONObject(); // JSON 객체 생성
				jsonObj.put("adno", "null"); 
				jsonObj.put("fk_employee_no", "null"); 
				jsonObj.put("seldate", "null"); 
				jsonObj.put("startTime", "null"); 
				jsonObj.put("endTime", "null"); 
				jsonObj.put("workTime", "null"); 
				jsonObj.put("workMin", "null"); 
				jsonArr.put(jsonObj);
			}
		}
		return jsonArr.toString();
	}		
	*/
	
	
	// 하루치 총 근무시간 구하기
	@ResponseBody     // return 되는 값은 View 단 페이지를 통해서 출력되는 것이 아니라 return 되어지는 값 그 자체를 웹브라우저에 바로 직접 쓰여지게 하는 것이다. JSON 결과물을 보일때는 css 태그 와 같은 view단 태그는 필요없이  결과물만 찍어주면 되기 때문이다.
	@RequestMapping(value="/totalTimebyDay.up", produces="text/plain;charset=UTF-8") // 웹브라우저에 출력되는 한글이 안 깨지기 위해 produces="text/plain;charset=UTF-8" 붙여준다.
	public String totalTimebyDay(HttpServletRequest request) throws Throwable {  // Ajax 방식은 view단 태그는 필요없이  결과물만 찍어주면 되기 때문에 항상 String 타입으로 해준다.
		
		String[] thisWeekDate = request.getParameterValues("thisWeekDate"); // 이번주 날짜
		
		// 로그인된 유저의 employee_no 알아오기
		HttpSession session = request.getSession();
		EmployeeVO loginuser = (EmployeeVO) session.getAttribute("loginuser");
		String fk_employee_no = loginuser.getEmployee_no();
		
		JSONArray jsonArr = new JSONArray();  // []
		
		for (int i = 0; i < thisWeekDate.length; i++) {
			Map<String, String> paraMap = new HashMap<String, String>();
			String year = thisWeekDate[i].substring(0, 4);
			String month = thisWeekDate[i].substring(6, 8);
			String day = thisWeekDate[i].substring(10, 12);
			String thisWeekDay = year+'-'+month+'-'+day;
			
			paraMap.put("fk_employee_no", fk_employee_no);  
			paraMap.put("thisWeekDay", thisWeekDay); 
			//System.out.println("여기에요 thisWeekDay >>>>>>>>> "+thisWeekDay);

			List<AttendanceVO> totalworkTimeList = service.getTotalworkTimebyDay(paraMap);
				
			int realtotal = 0;
			for (int j = 0; j < totalworkTimeList.size(); j++) {
				JSONObject jsonObj = new JSONObject(); // JSON 객체 생성
    			jsonObj.put("seldate", totalworkTimeList.get(j).getSeldate());
				//System.out.println("seldate :" +totalworkTimeList.get(j).getSeldate());
				//System.out.println("totalTime :" +totalworkTimeList.get(j).getTotalTime());
    			if(Integer.parseInt(totalworkTimeList.get(j).getTotalTime()) <= 240) { // 반차 근무
    				realtotal = Integer.parseInt(totalworkTimeList.get(j).getTotalTime());
    			} else {
    				realtotal = Integer.parseInt(totalworkTimeList.get(j).getTotalTime()) - 60;
    			}
    			
				int workTime = realtotal / 60;  // 몫
    			int workMin = realtotal % 60;   // 나머지
    			//System.out.println("realtotal :" +realtotal);
    			//System.out.println("workTime :" +workTime);
    			//System.out.println("workMin :" +workMin);
    			jsonObj.put("workTime", workTime);
    			jsonObj.put("workMin", workMin);
				jsonArr.put(jsonObj);
			} 
		}
		
		return jsonArr.toString();
	}
	
	
	// 일주일치 총 근무시간 구하기
	@ResponseBody     // return 되는 값은 View 단 페이지를 통해서 출력되는 것이 아니라 return 되어지는 값 그 자체를 웹브라우저에 바로 직접 쓰여지게 하는 것이다. JSON 결과물을 보일때는 css 태그 와 같은 view단 태그는 필요없이  결과물만 찍어주면 되기 때문이다.
	@RequestMapping(value="/totalTimebyWeek.up", produces="text/plain;charset=UTF-8") // 웹브라우저에 출력되는 한글이 안 깨지기 위해 produces="text/plain;charset=UTF-8" 붙여준다.
	public String totalTimebyWeek(HttpServletRequest request) throws Throwable {  // Ajax 방식은 view단 태그는 필요없이  결과물만 찍어주면 되기 때문에 항상 String 타입으로 해준다.
		
		String[] thisWeekDate = request.getParameterValues("thisWeekDate"); // 이번주 날짜
		//System.out.println("thisWeekDate >>> "+thisWeekDate);
		
		// 로그인된 유저의 employee_no 알아오기
		HttpSession session = request.getSession();
		EmployeeVO loginuser = (EmployeeVO) session.getAttribute("loginuser");
		String fk_employee_no = loginuser.getEmployee_no();
		
		JSONObject jsonObj = new JSONObject(); // JSON 객체 생성
		
		float realtotal = 0;
		int size = 0;
		int workTimeList_length = 0;
		for (int i = 0; i < thisWeekDate.length; i++) {
			Map<String, String> paraMap = new HashMap<String, String>();
			String year = thisWeekDate[i].substring(0, 4);
			String month = thisWeekDate[i].substring(6, 8);
			String day = thisWeekDate[i].substring(10, 12);
			String thisWeekDay = year+'-'+month+'-'+day;
			//System.out.println("thisWeekDay >>>>>>>>>>> "+thisWeekDay);
			
			paraMap.put("fk_employee_no", fk_employee_no);  
			paraMap.put("thisWeekDay", thisWeekDay); 
			
			List<AttendanceVO> totalworkTimeList = service.getTotalworkTimebyWeek(paraMap);
			
			for (int j = 0; j < totalworkTimeList.size(); j++) {
				realtotal += Integer.parseInt(totalworkTimeList.get(j).getTotalTime());
				//System.out.println("realtotal >>>>>>>" +realtotal);
			}
			size = totalworkTimeList.size();
			workTimeList_length += size;
			//System.out.println("size : "+size);
		}
		//System.out.println("workTimeList_length : "+workTimeList_length);
		
		// 근무한 날짜 개수만큼 근무시간 빼줘야함 .!!!
		realtotal = realtotal - (workTimeList_length*60);
		int workTime = (int)(realtotal / 60);  // 몫
		int workMin = (int)(realtotal % 60);   // 나머지
		
		int realtotal_per = Math.round((realtotal/3120)*100);
		//System.out.println("realtotal_per : " +realtotal_per);
		
		jsonObj.put("workTime", workTime);
		jsonObj.put("workMin", workMin);
		jsonObj.put("realtotal_per", realtotal_per);
		
		//jsonObj.put("workTimeList_length", workTimeList_length);
		return jsonObj.toString();
	}		

	
	
	
	
	
	
	
	
	
	
	//////////////////////////////////////////////////////////////////////////////////////////////
	// ** 휴가 개요 ** //
	@RequestMapping(value = "/dayoff/index.up")
	public ModelAndView dayoff_index(HttpServletRequest request, ModelAndView mav) throws ParseException {
		
		// getCurrentURL(request);  // 로그아웃을 했을 때 현재 보이던 그 페이지 그대로 돌아가기 위한 메소드 호출
		
		// 로그인된 유저의 employee_no 알아오기
		HttpSession session = request.getSession();
		EmployeeVO loginuser = (EmployeeVO) session.getAttribute("loginuser");
		String fk_employee_no = loginuser.getEmployee_no();
		String position = loginuser.getPosition();
		
		int dayoff_receiveCnt = 0;
		if("사원".equals(position)) {
			dayoff_receiveCnt = 12;
		} else if("대리".equals(position)) {
			dayoff_receiveCnt = 14;
		} else if("과장".equals(position)) {
			dayoff_receiveCnt = 16;
		} else if("부장".equals(position)) {
			dayoff_receiveCnt = 18;
		} else if("대표".equals(position)) {
			dayoff_receiveCnt = 20;
		}
		
		List<DayoffVO> dayoffList = new ArrayList<DayoffVO>();
		dayoffList = service.dayoffListView(fk_employee_no);
		List<DayoffVO> comedayoff = new ArrayList<DayoffVO>();  // 예정연차
		List<DayoffVO> lastdayoff = new ArrayList<DayoffVO>();  // 사용연차
		
		for(DayoffVO list : dayoffList) {
			// 현재 날짜 구하기
			Date now = new Date();
			SimpleDateFormat format = new SimpleDateFormat("yyyy. MM. dd");
			Date date = format.parse(list.getStartdate());
			
			int compare = now.compareTo(date);
			if(compare < 0) { // 예정연차
				comedayoff.add(list);
				
			}else {  // 사용연차
				lastdayoff.add(list);
			}
		}
		
		double lastUsedays = 0;
		for(DayoffVO lastdolist : lastdayoff) {
			lastUsedays += Double.parseDouble(lastdolist.getUsedays()); // 올해 총 사용연차
		}// end of for------------------
		//System.out.println("lastUsedays >> "+ lastUsedays);
		
		DecimalFormat formatt = new DecimalFormat("##.#");
		mav.addObject("lastUsedays", formatt.format(lastUsedays)); // 올해 총 사용연차
		mav.addObject("dayoff_receiveCnt", dayoff_receiveCnt);    // 올해 부여받은 총 연차
	    mav.addObject("comedayoff", comedayoff);   // 구해온 값이 null이 아니라면 comedayoff를 dayoff_index.jsp 에 넘긴다.
	    mav.addObject("lastdayoff", lastdayoff);   // 구해온 값이 null이 아니라면 lastdayoff를 dayoff_index.jsp 에 넘긴다.
		mav.setViewName("attendance/dayoff_index.tiles");
		return mav;
		
	}
	
	
	// 년도별 휴가 개요 ajax로 보여주기
	@ResponseBody     // return 되는 값은 View 단 페이지를 통해서 출력되는 것이 아니라 return 되어지는 값 그 자체를 웹브라우저에 바로 직접 쓰여지게 하는 것이다. JSON 결과물을 보일때는 css 태그 와 같은 view단 태그는 필요없이  결과물만 찍어주면 되기 때문이다.
	@RequestMapping(value="/dayoff/index2.up", method= {RequestMethod.POST}, produces="text/plain;charset=UTF-8") // 웹브라우저에 출력되는 한글이 안 깨지기 위해 produces="text/plain;charset=UTF-8" 붙여준다.
	public String dayoff_index2(HttpServletRequest request) throws Throwable {  // Ajax 방식은 view단 태그는 필요없이  결과물만 찍어주면 되기 때문에 항상 String 타입으로 해준다.
		
		String year = request.getParameter("year"); 
		
		// 로그인된 유저의 employee_no 알아오기
		HttpSession session = request.getSession();
		EmployeeVO loginuser = (EmployeeVO) session.getAttribute("loginuser");
		String fk_employee_no = loginuser.getEmployee_no();
		
		Map<String, String> paraMap = new HashMap<>();
		paraMap.put("year", year);
		paraMap.put("fk_employee_no", fk_employee_no);
		
		List<DayoffVO> dayoffList = service.dayoffListViewByYear(paraMap);
		
		JSONArray jsonArr = new JSONArray();  // []
		
		if(dayoffList != null) {
			for(DayoffVO dovo : dayoffList) {
				JSONObject jsonObj = new JSONObject(); // JSON 객체 생성
				jsonObj.put("fk_employee_no", dovo.getFk_employee_no());
				jsonObj.put("docatgo", dovo.getDocatgo());
				jsonObj.put("startdate", dovo.getStartdate());
				jsonObj.put("startday", dovo.getStartday());
				jsonObj.put("enddate", dovo.getEnddate());
				jsonObj.put("endday", dovo.getEndday());
				jsonObj.put("usedays", dovo.getUsedays());
				jsonArr.put(jsonObj);
			}// end of for------------------
		}
		
		return jsonArr.toString();
	}	
	

	
	
	// ** 연차상세 ** //
	@RequestMapping(value = "/dayoff/detail.up")
	public ModelAndView dayoff_detail(HttpServletRequest request, ModelAndView mav) throws ParseException {
		
		// 로그인된 유저의 employee_no 알아오기
		HttpSession session = request.getSession();
		EmployeeVO loginuser = (EmployeeVO) session.getAttribute("loginuser");
		String fk_employee_no = loginuser.getEmployee_no();
		String position = loginuser.getPosition();
		
		int dayoff_defaultCnt = 0;
		if("사원".equals(position)) {
			dayoff_defaultCnt = 1;
		} else if("대리".equals(position)) {
			dayoff_defaultCnt = 3;
		} else if("과장".equals(position)) {
			dayoff_defaultCnt = 5;
		} else if("부장".equals(position)) {
			dayoff_defaultCnt = 7;
		} else if("대표".equals(position)) {
			dayoff_defaultCnt = 9;
		}
		
		List<DayoffVO> dayoffList = new ArrayList<DayoffVO>();  // 예정 + 사용연차
		dayoffList = service.dayoffListView(fk_employee_no);
		
		List<DayoffVO> lastdayoff = new ArrayList<DayoffVO>();  // 사용연차
		
		for(DayoffVO list : dayoffList) {
			// 현재 날짜 구하기
			Date now = new Date();
			SimpleDateFormat format = new SimpleDateFormat("yyyy. MM. dd");
			Date date = format.parse(list.getStartdate());
			
			int compare = now.compareTo(date);
			if(compare > 0) { // 사용연차
				lastdayoff.add(list);
			}
			
		}
		
		double lastUsedays = 0;
		double aa = 0;
		double bb = 0;
		double cc = 0;
		double dd = 0;
		double ee = 0;
		double ff = 0;
		double gg = 0;
		double hh = 0;
		double ii = 0;
		double jj = 0;
		double kk = 0;
		double ll = 0;
		
		for(DayoffVO lastdolist : lastdayoff) {
			
			int date = Integer.parseInt(lastdolist.getStartdate().substring(6,8));
			double result = Double.parseDouble(lastdolist.getUsedays());
			
			switch (date) {
			case 1: date = 1;
				aa = aa + result;
				break;
			case 2: date = 2;
				bb = bb + result;
				break;
			case 3: date = 3;
				cc = cc + result;
				break;
			case 4: date = 4;
				dd = dd + result;
				break;
			case 5: date = 5;
				ee = ee + result;
				break;
			case 6: date = 6;
				ff = ff + result;
				break;
			case 7: date = 7;
				gg = gg + result;
				break;
			case 8: date = 8;
				hh = hh + result;
				break;
			case 9: date = 9;
				ii = ii + result;
				break;
			case 10: date = 10;
				jj = jj + result;
				break;
			case 11: date = 11;
				kk = kk + result;
				break;
			case 12: date = 12;
				ll = ll + result;
				break;
			}
			
			lastUsedays += Double.parseDouble(lastdolist.getUsedays()); // 올해 총 사용연차
		}// end of for------------------
		
		DecimalFormat format = new DecimalFormat("##.#");
		List<Object> list =  new ArrayList<Object>();
		list.add(format.format(aa));
		list.add(format.format(bb));
		list.add(format.format(cc));
		list.add(format.format(dd));
		list.add(format.format(ee));
		list.add(format.format(ff));
		list.add(format.format(gg));
		list.add(format.format(hh));
		list.add(format.format(ii));
		list.add(format.format(jj));
		list.add(format.format(kk));
		list.add(format.format(ll));
		
		
		Date now = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy.MM");  // 포맷 정의
        int thisyyyy = Integer.parseInt(formatter.format(now).substring(0, 4)); // 포맷팅 적용 => yyyy
        int thismm = Integer.parseInt(formatter.format(now).substring(5, 7)); // 포맷팅 적용 => mm
		//System.out.println("올해 총 사용연차 : "+ lastUsedays);
		
		// 잔여연차 구하기 (해당 empno사원의 정보 가져오기)
		//EmployeeVO evo = service.getempvo(fk_employee_no);
		
		mav.addObject("lastUsedays", format.format(lastUsedays)); // 올해 총 사용연차
		mav.addObject("dayoff_defaultCnt", dayoff_defaultCnt);    // 올해 1월 부여받은 연차
		mav.addObject("dayoff_receiveCnt", dayoff_defaultCnt +11);    // 올해 부여받은 총 연차
		mav.addObject("list", list);          // 월별 연차사용
		mav.addObject("thisyyyy", thisyyyy);  // 이번년도
		mav.addObject("thismm", thismm);      // 이번달
    	mav.setViewName("attendance/dayoff_detail.tiles");
		return mav;
	}
	
	
	/*
	// 년도별 연차 상세 ajax로 보여주기
	@ResponseBody     // return 되는 값은 View 단 페이지를 통해서 출력되는 것이 아니라 return 되어지는 값 그 자체를 웹브라우저에 바로 직접 쓰여지게 하는 것이다. JSON 결과물을 보일때는 css 태그 와 같은 view단 태그는 필요없이  결과물만 찍어주면 되기 때문이다.
	@RequestMapping(value="/dayoff/detail2.up", method= {RequestMethod.POST}, produces="text/plain;charset=UTF-8") // 웹브라우저에 출력되는 한글이 안 깨지기 위해 produces="text/plain;charset=UTF-8" 붙여준다.
	public String dayoff_detail2(HttpServletRequest request) throws Throwable {  // Ajax 방식은 view단 태그는 필요없이  결과물만 찍어주면 되기 때문에 항상 String 타입으로 해준다.
		
		String year = request.getParameter("year"); 
		//System.out.println(year);
		
		// 로그인된 유저의 employee_no 알아오기
		HttpSession session = request.getSession();
		EmployeeVO loginuser = (EmployeeVO) session.getAttribute("loginuser");
		String fk_employee_no = loginuser.getEmployee_no();
		
		Map<String, String> paraMap = new HashMap<>();
		paraMap.put("year", year);
		paraMap.put("fk_employee_no", fk_employee_no);
		
		List<DayoffVO> dayoffDetail = service.dayoffDetailViewByYear(paraMap);  // 특정년도 연차상세현황 조회
		List<DayoffVO> lastdayoff = new ArrayList<DayoffVO>();  // 사용연차
		
		JSONArray jsonArr = new JSONArray();  // []
		JSONObject jsonObj = new JSONObject(); // JSON 객체 생성
		
		if(dayoffDetail != null) {
			for(DayoffVO list : dayoffDetail) {
				
				// 현재 날짜 구하기
				Date now = new Date();
				SimpleDateFormat format = new SimpleDateFormat("yyyy. MM. dd");
				Date date = format.parse(list.getStartdate());
				
				int compare = now.compareTo(date);
				
				if(compare > 0) { // 사용연차
					lastdayoff.add(list);
				}
			}// end of for------------------
		}
		
		
		double lastUsedays = 0;
		double totalUsedays = 0;
		
		double aa = 0;
		double bb = 0;
		double cc = 0;
		double dd = 0;
		double ee = 0;
		double ff = 0;
		double gg = 0;
		double hh = 0;
		double ii = 0;
		double jj = 0;
		double kk = 0;
		double ll = 0;
		
		String selmm;
		for(DayoffVO lastdolist : lastdayoff) {
			
			int date = Integer.parseInt(lastdolist.getStartdate().substring(6,8));
			double result = Double.parseDouble(lastdolist.getUsedays());
			
			switch (date) {
			case 1: date = 1;
				aa = aa + result;
				break;
			case 2: date = 2;
				bb = bb + result;
				break;
			case 3: date = 3;
				cc = cc + result;
				break;
			case 4: date = 4;
				dd = dd + result;
				break;
			case 5: date = 5;
				ee = ee + result;
				break;
			case 6: date = 6;
				ff = ff + result;
				break;
			case 7: date = 7;
				gg = gg + result;
				break;
			case 8: date = 8;
				hh = hh + result;
				break;
			case 9: date = 9;
				ii = ii + result;
				break;
			case 10: date = 10;
				jj = jj + result;
				break;
			case 11: date = 11;
				kk = kk + result;
				break;
			case 12: date = 12;
				ll = ll + result;
				break;
			}
			
			lastUsedays += Double.parseDouble(lastdolist.getUsedays()); // 올해 총 사용연차
			selmm = lastdolist.getStartdate().substring(6, 8);
			
		}// end of for------------------
		
		DecimalFormat format = new DecimalFormat("##.#");
		System.out.println("aa :" +format.format(aa));
		System.out.println("bb :" +format.format(bb));
		System.out.println("cc :" +format.format(cc));
		System.out.println("dd :" +format.format(dd));
		System.out.println("ee :" +format.format(ee));
		System.out.println("ff :" +format.format(ff));
		System.out.println("gg :" +format.format(gg));
		System.out.println("hh :" +format.format(hh));
		System.out.println("ii :" +format.format(ii));
		System.out.println("jj :" +format.format(jj));
		System.out.println("kk :" +format.format(kk));
		System.out.println("ll :" +format.format(ll));
		
		List<Object> list =  new ArrayList<Object>();
		list.add(format.format(aa));
		list.add(format.format(bb));
		list.add(format.format(cc));
		list.add(format.format(dd));
		list.add(format.format(ee));
		list.add(format.format(ff));
		list.add(format.format(gg));
		list.add(format.format(hh));
		list.add(format.format(ii));
		list.add(format.format(jj));
		list.add(format.format(kk));
		list.add(format.format(ll));
		
		// 잔여연차 구하기 (해당 empno사원의 정보 가져오기)
		EmployeeVO evo = service.getempvo(fk_employee_no);
		System.out.println("잔여연차 :"+evo.getDayoff_cnt());
		
		totalUsedays = Double.parseDouble(evo.getDayoff_cnt()) + lastUsedays;
		// System.out.println("올해 받은 총 연차 :"+totalUsedays);
		// System.out.println("올해 받은 총 연차 :"+format.format(totalUsedays));
		System.out.println("list :"+ list);
		System.out.println("year :"+ year);
		
		jsonObj.put("lastUsedays", format.format(lastUsedays));   // 선택년도 총 사용연차
		jsonObj.put("totalUsedays", format.format(totalUsedays)); // 선택년도 받은 총 연차
		jsonObj.put("list", list);      // 월별 연차사용
		jsonObj.put("selyyyy", year);   // 선택년도
		jsonArr.put(jsonObj);
		return jsonArr.toString();
		
	}*/
	
	
	
    // 매년 1월 직급별 연차 업데이트 스프링 스케줄러
    @RequestMapping(value="/dayoffUpdateInJanuary.up") 
    public ModelAndView dayoffUpdateInJanuary(ModelAndView mav, HttpServletRequest request) {
    	
		String message = "올해 직급별 연차를 업데이트 완료했습니다.";
		String loc = request.getContextPath()+"/main.up";
		mav.addObject("message", message);
		mav.addObject("loc", loc);
		mav.setViewName("msg");
		
    	return mav;
    }		
    
	
	// 매월 연차 업데이트 스프링 스케줄러
    @RequestMapping(value="/dayoffUpdate.up")  // Controller 에서는 URL 만 잡아주고, Service 단에서 특정 날짜 및 시각을 설정해준다.
    public ModelAndView dayoffUpdate(ModelAndView mav, HttpServletRequest request) {
			
		String message = "이번달 모든 직원 연차를 업데이트 완료했습니다.";
		String loc = request.getContextPath()+"/main.up";
		mav.addObject("message", message);
		mav.addObject("loc", loc);
		mav.setViewName("msg");
		
    	return mav;
    }	
    

	
	
	
	
	
	
	
	
	
	
	
}