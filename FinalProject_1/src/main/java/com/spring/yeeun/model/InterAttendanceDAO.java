package com.spring.yeeun.model;

import java.util.List;
import java.util.Map;

public interface InterAttendanceDAO {

	// 근무상태 저장하기
	int addAttendance(Map<String, String> paraMap);


	
	//** 휴가 페이지 **//
	// 휴가 개요 보여주기
	//List<DayoffVO> dayoffListView();
	List<DayoffVO> dayoffListView(String fk_employee_no);

	
	// 년도별 휴가 개용 보여주기
	List<DayoffVO> dayoffListViewByYear(Map<String, String> paraMap);

	
	// 매월 연차 +1 스프링 스케줄러
	List<DayoffVO> dayoffAddScheduler(DayoffVO dayoffvo);



	

}
