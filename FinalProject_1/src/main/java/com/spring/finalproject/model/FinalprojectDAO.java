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

	@Override
	public int getNbtotal() {
		int total = sqlsession.selectOne("main.getNbtotal");
		return total;
	}

	@Override
	public List<Map<String, String>> getNbList(Map<String, String> paraMap) {
		List<Map<String, String>> boardList = sqlsession.selectList("main.getNbList",paraMap);
		return boardList;
	}

	@Override
	public int getFbtotal() {
		int total = sqlsession.selectOne("main.getFbtotal");
		return total;
	}

	@Override
	public List<Map<String, String>> getFbList(Map<String, String> paraMap) {
		List<Map<String, String>> boardList = sqlsession.selectList("main.getFbList",paraMap);
		return boardList;
	}
	

	// 결재요청 처리하기 (승인/반려)
	@Override
	public int updateMainAvStatus(Map<String, String> paraMap) {
		int result = sqlsession.update("main.updateMainAvStatus", paraMap);
		return result;
	}
}
