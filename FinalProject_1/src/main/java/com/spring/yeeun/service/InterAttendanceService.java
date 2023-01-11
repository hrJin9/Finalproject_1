package com.spring.yeeun.service;

import java.util.List;
import java.util.Map;

import com.spring.hyerin.model.EmployeeVO;
import com.spring.yeeun.model.AttendanceVO;
import com.spring.yeeun.model.DayoffVO;

public interface InterAttendanceService {

	//** 근무 상태 **//
	// 근무상태 저장하기
	int addAttendance(Map<String, String> paraMap);
	//int addAttendance(Map<String, String> paraMap) throws Throwable; // Throwable 은 Error, Exception 의 부모로, 예외처리 최상위 클래스이다.

	// 저장한 근무상태 조회하기
	List<AttendanceVO> atdetailView(Map<String, String> paraMap);
	
	// 저장한 근무상태 한개 삭제하기
	int atdetailDel(String adno);
	
	// 근무상태 전부  삭제하기
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
	// List<DayoffVO> dayoffListView();
	List<DayoffVO> dayoffListView(String fk_employee_no);

	// 년도별 휴가 개요 보여주기
	List<DayoffVO> dayoffListViewByYear(Map<String, String> paraMap);

	// 해당 사원의 근속년수 알아오기
	String getWorkingyear(String fk_employee_no);
	
	

	// 매월 연차 업데이트 스프링 스케줄러
	// 스케줄러로 사용되어지는 메소드는 반드시 파라미터는 없어야 한다.
	// 2~12월(1월제외) 매월 새벽 4시 30분 마다 연차 +1 업데이트를 해줄 것이다.
	// 업데이트가 안될 경우, 익셉션을 던져버리기 위해 throws Exception 을 추가해준다.
	int dayoffUpdateInJanuary() throws Exception;  // 매년 1월, 1년차 이상의 직급별 연차 업데이트 스프링 스케줄러
	int dayoffUpdate() throws Exception;           // 1년차 미만 직원의 1개월 개근시 매월 연차 업데이트 스프링 스케줄러
	int dayoffExtinct() throws Exception;          // 년도 바뀔시 전직원 연차 자동소멸

	
	
	
	
	// 년도별 연차 상세 보여주기(x)
	List<DayoffVO> dayoffDetailViewByYear(Map<String, String> paraMap);

	




	
}
