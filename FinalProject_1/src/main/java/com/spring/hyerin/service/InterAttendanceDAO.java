package com.spring.hyerin.service;

import java.util.List;
import java.util.Map;

import com.spring.hyerin.model.EmployeeVO;

public interface InterAttendanceDAO {
	
	// 총 구성원 수(근태) 가져오기
	int getAdTotal(Map<String, String> paraMap);
	
	// 구성원 리스트(근태) 가져오기
	List<EmployeeVO> getAdList(Map<String, String> paraMap);

}
