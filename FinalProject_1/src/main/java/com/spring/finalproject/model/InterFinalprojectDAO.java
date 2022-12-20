package com.spring.finalproject.model;

import java.util.List;
import java.util.Map;

import com.spring.jieun.model.ApprovalVO;
import com.spring.schedule.model.Calendar_schedule_VO;
import com.spring.yeeun.model.AttendanceVO;

public interface InterFinalprojectDAO {
	
	// 오늘 출근시간 알아오기
	List<AttendanceVO> getTodayStarttime(String employee_no);
	
	// 오늘 총근무시간 알아오기
	String getTodayWorkingtime(String employee_no);
	
	// 이번주 총근무시간 알아오기
	String getWeekWorkingTime(String employee_no);
	
	//결재요청 온 것 
	List<Map<String, String>> getAvMy(String employee_no);

	int getNbtotal();

	List<Map<String, String>> getNbList(Map<String, String> paraMap);

	int getFbtotal();

	List<Map<String, String>> getFbList(Map<String, String> paraMap);
	
	// 결재요청 처리하기 (승인/반려)
	int updateMainAvStatus(Map<String, String> paraMap);

	
	
	
	//////////////////////////
	// 캘린더 불러오기
	List<Calendar_schedule_VO> selectMainSchedule(String fk_employee_no);

}
