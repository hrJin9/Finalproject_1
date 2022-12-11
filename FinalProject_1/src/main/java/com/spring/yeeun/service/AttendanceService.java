package com.spring.yeeun.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.hyerin.model.EmployeeVO;
import com.spring.yeeun.model.AttendanceVO;
import com.spring.yeeun.model.DayoffVO;
import com.spring.yeeun.model.InterAttendanceDAO;

@Service
public class AttendanceService implements InterAttendanceService {

	// 의존객체
	@Autowired
	private InterAttendanceDAO dao;

	// 근무상태 저장하기
	@Override
	public int addAttendance(Map<String, String> paraMap) {
		int n = dao.addAttendance(paraMap);
		return n;
	}
	
	// 저장한 근무상태 조회하기
	@Override
	public List<AttendanceVO> atdetailView(Map<String, String> paraMap) {
		List<AttendanceVO> attendancedetail = dao.atdetailView(paraMap);
		return attendancedetail;
	}

	// 저장한 근무상태 한개 삭제하기
	@Override
	public int atdetailDel(String adno) {
		int n = dao.atdetailDel(adno);  // db 에서 삭제해온 것이다.
		return n;
	}
	
	// 근무상태 전부 삭제하기
	@Override
	public int atdetailAllDel(Map<String, String> paraMap) {
		int n = dao.atdetailAllDel(paraMap);  // db 에서 삭제해온 것이다.
		return n;
	}
	
	// 전체 근무목록 보여주기 
	@Override
	public List<AttendanceVO> getworkTimebyDay(Map<String, String> paraMap) {
		List<AttendanceVO> workTimeList = dao.getworkTimebyDay(paraMap);
		return workTimeList;
	}	
	
	// 하루치 총 근무시간 구하기
	/*
	@Override
	public Map<String, String> getTotalTime(Map<String, String> paraMap) {
		Map<String,String> totalTime = dao.getTotalTime(paraMap);
		return totalTime;
	} */
	@Override
	public List<AttendanceVO> getTotalworkTimebyDay(Map<String, String> paraMap) {
		List<AttendanceVO> totalworkTimeList = dao.getTotalworkTimebyDay(paraMap);
		return totalworkTimeList;
	}
	
	// 일주일치 총 근무시간 구하기
	@Override
	public List<AttendanceVO> getTotalworkTimebyWeek(Map<String, String> paraMap) {
		List<AttendanceVO> totalworkTimeList = dao.getTotalworkTimebyWeek(paraMap);
		return totalworkTimeList;
	}
	
	
	
	
	
	
	// 휴가 개요 보여주기
	@Override
	public List<DayoffVO> dayoffListView(String fk_employee_no) {
		List<DayoffVO> dayoffList = dao.dayoffListView(fk_employee_no);
		return dayoffList;
	}
	
	// 잔여연차 구하기
	@Override
	public EmployeeVO getempvo(String fk_employee_no) {
		EmployeeVO evo = dao.getempvo(fk_employee_no);
		return evo;
	}	
	

	// 년도별 휴가 내용 보여주기
	@Override
	public List<DayoffVO> dayoffListViewByYear(Map<String, String> paraMap) {
		List<DayoffVO> dayoffListbyYear = dao.dayoffListViewByYear(paraMap);
		return dayoffListbyYear;
	}

	// 매월 연차 +1 스프링 스케줄러
	@Override
	public List<DayoffVO> dayoffAddScheduler(DayoffVO dayoffvo) {
		List<DayoffVO> dayoffAdd = dao.dayoffAddScheduler(dayoffvo);
		return dayoffAdd;
	}



	

	












	


	


	
	
	
}

