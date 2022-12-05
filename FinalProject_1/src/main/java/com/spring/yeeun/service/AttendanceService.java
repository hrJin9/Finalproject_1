package com.spring.yeeun.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
		return 0;
	}

	
	// 휴가 개요 보여주기
	@Override
	public List<DayoffVO> dayoffListView(String fk_employee_no) {
		List<DayoffVO> dayoffList = dao.dayoffListView(fk_employee_no);
		return dayoffList;
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

