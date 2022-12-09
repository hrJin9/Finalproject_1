package com.spring.yeeun.controller;

import java.sql.SQLException;
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
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
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
	
	/*
	@RequestMapping(value = "/attendance.up")
	public ModelAndView rl_attendance(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) { 
		mav.setViewName("attendance/attendance.tiles"); 
		return mav; 
	}*/
	
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
	
	
	// 총 근무시간 조회하기
	/*
	@ResponseBody     // return 되는 값은 View 단 페이지를 통해서 출력되는 것이 아니라 return 되어지는 값 그 자체를 웹브라우저에 바로 직접 쓰여지게 하는 것이다. JSON 결과물을 보일때는 css 태그 와 같은 view단 태그는 필요없이  결과물만 찍어주면 되기 때문이다.
	@RequestMapping(value="/getTotalTime.up", produces="text/plain;charset=UTF-8") // 웹브라우저에 출력되는 한글이 안 깨지기 위해 produces="text/plain;charset=UTF-8" 붙여준다.
	public String getTotalTime(HttpServletRequest request) throws Throwable {  // Ajax 방식은 view단 태그는 필요없이  결과물만 찍어주면 되기 때문에 항상 String 타입으로 해준다.
		
		String seldate = request.getParameter("seldate"); // 선택한 날짜
		
		// 로그인된 유저의 employee_no 알아오기
		HttpSession session = request.getSession();
		EmployeeVO loginuser = (EmployeeVO) session.getAttribute("loginuser");
		String fk_employee_no = loginuser.getEmployee_no();
		
		String year = seldate.substring(0,4);
		String month = seldate.substring(6,8);
		String day = seldate.substring(10,12);
		String selectdate = year+'-'+month+'-'+day;
		
		Map<String, String> paraMap = new HashMap<>();
		paraMap.put("fk_employee_no", fk_employee_no);
		paraMap.put("selectdate", selectdate);
		
		Map<String,String> totalTime = service.getTotalTime(paraMap);
		
		JSONObject jsonobj = new JSONObject();
		jsonobj.put("seldate", totalTime.get("seldate"));
		jsonobj.put("workTime", totalTime.get("workTime"));
		jsonobj.put("workMin", totalTime.get("workMin"));
		//System.out.println("seldate : "+ totalTime.get("seldate"));
		//System.out.println("workTime : "+ totalTime.get("workTime"));
		//System.out.println("workMin : "  + totalTime.get("workMin"));
		
		return jsonobj.toString();
	}		
	*/
	
	
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
	
	
	
	// 총 근무시간 및 시작,종료시간 조회해오기
	@ResponseBody     // return 되는 값은 View 단 페이지를 통해서 출력되는 것이 아니라 return 되어지는 값 그 자체를 웹브라우저에 바로 직접 쓰여지게 하는 것이다. JSON 결과물을 보일때는 css 태그 와 같은 view단 태그는 필요없이  결과물만 찍어주면 되기 때문이다.
	@RequestMapping(value="/getworkTimebyDay.up", produces="text/plain;charset=UTF-8") // 웹브라우저에 출력되는 한글이 안 깨지기 위해 produces="text/plain;charset=UTF-8" 붙여준다.
	public String getworkTimebyDay(HttpServletRequest request) throws Throwable {  // Ajax 방식은 view단 태그는 필요없이  결과물만 찍어주면 되기 때문에 항상 String 타입으로 해준다.
		
		String[] thisWeekDate = request.getParameterValues("thisWeekDate"); // 이번주 날짜
		//System.out.println("thisWeekDate >> "+thisWeekDate);
		
		// 로그인된 유저의 employee_no 알아오기
		HttpSession session = request.getSession();
		EmployeeVO loginuser = (EmployeeVO) session.getAttribute("loginuser");
		String fk_employee_no = loginuser.getEmployee_no();
		
		JSONArray jsonArr = new JSONArray();  // []
		
        int n = 0;
		for (int i = 0; i < thisWeekDate.length; i++) {
			Map<String, String> paraMap = new HashMap<String, String>();
			String year = thisWeekDate[i].substring(0, 4);
			String month = thisWeekDate[i].substring(6, 8);
			String day = thisWeekDate[i].substring(10, 12);
			
			String thisWeekDay = year+'-'+month+'-'+day;
			//System.out.println("thisWeekDay >>> "+thisWeekDay);
			
			paraMap.put("fk_employee_no", fk_employee_no);  
	        paraMap.put("thisWeekDay", thisWeekDay); 
	        
	        List<AttendanceVO> workTimeList = service.getworkTimebyDay(paraMap);
	        
        	if(workTimeList != null) {
        		int realtotal = 0;
        							//9일에는 리스트사이즈가 5
        		for (int j = 0; j < workTimeList.size(); j++) {
        			
        			JSONObject jsonObj = new JSONObject(); // JSON 객체 생성
        			jsonObj.put("adno", workTimeList.get(j).getAdno());
        			jsonObj.put("fk_employee_no", workTimeList.get(j).getFk_employee_no());
        			jsonObj.put("seldate", workTimeList.get(j).getSeldate());
        			jsonObj.put("startTime", workTimeList.get(j).getStartTime());
        			jsonObj.put("endTime", workTimeList.get(j).getEndTime());
        			//jsonObj.put("workTime", workTimeList.get(j).getWorkTime());
        			//jsonObj.put("workMin", workTimeList.get(j).getWorkMin());
					jsonArr.put(jsonObj);
					realtotal += Integer.parseInt(workTimeList.get(j).getTotalTime());
					//System.out.println("seldate :" +workTimeList.get(j).getSeldate());
					System.out.println("realtotal :" +realtotal);
					
					if(workTimeList.size()-1 == j) {
						int workTime = realtotal / 60;  // 몫
						int workMin = realtotal % 60;   // 나머지
						//System.out.println("workTime :" +workTime);
						//System.out.println("workMin :" +workMin);
						//System.out.println("realtotal :" +realtotal);
						
						jsonObj.put("workTime", workTime);
						jsonObj.put("workMin", workMin);
						jsonObj.put("totalTime", realtotal);
					}
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

	
	
	
	
	
	
	
	
	
	
	//////////////////////////////////////////////////////////////////////////////////////////////
	
	// 휴가 개요 보여주기
	@RequestMapping(value = "/dayoff/index.up")
	public ModelAndView dayoff_index(HttpServletRequest request, ModelAndView mav) throws ParseException {
		
		// getCurrentURL(request);  // 로그아웃을 했을 때 현재 보이던 그 페이지 그대로 돌아가기 위한 메소드 호출
		
		// 로그인된 유저의 employee_no 알아오기
		HttpSession session = request.getSession();
		EmployeeVO loginuser = (EmployeeVO) session.getAttribute("loginuser");
		String fk_employee_no = loginuser.getEmployee_no();
		
		// 현재 날짜 구하기
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy. MM. dd");
		Date now = new Date();
		//String nowTime = sdf.format(now);
		// System.out.println("현재날짜 >>" + nowTime);
		//System.out.println("now >>" + now);
		
		List<DayoffVO> dayoffList = new ArrayList<DayoffVO>();
		dayoffList = service.dayoffListView(fk_employee_no);
		List<DayoffVO> comedayoff = new ArrayList<DayoffVO>();  // 예정연차
		List<DayoffVO> lastdayoff = new ArrayList<DayoffVO>();  // 사용연차
		
		for(DayoffVO list : dayoffList) {
			SimpleDateFormat format = new SimpleDateFormat("yyyy. MM. dd");
			Date date = format.parse(list.getStartdate());
			
			int compare = now.compareTo(date);
			
			if(compare < 0) { // 예정연차
				comedayoff.add(list);
			}else {  // 사용연차
				lastdayoff.add(list);
			}
		}
		
	    //mav.addObject("dayoffList", dayoffList); // 구해온 값이 null이 아니라면 dayoffList를 dayoff_index.jsp 에 넘긴다.
	    mav.addObject("comedayoff", comedayoff); // 구해온 값이 null이 아니라면 dayoffList를 dayoff_index.jsp 에 넘긴다.
	    mav.addObject("lastdayoff", lastdayoff); // 구해온 값이 null이 아니라면 dayoffList를 dayoff_index.jsp 에 넘긴다.
		mav.setViewName("attendance/dayoff_index.tiles");
		return mav;
		
	}
	
	
	// 휴가 개요 ajax로 보여주기
	@ResponseBody     // return 되는 값은 View 단 페이지를 통해서 출력되는 것이 아니라 return 되어지는 값 그 자체를 웹브라우저에 바로 직접 쓰여지게 하는 것이다. JSON 결과물을 보일때는 css 태그 와 같은 view단 태그는 필요없이  결과물만 찍어주면 되기 때문이다.
	@RequestMapping(value="/dayoff/index2.up", method= {RequestMethod.POST}, produces="text/plain;charset=UTF-8") // 웹브라우저에 출력되는 한글이 안 깨지기 위해 produces="text/plain;charset=UTF-8" 붙여준다.
	public String dayoff_index2(HttpServletRequest request) throws Throwable {  // Ajax 방식은 view단 태그는 필요없이  결과물만 찍어주면 되기 때문에 항상 String 타입으로 해준다.
		
		String year = request.getParameter("year"); 
		//System.out.println(year);
		
		// 로그인된 유저의 employee_no 알아오기
		HttpSession session = request.getSession();
		EmployeeVO loginuser = (EmployeeVO) session.getAttribute("loginuser");
		String fk_employee_no = loginuser.getEmployee_no();
		
		// 현재 날짜 구하기
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy. MM. dd");
		Date now = new Date();
		
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
	// 매월 연차 +1 스프링 스케줄러
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = { Exception.class, SQLException.class }, readOnly = false)
	public boolean autoUpdate() throws Exception {
	       
	    //System.out.println("스케줄링 테스트");
	    
		DayoffVO dayoffvo = new DayoffVO();
	    
	    List<DayoffVO> dayoffAdd = service.dayoffAddScheduler(dayoffvo);
	        
	    Date now = new Date();
	    SimpleDateFormat nowDate = new SimpleDateFormat("yyyy-MM-dd");
	    
	    /*
	    for(TestVO vo : list) {
	        if("0".equals(vo.getState())) {
	            
	            Date edateTest = nowDate.parse(vo.getEdate());
	            int compare = edateTest.compareTo(now);
	            
	            if(compare < 0 ) {
	                
	                searchVO.setIdx(vo.getIdx());
	                schedulerService.autoUpdate(searchVO);
	            }
	        }
	    }
	    */
	        
	    return true;
	}
	
	
	
	
	@RequestMapping(value = "/dayoff/detail.up")
	public ModelAndView dayoff_detail(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {
		mav.setViewName("attendance/dayoff_detail.tiles");
		return mav;
	}
	
	
	
	
	
}