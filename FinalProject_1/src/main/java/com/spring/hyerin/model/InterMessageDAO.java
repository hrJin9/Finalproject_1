package com.spring.hyerin.model;

import java.util.List;
import java.util.Map;

public interface InterMessageDAO {

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
	
	//부서, 팀 이름 알아오기
	List<Map<String, String>> getdt();

	//구성원 목록을 읽어오기
	List<EmployeeVO> getEmpList(Map<String, String> paraMap);
	
	// mno 채번해오기
	String getmno();

	// tbl_message에 메시지 insert하기 
	int addMessage(MessageVO mvo);
	
	// tbl_message_file에 파일 insert하기
	int addMF(MessageFileVO mfvo);
	
	// tbl_message_send에 수신자 insert하기
	int addMS(MessageSendVO msvo);
	
	// 관련메시지 3개  알아오기
	Map<String,String> getmgroupList(Map<String, String> paraMap);
	
	//해당 메시지 읽음처리하기
	int changeMgStatus(MessageSendVO msvo);

	// 탭별 메시지 개수 알아오기
	int getMgCnt(Map<String, String> paraMap);
	
	//체크된것 읽음처리하기
	int chxStatus(Map<String, String> paraMap);

	// 해당 메시지 파일의 정보 가져오기
	MessageFileVO getmfvo(MessageFileVO mfvo_y);
	
	// 로그인유저의 메시지리스트 불러오기
	List<MessageVO> getMsmvoList(Map<String, String> paraMap);
	
	// 메시지리스트의 총페이지수 알아오기
	int getMsmgtotal(Map<String, String> paraMap);
	
	// 탭별 메시지 개수 알아오기
	int getMsMgCnt(Map<String, String> paraMap);
	
	//보낸 메시지 => 체크된 것 condition에 따라 상태 update해주기
	int sendchxStatus(Map<String, String> paraMap);
	
	// empname, deptname 알아오기
	List<EmployeeVO> getempname(Map<String, String[]> paraMap);
	


}
