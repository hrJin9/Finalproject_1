package com.spring.chae0.model;

import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class MeetingroomDAO implements InterMeetingroomDAO { 

	@Resource
	private SqlSessionTemplate sqlsession;

	// 회의실 예약하기
	@Override
	public int addMeetingroom(Map<String, String> paraMap) { 
		int n = sqlsession.insert("meetingroom.addMeetingroom", paraMap);  
		return 0;
	} 


	
	
}
