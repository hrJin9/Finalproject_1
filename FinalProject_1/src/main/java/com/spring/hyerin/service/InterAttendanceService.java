package com.spring.hyerin.service;

import java.util.List;
import java.util.Map;

import com.spring.hyerin.model.EmployeeVO;

public interface InterAttendanceService {
	
	// 총 구성원 수(근태) 가져오기
	int getAdTotal(Map<String, String> paraMap);
	
	// 구성원 리스트(근태) 가져오기
	List<EmployeeVO> getAdList(Map<String, String> paraMap);
	
	// 전체 사용목록 개수 가져오기
	int getTotalAdUseList(Map<String, String> paraMap);
	
	// 페이징처리한 사용목록 가져오기
	List<Map<String, String>> getAdUseList(Map<String, String> paraMap);
	
	// 사용목록 가져오기
	List<EmployeeVO> getAdUseListAll(Map<String, String> paraMap);
	
	// 연차사용목록 가져오기
	List<Map<String, String>> getExcelAdUseListAll(Map<String, String> paraMap);
	

}
