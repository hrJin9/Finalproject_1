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
import com.spring.yeeun.model.DayoffVO;
import com.spring.yeeun.service.InterAttendanceService;

@Controller
public class AttendanceController {
	
	@Autowired
	private InterAttendanceService service;
	
	
	@RequestMapping(value = "/attendance.up")
	public ModelAndView rl_attendance(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) { 
		mav.setViewName("attendance/attendance.tiles"); 
		return mav; 
	}
	
	
	@ResponseBody     // return 되는 값은 View 단 페이지를 통해서 출력되는 것이 아니라 return 되어지는 값 그 자체를 웹브라우저에 바로 직접 쓰여지게 하는 것이다. JSON 결과물을 보일때는 css 태그 와 같은 view단 태그는 필요없이  결과물만 찍어주면 되기 때문이다.
	@RequestMapping(value="/attendance2.up", method= {RequestMethod.POST}, produces="text/plain;charset=UTF-8") // 웹브라우저에 출력되는 한글이 안 깨지기 위해 produces="text/plain;charset=UTF-8" 붙여준다.
	public String attendance2(HttpServletRequest request) throws Throwable {  // Ajax 방식은 view단 태그는 필요없이  결과물만 찍어주면 되기 때문에 항상 String 타입으로 해준다.
		
		// String employee_no = request.getParameter("employee_no");  // attendance.jsp 에서 파라미터 값 받아오기
		String adcatgo = request.getParameter("attendancetype"); 
		String todaydate = request.getParameter("todaydate"); 
		String sdate = request.getParameter("startdate"); 
		String edate = request.getParameter("enddate");  
		
		// 로그인된 유저의 employee_no 알아오기
		HttpSession session = request.getSession();
		EmployeeVO loginuser = (EmployeeVO) session.getAttribute("loginuser");
		String fk_employee_no = loginuser.getEmployee_no();

		String year = todaydate.substring(0,4);
		String month = todaydate.substring(6,8);
		String day = todaydate.substring(10,12);
		
		//LocalDate startdate = LocalDate.parse(year+'-'+month+'-'+day+' '+startdate);
		//LocalDate enddate = LocalDate.parse(year+'-'+month+'-'+day+' '+enddate);
		
		String startdate = year+'-'+month+'-'+day+' '+sdate;
		String enddate = year+'-'+month+'-'+day+' '+edate;
		
		
		Map<String, String> paraMap = new HashMap<>();
		paraMap.put("fk_employee_no", fk_employee_no);  
		paraMap.put("adcatgo", adcatgo); 
        paraMap.put("startdate", startdate); 
        paraMap.put("enddate", enddate); 
		
		int n = 0;
		
		try {
			n = service.addAttendance(paraMap); 
			
		} catch (Throwable e) {
			e.printStackTrace();  // 콘솔에만 찍어준다.
		}
		
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("n", n);
		
		return jsonObj.toString();
		
		
		/*
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("n", n);
		jsonObj.put("name", commentvo.getName());  // view.jsp 에서 받아온 commentvo 에 있다.
		
		
		return jsonObj.toString(); // "{"n":1,"name":"이예은"}" 또는 "{"n":0"name":"이예은"}"
		*/
	}
	
	
	@RequestMapping(value = "/dayoff/index.up")
	public ModelAndView dayoff_index(HttpServletRequest request, ModelAndView mav) throws ParseException {
		
		// getCurrentURL(request);  // 로그아웃을 했을 때 현재 보이던 그 페이지 그대로 돌아가기 위한 메소드 호출
		
		// 로그인된 유저의 employee_no 알아오기
		HttpSession session = request.getSession();
		EmployeeVO loginuser = (EmployeeVO) session.getAttribute("loginuser");
		String fk_employee_no = loginuser.getEmployee_no();
		
		// 현재 날짜 구하기
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
		Date now = new Date();
		//String nowTime = sdf.format(now);
		// System.out.println("현재날짜 >>" + nowTime);
		//System.out.println("now >>" + now);
		
		List<DayoffVO> dayoffList = new ArrayList<DayoffVO>();
		dayoffList = service.dayoffListView(fk_employee_no);
		List<DayoffVO> comedayoff = new ArrayList<DayoffVO>();  // 예정연차
		List<DayoffVO> lastdayoff = new ArrayList<DayoffVO>();  // 사용연차
		
		for(DayoffVO list : dayoffList) {
			SimpleDateFormat format = new SimpleDateFormat("yyyy.MM.dd");
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
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
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