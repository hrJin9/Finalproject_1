package com.spring.hyerin.service;

import java.util.Map;

import com.spring.hyerin.model.EmployeeVO;

public interface InterLoginService {
	
	//로그인처리하기
	EmployeeVO getLoginMember(Map<String, String> paraMap);
	
	// 패스워드 바꿔주기
	int ChangePwd(EmployeeVO evo);

}
