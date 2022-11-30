package com.spring.hyerin.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.finalproject.common.FileManager;
import com.spring.hyerin.model.InterMessageDAO;
import com.spring.hyerin.model.MessageVO;

@Service
public class MessageService implements InterMessageService {
	
	@Autowired
	private InterMessageDAO dao;
	
	@Autowired
	private FileManager fileManager;

	@Override
	public List<Map<String,String>> getmvoList(String receiver) {
		List<Map<String,String>> mvoList = dao.getmvoList(receiver);
		return mvoList;
	}

	@Override
	public List<Map<String, String>> unread_mvoList(String receiver) {
		List<Map<String,String>> mvoList = dao.unread_mvoList(receiver);
		return mvoList;
	}
	
	
}