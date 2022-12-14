package com.spring.chae0.model;

import java.util.Map;

public interface InterMeetingroomDAO {

	// 회의실 예약하기  
//	int addMeetingroom(Map<String, String> paraMap);

	// 회의실 예약하기 
	int meetingroom_add(Map<String, String> paraMap) throws Throwable;

	
	
	
}
