package com.spring.jieun.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.hyerin.model.EmployeeVO;
import com.spring.jieun.model.InterSearchDAO;

@Service
public class SearchService implements InterSearchService {

	// 의존객체 
	@Autowired
	private InterSearchDAO dao;

	// 구성원 검색 
	@Override
	public List<EmployeeVO> getEmpList(Map<String, String> paraMap) {
		List<EmployeeVO> list = dao.getEmpList(paraMap);
		return list;
	}

	// 메시지리스트 검색 
	@Override
	public List<Map<String, String>> getMsgList(Map<String, String> paraMap) {
		List<Map<String, String>> list = dao.getMsgList(paraMap); 
		return list;
	}
	// 결재문서 리스트 검색 
	@Override
	public List<Map<String, String>> getAppList(Map<String, String> paraMap) {
		List<Map<String, String>> list = dao.getAppList(paraMap);
		return list;
	}





}
