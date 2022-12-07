package com.spring.hyerin.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.spring.hyerin.model.DepartmentsVO;
import com.spring.hyerin.model.EmployeeVO;

@Repository
public class MemberDAO implements InterMemberDAO {
	@Resource
	private SqlSessionTemplate sqlsession;
	
	//부서정보 가져오기
	@Override
	public List<DepartmentsVO> getdept() {
		List<DepartmentsVO> deptList = sqlsession.selectList("member.getdept");
		return deptList;
	}
	
	
	//부서, 팀 이름 알아오기
	@Override
	public List<Map<String, String>> getdt() {
		List<Map<String, String>> dtList = sqlsession.selectList("member.getdt");
		return dtList;
	}

	
	//해당 empno사원의 정보 가져오기
	@Override
	public EmployeeVO getempvo(String empno) {
		EmployeeVO evo = sqlsession.selectOne("member.getempvo",empno);
		return evo;
	}

	
	//파일업로드해주기
	@Override
	public int addProfile(Map<String, String> paraMap) {
		int n = sqlsession.update("member.addProfile",paraMap);
		return n;
	}

	
	//프로필 파일이름 알아오기
	@Override
	public String getImg(String employee_no) {
		String filename = sqlsession.selectOne("member.getImg", employee_no);
		return filename;
	}
	
	
	
}
