package com.spring.chae0.model;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.spring.schedule.model.Calendar_schedule_VO;

@Repository
public class MeetingroomDAO implements InterMeetingroomDAO { 

	@Resource
	private SqlSessionTemplate sqlsession;

	/*
	// 회의실 예약하기
	@Override
	public int addMeetingroom(Map<String, String> paraMap) { 
		int n = sqlsession.insert("meetingroom.addMeetingroom", paraMap);  
		return 0;
	}
*/
	// 회의실 예약하기
	@Override
	public int meetingroom_add(Map<String, String> paraMap) throws Throwable { 
		int n = sqlsession.insert("meetingroom.meetingroom_add", paraMap);   
		return n;  
	}

	// 회의실 예약 불러오기  
	@Override
	public List<Meetingroom_reservationVO> selectMeetingroom(String fk_roomno) {
		List<Meetingroom_reservationVO> meetingList = sqlsession.selectList("meetingroom.selectMeetingroom", fk_roomno);
		return meetingList;  
	} 


	
	 
}
