package com.spring.hyerin.model;

import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class LoginDAO implements InterLoginDAO {
	@Resource
	private SqlSessionTemplate sqlsession;
	
	//로그인처리하기
	@Override
	public EmployeeVO getLoginMember(Map<String, String> paraMap) {
		EmployeeVO loginuser = sqlsession.selectOne("member.getLoginMember", paraMap);
		return loginuser;
	}
	
	// 패스워드 바꿔주기
	@Override
	public int changePwd(EmployeeVO evo) {
		int n = sqlsession.update("member.changePwd",evo);
		return n;
	}
	
	
	
}
