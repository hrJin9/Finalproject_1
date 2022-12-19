package com.spring.hyerin.service;

import java.util.List;
import java.util.Map;

import com.spring.hyerin.model.DepartmentsVO;
import com.spring.hyerin.model.EmployeeVO;
import com.spring.hyerin.model.TeamVO;

public interface InterMemberService {
	
	//부서정보 가져오기
	List<DepartmentsVO> getdept();
	
	//부서, 팀의 정보 구해오기
	List<Map<String, String>> getdt();
	
	//해당 empno사원의 정보 가져오기
	EmployeeVO getempvo(String empno);
	
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
	
	// 트랜잭션 처리 (fk_department_no나 fk_team_no가 add라면 먼저 insert해준 뒤 사원정보 insert)
	Map<String, String> addEmployee(EmployeeVO evo) throws Throwable;
	
	// 해당 사원들의 status를 0으로 바꿔주기
	int goDeleteEmp(Map<String, String[]> paraMap);
	
	//트랜잭션 처리 (fk_department_no나 fk_team_no가 add라면 먼저 insert해준 뒤 사원정보 update)
	int updateEmployee(EmployeeVO evo);
	
	// 해당 사원의 정보를 변경해주기
	int updateMyInfo(EmployeeVO evo);
	
	// 해당 사원들의 정보 알아오기
	List<EmployeeVO> empList(Map<String, String[]> paraMap);
	
	//모든 사원의 정보를 알아오기
	List<EmployeeVO> empListAll();
	
	// 해당 정보로 사원테이블에 insert 해주기
	int memberRegister(EmployeeVO evo);
	
	// 사원번호 채번해오기
	String getNewEmpno(String fk_department_no);
	
	//해당 정보의 사원 가져오기
	String getEmployeeInfo(EmployeeVO evo);
	
	// employee_no의 비밀번호 알아오기
	String getMyPassword(String employee_no);
	
	// 비밀번호 업데이트해주기
	int updateMyPwd(Map<String, String> paraMap);

}
