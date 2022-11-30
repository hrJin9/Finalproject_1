package com.spring.hyerin.service;

import java.util.List;
import java.util.Map;

import com.spring.hyerin.model.MessageSendVO;
import com.spring.hyerin.model.MessageVO;


public interface InterMessageService {

	List<Map<String,String>> getmvoList(Map<String, String> paraMap);

	// 메시지리스트의 총페이지수 알아오기
	int getmgtotal(Map<String, String> paraMap);

	//로그인 유저가 클릭한 메시지내용 1개 불러오기
	MessageVO getmvo(String mno);
	
	// 메시지 수신자 정보 알아오기
	List<MessageSendVO> getmsvoList(String mno);
	
	// 메시지 보낸시간 알아오기
	String getmstime(String mno);
	
}
