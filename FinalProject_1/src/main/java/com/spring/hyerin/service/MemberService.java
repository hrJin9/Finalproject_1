package com.spring.hyerin.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.hyerin.model.DepartmentsVO;
import com.spring.hyerin.model.EmployeeVO;

@Service
public class MemberService implements InterMemberService {
	@Autowired
	private InterMemberDAO dao;
	
	//부서정보 가져오기
	@Override
	public List<DepartmentsVO> getdept() {
		List<DepartmentsVO> deptList = dao.getdept();
		return deptList;
	}

	//부서, 팀의 정보 구해오기
	@Override
	public List<Map<String, String>> getdt() {
		List<Map<String, String>> dtList = dao.getdt();
		return dtList;
	}
	
	//해당 empno사원의 정보 가져오기
	@Override
	public EmployeeVO getempvo(String empno) {
		EmployeeVO evo = dao.getempvo(empno);
		return evo;
	}
	
	//파일업로드해주기
	@Override
	public int addProfile(Map<String, String> paraMap) {
		int n = dao.addProfile(paraMap);
		return n;
	}
	
	//프로필 파일이름 알아오기
	@Override
	public String getImg(String employee_no) {
		String filename = dao.getImg(employee_no);
		return filename;
	}
	
}
