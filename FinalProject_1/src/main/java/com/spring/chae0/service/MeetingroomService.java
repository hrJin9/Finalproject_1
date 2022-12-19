package com.spring.chae0.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.chae0.model.InterMeetingroomDAO;
import com.spring.chae0.model.Meetingroom_reservationVO;
import com.spring.schedule.model.Calendar_schedule_VO;

@Service
public class MeetingroomService implements InterMeetingroomService {

	@Autowired
	private InterMeetingroomDAO dao;

/*	
	// 회의실 예약하기
	@Override
	public int addMeetingroom(Map<String, String> paraMap) {
		int n = dao.addMeetingroom(paraMap);
		return n;
	}
*/ 	

	// 회의실 예약하기
	@Override
	public int meetingroom_add(Map<String, String> paraMap) throws Throwable { 
		int n = dao.meetingroom_add(paraMap); 
		return n;
	}

	// 회의실 예약 불러오기 
	@Override
	public List<Meetingroom_reservationVO> selectMeetingroom(String fk_roomno) {
		List<Meetingroom_reservationVO> meetingList = dao.selectMeetingroom(fk_roomno);
		return meetingList; 
	}
	  
	
}
