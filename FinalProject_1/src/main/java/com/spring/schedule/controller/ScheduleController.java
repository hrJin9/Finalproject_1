package com.spring.schedule.controller;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.finalproject.common.MyUtil;
import com.spring.hyerin.model.EmployeeVO;
import com.spring.schedule.model.Calendar_schedule_VO;
import com.spring.schedule.model.Calendar_small_category_VO;
import com.spring.schedule.service.InterScheduleService;

@Controller
public class ScheduleController {

	@Autowired
	private InterScheduleService service;
	  
	   
	// === 일정관리 시작 페이지 ===
	@RequestMapping(value="/schedule/scheduleManagement.up")
	public ModelAndView requiredLogin_showSchedule(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) { 
		
		mav.setViewName("schedule/scheduleManagement.tiles");

		return mav;
	}
	
	
	// === 사내 캘린더에 사내캘린더 소분류 추가하기 ===
	@ResponseBody
	@RequestMapping(value="/schedule/addComCalendar.up",method = {RequestMethod.POST})
	public String addComCalendar(HttpServletRequest request) throws Throwable {
		
		String com_smcatgoname = request.getParameter("com_smcatgoname");
		String fk_employee_no = request.getParameter("fk_employee_no");
		
		Map<String, String> paraMap = new HashMap<String, String>();
		paraMap.put("com_smcatgoname",com_smcatgoname);
		paraMap.put("fk_employee_no",fk_employee_no);
		
		int n = service.addComCalendar(paraMap);
				
		JSONObject jsObj = new JSONObject();
		jsObj.put("n", n);
		
		return jsObj.toString();
	}
	
	
	// === 내 캘린더에 내캘린더 소분류 추가하기 ===
	@ResponseBody
	@RequestMapping(value="/schedule/addMyCalendar.up",method = {RequestMethod.POST})
	public String addMyCalendar(HttpServletRequest request) throws Throwable {
		
		String my_smcatgoname = request.getParameter("my_smcatgoname");
		String fk_employee_no = request.getParameter("fk_employee_no");
		
		Map<String, String> paraMap = new HashMap<String, String>();
		paraMap.put("my_smcatgoname",my_smcatgoname);
		paraMap.put("fk_employee_no",fk_employee_no);
		
		int n = service.addMyCalendar(paraMap);
				
		JSONObject jsObj = new JSONObject();
		jsObj.put("n", n);
		
		return jsObj.toString();
	}
	
	
	// === 사내 캘린더에서 사내캘린더 소분류  보여주기 ===
	@ResponseBody
	@RequestMapping(value="/schedule/showCompanyCalendar.up",method = {RequestMethod.GET}, produces="text/plain;charset=UTF-8")  
	public String showCompanyCalendar() {
		
		List<Calendar_small_category_VO> calendar_small_category_VO_CompanyList = service.showCompanyCalendar();
		
		JSONArray jsonArr = new JSONArray();
		
		if(calendar_small_category_VO_CompanyList != null) {
			for(Calendar_small_category_VO smcatevo : calendar_small_category_VO_CompanyList) {
				JSONObject jsObj = new JSONObject();
				jsObj.put("smcatgono", smcatevo.getSmcatgono());
				jsObj.put("smcatgoname", smcatevo.getSmcatgoname());
				jsonArr.put(jsObj);
			}
		}
		
		return jsonArr.toString();
	}
	
	
	// === 내 캘린더에서 내캘린더 소분류  보여주기 ===
	@ResponseBody
	@RequestMapping(value="/schedule/showMyCalendar.up",method = {RequestMethod.GET}, produces="text/plain;charset=UTF-8") 
	public String showMyCalendar(HttpServletRequest request) {
		
		String fk_employee_no = request.getParameter("fk_employee_no");
		System.out.println("fk_employee_no=>"+fk_employee_no);
		List<Calendar_small_category_VO> calendar_small_category_VO_CompanyList = service.showMyCalendar(fk_employee_no);
		
		JSONArray jsonArr = new JSONArray();
		
		if(calendar_small_category_VO_CompanyList != null) {
			for(Calendar_small_category_VO smcatevo : calendar_small_category_VO_CompanyList) {
				JSONObject jsObj = new JSONObject();
				jsObj.put("smcatgono", smcatevo.getSmcatgono());
				jsObj.put("smcatgoname", smcatevo.getSmcatgoname());
				jsonArr.put(jsObj);
			}
		}
		
		return jsonArr.toString();
	}
	
	
	// === 풀캘린더에서 날짜 클릭할 때 발생하는 이벤트(일정 등록창으로 넘어간다) ===
	@RequestMapping(value="/schedule/insertSchedule.up",method = {RequestMethod.POST})
	public ModelAndView insertSchedule(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) { 
		
		// form 에서 받아온 날짜
		String chooseDate = request.getParameter("chooseDate");
		
		mav.addObject("chooseDate", chooseDate);
		mav.setViewName("schedule/insertSchedule.tiles");
		
		return mav;
	}
	
	
	// === 일정 등록시 내캘린더,사내캘린더 선택에 따른 서브캘린더 종류를 알아오기 ===
	@ResponseBody
	@RequestMapping(value="/schedule/selectSmallCategory.up",method = {RequestMethod.GET}, produces="text/plain;charset=UTF-8") 
	public String selectSmallCategory(HttpServletRequest request) {
		
		String fk_lgcatgono = request.getParameter("fk_lgcatgono"); 		  // 캘린더 대분류 번호
		String fk_employee_no = request.getParameter("fk_employee_no");       // 사용자아이디
		
		Map<String,String> paraMap = new HashMap<>();
		paraMap.put("fk_lgcatgono", fk_lgcatgono);
		paraMap.put("fk_employee_no", fk_employee_no);
		
		List<Calendar_small_category_VO> small_category_VOList = service.selectSmallCategory(paraMap);
			 
		JSONArray jsArr = new JSONArray();
		if(small_category_VOList != null) {
			for(Calendar_small_category_VO scvo : small_category_VOList) {
				JSONObject jsObj = new JSONObject();
				jsObj.put("smcatgono", scvo.getSmcatgono());
				System.out.println(scvo.getSmcatgono());  
				jsObj.put("smcatgoname", scvo.getSmcatgoname());
				
				jsArr.put(jsObj);
			}
		}
		
		return jsArr.toString();
	}
	
	
	// === 공유자를 찾기 위한 특정글자가 들어간 회원명단 불러오기 ===
	@ResponseBody
	@RequestMapping(value="/schedule/insertSchedule/searchJoinUserList.up", produces="text/plain;charset=UTF-8")
	public String searchJoinUserList(HttpServletRequest request) {
		
		String joinUserName = request.getParameter("joinUserName");
		
		// 사원 명단 불러오기 
		List<EmployeeVO> joinUserList = service.searchJoinUserList(joinUserName);

		JSONArray jsonArr = new JSONArray();
		if(joinUserList != null && joinUserList.size() > 0) {
			for(EmployeeVO mvo : joinUserList) {
				JSONObject jsObj = new JSONObject();
				jsObj.put("employee_no", mvo.getEmployee_no());
				jsObj.put("name_kr", mvo.getName_kr());    
				jsObj.put("position", mvo.getPosition());   
				jsObj.put("role", mvo.getRole());    
				
				jsonArr.put(jsObj);
			}
		}
		
		return jsonArr.toString();
		
	}
	
	
	// === 일정 등록하기 ===
	@RequestMapping(value="/schedule/registerSchedule_end.up", method = {RequestMethod.POST})
	public ModelAndView registerSchedule_end(ModelAndView mav, HttpServletRequest request) throws Throwable {
		
		String startdate= request.getParameter("startdate");
   	//  System.out.println("확인용 startdate => " + startdate);
	//  확인용 startdate => 20211125140000
   	    
		String enddate = request.getParameter("enddate");
		String subject = request.getParameter("subject");
		String fk_lgcatgono= request.getParameter("fk_lgcatgono");
		String fk_smcatgono = request.getParameter("fk_smcatgono");
		String color = request.getParameter("color");
		String place = request.getParameter("place");
		String joinuser = request.getParameter("joinuser");
		
     	System.out.println("확인용 joinuser => " + joinuser);
	 // 확인용 joinUser_es => 
	 // 또는 
	 // 확인용 joinUser_es => 이순신(leess),아이유1(iyou1),설현(seolh) 	
		
		String content = request.getParameter("content");
		String fk_employee_no = request.getParameter("fk_employee_no");
		
		Map<String,String> paraMap = new HashMap<String, String>();
		paraMap.put("startdate", startdate);
		paraMap.put("enddate", enddate);
		paraMap.put("subject", subject);
		paraMap.put("fk_lgcatgono",fk_lgcatgono);
		paraMap.put("fk_smcatgono", fk_smcatgono);
		paraMap.put("color", color);
		paraMap.put("place", place);
		
		paraMap.put("joinuser", joinuser);
		
		paraMap.put("content", content);
		paraMap.put("fk_employee_no", fk_employee_no);
		
		int n = service.registerSchedule_end(paraMap);

		if(n == 0) {
			mav.addObject("message", "일정 등록에 실패하였습니다.");
		}
		else {
			mav.addObject("message", "일정 등록에 성공하였습니다.");
		}
		
		mav.addObject("loc", request.getContextPath()+"/schedule/scheduleManagement.up");
		
		mav.setViewName("msg");
		
		return mav;
	}
	
	
	 
	
	// === 모든 캘린더(사내캘린더, 내캘린더, 공유받은캘린더)를 불러오는것 ===
	@ResponseBody
	@RequestMapping(value="/schedule/selectSchedule.up", produces="text/plain;charset=UTF-8")
	public String selectSchedule(HttpServletRequest request) {
		
		// 등록된 일정 가져오기
		
		String fk_employee_no = request.getParameter("fk_employee_no");
		
				
		List<Calendar_schedule_VO> scheduleList = service.selectSchedule(fk_employee_no);
		
		JSONArray jsArr = new JSONArray();
		
		if(scheduleList != null && scheduleList.size() > 0) {
			
			for(Calendar_schedule_VO svo : scheduleList) {
				JSONObject jsObj = new JSONObject();
				jsObj.put("subject", svo.getSubject());
				jsObj.put("startdate", svo.getStartdate());
				jsObj.put("enddate", svo.getEnddate());
				jsObj.put("color", svo.getColor()); 
				jsObj.put("calno", svo.getCalno()); 
				jsObj.put("fk_lgcatgono", svo.getFk_lgcatgono());
				jsObj.put("fk_smcatgono", svo.getFk_smcatgono()); 
				jsObj.put("fk_employee_no", svo.getFk_employee_no());
				jsObj.put("joinuser", svo.getJoinuser());
				
				jsArr.put(jsObj);
			}// end of for-------------------------------------
		
		}
		
		return jsArr.toString();
	}
	
	
	
	// === 일정상세보기 ===
	@RequestMapping(value="/schedule/detailSchedule.up")
	public ModelAndView detailSchedule(ModelAndView mav, HttpServletRequest request) {
		
		String calno = request.getParameter("calno"); 
		
		// 검색하고 나서 취소 버튼 클릭했을 때 필요함
		String listgobackURL_schedule = request.getParameter("listgobackURL_schedule");
		mav.addObject("listgobackURL_schedule",listgobackURL_schedule);
  
		
		// 일정상세보기에서 일정수정하기로 넘어갔을 때 필요함
		String gobackURL_detailSchedule = MyUtil.getCurrentURL(request);
		mav.addObject("gobackURL_detailSchedule", gobackURL_detailSchedule);
		
		try {
			Integer.parseInt(calno);
			Map<String,String> map = service.detailSchedule(calno); 
			mav.addObject("map", map);
			mav.setViewName("schedule/detailSchedule.tiles");
		} catch (NumberFormatException e) {
			mav.setViewName("redirect:/schedule/scheduleManagement.up");
		}
		
		return mav;
	}
	
	
	
	// === 일정삭제하기 ===
	@ResponseBody
	@RequestMapping(value="/schedule/deleteSchedule.up", method = {RequestMethod.POST})
	public String deleteSchedule(HttpServletRequest request) throws Throwable {
		
		String calno = request.getParameter("calno");
				
		int n = service.deleteSchedule(calno);
		
		JSONObject jsObj = new JSONObject();
		jsObj.put("n", n);
			
		return jsObj.toString();
	}
	
	
	
	// === 일정 수정하기 ===
	@RequestMapping(value="/schedule/editSchedule.up", method = {RequestMethod.POST})
	public ModelAndView editSchedule(ModelAndView mav, HttpServletRequest request) {
		
		String calno= request.getParameter("calno");
   		
		try {
			Integer.parseInt(calno);
			
			String gobackURL_detailSchedule = request.getParameter("gobackURL_detailSchedule");
			
			HttpSession session = request.getSession();
			EmployeeVO loginuser = (EmployeeVO) session.getAttribute("loginuser"); 
			 
			Map<String,String> map = service.detailSchedule(calno); 
			
			if( !loginuser.getEmployee_no().equals( map.get("fk_employee_no") ) ) {
				String message = "다른 사용자가 작성한 일정은 수정이 불가합니다.";
				String loc = "javascript:history.back()";
				 
				mav.addObject("message", message); 
				mav.addObject("loc", loc);
				mav.setViewName("msg");
			}
			else {
				mav.addObject("map", map);
				mav.addObject("gobackURL_detailSchedule", gobackURL_detailSchedule);
				
				mav.setViewName("schedule/editSchedule.tiles");
			}
		} catch (NumberFormatException e) {
			mav.setViewName("redirect:/schedule/scheduleManagement.up");
		}
		
		return mav;
		
	}
	
	 
	
	// === 일정 수정 완료하기 ===
	@RequestMapping(value="/schedule/editSchedule_end.up", method = {RequestMethod.POST})
	public ModelAndView editSchedule_end(Calendar_schedule_VO svo, HttpServletRequest request, ModelAndView mav) {
		
		try {
//			System.out.println(svo.getFk_smcatgono());
			 int n = service.editSchedule_end(svo);
			 
			 if(n==1) {
				 mav.addObject("message", "일정을 수정하였습니다.");
				 mav.addObject("loc", request.getContextPath()+"/schedule/scheduleManagement.up");
			 }
			 else {
				 mav.addObject("message", "일정 수정에 실패하였습니다.");
				 mav.addObject("loc", "javascript:history.back()");
			 }
			 
			 mav.setViewName("msg");
		} catch (Throwable e) {	
			e.printStackTrace();
			mav.setViewName("redirect:/schedule/scheduleManagement.up");
		}
			
		return mav;
	}
	
	
	
	// === (사내캘린더 또는 내캘린더)속의  소분류 카테고리인 서브캘린더 삭제하기  === 	
	@ResponseBody
	@RequestMapping(value="/schedule/deleteSubCalendar.up", method = {RequestMethod.POST})
	public String deleteSubCalendar(HttpServletRequest request) throws Throwable {
		
		String smcatgono = request.getParameter("smcatgono");
				
		int n = service.deleteSubCalendar(smcatgono);
		
		JSONObject jsObj = new JSONObject();
		jsObj.put("n", n);
			
		return jsObj.toString();
	}
	 
	 
	 
	// === (사내캘린더 또는 내캘린더)속의 소분류 카테고리인 서브캘린더 수정하기 === 
	@ResponseBody
	@RequestMapping(value="/schedule/editCalendar.up", method = {RequestMethod.POST})
	public String editComCalendar(HttpServletRequest request) throws Throwable {
		
		String smcatgono = request.getParameter("smcatgono");
		String smcatgoname = request.getParameter("smcatgoname");
		String fk_employee_no = request.getParameter("fk_employee_no");
		String caltype = request.getParameter("caltype");
		
		Map<String, String> paraMap = new HashMap<>();
		paraMap.put("smcatgono", smcatgono); 
		paraMap.put("smcatgoname", smcatgoname); 
		paraMap.put("fk_employee_no", fk_employee_no); 
		paraMap.put("caltype", caltype);
		
		int n = service.editCalendar(paraMap);
		 
		JSONObject jsObj = new JSONObject();
		jsObj.put("n", n);
			
		return jsObj.toString();
	}
	 

	
	 
	
}
