package com.spring.chae0.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.chae0.model.InterMeetingroomDAO;

@Service
public class MeetingroomService implements InterMeetingroomService {

	@Autowired
	private InterMeetingroomDAO dao;

	
	// 회의실 예약하기
	@Override
	public int addMeetingroom(Map<String, String> paraMap) {
		int n = dao.addMeetingroom(paraMap);
		return n;
	}
	 
	
}
