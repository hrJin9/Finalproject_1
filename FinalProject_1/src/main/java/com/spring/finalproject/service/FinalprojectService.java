package com.spring.finalproject.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.finalproject.common.FileManager;
import com.spring.finalproject.common.AES256;
import com.spring.finalproject.model.InterFinalprojectDAO;
import com.spring.jieun.model.ApprovalVO;
import com.spring.yeeun.model.AttendanceVO;

@Service
public class FinalprojectService implements InterFinalprojectService {
	
	@Autowired
	private InterFinalprojectDAO dao;
	
	@Autowired
	private AES256 aes;
	@Autowired
	private FileManager fileManager;
	
	// 오늘 출근시간 알아오기
	@Override
	public List<AttendanceVO> getTodayStarttime(String employee_no) {
		List<AttendanceVO> avoList = dao.getTodayStarttime(employee_no);
		return avoList;
	}
	
	// 오늘 총근무시간 알아오기
	@Override
	public String getTodayWorkingtime(String employee_no) {
		String totalWorkingtime = dao.getTodayWorkingtime(employee_no);
		return totalWorkingtime;
	}
	
	// 이번주 총근무시간 알아오기
	@Override
	public String getWeekWorkingTime(String employee_no) {
		String weekWorkingTime = dao.getWeekWorkingTime(employee_no);
		return weekWorkingTime;
	}
	
	//결재요청 온 것 
	@Override
	public List<Map<String, String>> getAvMy(String employee_no) {
		List<Map<String, String>> apList = dao.getAvMy(employee_no);
		return apList;
	}

	@Override
	public int getNbtotal() {
		int total = dao.getNbtotal();
		return total;
	}

	@Override
	public List<Map<String, String>> getNbList(Map<String, String> paraMap) {
		List<Map<String, String>> boardList = dao.getNbList(paraMap);
		return boardList;
	}

	@Override
	public int getFbtotal() {
		int total = dao.getFbtotal();
		return total;
	}

	@Override
	public List<Map<String, String>> getFbList(Map<String, String> paraMap) {
		List<Map<String, String>> boardList = dao.getFbList(paraMap);
		return boardList;
	}
	
	// 결재요청 처리하기 (승인/반려)
	@Override
	public int updateMainAvStatus(Map<String, String> paraMap) {
		int result = dao.updateMainAvStatus(paraMap);
		return result;
	}
}
