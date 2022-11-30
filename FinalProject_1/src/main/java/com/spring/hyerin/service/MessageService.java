package com.spring.hyerin.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.finalproject.common.FileManager;
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
	
}
