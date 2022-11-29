package com.spring.hyerin.model;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class MessageDAO implements InterMessageDAO {
	
	@Resource
	private SqlSessionTemplate sqlsession;
	
	@Override
	public List<Map<String,String>> getmvoList(Map<String, String> paraMap) {
		List<Map<String,String>> mvoList = sqlsession.selectList("message.getmvoList", paraMap);
		return mvoList;
	}

	@Override
	public List<Map<String, String>> unread_mvoList(String receiver) {
		List<Map<String,String>> mvoList = sqlsession.selectList("message.unread_mvoList", receiver);
		return mvoList;
	}
	
	
	
	
}
