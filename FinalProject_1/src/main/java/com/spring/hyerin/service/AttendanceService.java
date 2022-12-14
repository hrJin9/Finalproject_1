package com.spring.hyerin.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.hyerin.model.EmployeeVO;

@Service
public class AttendanceService implements InterAttendanceService {
	@Autowired
	private InterAttendanceDAO dao;
	
	// 총 구성원 수(근태) 가져오기
	@Override
	public int getAdTotal(Map<String, String> paraMap) {
		int total = dao.getAdTotal(paraMap);
		return total;
	}
	
	// 구성원 리스트(근태) 가져오기
	@Override
	public List<EmployeeVO> getAdList(Map<String, String> paraMap) {
		List<EmployeeVO> evoList = dao.getAdList(paraMap);
		return evoList;
	}
	
	
}
