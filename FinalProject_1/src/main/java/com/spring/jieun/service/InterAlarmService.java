package com.spring.jieun.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.jieun.model.*;

public interface InterAlarmService {

	int addAlarm(AlarmVO avo); //alarm 테이블에 추가 

	List<AlarmVO> alarmList(String employee_no);//알림목록 

	int alarmRead(String amno);// 알림 클릭시 읽음처리 


}
