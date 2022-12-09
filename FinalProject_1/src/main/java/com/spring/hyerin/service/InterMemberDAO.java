package com.spring.hyerin.service;

import java.util.List;
import java.util.Map;

import com.spring.hyerin.model.DepartmentsVO;
import com.spring.hyerin.model.EmployeeVO;

public interface InterMemberDAO {
	
	//부서정보 가져오기
	List<DepartmentsVO> getdept();
	
	//부서, 팀 이름 알아오기
	List<Map<String, String>> getdt();
	
	//해당 empno사원의 정보 가져오기
	EmployeeVO getempvo(String mpno);
	
	//파일업로드해주기
	int addProfile(Map<String, String> paraMap);
	
	//프로필 파일이름 알아오기
	String getImg(String employee_no);

	// 해당 사원의 오늘 근무시간 알아오기
	String getWorkinghour(String employee_no);

}
