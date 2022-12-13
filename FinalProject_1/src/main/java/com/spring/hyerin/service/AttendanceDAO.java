package com.spring.hyerin.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.spring.hyerin.model.EmployeeVO;

@Repository
public class AttendanceDAO implements InterAttendanceDAO {
	@Resource
	private SqlSessionTemplate sqlsession;
	
	// 총 구성원 수(근태) 가져오기
	@Override
	public int getAdTotal(Map<String, String> paraMap) {
		int total = sqlsession.selectOne("adAttendance.getAdTotal",paraMap);
		return total;
	}
	
	// 구성원 리스트(근태) 가져오기
	@Override
	public List<EmployeeVO> getAdList(Map<String, String> paraMap) {
		List<EmployeeVO> evoList = sqlsession.selectList("adAttendance.getAdList",paraMap);
		return evoList;
	}
	
	
	
}
