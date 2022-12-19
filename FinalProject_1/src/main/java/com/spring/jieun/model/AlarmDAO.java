package com.spring.jieun.model;


import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;


@Repository
public class AlarmDAO implements InterAlarmDAO{

	@Resource
	private SqlSessionTemplate sqlsession;

	// 알람테이블에 인서트 
	@Override
	public int addAlarm(AlarmVO avo) {
		int n = sqlsession.insert("alarm.addAlarm", avo);
		return n;
	}
	// 알림목록 
	@Override
	public List<AlarmVO> alarmList(String employee_no) {
		List<AlarmVO> list = sqlsession.selectList("alarm.alarmList", employee_no);
		return list;
	}
	// 알림 클릭시 읽음처리 
	@Override
	public int alarmRead(String amno) {
		int n = sqlsession.update("alarm.alarmRead",amno); 
		return n;
	}
}
