package com.spring.hyerin.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.hyerin.model.DepartmentsVO;
import com.spring.hyerin.model.EmployeeVO;
import com.spring.hyerin.model.MessageFileVO;
import com.spring.hyerin.model.MessageSendVO;
import com.spring.hyerin.model.MessageVO;


public interface InterMessageService {

	List<Map<String,String>> getmvoList(Map<String, String> paraMap);

	// 메시지리스트의 총페이지수 알아오기
	int getmgtotal(Map<String, String> paraMap);

	//로그인 유저가 클릭한 메시지내용 1개 불러오기
	MessageVO getmvo(Map<String, String> paraMap);
	
	// 메시지 수신자 정보 알아오기
	List<MessageSendVO> getmsvoList(String mno);
	
	
	// 메시지의 파일 정보 알아오기
	List<MessageFileVO> getmfile(String mno);
	
	
	
	// 부서 정보 구해오기
	List<DepartmentsVO> getdept();
	
	//부서, 팀의 구성원수 구해오기
	List<Map<String, String>> getdt();
	
	//구성원 목록을 읽어오기
	List<EmployeeVO> getEmpList(Map<String, String> paraMap);
	
	// mno 채번해오기
	String getmno();
	
	// 메시지 insert
	int addMessage(MultipartFile[] attaches, MultipartHttpServletRequest mrequest, MessageSendVO msvo, MessageVO mvo) throws Exception;

	// 관련메시지 3개  알아오기
	Map<String,String> getmgroupList(Map<String, String> paraMap);
	
	//해당 메시지 읽음처리하기
	int changeMgStatus(MessageSendVO msvo);
	
	
	// 탭별 메시지 개수 알아오기
	int getMgCnt(Map<String, String> paraMap);
	
	//체크된것 상태 처리하기
	int chxStatus(Map<String, String> paraMap);
	
	// 해당 메시지 파일의 정보 가져오기
	MessageFileVO getmfvo(MessageFileVO mfvo_y);
	

	
}
