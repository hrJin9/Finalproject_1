package com.spring.chae0.service;

import java.util.List;
import java.util.Map;

import com.spring.chae0.model.Meetingroom_reservationVO;

public interface InterMeetingroomService {

	// 회의실 예약하기 
//	int addMeetingroom(Map<String, String> paraMap);

	// 회의실 예약하기  
	int meetingroom_add(Map<String, String> paraMap) throws Throwable;

	// 회의실 예약 불러오기	 
	List<Meetingroom_reservationVO> selectMeetingroom(String fk_roomno);  



}
