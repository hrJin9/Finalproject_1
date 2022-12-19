package com.spring.jieun.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.hyerin.model.EmployeeVO;
import com.spring.jieun.model.*;

public interface InterSearchService {

	List<EmployeeVO> getEmpList(Map<String, String> paraMap);		// 사원리스트 검색 

	List<Map<String, String>> getMsgList(Map<String, String> paraMap);		// 메시지리스트 검색 

	List<Map<String, String>> getAppList(Map<String, String> paraMap);// 결재문서 리스트 검색 


}
