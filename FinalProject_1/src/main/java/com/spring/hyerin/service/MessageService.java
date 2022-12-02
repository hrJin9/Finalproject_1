package com.spring.hyerin.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.finalproject.common.FileManager;
import com.spring.hyerin.model.DepartmentsVO;
import com.spring.hyerin.model.EmployeeVO;
import com.spring.hyerin.model.InterMessageDAO;
import com.spring.hyerin.model.MessageSendVO;
import com.spring.hyerin.model.MessageVO;

@Service
public class MessageService implements InterMessageService {
	
	@Autowired
	private InterMessageDAO dao;
	
	@Autowired
	private FileManager fileManager;

	@Override
	public List<Map<String,String>> getmvoList(Map<String, String> paraMap) {
		List<Map<String,String>> mvoList = dao.getmvoList(paraMap);
		return mvoList;
	}

	// 메시지리스트의 총페이지수 알아오기
	@Override
	public int getmgtotal(Map<String, String> paraMap) {
		int mgtotal = dao.getmgtotal(paraMap);
		return mgtotal;
	}
	
	//로그인 유저가 클릭한 메시지내용 1개 불러오기
	@Override
	public MessageVO getmvo(String mno) {
		MessageVO mvo = dao.getmvo(mno);
		return mvo;
	}
	
	// 메시지 수신자 정보 알아오기
	@Override
	public List<MessageSendVO> getmsvoList(String mno) {
		List<MessageSendVO> msvo = dao.getmsvoList(mno);
		return msvo;
	}
	
	// 메시지 보낸시간 알아오기
	@Override
	public String getmstime(String mno) {
		String ms_sendtime = dao.getmstime(mno);
		return ms_sendtime;
	}
	
	// 부서 정보 구해오기
	@Override
	public List<DepartmentsVO> getdept() {
		List<DepartmentsVO> deptList = dao.getdept();
		return deptList;
	}
	
	//부서, 팀 이름 알아오기
	@Override
	public List<Map<String, String>> getdt() {
		List<Map<String, String>> dtList = dao.getdt();
		return dtList;
	}
	
	//구성원 목록을 읽어오기
	@Override
	public List<EmployeeVO> getEmpList(Map<String, String> paraMap) {
		List<EmployeeVO> empList = dao.getEmpList(paraMap);
		return empList;
	}
	
}
