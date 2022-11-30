package com.spring.hyerin.model;

import java.util.List;
import java.util.Map;

public interface InterMessageDAO {

	List<Map<String,String>> getmvoList(Map<String, String> paraMap);

	List<Map<String, String>> unread_mvoList(String receiver);
	
	//로그인 유저가 클릭한 메시지내용 1개 불러오기
	Map<String, String> getmvo(String mno);
	
	// 메시지리스트의 총페이지수 알아오기
	int getmgtotal(Map<String, String> paraMap);

}
