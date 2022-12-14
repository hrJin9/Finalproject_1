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

	// 근무상태 저장하기(transaction 처리)
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
	
	
	
	
	
	

	// 잔여연차 구하기
	@Override
	public EmployeeVO getempvo(String fk_employee_no) {
		EmployeeVO evo = sqlsession.selectOne("attendance.getempvo",fk_employee_no);
		return evo;
	}
	
	// 휴가 개요 보여주기 (+ 연차 상세)
	@Override
	public List<DayoffVO> dayoffListView(String fk_employee_no) {
		List<DayoffVO> dayoffList = sqlsession.selectList("attendance.dayoffListView", fk_employee_no);
		return dayoffList;
	}
	
	// 년도별 휴가 개요 보여주기
	@Override
	public List<DayoffVO> dayoffListViewByYear(Map<String, String> paraMap) {
		List<DayoffVO> dayoffListbyYear = sqlsession.selectList("attendance.dayoffListViewByYear", paraMap);
		return dayoffListbyYear;
	}
	
	// 해당 사원의 근속년수 알아오기
	@Override
	public String getWorkingyear(String fk_employee_no) {
		String workingyear = sqlsession.selectOne("attendance.getWorkingyear", fk_employee_no);
		return workingyear;
	}



	// 매년 1월 직급별 연차 업데이트 스프링 스케줄러
	@Override
	public int addDayoffInJanuary1() { // 매년 1월 사원직급
		int n = sqlsession.update("attendance.addDayoffInJanuary1");
		return n;
	}
	@Override
	public int addDayoffInJanuary2() { // 매년 1월 대리직급
		int n = sqlsession.update("attendance.addDayoffInJanuary2");
		return n;
	}
	@Override
	public int addDayoffInJanuary3() { // 매년 1월 과장직급
		int n = sqlsession.update("attendance.addDayoffInJanuary3");
		return n;
	}
	@Override
	public int addDayoffInJanuary4() { // 매년 1월 부장직급
		int n = sqlsession.update("attendance.addDayoffInJanuary4");
		return n;
	}
	@Override
	public int addDayoffInJanuary5() { // 매년 1월 대표직급
		int n = sqlsession.update("attendance.addDayoffInJanuary5");
		return n;
	}
	
	// 1년차 미만 직원의 1개월 개근시 매월(1~12월) 연차 업데이트 스프링 스케줄러
	@Override
	public int addDayoff() {
		int n = sqlsession.update("attendance.addDayoff");
		return n;
	}
	
	// 년도 바뀔시 전직원 연차 자동소멸
	@Override
	public int dayoffExtinct() {
		int n = sqlsession.update("attendance.dayoffExtinct");
		return n;
	}	
	
	
	
	
	// 년도별 연차 상세 보여주기(x)
	@Override
	public List<DayoffVO> dayoffDetailViewByYear(Map<String, String> paraMap) {
		List<DayoffVO> dayoffDetail = sqlsession.selectList("attendance.dayoffDetailViewByYear", paraMap);
		return dayoffDetail;
	}



	


	








	


	

	


	
}

