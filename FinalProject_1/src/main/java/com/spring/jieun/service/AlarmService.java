package com.spring.jieun.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.jieun.model.AlarmVO;
import com.spring.jieun.model.InterAlarmDAO;

@Service
public class AlarmService implements InterAlarmService {

	// 의존객체 
	@Autowired
	private InterAlarmDAO dao;

	
	// 알람테이블에 인서트 
	@Override
	public int addAlarm(AlarmVO avo) {
		System.out.println(avo.getTo_empno()+avo.getCtgy()+avo.getCtnt()+avo.getFrom_empname());
		int n = 0;
		// 여러명에게 보낼수있으니 구분자로 잘라서 반복문 
		String emplinestr = avo.getTo_empno();
		String[] empline = emplinestr.split(",");
		if(empline != null) {
			for(int i=0; i<empline.length; i++) {
				if(!empline[i].trim().isEmpty()) avo.setTo_empno(empline[i]);
			}
		}
		n = dao.addAlarm(avo);
		
		return n;
	}

	// 알림목록 
	@Override
	public List<AlarmVO> alarmList(String employee_no) {
		List<AlarmVO> list = dao.alarmList(employee_no); 
		return list;
	}
	
	// 알림 클릭시 읽음처리 
	@Override
	public int alarmRead(String amno) {
		int n = dao.alarmRead(amno);
		return n;
	}




}
