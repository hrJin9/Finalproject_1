package com.spring.jieun.model;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

public interface InterAlarmDAO {

	int addAlarm(AlarmVO avo);

	List<AlarmVO> alarmList(String employee_no);

	int alarmRead(String amno);

}
