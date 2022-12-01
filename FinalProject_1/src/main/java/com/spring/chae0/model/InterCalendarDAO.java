package com.spring.chae0.model;

import java.util.List;
import java.util.Map;


public interface InterCalendarDAO {

	// 사내 캘린더의 소분류인 일정 이름 존재 여부 알아오기
	int existComCalendar(String scname);

	// 사내 캘린더에 캘린더 소분류 추가하기
	int addComCalendar(Map<String, String> paraMap) throws Throwable;
	
	// 내 캘린더의 소분류인 일정 이름 존재 여부 알아오기
	int existMyCalendar(Map<String, String> paraMap);

	// 내 캘린더에 캘린더 소분류 추가하기
	int addMyCalendar(Map<String, String> paraMap) throws Throwable;

	// 사내 캘린더에 사내캘린더 소분류  보여주기 
	List<Calendar_smallVO> showCompanyCalendar();

	// 내 캘린더에서 내캘린더 소분류  보여주기
	List<Calendar_smallVO> showMyCalendar(String fk_userid);
	
	
}
