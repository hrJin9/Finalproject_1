package com.spring.hyerin.model;

import java.util.Map;

public interface InterLoginDAO {
	
	//로그인처리하기
	EmployeeVO getLoginMember(Map<String, String> paraMap);

}
