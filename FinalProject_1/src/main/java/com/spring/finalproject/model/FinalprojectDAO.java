package com.spring.finalproject.model;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.spring.jieun.model.ApprovalVO;
import com.spring.yeeun.model.AttendanceVO;

@Repository
public class FinalprojectDAO implements InterFinalprojectDAO {
	@Resource
	private SqlSessionTemplate sqlsession;
	
	// 오늘 출근시간 알아오기
	@Override
	public List<AttendanceVO> getTodayStarttime(String employee_no) {
		List<AttendanceVO> avoList = sqlsession.selectList("main.getTodayStarttime", employee_no);
		return avoList;
	}
	
	// 오늘 총근무시간 알아오기
	@Override
	public String getTodayWorkingtime(String employee_no) {
		String totalWorkingtime = sqlsession.selectOne("main.getTodayWorkingtime", employee_no);
		return totalWorkingtime;
	}
	
	// 이번주 총근무시간 알아오기
	@Override
	public String getWeekWorkingTime(String employee_no) {
		String weekWorkingTime = sqlsession.selectOne("main.getWeekWorkingTime", employee_no);
		return weekWorkingTime;
	}
	
	// 결재요청 온 것 
	@Override
	public List<Map<String, String>> getAvMy(String employee_no) {
		List<Map<String, String>> apList = sqlsession.selectList("main.getAvMy", employee_no);
		return apList;
	}
}
