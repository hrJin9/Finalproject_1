package com.spring.hyerin.service;

import java.util.List;
import java.util.Map;

import com.spring.hyerin.model.DepartmentsVO;
import com.spring.hyerin.model.EmployeeVO;
import com.spring.hyerin.model.TeamVO;

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
	
	// 멤버리스트 가져오기
	List<EmployeeVO> getEmpList(Map<String, String> paraMap);
	
	// 구성원 리스트의 총 페이지수
	int getEmpTotal(Map<String, String> paraMap);
	
	// 부서목록 가져오기
	List<DepartmentsVO> getdeptname();
	
	// 직위목록 가져오기
	List<String> getposition();
	
	// 고용형태 가져오기
	List<String> getjointype();
	
	// 해당 부서의 팀 가져오기
	List<TeamVO> getTeams(String deptno);
	
	// 새로운 부서를 만들어주기
	int addDepartment(Map<String, String> paraMap);
	
	// 새로운 팀을 만들어주기
	int addTeam(Map<String, String> paraMap);
	
	// 사원테이블에 insert
	int addEmployee(EmployeeVO evo);
	
	// 사원번호 채번해오기
	String getNewEmpno(String fk_department_no);
	
	//새로운 부서의 no 채번해오기
	String getNewDepartment();
	
	//새로운 팀을 만들 번호 채번하기
	String getNewTeam();

}
