package com.spring.chae0.service;

import java.util.List;
import java.util.Map;

import com.spring.chae0.model.Calendar_smallVO;

public interface InterCalendarService {


	// 사내 캘린더에 일정 추가하기
	int addComCalendar(Map<String, String> paraMap) throws Throwable;

	// 내 캘린더에 일정 추가하기
	int addMyCalendar(Map<String, String> paraMap) throws Throwable;

	// 사내 캘린더에서 사내캘린더 소분류  보여주기 
	List<Calendar_smallVO> showCompanyCalendar(); 

	// 내 캘린더에서 내캘린더 소분류  보여주기
	List<Calendar_smallVO> showMyCalendar(String fk_userid);

}
