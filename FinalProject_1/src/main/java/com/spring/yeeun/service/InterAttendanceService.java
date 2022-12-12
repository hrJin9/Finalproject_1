package com.spring.yeeun.service;

import java.util.List;
import java.util.Map;

import com.spring.yeeun.model.AttendanceVO;
import com.spring.yeeun.model.DayoffVO;

public interface InterAttendanceService {

	//** 근무 상태 **//
	// 근무상태 저장하기
	int addAttendance(Map<String, String> paraMap);
	
	// 총 근무시간 조회하기
	//Map<String, String> getTotalTime(Map<String, String> paraMap);

	// 저장한 근무상태 조회하기
	List<AttendanceVO> atdetailView(Map<String, String> paraMap);
	
	// 저장한 근무상태 한개 삭제하기
	int atdetailDel(String adno);
	
	// 근무상태 전부  삭제하기
	int atdetailAllDel(Map<String, String> paraMap);
	
	// 전체 근무목록 보여주기 
	List<AttendanceVO> getworkTimebyDay(Map<String, String> paraMap);
	
	
	//** 휴가 페이지 **//
	// 휴가 개요 보여주기
	// List<DayoffVO> dayoffListView();
	List<DayoffVO> dayoffListView(String fk_employee_no);

	// 년도별 휴가 개용 보여주기
	List<DayoffVO> dayoffListViewByYear(Map<String, String> paraMap);


	// 매월 연차 +1 스프링 스케줄러
	List<DayoffVO> dayoffAddScheduler(DayoffVO dayoffvo);



	



	


	





	
}
