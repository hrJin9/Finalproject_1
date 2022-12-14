package com.spring.yeeun.model;

import java.util.List;
import java.util.Map;

import com.spring.hyerin.model.EmployeeVO;

public interface InterAttendanceDAO {

	// 근무상태 저장하기
	int addAttendance(Map<String, String> paraMap);
	
	// 저장한 근무상태 조회하기
	List<AttendanceVO> atdetailView(Map<String, String> paraMap);

	// 저장한 근무상태 한개 삭제하기
	int atdetailDel(String adno);
	
	// 근무상태 전부 삭제하기
	int atdetailAllDel(Map<String, String> paraMap);
	
	// 전체 근무목록 보여주기 
	List<AttendanceVO> getworkTimebyDay(Map<String, String> paraMap);
	
	// 하루치 총 근무시간 구하기
	//Map<String, String> getTotalTime(Map<String, String> paraMap);
	List<AttendanceVO> getTotalworkTimebyDay(Map<String, String> paraMap);
	
	// 일주일치 총 근무시간 구하기
	List<AttendanceVO> getTotalworkTimebyWeek(Map<String, String> paraMap);
	
	
	
	//** 휴가 페이지 **//
	// 잔여연차 구하기
	EmployeeVO getempvo(String fk_employee_no);
		
	// 휴가 개요 보여주기 (+ 연차 상세)
	//List<DayoffVO> dayoffListView();
	List<DayoffVO> dayoffListView(String fk_employee_no);

	// 년도별 휴가 개요 보여주기
	List<DayoffVO> dayoffListViewByYear(Map<String, String> paraMap);

	// 해당 사원의 근속년수 알아오기
	String getWorkingyear(String fk_employee_no);
	
	

	// 매년 1월 직급별 연차 업데이트 스프링 스케줄러
	int addDayoffInJanuary1();  // 매년 1월  1년차 이상 사원직급
	int addDayoffInJanuary2();  // 매년 1월  1년차 이상 대리직급
	int addDayoffInJanuary3();  // 매년 1월  1년차 이상 과장직급
	int addDayoffInJanuary4();  // 매년 1월  1년차 이상 부장직급
	int addDayoffInJanuary5();  // 매년 1월  1년차 이상 대표직급
	
	// 1년차 미만 직원의 1개월 개근시 매월(1~12월) 연차 업데이트 스프링 스케줄러
	int addDayoff();  
	
	// 년도 바뀔시 전직원 연차 자동소멸
	int dayoffExtinct();  
	
	
	
	// 년도별 연차 상세 보여주기(x)
	List<DayoffVO> dayoffDetailViewByYear(Map<String, String> paraMap);

	

	






	












	

}
