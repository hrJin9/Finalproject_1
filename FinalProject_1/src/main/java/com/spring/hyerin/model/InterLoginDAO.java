package com.spring.hyerin.model;

import java.util.Map;

public interface InterLoginDAO {
	
	//로그인처리하기
	EmployeeVO getLoginMember(Map<String, String> paraMap);
	
	// 패스워드 바꿔주기
	int changePwd(EmployeeVO evo);

}
