package com.spring.hyerin.service;

import java.util.List;
import java.util.Map;


public interface InterMessageService {

	List<Map<String,String>> getmvoList(Map<String, String> paraMap);

	List<Map<String, String>> unread_mvoList(String receiver);
	
	//로그인 유저가 클릭한 메시지내용 1개 불러오기
	Map<String, String> getmvo(String mno);

}
