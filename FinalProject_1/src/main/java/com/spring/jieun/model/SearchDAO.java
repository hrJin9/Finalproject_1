package com.spring.jieun.model;


import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.spring.hyerin.model.EmployeeVO;


@Repository
public class SearchDAO implements InterSearchDAO{

	@Resource
	private SqlSessionTemplate sqlsession;

	// 구성원 검색 
	@Override
	public List<EmployeeVO> getEmpList(Map<String, String> paraMap) {
		List<EmployeeVO> list = sqlsession.selectList("search.getEmpList", paraMap); 
		return list;
	}
	// 메시지리스트 검색
	@Override
	public List<Map<String, String>> getMsgList(Map<String, String> paraMap) {
		List<Map<String, String>> list = sqlsession.selectList("search.getMsgList", paraMap); 
		return list;
	}
	// 결재문서 리스트 검색
	@Override
	public List<Map<String, String>> getAppList(Map<String, String> paraMap) {
		List<Map<String, String>> list = sqlsession.selectList("search.getAppList", paraMap); 
		return list;
	}
}
