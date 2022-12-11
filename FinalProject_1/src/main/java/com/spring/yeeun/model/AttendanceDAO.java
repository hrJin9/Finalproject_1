package com.spring.yeeun.model;

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

	// 근무상태 저장하기
	@Override
	public int addAttendance(Map<String, String> paraMap) {
		int n = sqlsession.insert("attendance.addAttendance", paraMap);
		return n;
	}
	
	// 저장한 근무상태 조회하기
	@Override
	public List<AttendanceVO> atdetailView(Map<String, String> paraMap) {
		List<AttendanceVO> attendancedetail = sqlsession.selectList("attendance.atdetailView", paraMap);
		return attendancedetail;
	}
		
	// 저장한 근무상태 한개 삭제하기
	@Override
	public int atdetailDel(String adno) {
		int n = sqlsession.delete("attendance.atdetailDel", adno);
		return n;
	}		
	
	// 근무상태 전부 삭제하기
	@Override
	public int atdetailAllDel(Map<String, String> paraMap) {
		int n = sqlsession.delete("attendance.atdetailAllDel", paraMap);
		return n;
	}	

	// 전체 근무목록 보여주기 
	@Override
	public List<AttendanceVO> getworkTimebyDay(Map<String, String> paraMap) {
		List<AttendanceVO> workTimeList = sqlsession.selectList("attendance.getworkTimebyDay", paraMap);
		return workTimeList;
	}
	
	// 하루치 총 근무시간 구하기
	/*
	@Override
	public Map<String, String> getTotalTime(Map<String, String> paraMap) {
		Map<String, String> totalTime = sqlsession.selectOne("attendance.getTotalTime",paraMap);
		return totalTime;
	} */
	@Override
	public List<AttendanceVO> getTotalworkTimebyDay(Map<String, String> paraMap) {
		List<AttendanceVO> totalworkTimeList = sqlsession.selectList("attendance.getTotalworkTimebyDay", paraMap);
		return totalworkTimeList;
	}
	
	
	// 일주일치 총 근무시간 구하기
	@Override
	public List<AttendanceVO> getTotalworkTimebyWeek(Map<String, String> paraMap) {
		List<AttendanceVO> totalworkTimeList = sqlsession.selectList("attendance.getTotalworkTimebyWeek", paraMap);
		return totalworkTimeList;
	}
	
	
	
	
	
	
	// 휴가 개요 보여주기
	@Override
	public List<DayoffVO> dayoffListView(String fk_employee_no) {
		List<DayoffVO> dayoffList = sqlsession.selectList("attendance.dayoffListView", fk_employee_no);
		return dayoffList;
	}

	// 잔여연차 구하기
	@Override
	public EmployeeVO getempvo(String fk_employee_no) {
		EmployeeVO evo = sqlsession.selectOne("attendance.getempvo",fk_employee_no);
		return evo;
	}
	
	// 년도별 휴가 개용 보여주기
	@Override
	public List<DayoffVO> dayoffListViewByYear(Map<String, String> paraMap) {
		List<DayoffVO> dayoffListbyYear = sqlsession.selectList("attendance.dayoffListViewByYear", paraMap);
		return dayoffListbyYear;
	}

	// 매월 연차 +1 스프링 스케줄러 ==> 수정필요
	@Override
	public List<DayoffVO> dayoffAddScheduler(DayoffVO dayoffvo) {
		// TODO Auto-generated method stub
		return null;
	}

	



	




	
	








	


	

	


	
}

