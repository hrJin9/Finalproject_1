package com.spring.yeeun.service;

import java.awt.Desktop;
import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.spring.hyerin.model.EmployeeVO;
import com.spring.yeeun.model.AttendanceVO;
import com.spring.yeeun.model.DayoffVO;
import com.spring.yeeun.model.InterAttendanceDAO;

@Service
public class AttendanceService implements InterAttendanceService {

	// 의존객체
	@Autowired
	private InterAttendanceDAO dao;

	// 근무상태 저장하기
	@Override
	public int addAttendance(Map<String, String> paraMap) {
		int n = dao.addAttendance(paraMap);
		return n;
	}
	
	// 저장한 근무상태 조회하기
	@Override
	public List<AttendanceVO> atdetailView(Map<String, String> paraMap) {
		List<AttendanceVO> attendancedetail = dao.atdetailView(paraMap);
		return attendancedetail;
	}

	// 저장한 근무상태 한개 삭제하기
	@Override
	public int atdetailDel(String adno) {
		int n = dao.atdetailDel(adno);  // db 에서 삭제해온 것이다.
		return n;
	}
	
	// 근무상태 전부 삭제하기
	@Override
	public int atdetailAllDel(Map<String, String> paraMap) {
		int n = dao.atdetailAllDel(paraMap);  // db 에서 삭제해온 것이다.
		return n;
	}
	
	// 전체 근무목록 보여주기 
	@Override
	public List<AttendanceVO> getworkTimebyDay(Map<String, String> paraMap) {
		List<AttendanceVO> workTimeList = dao.getworkTimebyDay(paraMap);
		return workTimeList;
	}	
	
	// 하루치 총 근무시간 구하기
	/*
	@Override
	public Map<String, String> getTotalTime(Map<String, String> paraMap) {
		Map<String,String> totalTime = dao.getTotalTime(paraMap);
		return totalTime;
	} */
	@Override
	public List<AttendanceVO> getTotalworkTimebyDay(Map<String, String> paraMap) {
		List<AttendanceVO> totalworkTimeList = dao.getTotalworkTimebyDay(paraMap);
		return totalworkTimeList;
	}
	
	// 일주일치 총 근무시간 구하기
	@Override
	public List<AttendanceVO> getTotalworkTimebyWeek(Map<String, String> paraMap) {
		List<AttendanceVO> totalworkTimeList = dao.getTotalworkTimebyWeek(paraMap);
		return totalworkTimeList;
	}
	
	
	
	
	
	
	
	// 잔여연차 구하기
	@Override
	public EmployeeVO getempvo(String fk_employee_no) {
		EmployeeVO evo = dao.getempvo(fk_employee_no);
		return evo;
	}	
	
	// 휴가 개요 보여주기 (+ 연차 상세)
	@Override
	public List<DayoffVO> dayoffListView(String fk_employee_no) {
		List<DayoffVO> dayoffList = dao.dayoffListView(fk_employee_no);
		return dayoffList;
	}

	// 년도별 휴가 개요 보여주기
	@Override
	public List<DayoffVO> dayoffListViewByYear(Map<String, String> paraMap) {
		List<DayoffVO> dayoffListbyYear = dao.dayoffListViewByYear(paraMap);
		return dayoffListbyYear;
	}


	
	// 매년 1월 직급별 연차 업데이트 스프링 스케줄러
	@Override
	//@Scheduled(cron="0 20 21 * * *") ==> 시연시 필요!
	@Scheduled(cron="0 30 4 1 1 *")  // 매년 1월
	public int dayoffUpdateInJanuary() throws Exception {
		
		int n = 0;
		try {
			n = dao.addDayoffInJanuary1(); // 사원직급
			System.out.println("올해 사원 기본연차가 업데이트 완료되었습니다.");  
			n = dao.addDayoffInJanuary2(); // 대리직급
			System.out.println("올해 대리 기본연차가 업데이트 완료되었습니다.");  
			n = dao.addDayoffInJanuary3(); // 과장직급
			System.out.println("올해 과장 기본연차가 업데이트 완료되었습니다.");  
			n = dao.addDayoffInJanuary4(); // 부장직급
			System.out.println("올해 부장 기본연차가 업데이트 완료되었습니다.");  
			n = dao.addDayoffInJanuary5(); // 대표직급
			System.out.println("올해 대표 기본연차가 업데이트 완료되었습니다.");  
			n = 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("매년 1월 직급별 연차 업데이트 스프링 스케줄러 >>" + n);
		
		
		// 특정 사이트의 웹페이지를 보여주기 위해 기본브라우저를 띄운다.
	    try { 
			Desktop.getDesktop().browse(new URI("http://localhost:9090/thumbsup/dayoffUpdateInJanuary.up")); // import java.net 으로 한다.
			// WAS 컴퓨터에서만 특정 웹페이지를 실행시켜주는 것이지, WAS에 접속한 다른 클라이언트 컴퓨터에서는 특정 웹사이트를 실행시켜주지 않는다.
		} catch (IOException e) { 
		     e.printStackTrace(); 
		} catch (URISyntaxException e) {
		     e.printStackTrace(); 
		}  
		
		return n;
	}
	
	
	// 매월 연차 업데이트 스프링 스케줄러
	@Override
	@Scheduled(cron="0 30 4 1 2-12 *")  // 매년 2~12월(1월 제외)
	public int dayoffUpdate() throws Exception {
		
		int n = 0;
		try {
			n = dao.addDayoff();
			System.out.println("연차 업데이트가 완료되었습니다.");  
			n = 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("매월 연차 업데이트 스프링 스케줄러 >>" + n);
		
		
		// 특정 사이트의 웹페이지를 보여주기 위해 기본브라우저를 띄운다.
	    try { 
			Desktop.getDesktop().browse(new URI("http://localhost:9090/thumbsup/dayoffUpdate.up")); // import java.net 으로 한다.
			// WAS 컴퓨터에서만 특정 웹페이지를 실행시켜주는 것이지, WAS에 접속한 다른 클라이언트 컴퓨터에서는 특정 웹사이트를 실행시켜주지 않는다.
			
		} catch (IOException e) { 
		     e.printStackTrace(); 
		} catch (URISyntaxException e) {
		     e.printStackTrace(); 
		}  
		
		return n;
	}	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 년도별 연차 상세 보여주기
	@Override
	public List<DayoffVO> dayoffDetailViewByYear(Map<String, String> paraMap) {
		List<DayoffVO> dayoffDetail = dao.dayoffDetailViewByYear(paraMap);
		return dayoffDetail;
	}
	

	












	


	


	
	
	
}

