package com.spring.finalproject.service;

import java.util.List;
import java.util.Map;

import com.spring.jieun.model.ApprovalVO;
import com.spring.yeeun.model.AttendanceVO;

public interface InterFinalprojectService {
	
	// 오늘 출근시간 알아오기
	List<AttendanceVO> getTodayStarttime(String employee_no);
	
	// 오늘 총근무시간 알아오기
	String getTodayWorkingtime(String employee_no);
	
	// 이번주 총근무시간 알아오기
	String getWeekWorkingTime(String employee_no);
	
	// 결재요청온 것 
	List<Map<String, String>> getAvMy(String employee_no);



}
