package com.spring.hyerin.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.finalproject.common.AES256;
import com.spring.hyerin.model.EmployeeVO;
import com.spring.hyerin.model.InterLoginDAO;

@Service
public class LoginService implements InterLoginService {
	@Autowired
	private InterLoginDAO dao;
	
	@Autowired
	private AES256 aes;
	
	// 로그인처리하기
	@Override
	public EmployeeVO getLoginMember(Map<String, String> paraMap) {
		EmployeeVO loginuser = dao.getLoginMember(paraMap);
		return loginuser;
	}
}
